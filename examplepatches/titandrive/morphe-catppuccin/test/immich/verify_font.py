#!/usr/bin/env python3
"""Check a font-only patched APK against the original without account access."""
import argparse
import hashlib
import json
import zipfile

p = argparse.ArgumentParser()
p.add_argument('original')
p.add_argument('patched')
p.add_argument('ttf')
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
            assert digest(patched.read(path)) == digest(original.read(path)), path
    assert patched.testzip() is None
print('PASS: eight text font assets replaced; icons, manifest and native libraries preserved')
