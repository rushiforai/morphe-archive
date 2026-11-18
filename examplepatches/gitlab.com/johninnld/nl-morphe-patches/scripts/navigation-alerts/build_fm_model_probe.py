#!/usr/bin/env python3
"""Build an FM model/resource instrumentation APK without app-class compile stubs."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile
import zipfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--key', type=Path, required=True)
    parser.add_argument('--alias', default='native-warning-test')
    parser.add_argument('--kind', choices=['models', 'capture'], default='models')
    args = parser.parse_args()
    probe_class = 'NativeFmModelProbe' if args.kind == 'models' else 'NativeFmCaptureProbe'
    source = Path(__file__).with_name('probe') / (probe_class + '.java')
    sources = [source]
    if args.kind == 'capture':
        sources += [source.with_name(name) for name in ['Fm15PrivateMovingInput.java','Fm15PrivateZoneInput.java']]
    tools = args.sdk / 'build-tools/36.0.0'
    android = args.sdk / 'platforms/android-36/android.jar'
    args.output.mkdir(parents=True, exist_ok=True)

    def run(*command):
        subprocess.run([str(item) for item in command], check=True)

    with tempfile.TemporaryDirectory(prefix='compile-', dir=args.output) as temporary:
        classes, dex = Path(temporary) / 'classes', Path(temporary) / 'dex'
        classes.mkdir();dex.mkdir()
        source_hashes = {item.name: hashlib.sha256(item.read_bytes()).hexdigest() for item in sources}
        digest = source_hashes[source.name]
        run('javac', '--release', '8', '-cp', android, '-d', classes, *sources)
        if any(hashlib.sha256(item.read_bytes()).hexdigest() != source_hashes[item.name] for item in sources):
            raise RuntimeError('Probe source changed during compilation')
        run(tools / 'd8', '--min-api', '29', '--lib', android, '--output', dex, *sorted(classes.rglob('*.class')))
        manifest = args.output / 'AndroidManifest.xml'
        manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="nl.johninnl.warningprobe.fm.' + args.kind + '">'
                            '<uses-sdk android:minSdkVersion="29" android:targetSdkVersion="34"/>'
                            '<application android:label="FM native model probe" android:allowBackup="false"/>'
                            '<instrumentation android:name="nl.johninnl.warningprobe.' + probe_class + '" android:targetPackage="nl.flitsmeister"/>'
                            '</manifest>')
        raw, apk = args.output / 'unaligned.apk', args.output / 'probe.apk'
        run(tools / 'aapt2', 'link', '-I', android, '--manifest', manifest, '-o', raw)
        with zipfile.ZipFile(raw, 'a', zipfile.ZIP_DEFLATED) as archive:
            for item in sorted(dex.glob('classes*.dex')):
                archive.write(item, item.name)
        run(tools / 'zipalign', '-f', '4', raw, apk)
        run(tools / 'apksigner', 'sign', '--ks', args.key, '--ks-key-alias', args.alias,
            '--ks-pass', 'pass:android', '--key-pass', 'pass:android', apk)
        run(tools / 'apksigner', 'verify', apk)
        (args.output / 'build-report.json').write_text(json.dumps({
            'source_sha256': digest, 'probe_sha256': hashlib.sha256(apk.read_bytes()).hexdigest(),
            'sources_sha256': source_hashes,
            'android_jar_sha256': hashlib.sha256(android.read_bytes()).hexdigest(),
            'target_package': 'nl.flitsmeister', 'target_model_classes_in_probe': False, 'kind': args.kind,
        }, indent=2) + '\n')
    print(apk)


if __name__ == '__main__':
    main()
