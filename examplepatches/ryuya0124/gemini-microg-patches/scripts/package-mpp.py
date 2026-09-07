"""Build a dual JVM/Android Morphe bundle, using the official bundle layout."""
from pathlib import Path
from datetime import datetime, timezone
import hashlib
import json
import re
import sys
import zipfile

root = Path(__file__).resolve().parents[1]
metadata = json.loads((root / 'patches-bundle.json').read_text())
version = metadata['version']
if not re.fullmatch(r'\d+\.\d+\.\d+', version):
    raise SystemExit('Expected a stable semantic version in patches-bundle.json')
name = f'gemini-microg-patches-{version}.mpp'
expected_url = f'https://github.com/ryuya0124/gemini-microg-patches/releases/download/v{version}/{name}'
assert metadata['download_url'] == expected_url
timestamp = int(datetime.fromisoformat(metadata['created_at']).replace(tzinfo=timezone.utc).timestamp() * 1000)
attributes = {
    'Manifest-Version': '1.0',
    'Name': 'Gemini microG patches',
    'Description': 'Gemini login and Secure Folder support with microG',
    'Version': version,
    'Timestamp': str(timestamp),
    'Source': 'https://github.com/ryuya0124/gemini-microg-patches',
    'Author': 'ryuya0124',
    'Website': 'https://github.com/ryuya0124/gemini-microg-patches',
    'Patcher-Version': '1.12.0',
}
lines = []
for key, value in attributes.items():
    line = f'{key}: {value}'
    line.encode('ascii')
    while len(line) > 70:
        lines.append(line[:70])
        line = ' ' + line[70:]
    lines.append(line)
manifest = ('\r\n'.join(lines) + '\r\n\r\n').encode('ascii')
entries = {'META-INF/MANIFEST.MF': manifest}
with zipfile.ZipFile(root / 'build/gemini-patches.jar') as jar:
    for member in jar.namelist():
        if member != 'META-INF/MANIFEST.MF' and not member.endswith('/'):
            entries[member] = jar.read(member)
dex_files = sorted(Path(sys.argv[1]).glob('classes*.dex'))
assert dex_files and dex_files[0].name == 'classes.dex'
for path in dex_files:
    data = path.read_bytes()
    assert data.startswith(b'dex\n')
    entries[path.name] = data
output = root / 'build/release'
output.mkdir(parents=True, exist_ok=True)
bundle = output / name
with zipfile.ZipFile(bundle, 'w', compression=zipfile.ZIP_DEFLATED) as archive:
    for entry, content in sorted(entries.items()):
        info = zipfile.ZipInfo(entry, date_time=(2000, 1, 1, 0, 0, 0))
        info.compress_type = zipfile.ZIP_DEFLATED
        info.external_attr = 0o100644 << 16
        archive.writestr(info, content)
metadata_file = output / 'patches-bundle.json'
metadata_file.write_bytes((root / 'patches-bundle.json').read_bytes())
(output / 'SHA256SUMS').write_text(''.join(
    hashlib.sha256(path.read_bytes()).hexdigest() + '  ' + path.name + '\n'
    for path in [bundle, metadata_file]
))
print('Packaged', bundle.name, 'with', len(dex_files), 'Android DEX file(s)')
