"""Exercise the production preflight against a genuine device-specific XAPK."""
import argparse
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
from validate_targets import prepare_input


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--bundle', required=True, type=Path)
    parser.add_argument('--input', required=True, type=Path)
    parser.add_argument('--full-input', type=Path, help='Optional earlier full split set or directory')
    parser.add_argument('--patcher', type=Path, help='Optional patcher JAR to test Manager SDK compatibility')
    args = parser.parse_args()
    desktop = ROOT / '.tools/morphe-desktop-1.19.1-all.jar'
    cp = str(desktop) if args.patcher is None else f'{args.patcher.resolve()}:{desktop}'
    with tempfile.TemporaryDirectory(prefix='tweedehands-splits-') as scratch:
        work = Path(scratch)
        staged, _ = prepare_input(args.input.resolve(), work)
        full = []
        if args.full_input:
            other = work / 'full'
            other.mkdir()
            full = [str(prepare_input(args.full_input.resolve(), other)[0])]
        subprocess.run(['javac', '-J-Xmx128m', '-cp', cp, '-d', scratch,
                        str(ROOT / 'tests/OriginalInputRegression.java'),
                        str(ROOT / 'tests/TweedehandsSplitRegression.java')], check=True)
        subprocess.run(['java', '-Xmx1g', '-cp', f'{scratch}:{cp}', 'TweedehandsSplitRegression',
                        str(args.bundle.resolve()), str(staged), str(work / 'cases'), *full], check=True)


if __name__ == '__main__':
    main()
