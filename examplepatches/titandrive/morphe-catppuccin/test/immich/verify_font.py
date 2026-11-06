#!/usr/bin/env python3
"""Check a font or combined patched APK without account access."""
import argparse
import hashlib
import json
from pathlib import Path
import zipfile

p = argparse.ArgumentParser()
p.add_argument('original')
p.add_argument('patched')
p.add_argument('ttf')
p.add_argument('--palette-recipe', help='Expected native edits when the theme patch is also selected')
args = p.parse_args()
font = open(args.ttf, 'rb').read()
digest = lambda data: hashlib.sha256(data).digest()
with zipfile.ZipFile(args.original) as original, zipfile.ZipFile(args.patched) as patched:
    manifest = 'assets/flutter_assets/FontManifest.json'
    assert patched.read(manifest) == original.read(manifest), 'Font manifest changed'
    families = json.loads(original.read(manifest))
    count = 0
    for family in families:
        for entry in family['fonts']:
            path = 'assets/flutter_assets/' + entry['asset']
            if family['family'] in ('GoogleSans', 'GoogleSansCode'):
                assert digest(patched.read(path)) == digest(font), path
                count += 1
            else:
                assert patched.read(path) == original.read(path), 'Icon font changed'
    assert count == 8
    for path in original.namelist():
        if path.startswith('lib/') and not path.endswith('/'):
            expected = bytearray(original.read(path))
            if args.palette_recipe and path == 'lib/arm64-v8a/libapp.so':
                lines = [line for line in Path(args.palette_recipe).read_text().splitlines() if line and not line.startswith('#')]
                assert hashlib.sha256(expected).hexdigest() == lines[0]
                for line in lines[1:]:
                    address, before, after = line.split('\t')
                    offset = int(address, 16)
                    before, after = bytes.fromhex(before), bytes.fromhex(after)
                    assert expected[offset:offset+len(before)] == before
                    expected[offset:offset+len(after)] = after
            assert digest(patched.read(path)) == digest(expected), path
    assert patched.testzip() is None
print('PASS: eight text fonts replaced; icons/manifest preserved; native libraries match only the expected edits')
