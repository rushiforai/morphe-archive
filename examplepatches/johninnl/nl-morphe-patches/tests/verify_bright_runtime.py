"""Check emitted Bright policy selection against an explicit original APK and built bundle.

Read the publisher DEX without executing or rewriting the app. Exercise every
ordering of all control subsets through production selectControl and the SDK.
"""
import argparse
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--bundle', type=Path, required=True)
    parser.add_argument('--original', type=Path, required=True)
    parser.add_argument('--desktop', type=Path,
                        default=ROOT / '.tools/morphe-desktop-1.19.1-all.jar')
    args = parser.parse_args()
    for path in (args.bundle, args.original, args.desktop):
        if not path.is_file():
            parser.error(f'Required input does not exist: {path}')
    cached = Path.home() / '.gradle/caches/modules-2/files-2.1/app.morphe/morphe-patcher/2.0.1'
    sdks = sorted(cached.glob('*/*.jar'))
    if not sdks:
        parser.error('Build the bundle first to cache morphe-patcher 2.0.1')
    classpath = os.pathsep.join(map(str, (sdks[0], args.desktop.resolve())))
    with tempfile.TemporaryDirectory(prefix='bright-runtime-regression-') as scratch:
        subprocess.run(['javac', '-J-Xmx128m', '-cp', classpath, '-d', scratch,
                        str(ROOT / 'tests/BrightRuntimeRegression.java')], check=True)
        subprocess.run(['java', '-Xmx256m', '-cp', os.pathsep.join((scratch, classpath)),
                        'BrightRuntimeRegression', str(args.bundle.resolve()),
                        str(args.original.resolve()), scratch], check=True)


if __name__ == '__main__':
    main()
