#!/usr/bin/env python3
"""Check the public source and the exact Android release artifact before publishing."""
from pathlib import Path
import io, json, re, subprocess, zipfile

root = Path(__file__).resolve().parents[1]
def git(*args):
    return subprocess.check_output(['git', *args], cwd=root)

version = next(s.split('=', 1)[1].strip() for s in (root/'gradle.properties').read_text().splitlines() if s.startswith('version'))
expected = {'Dark mode', 'Bike mode', 'Personal Maps API key', 'Custom weather sources',
            'Physical Activity spoof [TRANSMITTER]', 'Physical Activity spoof [RECEIVER]', 'ClipCascade sync', 'Better translate UX'}
catalog = json.loads((root/'patches-list.json').read_text())
assert catalog['version'] == version
assert len(catalog['patches']) == len(expected) and {p['name'] for p in catalog['patches']} == expected
receiver = next(p for p in catalog['patches'] if p['name'].endswith('[RECEIVER]'))
assert not receiver.get('compatiblePackages'), 'Receiver must not target a specific package'
for path in ('patches-bundle.json', 'amazon/patches-bundle.json'):
    metadata = json.loads((root/path).read_text())
    assert metadata['version'] == version
    assert metadata['download_url'] == f'https://github.com/urroxyz/morphe-patches/releases/download/v{version}/patches-{version}.mpp', 'Source points outside Urro release'
    assert re.fullmatch(r'\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d', metadata['created_at'])
assert (root/'patches-bundle.png').read_bytes().startswith(b'\x89PNG\r\n\x1a\n')
assert (root/'patches-bundle.png').read_bytes() == (root/'amazon/patches-bundle.png').read_bytes()
assert (root/'patches-bundle.json').read_bytes() == (root/'amazon/patches-bundle.json').read_bytes()

forbidden_suffixes = {'.apk', '.apks', '.apkm', '.so', '.p12', '.jks', '.keystore'}
patterns = [rb'AIza[0-9A-Za-z_-]{35}', rb'(?:ghp_|github_pat_)[A-Za-z0-9_]{20,}',
            rb'-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----', rb'/usr/src/' + rb'mobile-transfer/']
scanned = 0
def inspect(name, data):
    global scanned
    scanned += 1
    assert Path(name).suffix.lower() not in forbidden_suffixes, f'Private/binary artifact: {name}'
    for pattern in patterns:
        assert re.search(pattern, data) is None, f'Secret-shaped content: {name}'
    if data.startswith(b'PK\x03\x04'):
        with zipfile.ZipFile(io.BytesIO(data)) as archive:
            assert archive.testzip() is None, name
            for entry in archive.namelist():
                if not entry.endswith('/'):
                    inspect(name+'!'+entry, archive.read(entry))

files = set(git('ls-files', '-z').decode().split('\0')) | set(git('ls-files', '--others', '--exclude-standard', '-z').decode().split('\0'))
for name in sorted(files - {''}):
    path = root/name
    if path.is_file(): inspect(name, path.read_bytes())
bundle = root/f'patches/build/libs/patches-{version}.mpp'
inspect(bundle.name, bundle.read_bytes())
with zipfile.ZipFile(bundle) as archive:
    manifest = archive.read('META-INF/MANIFEST.MF').decode().replace('\r\n', '\n')
    assert '\nName: Urro\n' in manifest
    assert '\nSource: https://github.com/urroxyz/morphe-patches\n' in manifest
    for name in ('classes.dex', 'extensions/extension.mpe', 'extensions/activity-spoof.mpe', 'extensions/gboard.mpe'):
        assert archive.read(name).startswith(b'dex\n'), f'Missing Android DEX: {name}'
    assert b'Lxyz/urro/transit/GoInputSpoof;' not in archive.read('extensions/extension.mpe'), 'GO developer utility leaked into release'
    assert b'GoInputSpoof' not in archive.read('classes.dex'), 'GO injection hooks leaked into patch bundle'
    assert not any('youtubemusic' in name.lower() or 'lyrics' in name.lower() for name in archive.namelist())
import hashlib
assert (root/'SHA256SUMS.txt').read_text() == hashlib.sha256(bundle.read_bytes()).hexdigest()+'  '+bundle.name+'\n'
git('diff', '--check')
print(f'PASS: eight patches, universal receiver, both Manager endpoints, four DEX payloads, checksum; {scanned} source/archive entries scanned')
