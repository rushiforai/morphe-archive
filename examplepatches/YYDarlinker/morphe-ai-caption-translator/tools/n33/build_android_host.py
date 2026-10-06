"""Independent ART/WMS host: unmodified final APK DEX/resources and new test-only lifecycle code."""
from pathlib import Path
import argparse, hashlib, json, os, subprocess, zipfile

ROOT = Path(__file__).resolve().parents[2]
SDK = Path(r'C:\Users\14776\AppData\Local\Android\Sdk')
JDK = Path(r'E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1')
BUILD = SDK / 'build-tools/36.0.0'

def run(arguments, **kwargs):
    subprocess.run([str(a) for a in arguments], check=True, **kwargs)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    out = args.output.resolve(); out.mkdir(parents=True, exist_ok=False)
    android = SDK / 'platforms/android-35/android.jar'
    classes = out / 'classes'; classes.mkdir()
    sources = sorted((ROOT / 'tools/n33/android').glob('*.java'))
    run([JDK / 'bin/javac.exe', '-encoding', 'UTF-8', '-source', '8', '-target', '8', '-cp', android, '-d', classes, *sources])
    run([JDK / 'bin/jar.exe', 'cf', out / 'host.jar', '-C', classes, '.'])
    dex = out / 'dex'; dex.mkdir()
    env = os.environ.copy(); env['JAVA_HOME'] = str(JDK)
    run([BUILD / 'd8.bat', '--min-api', '28', '--lib', android, '--output', dex, out / 'host.jar'], env=env)
    manifest = out / 'AndroidManifest.xml'
    manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app.morphe.android.youtube" android:versionCode="1561068412" android:versionName="21.16.256">
<uses-sdk android:minSdkVersion="28" android:targetSdkVersion="35"/>
<uses-permission android:name="android.permission.INTERNET"/>
<application android:label="N33 actual DEX verification" android:debuggable="true" android:usesCleartextTraffic="true">
<activity android:name="n33.N33Host" android:exported="true" android:theme="@android:style/Theme.Material.Light"/>
</application>
<instrumentation android:name="n33.N33Instrumentation" android:targetPackage="app.morphe.android.youtube"/>
</manifest>''', encoding='utf-8')
    linked = out / 'manifest.apk'
    run([BUILD / 'aapt2.exe', 'link', '-I', android, '--manifest', manifest, '-o', linked])
    unsigned = out / 'host-unsigned.apk'
    inputs = {}
    with zipfile.ZipFile(args.input) as source, zipfile.ZipFile(linked) as metadata, zipfile.ZipFile(unsigned, 'w', compression=zipfile.ZIP_DEFLATED) as target:
        names = source.namelist()
        dexes = [name for name in names if name.startswith('classes') and name.endswith('.dex')]
        for name in names:
            if name == 'AndroidManifest.xml' or name.startswith('META-INF/') or name.endswith('.idsig'):
                continue
            data = source.read(name); target.writestr(source.getinfo(name), data)
            if name in dexes or name == 'resources.arsc' or name.startswith('res/xml/morphe_prefs'):
                inputs[name] = hashlib.sha256(data).hexdigest()
        target.writestr('AndroidManifest.xml', metadata.read('AndroidManifest.xml'))
        target.writestr(f'classes{len(dexes) + 1}.dex', (dex / 'classes.dex').read_bytes())
    signed = out / 'host-signed.apk'
    aligned = out / 'host-aligned.apk'
    run([BUILD / 'zipalign.exe', '-p', '4', unsigned, aligned])
    run([BUILD / 'apksigner.bat', 'sign', '--ks', ROOT / '.verification/n33/android/n33-test.jks', '--ks-key-alias', 'n33', '--ks-pass', 'pass:n33-local-only', '--key-pass', 'pass:n33-local-only', '--out', signed, aligned], env=env)
    (out / 'provenance.json').write_text(json.dumps({'input': str(args.input.resolve()), 'input_sha256': hashlib.sha256(args.input.read_bytes()).hexdigest(), 'copied_actual_entries': inputs, 'test_code': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sources}, 'no_replacement_official_classes': True, 'delivery_unchanged': True}, indent=2), encoding='utf-8')
    print(signed)

if __name__ == '__main__':
    main()
