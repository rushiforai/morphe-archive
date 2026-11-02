"""Run app-scoped weather production guards with the real Morphe SDK."""
import argparse
import os
from pathlib import Path
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parents[1]


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('app',choices=['buienalarm','buienradar','weerplaza','rainviewer'])
    parser.add_argument('--cli',type=Path,default=ROOT/'.tools/morphe-desktop-1.19.1-all.jar')
    parser.add_argument('--bundle',type=Path,required=True)
    parser.add_argument('--original',type=Path,required=True)
    parser.add_argument('--other-original',type=Path,required=True)
    args=parser.parse_args()
    cache=Path(os.environ.get('GRADLE_USER_HOME',Path.home()/'.gradle'))
    sdk=next((cache/'caches/modules-2/files-2.1/app.morphe/morphe-patcher/2.0.1').glob('*/*.jar'))
    cp=f'{sdk}:{args.cli.resolve()}'
    with tempfile.TemporaryDirectory(prefix='weather-input-') as scratch:
        subprocess.run(['javac','-J-Xmx128m','-cp',cp,'-d',scratch,
                        str(ROOT/'tests/OriginalInputRegression.java'),str(ROOT/'tests/WeatherInputRegression.java')],check=True)
        subprocess.run(['java','-Xmx256m','-cp',f'{scratch}:{cp}','WeatherInputRegression',
                        str(args.bundle.resolve()),args.app,str(args.original.resolve()),
                        str(args.other_original.resolve()),scratch],check=True)


if __name__=='__main__':
    main()
