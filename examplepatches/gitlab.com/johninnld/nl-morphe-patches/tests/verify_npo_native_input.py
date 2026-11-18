"""Exercise the production NPO guard with publisher splits and a captured incomplete APK."""
import argparse
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('bundle', 'tv', 'phone', 'tv_splits', 'phone_splits', 'incomplete'):
        parser.add_argument('--' + name.replace('_', '-'), required=True, type=Path)
    args = parser.parse_args()
    sdk = next((Path.home() / '.gradle/caches/modules-2/files-2.1/app.morphe/morphe-patcher/2.0.1').glob('*/*.jar'))
    desktop = ROOT / '.tools/morphe-desktop-1.19.1-all.jar'
    classpath = os.pathsep.join(map(str, (sdk, desktop)))
    with tempfile.TemporaryDirectory(prefix='npo-native-input-') as scratch:
        subprocess.run(['javac', '-cp', classpath, '-d', scratch,
                        str(ROOT / 'tests/OriginalInputRegression.java'),
                        str(ROOT / 'tests/NpoNativeInputRegression.java')], check=True)
        subprocess.run(['java', '-cp', scratch + os.pathsep + classpath, 'NpoNativeInputRegression',
                        str(args.bundle.resolve()), str(args.tv.resolve()), str(args.phone.resolve()), scratch,
                        str(args.tv_splits.resolve()), str(args.phone_splits.resolve()),
                        str(args.incomplete.resolve())], check=True)


if __name__ == '__main__':
    main()
