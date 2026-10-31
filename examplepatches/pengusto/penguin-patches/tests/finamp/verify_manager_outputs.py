#!/usr/bin/env python3
"""Read-only verification of APKs saved through the actual Android Manager UI."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import zipfile

from build_native_payloads import APK_SHA
from patch_matrix import check_contents

FULL_SUITE = {'32-jvm', '64-jvm', '96-jvm', '127-jvm', '31-jvm', '127-art'}
SUITES = {'ui-fixes': FULL_SUITE,
          'artist-review': {'4-jvm', '12-jvm', '36-jvm', '127-jvm', '123-jvm', '4-art', '127-art'}}
SUPPORTED_CASES = {f'{mask}-{runtime}{suffix}' for mask in range(1, 128)
                   for runtime in ('jvm', 'art') for suffix in ('', '-recovery')}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for argument in ('apk-dir', 'original-apk', 'native-report', 'build-tools', 'java-home', 'report'):
        parser.add_argument('--' + argument, type=Path, required=True)
    parser.add_argument('--signer-sha256', required=True)
    parser.add_argument('--suite', choices=sorted(SUITES), default='ui-fixes')
    parser.add_argument('--expect', default=None,
                        help='Case IDs; a subset is explicitly recorded as an incomplete suite')
    args = parser.parse_args()
    signer = args.signer_sha256.lower()
    if not re.fullmatch(r'[0-9a-f]{64}', signer):
        raise ValueError('Invalid expected signer SHA-256')
    expected_suite = SUITES[args.suite]
    cases = args.expect.split(',') if args.expect is not None else sorted(expected_suite)
    if len(cases) != len(set(cases)) or not set(cases) <= SUPPORTED_CASES:
        raise ValueError('Select unique recorded Manager case IDs')
    if hashlib.sha256(args.original_apk.read_bytes()).hexdigest() != APK_SHA:
        raise ValueError('Wrong official APK input')
    native = json.loads(args.native_report.read_text())
    if native['original_apk_sha256'] != APK_SHA:
        raise ValueError('Native verification report targets another original')
    environment = dict(os.environ, JAVA_HOME=str(args.java_home.resolve()))
    report = {'original_apk_sha256': APK_SHA, 'bundle_sha256': native['bundle_sha256'],
              'manager_suite': args.suite, 'expected_suite_cases': sorted(expected_suite),
              'full_manager_suite': set(cases) == expected_suite, 'cases': {}}
    for case in cases:
        mask, runtime, *stage = case.split('-')
        apk = args.apk_dir / f'manager-mask-{case}.apk'
        expected = native['masks'][mask]['native_sha256']
        contents = check_contents(args.original_apk, apk, expected)
        # This pinned manifest has extractNativeLibs=false: alignment alone does
        # not make a compressed native entry loadable directly from the APK.
        with zipfile.ZipFile(apk) as archive:
            if any(entry.compress_type != zipfile.ZIP_STORED for entry in archive.infolist()
                   if entry.filename.startswith('lib/') and entry.filename.endswith('.so')):
                raise ValueError('Compressed native library is incompatible with this manifest: ' + case)
        signature = subprocess.check_output([str(args.build_tools / 'apksigner'), 'verify', '--print-certs', str(apk)],
                                            env=environment, text=True)
        certificates = re.findall(r'Signer #\d+ certificate SHA-256 digest: ([0-9a-f]+)', signature)
        if certificates != [signer]:
            raise ValueError('Unexpected Manager signer for ' + case)
        subprocess.run([str(args.build_tools / 'zipalign'), '-c', '-P', '16', '4', str(apk)],
                       check=True, capture_output=True)
        report['cases'][case] = {'mask': int(mask), 'runtime': runtime, 'recovery': stage == ['recovery'],
                                 'apk_bytes': apk.stat().st_size,
                                 'apk_sha256': hashlib.sha256(apk.read_bytes()).hexdigest(),
                                 'native_sha256': expected, 'signer_sha256': signer,
                                 'signature_verified': True, 'alignment_16k_verified': True,
                                 'native_entries_uncompressed': True, **contents}
        print('Verified actual Manager output: ' + case)
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, indent=2) + '\n')


if __name__ == '__main__':
    main()
