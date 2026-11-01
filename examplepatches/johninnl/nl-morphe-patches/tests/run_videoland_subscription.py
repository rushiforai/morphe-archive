"""Run actual candidate routing methods on ART with test-only queue dependencies.

Does not install/start Videoland or contact its backend. Account playback is a
separate acceptance step; the APK and double DEX hashes identify this run.
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
ASSEMBLER = '''
import com.android.tools.smali.smali.*;
public class AssembleSubscriptionDoubles {
 public static void main(String[] args) throws Exception {
  SmaliOptions options=new SmaliOptions();options.apiLevel=24;options.outputDexFile=args[1];
  if(!Smali.assemble(options,args[0]))throw new AssertionError("Test doubles did not assemble");
 }
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--diagnostic', action='store_true', help='Also exercise the test-only raw JSON probe helper')
    parser.add_argument('--apk', required=True, type=Path)
    parser.add_argument('--sdk', type=Path, default=Path.home() / 'Library/Android/sdk')
    parser.add_argument('--java-home', type=Path, default=Path('/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'))
    parser.add_argument('--desktop', type=Path, default=ROOT / '.tools/morphe-desktop-1.19.1-all.jar')
    args = parser.parse_args()
    if not args.apk.is_file() or not args.desktop.is_file():
        parser.error('Provide the candidate APK and pinned local Desktop JAR')
    adb = args.sdk / 'platform-tools/adb'
    if run([adb, '-s', args.serial, 'get-state']).strip() != 'device':
        raise RuntimeError('Device unavailable')

    def version(path):
        return tuple(map(int, re.findall(r'\d+', path.parent.name)))

    android = max((args.sdk / 'platforms').glob('android-*/android.jar'), key=version)
    d8 = max((args.sdk / 'build-tools').glob('*/d8'), key=version)
    with tempfile.TemporaryDirectory(prefix='videoland-subscription-art-') as temporary:
        local = Path(temporary)
        classes, dex = local / 'classes', local / 'dex'
        classes.mkdir()
        dex.mkdir()
        assembler = local / 'AssembleSubscriptionDoubles.java'
        assembler.write_text(ASSEMBLER)
        run([args.java_home / 'bin/javac', '-cp', args.desktop, '-d', classes, assembler])
        doubles = local / 'doubles.dex'
        run([args.java_home / 'bin/java', '-cp', str(classes) + os.pathsep + str(args.desktop),
             'AssembleSubscriptionDoubles', ROOT / 'tests/fixtures/videoland-subscription', doubles])
        run([args.java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android,
             '-d', classes, ROOT / 'tests/VideolandSubscriptionProbe.java'])
        run([d8, '--min-api', '24', '--lib', android, '--output', dex,
             classes / 'VideolandSubscriptionProbe.class'], env=dict(os.environ, JAVA_HOME=str(args.java_home)))
        remote = '/data/local/tmp/videoland-subscription-' + uuid.uuid4().hex
        try:
            for source, suffix in ((args.apk, '.apk'), (dex / 'classes.dex', '.dex'), (doubles, '-doubles.dex')):
                run([adb, '-s', args.serial, 'push', source, remote + suffix])
                run([adb, '-s', args.serial, 'shell', 'chmod', '444', remote + suffix])
            print('APK SHA256:', hashlib.sha256(args.apk.read_bytes()).hexdigest(), flush=True)
            print('Test doubles SHA256:', hashlib.sha256(doubles.read_bytes()).hexdigest(), flush=True)
            result = run([adb, '-s', args.serial, 'shell', 'CLASSPATH=' + remote + '.dex',
                          'app_process', '/system/bin', 'VideolandSubscriptionProbe', remote + '.apk',
                          remote + '-doubles.dex', str(args.diagnostic).lower()], timeout=60)
            print(result, end='')
            if not re.search(r'PASS: \d+ actual Videoland subscription ART assertions', result):
                raise AssertionError('ART completion evidence missing')
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', remote + '.apk', remote + '.dex', remote + '-doubles.dex'])


if __name__ == '__main__':
    main()
