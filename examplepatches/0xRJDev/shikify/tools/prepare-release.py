#!/usr/bin/env python3
"""Prepare local GitHub release assets and optional Morphe source metadata. Never publishes."""
import argparse
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re
import shutil
import zipfile

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--repository', help='Actual GitHub owner/repository; enables patches-bundle.json')
args = parser.parse_args()
if args.repository and not re.fullmatch(r'[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+', args.repository):
    parser.error('Use owner/repository, without a URL or .git suffix.')
version = re.search(r'^version\s*=\s*([^\s]+)', (ROOT/'gradle.properties').read_text(), re.M).group(1)
if not re.fullmatch(r'\d+\.\d+\.\d+(?:[-.][A-Za-z0-9.-]+)?', version):
    raise SystemExit('Invalid release version')
bundle = ROOT/'output'/f'shikify-{version}.mpp'
changelog = (ROOT/'changelog.md').read_text()
heading = f'# Version {version}\n'
if heading not in changelog:
    raise SystemExit(f'Add a changelog.md entry for version {version}')
metadata = json.loads((ROOT/'patches-list.json').read_text())
if metadata['version'] != version or not metadata['patches']:
    raise SystemExit('Rebuild first: patch list is empty or its version does not match the release')
names = [patch['name'] for patch in metadata['patches']]
if len(set(names)) != len(names) or any(name.startswith('Shikify:') for name in names):
    raise SystemExit('Unexpected public patch names')
with zipfile.ZipFile(bundle) as archive:
    if not {'classes.dex', 'extensions/extension.mpe'}.issubset(archive.namelist()):
        raise SystemExit('Bundle lacks Android patches or runtime extension')
    manifest = archive.read('META-INF/MANIFEST.MF').decode()
    if not re.search(r'^Version: '+re.escape(version)+r'\r?$', manifest, re.M):
        raise SystemExit('Compiled bundle version does not match the release')
release = ROOT/'release'; release.mkdir(exist_ok=True)
asset = release/bundle.name
shutil.copy2(bundle, asset)
digest = hashlib.sha256(asset.read_bytes()).hexdigest()
(release/(asset.name+'.sha256')).write_text(f'{digest}  {asset.name}\n')
shutil.copy2(ROOT/'patches-list.json', release/'patches-list.json')
# Keep the simple project changelog as the source of release notes.
notes = changelog.split(heading, 1)[1].split('\n# Version ', 1)[0].strip()
notes += '\n\nImport the `.mpp` into Morphe Manager and patch your own copy of Boost for Reddit 1.14.4 (`com.rubenmayayo.reddit`). No Boost APK is included.\n'
# The tip jar link stays on GitHub; Morphe Manager shows the bundle description without it.
(release/'release-notes.md').write_text(notes+'\nEnjoying Shikify? You can support it on [Ko-fi](https://ko-fi.com/shikify) ☕\n')
if args.repository:
    descriptor = {
        'created_at': datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%S'),
        'description': notes.strip(),
        'download_url': f'https://github.com/{args.repository}/releases/download/v{version}/{asset.name}',
        'signature_download_url': '',
        'version': version,
    }
    (ROOT/'patches-bundle.json').write_text(json.dumps(descriptor, indent=2)+'\n')
    shutil.copy2(ROOT/'patches-bundle.json', release/'patches-bundle.json')
else:
    print('Repository not specified; no source URL invented. Use --repository owner/repository before publishing.')
print(f'Prepared {asset.name}: {digest}')
print('Local files only; no GitHub release, tag or push was performed.')
