"""Verify availability filtering on actual ART and app models.

The fixture does not install/start Videoland or use its active account/session.
"""
import argparse
import hashlib
import os
from pathlib import Path
import re
import tempfile
import uuid

from run_videoland_atv import run

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--paging', action='store_true')
    parser.add_argument('--integration', action='store_true')
    parser.add_argument('--abi', type=Path, default=ROOT / 'build/isolated-videoland/_extensions_videoland/app-abi/videoland-compile-only-abi.jar')
    parser.add_argument('--apk', type=Path, required=True)
    parser.add_argument('--sdk', type=Path, default=Path.home() / 'Library/Android/sdk')
    parser.add_argument('--java-home', type=Path, default=Path('/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'))
    args = parser.parse_args()
    if not args.apk.is_file():
        parser.error('Provide the candidate APK containing the availability extension')
    if args.integration and not args.paging:
        parser.error('--integration requires --paging')
    adb = args.sdk / 'platform-tools/adb'
    if run([adb, '-s', args.serial, 'get-state']).strip() != 'device':
        raise RuntimeError('Device unavailable')

    def version(path):
        return tuple(map(int, re.findall(r'\d+', path.parent.name)))

    android = max((args.sdk / 'platforms').glob('android-*/android.jar'), key=version)
    d8 = max((args.sdk / 'build-tools').glob('*/d8'), key=version)
    with tempfile.TemporaryDirectory(prefix='videoland-availability-art-') as temporary:
        local = Path(temporary)
        classes, dex = local / 'classes', local / 'dex'
        classes.mkdir()
        dex.mkdir()
        run([args.java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android, '-d', classes,
             ROOT / 'tests/VideolandAvailabilityProbe.java'])
        run([d8, '--min-api', '24', '--lib', android, '--output', dex, *classes.rglob('*.class')],
            env=dict(os.environ, JAVA_HOME=str(args.java_home)))
        fixture_dex = None
        if args.paging:
            fixture_classes, fixture_output = local / 'fixture-classes', local / 'fixture-dex'
            fixture_classes.mkdir()
            fixture_output.mkdir()
            run([args.java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', str(android) + os.pathsep + str(args.abi),
                 '-d', fixture_classes, *sorted((ROOT / 'tests/fixtures/videoland-availability').rglob('*.java'))])
            run([d8, '--min-api', '24', '--lib', android, '--classpath', args.abi, '--output', fixture_output,
                 *fixture_classes.rglob('*.class')], env=dict(os.environ, JAVA_HOME=str(args.java_home)))
            fixture_dex = fixture_output / 'classes.dex'
        remote = '/data/local/tmp/videoland-availability-art-' + uuid.uuid4().hex
        try:
            run([adb, '-s', args.serial, 'push', args.apk, remote + '.apk'])
            run([adb, '-s', args.serial, 'push', dex / 'classes.dex', remote + '.dex'])
            run([adb, '-s', args.serial, 'shell', 'chmod', '444', remote + '.apk', remote + '.dex'])
            if fixture_dex:
                run([adb, '-s', args.serial, 'push', fixture_dex, remote + '-fixtures.dex'])
                run([adb, '-s', args.serial, 'shell', 'chmod', '444', remote + '-fixtures.dex'])
            print('APK SHA256:' , hashlib.sha256(args.apk.read_bytes()).hexdigest(), flush=True)
            result = run([adb, '-s', args.serial, 'shell', 'CLASSPATH=' + remote + '.dex',
                          'app_process', '/system/bin', 'VideolandAvailabilityProbe', remote + '.apk',
                          *([remote + '-fixtures.dex'] if fixture_dex else []), *(['integration'] if args.integration else [])], timeout=60)
            print(result, end='')
            if not re.search(r'PASS: \d+ actual Videoland availability ART assertions', result):
                raise AssertionError('Availability evidence missing')
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', remote + '.apk', remote + '.dex', remote + '-fixtures.dex'])


if __name__ == '__main__':
    main()
