#!/usr/bin/env python3
"""Build same-test-signer native lifecycle probes; no device interaction."""
import argparse
from pathlib import Path
import subprocess
import zipfile

TARGETS = {'vela': 'app.vela', 'maps': 'com.google.android.apps.maps'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--target', choices=TARGETS, required=True)
    parser.add_argument('--key', type=Path, required=True)
    parser.add_argument('--alias', default='native-warning-test')
    production = parser.add_mutually_exclusive_group()
    production.add_argument('--production-maps',action='store_true',help='Compile only reflection-based Maps production cases; load all alert/owner classes from the target APK')
    production.add_argument('--production-vela', action='store_true', help='Compile only reflection-based Vela adapter cases in a fresh output directory; load production classes from the target APK')
    args = parser.parse_args()
    if args.production_maps and args.target!='maps':parser.error('--production-maps requires --target maps')
    if args.production_vela and args.target != 'vela':
        parser.error('--production-vela requires --target vela')
    source = Path(__file__).with_name('probe')
    tools = args.sdk / 'build-tools/36.0.0'
    android = args.sdk / 'platforms/android-36/android.jar'
    output = args.output
    if args.production_vela and output.exists() and any(output.iterdir()):
        raise ValueError('Use a fresh empty output directory for production-only Vela instrumentation')
    classes, dex = output / 'classes', output / 'dex'
    classes.mkdir(parents=True, exist_ok=True)
    dex.mkdir(parents=True, exist_ok=True)
    target_source = source / ('VelaVoiceProbe.java' if args.target == 'vela' else 'MapsVoiceProbe.java')

    def run(*command):
        subprocess.run([str(item) for item in command], check=True)

    if args.production_vela:
        inputs = [source / 'NativeWarningProbe.java', source / 'VelaAdapterProbe.java']
    elif args.production_maps:
        if (classes/'nl/johninnl/navigation').exists():raise ValueError('Use a clean output directory for production-only Maps instrumentation')
        inputs=[source/'NativeWarningProbe.java',target_source]
    else:
        shared = sorted((Path(__file__).resolve().parents[2] / 'support/navigation-alerts/src/main/java').rglob('*.java'))
        shared += sorted((Path(__file__).resolve().parents[2] / 'support/navigation-startup/src/main/java').rglob('*.java'))
        inputs=[source/'NativeWarningProbe.java',source/'WarningCodecProbe.java',source/'PlaybackLedgerProbe.java',target_source,*shared]
    run('javac', '--release', '8', '-cp', android, '-d', classes,*inputs)
    run(tools / 'd8', '--min-api', '29', '--lib', android, '--output', dex,
        *sorted(classes.rglob('*.class')))
    package = 'nl.johninnl.warningprobe.' + args.target
    manifest = output / 'AndroidManifest.xml'
    manifest.write_text('<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="' + package + '">'
                        '<uses-sdk android:minSdkVersion="29" android:targetSdkVersion="34"/>'
                        '<application android:label="Native warning lifecycle probe"/>'
                        '<instrumentation android:name="nl.johninnl.warningprobe.NativeWarningProbe" android:targetPackage="'
                        + TARGETS[args.target] + '"/></manifest>')
    raw, apk = output / 'unaligned.apk', output / 'probe.apk'
    run(tools / 'aapt2', 'link', '-I', android, '--manifest', manifest, '-o', raw)
    with zipfile.ZipFile(raw, 'a', zipfile.ZIP_DEFLATED) as archive:
        for item in sorted(dex.glob('classes*.dex')):
            archive.write(item, item.name)
    run(tools / 'zipalign', '-f', '4', raw, apk)
    run(tools / 'apksigner', 'sign', '--ks', args.key, '--ks-key-alias', args.alias,
        '--ks-pass', 'pass:android', '--key-pass', 'pass:android', apk)
    run(tools / 'apksigner', 'verify', apk)
    print(apk)


if __name__ == '__main__':
    main()
