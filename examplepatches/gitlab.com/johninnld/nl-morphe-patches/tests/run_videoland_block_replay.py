"""Verify diagnostic block-request continuations on ART without launching requests.

The fixture never invokes the Runnable and arms the once guard before matching
coordinates. It does not install Videoland or use its active account/session.
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
    parser.add_argument('--apk', type=Path, required=True)
    parser.add_argument('--sdk', type=Path, default=Path.home() / 'Library/Android/sdk')
    parser.add_argument('--java-home', type=Path, default=Path('/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'))
    args = parser.parse_args()
    if not args.apk.is_file():
        parser.error('Provide the diagnostic APK containing the block helpers')
    adb = args.sdk / 'platform-tools/adb'
    if run([adb, '-s', args.serial, 'get-state']).strip() != 'device':
        raise RuntimeError('Device unavailable')

    def version(path):
        return tuple(map(int, re.findall(r'\d+', path.parent.name)))

    android = max((args.sdk / 'platforms').glob('android-*/android.jar'), key=version)
    d8 = max((args.sdk / 'build-tools').glob('*/d8'), key=version)
    with tempfile.TemporaryDirectory(prefix='videoland-block-art-') as temporary:
        local = Path(temporary)
        classes, dex = local / 'classes', local / 'dex'
        classes.mkdir()
        dex.mkdir()
        run([args.java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android, '-d', classes,
             ROOT / 'tests/fixtures/videoland-block-replay/VideolandBlockReplayContinuationProbe.java'])
        run([d8, '--min-api', '24', '--lib', android, '--output', dex, *classes.rglob('*.class')],
            env=dict(os.environ, JAVA_HOME=str(args.java_home)))
        remote = '/data/local/tmp/videoland-block-art-' + uuid.uuid4().hex
        try:
            run([adb, '-s', args.serial, 'push', args.apk, remote + '.apk'])
            run([adb, '-s', args.serial, 'push', dex / 'classes.dex', remote + '.dex'])
            run([adb, '-s', args.serial, 'shell', 'chmod', '444', remote + '.apk', remote + '.dex'])
            print('APK SHA256:', hashlib.sha256(args.apk.read_bytes()).hexdigest(), flush=True)
            result = run([adb, '-s', args.serial, 'shell', 'CLASSPATH=' + remote + '.dex',
                          'app_process', '/system/bin', 'VideolandBlockReplayContinuationProbe', remote + '.apk'], timeout=30)
            print(result, end='')
            if 'PASS: 7 isolated block replay ART assertions; no requests launched' not in result:
                raise AssertionError('Block-continuation evidence missing')
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', remote + '.apk', remote + '.dex'])


if __name__ == '__main__':
    main()
