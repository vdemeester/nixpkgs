{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "gauge-${version}";
  version = "1.0.5";

  goPackagePath = "github.com/getgauge/gauge";
  excludedPackages = ''\(build\|man\)'';

  src = fetchFromGitHub {
    owner = "getgauge";
    repo = "gauge";
    rev = "v${version}";
    sha256 = "19x5xdg4n0nba5bjca4iz8s02nwifabmn6sphv4qw2iipph65ha0";
  };

  meta = with stdenv.lib; {
   description = "Light weight cross-platform test automation";
   homepage    = https://gauge.org;
   license     = licenses.gpl3;
   maintainers = [ maintainers.vdemeester ];
   platforms   = platforms.unix;
  };
}
