"""Execute TVgids production guards with the real SDK and original APKs."""
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
    parser.add_argument('--other-original', type=Path)
    parser.add_argument('--native-only', action='store_true')
    args = parser.parse_args()
    cache = Path(os.environ.get('GRADLE_USER_HOME', Path.home() / '.gradle'))
    sdk = next((cache / 'caches/modules-2/files-2.1/app.morphe/morphe-patcher/2.0.1').glob('*/*.jar'))
    desktop = ROOT / '.tools/morphe-desktop-1.19.1-all.jar'
    with tempfile.TemporaryDirectory(prefix='tvgids-input-') as scratch:
        cp = f'{sdk}:{desktop}'
        sources = ['TvgidsNativeRegression.java']
        if not args.native_only:
            if args.other_original is None:
                parser.error('--other-original is required unless --native-only is selected')
            sources += ['OriginalInputRegression.java', 'TvgidsInputRegression.java']
        subprocess.run(['javac', '-J-Xmx128m', '-cp', cp, '-d', scratch,
                        *(str(ROOT / 'tests' / name) for name in sources)], check=True)
        common = ['java', '-Xmx512m', '-cp', f'{scratch}:{cp}']
        subprocess.run([*common, 'TvgidsNativeRegression', str(args.bundle.resolve()),
                        str(args.original.resolve())], check=True)
        if not args.native_only:
            subprocess.run([*common, 'TvgidsInputRegression', str(args.bundle.resolve()),
                            str(args.original.resolve()), str(args.other_original.resolve()), scratch], check=True)


if __name__ == '__main__':
    main()
