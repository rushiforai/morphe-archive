"""Exercise the phone build's production resource guard using a publisher base APK."""
import argparse
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--bundle', required=True, type=Path)
    parser.add_argument('--original', required=True, type=Path)
    args = parser.parse_args()
    sdk = next((Path.home() / '.gradle/caches/modules-2/files-2.1/app.morphe/morphe-patcher/2.0.1').glob('*/*.jar'))
    desktop = ROOT / '.tools/morphe-desktop-1.19.1-all.jar'
    classpath = os.pathsep.join(map(str, (sdk, desktop)))
    with tempfile.TemporaryDirectory(prefix='npo-phone-input-') as scratch:
        subprocess.run(['javac', '-cp', classpath, '-d', scratch,
                        str(ROOT / 'tests/OriginalInputRegression.java'),
                        str(ROOT / 'tests/NpoPhoneInputRegression.java')], check=True)
        subprocess.run(['java', '-cp', scratch + os.pathsep + classpath, 'NpoPhoneInputRegression',
                        str(args.bundle.resolve()), str(args.original.resolve()), scratch], check=True)


if __name__ == '__main__':
    main()
