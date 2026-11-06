#!/usr/bin/env python3
"""Verify same-key Finamp information patch removal and reapplication on the disposable AVD."""
import argparse
import hashlib
from pathlib import Path
import subprocess
import sys
from zipfile import ZipFile

import android_acceptance as base
from artist_review_acceptance import download_file_hashes
from build_native_payloads import APK_SHA
from patch_matrix import check_contents


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('official-apk', 'original', 'patched', 'out', 'adb', 'apksigner'):
        parser.add_argument('--' + name, type=Path, required=True)
    for name in ('original-sha256', 'patched-sha256', 'patched-native-sha256'):
        parser.add_argument('--' + name, required=True)
    args = parser.parse_args()
    if digest(args.official_apk) != APK_SHA:
        raise ValueError('Official APK hash differs from the pinned release')
    for path, expected in ((args.original, args.original_sha256), (args.patched, args.patched_sha256)):
        if digest(path) != expected:
            raise ValueError('Requested APK hash mismatch')
    with ZipFile(args.official_apk) as official, ZipFile(args.original) as before:
        names = lambda z: {name for name in z.namelist() if not name.endswith('/') and not name.startswith('META-INF/')}
        if names(official) != names(before) or any(official.read(name) != before.read(name) for name in names(official)):
            raise ValueError('Re-signed baseline changes original APK contents')
    check_contents(args.official_apk, args.patched, args.patched_native_sha256)
    out = base.safe_output_path(args.out)
    if out.exists() and any(out.iterdir()):
        raise ValueError('Use a fresh lifecycle output directory')
    ui = base.Android(out / 'inventory', adb=args.adb)
    original_hashes = download_file_hashes(ui)
    if len([name for name in original_hashes if name.startswith('songs/')]) != 8:
        raise ValueError('Expected the eight existing synthetic downloaded songs')
    common = [sys.executable, '-B', str(Path(__file__).with_name('notes_acceptance.py')),
              '--adb', str(args.adb), '--apksigner', str(args.apksigner), '--require-preserved']
    steps = [('before', args.original, args.original_sha256), ('after', args.patched, args.patched_sha256),
             ('before', args.original, args.original_sha256), ('after', args.patched, args.patched_sha256),
             ('offline', args.patched, args.patched_sha256)]
    for index, (stage, apk, expected) in enumerate(steps):
        subprocess.run(common + ['--stage', stage, '--apk', str(apk), '--sha256', expected,
                                 '--out', str(out / f'{index}-{stage}')], check=True)
        actual = download_file_hashes(ui)
        if any(actual.get(path) != checksum for path, checksum in original_hashes.items()):
            raise AssertionError('Previously downloaded synthetic files changed')
        print(f'PASS: {index} {stage}; login and downloaded file hashes preserved', flush=True)


if __name__ == '__main__':
    main()
