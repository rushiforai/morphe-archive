#!/usr/bin/env python3
"""Apply the real MPP to every native selection; verify retained APK contents."""
import argparse
import hashlib
import json
import os
import shutil
from pathlib import Path
import subprocess
import zipfile

from build_native_payloads import APK_SHA, LIBRARY_SHA, MASKS

NAMES = {1: 'Fix section title validation', 2: 'Song artist order', 4: 'Load artist pages faster',
         8: 'Fix offline artist tracks', 16: 'Fix track alphabet navigation'}
NAMES[32] = 'Keep player output controls accessible'
NAMES[64] = 'Fix quick settings banner contrast'


def sha(data):
    return hashlib.sha256(data).hexdigest()


def check_contents(original, patched, expected_sha):
    with zipfile.ZipFile(original) as before, zipfile.ZipFile(patched) as after:
        names = set(after.namelist())
        if sha(after.read('lib/arm64-v8a/libapp.so')) != expected_sha:
            raise ValueError('Morphe produced the wrong native selection')
        abis = {name.split('/')[1] for name in names if name.startswith('lib/') and name.endswith('.so')}
        if abis != {'arm64-v8a'}:
            raise ValueError('Unverified native architecture remains in output')
        changed = []
        for name in before.namelist():
            if name.endswith('/') or name.startswith('META-INF/'):
                continue
            if name.startswith('lib/') and not name.startswith('lib/arm64-v8a/'):
                continue
            if name not in names:
                raise ValueError('Lost original APK entry ' + name)
            if before.read(name) != after.read(name):
                changed.append(name)
        if changed != ['lib/arm64-v8a/libapp.so']:
            raise ValueError('Unexpected retained APK content modifications: ' + repr(changed))
        extra = [name for name in names - set(before.namelist()) if not name.endswith('/') and not name.startswith('META-INF/')]
        if extra:
            raise ValueError('Unexpected APK additions: ' + repr(extra))
    return {'changed_retained_entries': changed, 'abis': sorted(abis)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ['java', 'desktop', 'bundle', 'original-apk', 'native-report', 'output-dir']:
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--discard-verified-apks', action='store_true',
                        help='Keep receipts/hashes but discard each successful APK and its owned work directory')
    args = parser.parse_args()
    if sha(args.original_apk.read_bytes()) != APK_SHA:
        raise ValueError('Wrong official APK input')
    report = json.loads(args.native_report.read_text())
    directory = args.output_dir.resolve()
    directory.mkdir(parents=True, exist_ok=True)
    results = {}
    for mask in MASKS:
        output = directory / f'mask-{mask}-unsigned.apk'
        result_file = directory / f'mask-{mask}-patcher.json'
        if output.exists() or result_file.exists():
            raise ValueError('Use a new output directory; refusing to reuse a stale result')
        selections = [name for bit, name in NAMES.items() if mask & bit]
        command = [str(args.java.resolve()), '-Xmx3g', '-jar', str(args.desktop.resolve()), 'patch',
                   str(args.original_apk.resolve()), '-p', str(args.bundle.resolve()), '--exclusive']
        for selection in selections:
            command += ['-e', selection]
        command += ['--unsigned', '-o', str(output), '-r', str(result_file), '-t', str(directory / f'work-{mask}')]
        with (directory / f'mask-{mask}.log').open('w') as log:
            subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
        status = json.loads(result_file.read_text())
        # Desktop 1.18 uses objects; 1.19 uses names and renames the step array.
        applied = {p if isinstance(p, str) else p['name'] for p in status['appliedPatches']}
        if status['failedPatches'] or applied != set(selections) or status.get('success', True) is not True:
            raise ValueError('Unexpected patcher selections/results')
        steps = status.get('patchingSteps', status.get('stepResults'))
        if not steps or not all(step['success'] for step in steps):
            raise ValueError('Patcher step failed')
        content = check_contents(args.original_apk, output, report['masks'][str(mask)]['native_sha256'])
        results[str(mask)] = {'selected': selections, 'patcher_succeeded': True, **content,
                              'unsigned_apk': None if args.discard_verified_apks else str(output),
                              'unsigned_apk_sha256': sha(output.read_bytes()),
                              'unsigned_apk_retained': not args.discard_verified_apks}
        temporary_report = directory / 'matrix-report.json.tmp'
        temporary_report.write_text(json.dumps(results, indent=2) + '\n')
        temporary_report.replace(directory / 'matrix-report.json')
        if args.discard_verified_apks:
            output.unlink()
            temporary = directory / f'work-{mask}'
            if temporary.is_dir():
                shutil.rmtree(temporary)
        print('Verified real Morphe selection ' + str(mask), flush=True)


if __name__ == '__main__':
    main()
