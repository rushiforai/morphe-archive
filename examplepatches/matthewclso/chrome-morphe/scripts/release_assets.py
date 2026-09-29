#!/usr/bin/env python3
"""Prepare the independently built patch bundle, Manager metadata and checksum."""
import argparse
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import shutil
import zipfile

parser = argparse.ArgumentParser()
parser.add_argument('--tag', required=True)
args = parser.parse_args()
root = Path(__file__).resolve().parents[1]
version = next(line.split('=', 1)[1].strip() for line in (root / 'gradle.properties').read_text().splitlines() if line.startswith('version='))
if args.tag != 'v' + version:
    raise SystemExit('Tag must match gradle.properties version')
source = root / f'patches/build/libs/patches-{version}.mpp'
with zipfile.ZipFile(source) as bundle:
    manifest = bundle.read('META-INF/MANIFEST.MF').decode()
    assert f'Version: {version}' in manifest
    assert 'License: MIT' in manifest
    assert 'classes.dex' in bundle.namelist()
out = root / 'build/release'
out.mkdir(parents=True, exist_ok=True)
name = f'chrome-morphe-{version}.mpp'
shutil.copyfile(source, out / name)
digest = hashlib.sha256(source.read_bytes()).hexdigest()
(out / 'SHA256SUMS').write_text(f'{digest}  {name}\n')
metadata = {
    'created_at': datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%S'),
    'description': (root / 'docs/RELEASE_NOTES.md').read_text().strip(),
    'download_url': f'https://github.com/matthewclso/chrome-morphe/releases/download/{args.tag}/{name}',
    'signature_download_url': '',
    'version': version,
}
(out / 'patches-bundle.json').write_text(json.dumps(metadata, indent=2) + '\n')
print(f'{name}: {digest}')
