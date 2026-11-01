"""Run the actual patched phone APK's gates and callbacks in a disposable emulator probe.

Installs only nl.johninnl.tests.npophone. Never installs, clears or opens NPO app
storage. HTTPS responses are synthetic; the probe requests no Internet permission.
"""
import argparse
import os
from pathlib import Path
import re
import subprocess
import tempfile
import time
import uuid
import zipfile

ROOT = Path(__file__).resolve().parents[1]
PACKAGE = 'nl.johninnl.tests.npophone'


def run(command, **kwargs):
    result = subprocess.run([str(x) for x in command], capture_output=True, text=True, **kwargs)
    if result.returncode:
        raise RuntimeError(f'Command failed: {command[0]}\n{result.stdout}\n{result.stderr}')
    return result.stdout


def execute(args):
    sdk, java = args.sdk, args.java_home
    android = sdk / 'platforms/android-34/android.jar'
    if not android.is_file():
        raise FileNotFoundError('Android API 34 platform is required for this probe')
    versions = sorted((sdk / 'build-tools').iterdir(), key=lambda p: tuple(int(x) for x in p.name.split('.') if x.isdigit()))
    tools = next(p for p in reversed(versions) if (p / 'd8').is_file() and (p / 'aapt2').is_file())
    adb = [sdk / 'platform-tools/adb', '-s', args.serial]
    assert run([*adb, 'get-state']).strip() == 'device'
    assert int(run([*adb, 'shell', 'getprop', 'ro.build.version.sdk']).strip()) >= 32
    identifier = uuid.uuid4().hex
    remote = f'/data/local/tmp/npo-phone-probe-{identifier}.apk'
    with tempfile.TemporaryDirectory(prefix='npo-phone-probe-') as temporary:
        out = Path(temporary)
        classes, dex = out / 'classes', out / 'dex'
        classes.mkdir()
        dex.mkdir()
        run([java / 'bin/javac', '-source', '8', '-target', '8', '-cp', android, '-d', classes,
             ROOT / 'tests/fixtures/NpoPhoneProbeActivity.java'])
        run([tools / 'd8', '--min-api', '32', '--lib', android, '--output', dex, *classes.rglob('*.class')],
            env=dict(os.environ, JAVA_HOME=str(java)))
        manifest = out / 'AndroidManifest.xml'
        manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{PACKAGE}">
<uses-sdk android:minSdkVersion="32" android:targetSdkVersion="34"/>
<application android:label="NPO patch probe" android:debuggable="true">
<activity android:name=".NpoPhoneProbeActivity" android:exported="true"/>
</application></manifest>''')
        unsigned, aligned, signed, key = (out / name for name in ('unsigned.apk', 'aligned.apk', 'probe.apk', 'probe.p12'))
        run([tools / 'aapt2', 'link', '--manifest', manifest, '-I', android, '-o', unsigned])
        with zipfile.ZipFile(unsigned, 'a') as archive:
            archive.write(dex / 'classes.dex', 'classes.dex')
        run([tools / 'zipalign', '-f', '4', unsigned, aligned])
        run([java / 'bin/keytool', '-genkeypair', '-keystore', key, '-storepass', 'android', '-keypass', 'android',
             '-alias', 'probe', '-dname', 'CN=NPO Phone Probe', '-keyalg', 'RSA', '-validity', '1'])
        run([tools / 'apksigner', 'sign', '--ks', key, '--ks-key-alias', 'probe', '--ks-pass', 'pass:android',
             '--key-pass', 'pass:android', '--out', signed, aligned])
        # This package is exclusively a disposable test fixture, never NPO itself.
        subprocess.run([str(x) for x in [*adb, 'uninstall', PACKAGE]], capture_output=True)
        try:
            run([*adb, 'install', '--no-incremental', signed])
            run([*adb, 'push', args.apk.resolve(), remote])
            run([*adb, 'shell', 'chmod', '644', remote])
            run([*adb, 'shell', 'am', 'start', '-W', '-n', f'{PACKAGE}/.NpoPhoneProbeActivity',
                 '--es', 'apk', remote, '--es', 'run', identifier])
            deadline = time.monotonic() + 45
            while time.monotonic() < deadline:
                result = subprocess.run([str(x) for x in [*adb, 'exec-out', 'run-as', PACKAGE, 'cat', f'files/{identifier}.txt']],
                                        text=True, capture_output=True)
                # Some ADB exec-out versions return zero even when remote cat
                # reports that the asynchronous result file does not exist yet.
                if result.returncode == 0 and result.stdout.startswith(('PASS cases=', 'FAIL\n')):
                    print(result.stdout, flush=True)
                    assert result.stdout.startswith('PASS cases=51\n'), 'Actual phone APK probe failed or omitted a case'
                    break
                time.sleep(1)
            else:
                raise TimeoutError('Phone probe produced no result within 45 seconds')
        finally:
            run([*adb, 'shell', 'rm', '-f', remote])
            run([*adb, 'uninstall', PACKAGE])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--apk', required=True, type=Path)
    parser.add_argument('--sdk', type=Path, default=Path(os.environ.get('ANDROID_HOME', Path.home() / 'Library/Android/sdk')))
    parser.add_argument('--java-home', type=Path, default=Path(os.environ.get('JAVA_HOME', '/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home')))
    args = parser.parse_args()
    if not re.fullmatch(r'emulator-\d+', args.serial):
        parser.error('The disposable APK probe is restricted to a local emulator')
    if not args.apk.is_file():
        parser.error('--apk must identify an existing patched phone APK')
    execute(args)


if __name__ == '__main__':
    main()
