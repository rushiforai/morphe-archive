#!/usr/bin/env python3
"""Verify the hermetic runtime inputs of the pinned compatibility adaptation."""
from pathlib import Path
import hashlib
import json
import re
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
LOCK = ROOT / 'tools/morphe-compatibility.lock.json'

def main():
    lock = json.loads(LOCK.read_text())
    checked = 0
    for entry in lock['files']:
        path = ROOT / entry['path']
        data = path.read_bytes()
        assert hashlib.sha256(data).hexdigest() == entry['sha256'], f'Changed pinned input: {path}'
        if 'size' in entry:
            assert len(data) == entry['size'], f'Wrong input size: {path}'
        if path.suffix == '.mpe':
            assert data.startswith(b'dex\n'), f'Extension is not a DEX: {path}'
        checked += 1
    expected = ['extensions/shared.mpe', 'extensions/youtube.mpe', 'extensions/shared-youtube.mpe']
    assert lock['extension_order'] == expected, 'Upstream extension merge order changed'
    sources = ROOT / 'patches/src/main/kotlin/app/afterglow/patches/compat/morphe'
    entrypoints = (sources / 'MorpheCompatibilityPatches.kt').read_text()
    assert re.findall(r'extendWith\("compat/morphe/([^\"]+)"\)', entrypoints) == expected
    for path in sources.rglob('*.kt'):
        text = path.read_text()
        assert not re.search(r'(?:bytecodePatch|resourcePatch)\(\s*name\s*=', text), f'Unexpected named compatibility helper: {path}'
    values = ROOT / 'patches/src/main/resources/compat/morphe/values/compatibility.xml'
    resource_root = ET.parse(values).getroot()
    keys = [item.attrib['name'] for item in resource_root if 'name' in item.attrib]
    assert len(keys) == len(set(keys)), 'Duplicate compatibility resource names'
    for reference in re.findall(r'@string/([\w.]+)', values.read_text()):
        assert reference in keys, f'Missing runtime string: {reference}'
    print(f'PASS: {checked} pinned assets, ordered extensions, unnamed helpers, {len(keys)} runtime resources')

if __name__ == '__main__':
    main()
