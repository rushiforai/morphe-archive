#!/usr/bin/env python3
"""Build disposable separate-UID synthetic Binder probes; never contacts a device."""
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
    args = parser.parse_args()
    tools = args.sdk / 'build-tools/36.0.0'
    android = args.sdk / 'platforms/android-36/android.jar'
    root = Path(__file__).resolve().parents[2]
    probe = Path(__file__).with_name('probe')
    args.output.mkdir(parents=True, exist_ok=True)
    temporary = tempfile.TemporaryDirectory(prefix='compile-', dir=args.output)
    classes, dex = Path(temporary.name) / 'classes', Path(temporary.name) / 'dex'
    classes.mkdir(parents=True, exist_ok=True)
    dex.mkdir(parents=True, exist_ok=True)
    shared = sorted((root / 'support/navigation-alerts/src/main/java').rglob('*.java'))
    shared += sorted((root / 'support/navigation-startup/src/main/java').rglob('*.java'))
    sources = [probe / 'BinderSourceService.java', probe / 'BinderClientProbe.java', *shared]

    def identities():
        return {str(path.resolve().relative_to(root)): hashlib.sha256(path.read_bytes()).hexdigest() for path in sources}

    source_hashes = identities()

    def run(*command):
        subprocess.run([str(value) for value in command], check=True)

    run('javac', '--release', '8', '-cp', android, '-d', classes,
        *sources)
    if identities() != source_hashes:
        raise RuntimeError('Probe source changed while compiling; rebuild before running')
    run(tools / 'd8', '--min-api', '29', '--lib', android, '--output', dex, *sorted(classes.rglob('*.class')))
    built = {}
    for role in ('source', 'client', 'stranger'):
        package = 'nl.johninnl.warningprobe.binder.' + role
        output = args.output / role
        output.mkdir(parents=True, exist_ok=True)
        component = ('<service android:name="nl.johninnl.warningprobe.BinderSourceService" android:exported="true"/>' if role == 'source' else '')
        instrumentation = ('' if role == 'source' else '<instrumentation android:name="nl.johninnl.warningprobe.BinderClientProbe" android:targetPackage="' + package + '"/>')
        manifest = output / 'AndroidManifest.xml'
        manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="' + package + '">'
                            '<uses-sdk android:minSdkVersion="29" android:targetSdkVersion="34"/>'
                            '<queries><package android:name="nl.johninnl.warningprobe.binder.source"/>'
                            '<package android:name="nl.johninnl.warningprobe.binder.client"/></queries>'
                            '<application android:label="Synthetic Binder warning probe" android:allowBackup="false">' + component + '</application>'
                            + instrumentation + '</manifest>')
        raw, apk = output / 'unaligned.apk', output / 'probe.apk'
        run(tools / 'aapt2', 'link', '-I', android, '--manifest', manifest, '-o', raw)
        with zipfile.ZipFile(raw, 'a', zipfile.ZIP_DEFLATED) as archive:
            for item in sorted(dex.glob('classes*.dex')):
                archive.write(item, item.name)
        run(tools / 'zipalign', '-f', '4', raw, apk)
        run(tools / 'apksigner', 'sign', '--ks', args.key, '--ks-key-alias', args.alias,
            '--ks-pass', 'pass:android', '--key-pass', 'pass:android', apk)
        run(tools / 'apksigner', 'verify', apk)
        built[role] = str(apk)
    (args.output / 'build-report.json').write_text(json.dumps({
        'sources': source_hashes,
        'android_jar_sha256': hashlib.sha256(android.read_bytes()).hexdigest(),
        'apks': {role: {'path': path, 'sha256': hashlib.sha256(Path(path).read_bytes()).hexdigest()}
                 for role, path in built.items()},
        'acceptance_scope': 'Synthetic separate-UID Binder probe; no audio or native application acceptance',
    }, indent=2) + '\n')
    temporary.cleanup()
    print(json.dumps(built))


if __name__ == '__main__':
    main()
