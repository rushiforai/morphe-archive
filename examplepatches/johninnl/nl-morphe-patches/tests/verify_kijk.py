"""Verify every emitted KIJK method and untouched method against decoded publisher input."""
import argparse
import json
import re
import hashlib
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path
from atv_smali import classes, class_methods, graph, without_prefix


def verify(original, patched, ads=False, tracking=False, contracts=None):
    before, after = classes(original), classes(patched)
    if contracts is None:
        contracts = json.loads(Path(__file__).with_name('kijk_mobile_contracts.json').read_text())
    edits = {x['owner'] + '->' + x['signature']: x for x in contracts
             if (ads if x['selection'] == 'ads' else tracking)}
    assert before.keys() == after.keys(), 'KIJK class inventory changed'
    seen = set()
    for owner, path in before.items():
        old, new = class_methods(path), class_methods(after[owner])
        assert old.keys() == new.keys(), owner + ': method inventory changed'
        for key, rows in old.items():
            actual = new[key]
            if key in edits:
                edit = edits[key]
                if 'replacements' in edit:
                    expected = list(rows)
                    for replacement in edit['replacements']:
                        locations = [i for i, row in enumerate(expected) if row == replacement['instruction']]
                        assert len(locations) == 1, key + ': replacement anchor changed'
                        expected[locations[0]] = replacement['with']
                    assert actual == expected, key + ': selective identifier edit changed other behavior'
                    seen.add(key)
                    continue
                prefix = edit['prefix']
                if rows[0].startswith('.locals '):
                    locals_count = int(rows[0].split()[1])
                    prefix = re.sub(r'\bv(\d+)\b', lambda m: 'p' + str(int(m[1]) - locals_count)
                                    if int(m[1]) >= locals_count else m[0], prefix)
                expected = graph(rows[0] + '\n' + prefix)
                count = len(expected) - 1
                assert actual[:count + 1] == expected, key + ': missing policy prefix'
                assert without_prefix(actual, count) == rows, key + ': original tail changed'
                seen.add(key)
            else:
                assert actual == rows, key + ': unselected method changed'
    assert seen == edits.keys(), 'Missing KIJK policy target'
    print(f'KIJK complete bytecode comparison passed ({len(seen)} edits)')


def verify_payload(original, patched):
    assert hashlib.sha256(Path(original).read_bytes()).hexdigest() == '695ec882393b98385046423da5b8d8ca8126e4a5c175e7731cb209ef43452d63', 'Unsupported KIJK original APK'
    with zipfile.ZipFile(original) as before, zipfile.ZipFile(patched) as after:
        payload = lambda archive: {name for name in archive.namelist()
                                  if name.startswith(('res/', 'assets/', 'lib/')) and not name.endswith('/')}
        names = payload(before)
        assert names == payload(after), 'KIJK packaged payload inventory changed'
        for name in names:
            assert before.read(name) == after.read(name), 'KIJK packaged payload changed: ' + name
    return len(names)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--original', required=True, type=Path)
    parser.add_argument('--patched', required=True, type=Path)
    parser.add_argument('--ads', action='store_true')
    parser.add_argument('--tracking', action='store_true')
    parser.add_argument('--original-apk', type=Path)
    parser.add_argument('--patched-apk', type=Path)
    args = parser.parse_args()
    verify(args.original, args.patched, args.ads, args.tracking)
    from kijk_mobile_manifest import verify as verify_manifest
    verify_manifest(ET.parse(args.original / 'AndroidManifest.xml').getroot(),
                    ET.parse(args.patched / 'AndroidManifest.xml').getroot(), args.tracking)
    if args.original_apk or args.patched_apk:
        assert args.original_apk and args.patched_apk, 'Provide both APK arguments'
        print(f'PASS: {verify_payload(args.original_apk, args.patched_apk)} original KIJK resource/asset/native payloads')
