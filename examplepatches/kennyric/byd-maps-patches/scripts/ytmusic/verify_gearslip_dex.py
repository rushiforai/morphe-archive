"""Inspect emitted wrapper contracts without a release or obfuscation table."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import tempfile


def inspect(apk, classpath, require_library=False):
    source = Path(__file__).with_name('InspectBrowser.java')
    with tempfile.TemporaryDirectory(prefix='ytmusic-browser-inspect-') as temporary:
        subprocess.run(['javac', '--release', '11', '-cp', str(classpath), '-d', temporary, str(source)], check=True)
        command = ['java', '-Xmx1024m', '-cp', temporary + os.pathsep + str(classpath), 'InspectBrowser', str(apk)]
        if require_library:
            command.append('--require-library')
        result = subprocess.run(command, capture_output=True, text=True)
        if result.returncode:
            raise AssertionError(result.stderr.strip() or 'DEX inspection failed')
    return dict(line.split('=', 1) for line in result.stdout.splitlines() if '=' in line)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk', type=Path)
    parser.add_argument('--version', help='Informational label; does not select a layout')
    parser.add_argument('--apkanalyzer', help=argparse.SUPPRESS)  # Older local command compatibility.
    parser.add_argument('--dexlib-classpath', type=Path)
    parser.add_argument('--require-library', action='store_true', help='Require the personal-library entry hook and captured browser bridge, not just host admission')
    args = parser.parse_args()
    if args.dexlib_classpath is None:
        root = Path(__file__).resolve().parents[2]
        candidates = sorted((root / '.tools').glob('morphe-desktop-*-all.jar'))
        if not candidates:
            parser.error('Pass --dexlib-classpath pointing to a Morphe desktop all.jar')
        args.dexlib_classpath = candidates[-1]
    bindings = inspect(args.apk, args.dexlib_classpath.resolve(), args.require_library)
    print(json.dumps({'status': 'PASS', 'label': args.version, 'bindings': bindings}, indent=2))


if __name__ == '__main__':
    main()
