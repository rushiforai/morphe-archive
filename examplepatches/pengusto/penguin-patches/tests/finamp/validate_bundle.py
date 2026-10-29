#!/usr/bin/env python3
"""Verify every shipped native delta and its pinned source against the official APK."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import zipfile

from pfd import apply_delta
from build_native_payloads import APK_SHA, ENGINE_SHA, LIBRARY_SHA, SNAPSHOT, MASKS


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--bundle', type=Path, required=True)
    parser.add_argument('--original-apk', type=Path, required=True)
    parser.add_argument('--source-matrix', type=Path, required=True)
    parser.add_argument('--report', type=Path, required=True)
    args = parser.parse_args()
    sha = lambda data: hashlib.sha256(data).hexdigest()
    if sha(args.original_apk.read_bytes()) != APK_SHA:
        raise ValueError('Not the pinned official Finamp universal APK')
    with zipfile.ZipFile(args.original_apk) as archive:
        original = archive.read('lib/arm64-v8a/libapp.so')
        if sha(original) != LIBRARY_SHA or sha(archive.read('lib/arm64-v8a/libflutter.so')) != ENGINE_SHA:
            raise ValueError('Original native hashes differ')
    matrix = json.loads(args.source_matrix.read_text())
    root = 'finamp/1.0.1/'
    report = {'original_apk_sha256': APK_SHA, 'bundle_sha256': sha(args.bundle.read_bytes()), 'masks': {}}
    with zipfile.ZipFile(args.bundle) as bundle:
        names = bundle.namelist()
        if len(names) != len(set(names)):
            raise ValueError('Duplicate bundle entries')
        if any(name.lower().endswith(('.apk', '.jks', '.keystore', '.p12')) for name in names):
            raise ValueError('An APK or signing key must never be bundled')
        props = {}
        for line in bundle.read(root + 'manifest.properties').decode('utf-8').splitlines():
            if line and not line.startswith('#'):
                key, value = line.split('=', 1)
                if key in props:
                    raise ValueError('Duplicate native manifest property')
                props[key] = value
        expected = {root + f'arm64-v8a/{mask}.pfd' for mask in MASKS}
        actual = {name for name in names if name.startswith(root) and name.endswith('.pfd')}
        if actual != expected:
            raise ValueError(f'A publishable bundle must contain exactly all {len(MASKS)} native selections')
        for key, value in [('schema', '1'), ('package', 'com.unicornsonlsd.finamp'), ('version', '1.0.1'),
                           ('flutter', '3.47.2'), ('dart', '3.13.2'), ('abi.arm64-v8a.base.sha256', LIBRARY_SHA),
                           ('abi.arm64-v8a.engine.sha256', ENGINE_SHA)]:
            if props.get(key) != value:
                raise ValueError('Wrong manifest value for ' + key)
        for mask in MASKS:
            prefix = f'abi.arm64-v8a.mask.{mask}'
            resource = root + f'arm64-v8a/{mask}.pfd'
            if props.get(prefix + '.resource') != resource or props.get(prefix + '.source') != matrix['masks'][str(mask)]['commit']:
                raise ValueError('Wrong payload/source mapping')
            delta = bundle.read(resource)
            new = apply_delta(original, delta)
            if sha(new) != props[prefix + '.sha256'] or len(new) != int(props[prefix + '.size']):
                raise ValueError('Replayed native output mismatch')
            header = SNAPSHOT.search(new)
            if header is None or header.groups() != SNAPSHOT.search(original).groups():
                raise ValueError('Replayed Dart snapshot format is incompatible')
            if (b'Song artist order' in new) != bool(mask & 2) or (b'Invalid artist track count' in new) != bool(mask & 4):
                raise ValueError('Wrong compiled features for the selected mask')
            report['masks'][str(mask)] = {'source': props[prefix + '.source'], 'native_sha256': sha(new),
                                         'native_bytes': len(new), 'delta_bytes': len(delta), 'verified': True}
            if mask % 8 == 0 or mask == len(MASKS):
                print(f'Verified native replay {mask}/{len(MASKS)}', flush=True)
    args.report.parent.mkdir(parents=True, exist_ok=True)
    checkpoint = args.report.with_name(args.report.name + '.tmp')
    checkpoint.write_text(json.dumps(report, indent=2) + '\n')
    checkpoint.replace(args.report)
    print(f'All {len(MASKS)} shipped PFD1 payloads, source pins and native output hashes verified')


if __name__ == '__main__':
    main()
