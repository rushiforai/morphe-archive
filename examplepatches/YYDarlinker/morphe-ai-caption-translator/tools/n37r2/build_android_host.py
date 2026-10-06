"""N36 real-device host split into two packages.

* The host APK is the delivered APK with only its manifest replaced and one test DEX appended. Every
  product entry is copied byte for byte, so the code under test is the real delivery code.
* The probe APK is a clean test-only package that carries the instrumentation and a real
  InputMethodService. It owns its own resource table, so the platform lists and serves the IME
  normally; nothing in the delivered resource table is touched.
"""
from pathlib import Path
import argparse, hashlib, json, os, subprocess, zipfile

ROOT = Path(__file__).resolve().parents[2]
SDK = Path(r'C:\Users\14776\AppData\Local\Android\Sdk')
JDK = Path(r'E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1')
BUILD = SDK / 'build-tools/36.0.0'
PROBE_PACKAGE = 'app.morphe.n36.probe'
HOST_PACKAGE = 'app.morphe.android.youtube'


def run(arguments, **kwargs):
    subprocess.run([str(a) for a in arguments], check=True, **kwargs)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--label', default='n37r2')
    args = parser.parse_args()
    out = args.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    android = SDK / 'platforms/android-35/android.jar'
    classes = out / 'classes'
    classes.mkdir()
    sources = sorted((ROOT / 'tools/n37r2/android').glob('*.java')) + [ROOT / 'tools/n37/android/N36TestIme.java']
    run([JDK / 'bin/javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8',
         '-cp', android, '-d', classes, *sources])
    run([JDK / 'bin/jar.exe', 'cf', out / 'host.jar', '-C', classes, '.'])
    dex = out / 'dex'
    dex.mkdir()
    env = os.environ.copy()
    env['JAVA_HOME'] = str(JDK)
    run([BUILD / 'd8.bat', '--min-api', '28', '--lib', android, '--output', dex, out / 'host.jar'],
        env=env)

    # ---- probe APK: instrumentation + real IME service, own resource table
    probe_res = out / 'probe-res/xml'
    probe_res.mkdir(parents=True)
    (probe_res / 'n36_test_ime.xml').write_text(
        '<?xml version="1.0" encoding="utf-8"?>\n'
        '<input-method xmlns:android="http://schemas.android.com/apk/res/android"\n'
        '    android:supportsSwitchingToNextInputMethod="true" />\n', encoding='utf-8')
    probe_manifest = out / 'probe-manifest.xml'
    probe_manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{PROBE_PACKAGE}" android:versionCode="1" android:versionName="1.0">
<uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/>
<application android:label="{args.label} n36 probe" android:debuggable="true">
<service android:name="n36.N36TestIme" android:process=":ime" android:exported="true" android:permission="android.permission.BIND_INPUT_METHOD">
  <intent-filter><action android:name="android.view.InputMethod"/></intent-filter>
  <meta-data android:name="android.view.im" android:resource="@xml/n36_test_ime"/>
</service>
</application>
<instrumentation android:name="n36.N36Instrumentation" android:targetPackage="{HOST_PACKAGE}"/>
</manifest>''', encoding='utf-8')
    compiled = out / 'probe-compiled'
    compiled.mkdir()
    run([BUILD / 'aapt2.exe', 'compile', '--dir', out / 'probe-res', '-o', compiled])
    probe_linked = out / 'probe-linked.apk'
    run([BUILD / 'aapt2.exe', 'link', '-I', android, '--manifest', probe_manifest,
         '--min-sdk-version', '28', '--target-sdk-version', '35', '-o', probe_linked,
         '-R', compiled / 'xml_n36_test_ime.xml.flat', '--auto-add-overlay'])
    probe_unsigned = out / 'probe-unsigned.apk'
    with zipfile.ZipFile(probe_linked) as linked, \
            zipfile.ZipFile(probe_unsigned, 'w', compression=zipfile.ZIP_DEFLATED) as target:
        for name in linked.namelist():
            if name.startswith('META-INF/'):
                continue
            target.writestr(linked.getinfo(name), linked.read(name))
        target.writestr('classes.dex', (dex / 'classes.dex').read_bytes())
    probe_aligned = out / 'probe-aligned.apk'
    probe_signed = out / 'probe-signed.apk'
    run([BUILD / 'zipalign.exe', '-p', '4', probe_unsigned, probe_aligned])
    run([BUILD / 'apksigner.bat', 'sign', '--ks', ROOT / '.verification/n34/android/n34-test.jks',
         '--ks-key-alias', 'n34', '--ks-pass', 'pass:n34-local-only',
         '--key-pass', 'pass:n34-local-only', '--out', probe_signed, probe_aligned], env=env)

    # ---- host APK: delivered entries byte for byte, only the manifest is replaced
    host_manifest = out / 'host-manifest.xml'
    host_manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{HOST_PACKAGE}" android:versionCode="1561068412" android:versionName="21.16.256">
<uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/>
<uses-permission android:name="android.permission.INTERNET"/>
<application android:label="{args.label} real input host" android:debuggable="true" android:usesCleartextTraffic="true" android:supportsRtl="true">
<activity android:name="n36.N36Host" android:exported="true" android:theme="@android:style/Theme.Material.Light" android:configChanges="orientation|screenSize|screenLayout|smallestScreenSize|layoutDirection|locale" android:windowSoftInputMode="stateUnspecified|adjustResize"/>
</application>
</manifest>''', encoding='utf-8')
    host_linked = out / 'host-linked.apk'
    run([BUILD / 'aapt2.exe', 'link', '-I', android, '--manifest', host_manifest,
         '--min-sdk-version', '28', '--target-sdk-version', '35', '-o', host_linked])
    host_unsigned = out / 'host-unsigned.apk'
    inputs = {}
    with zipfile.ZipFile(args.input) as source, zipfile.ZipFile(host_linked) as metadata, \
            zipfile.ZipFile(host_unsigned, 'w', compression=zipfile.ZIP_DEFLATED) as target:
        names = source.namelist()
        dexes = [name for name in names if name.startswith('classes') and name.endswith('.dex')]
        for name in names:
            if name == 'AndroidManifest.xml' or name.startswith('META-INF/') or name.endswith('.idsig'):
                continue
            data = source.read(name)
            target.writestr(source.getinfo(name), data)
            if name in dexes or name == 'resources.arsc' or name.startswith('res/xml/morphe_prefs'):
                inputs[name] = hashlib.sha256(data).hexdigest()
        target.writestr('AndroidManifest.xml', metadata.read('AndroidManifest.xml'))
        target.writestr(f'classes{len(dexes) + 1}.dex', (dex / 'classes.dex').read_bytes())
    host_aligned = out / 'host-aligned.apk'
    host_signed = out / 'host-signed.apk'
    run([BUILD / 'zipalign.exe', '-p', '4', host_unsigned, host_aligned])
    run([BUILD / 'apksigner.bat', 'sign', '--ks', ROOT / '.verification/n34/android/n34-test.jks',
         '--ks-key-alias', 'n34', '--ks-pass', 'pass:n34-local-only',
         '--key-pass', 'pass:n34-local-only', '--out', host_signed, host_aligned], env=env)
    (out / 'provenance.json').write_text(json.dumps({
        'input': str(args.input.resolve()),
        'input_sha256': hashlib.sha256(args.input.read_bytes()).hexdigest(),
        'copied_actual_entries': inputs,
        'test_code': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
                      for p in sources},
        'host_sha256': hashlib.sha256(host_signed.read_bytes()).hexdigest(),
        'probe_sha256': hashlib.sha256(probe_signed.read_bytes()).hexdigest(),
        'probe_ime_component': f'{PROBE_PACKAGE}/n36.N36TestIme',
        'no_replacement_official_classes': True,
        'delivery_unchanged': True,
    }, indent=2), encoding='utf-8')
    print(host_signed)
    print(probe_signed)


if __name__ == '__main__':
    main()
