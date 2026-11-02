"""Run the Belgian production preflight against genuine publisher inputs."""
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
    parser.add_argument('--other-original', required=True, type=Path)
    parser.add_argument('--complete-input', required=True, type=Path)
    parser.add_argument('--feature-original', required=True, type=Path)
    parser.add_argument('--incomplete-fixtures', required=True, type=Path)
    args = parser.parse_args()
    cache = Path(os.environ.get('GRADLE_USER_HOME', Path.home() / '.gradle'))
    sdk = next((cache / 'caches/modules-2/files-2.1/app.morphe/morphe-patcher/2.0.1').glob('*/*.jar'))
    desktop = ROOT / '.tools/morphe-desktop-1.19.1-all.jar'
    with tempfile.TemporaryDirectory(prefix='tweedehands-input-') as scratch:
        cp = f'{sdk}:{desktop}'
        subprocess.run(['javac', '-J-Xmx128m', '-cp', cp, '-d', scratch,
                        str(ROOT / 'tests/OriginalInputRegression.java'),
                        str(ROOT / 'tests/TweedehandsInputRegression.java')], check=True)
        subprocess.run(['java', '-Xmx128m', '-cp', f'{scratch}:{cp}', 'TweedehandsInputRegression',
                        str(args.bundle.resolve()), str(args.original.resolve()),
                        str(args.other_original.resolve()), scratch, str(args.complete_input.resolve()),
                        str(args.feature_original.resolve()), str(args.incomplete_fixtures.resolve())], check=True)


if __name__ == '__main__':
    main()
