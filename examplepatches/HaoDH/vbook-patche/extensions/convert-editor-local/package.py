from pathlib import Path
import hashlib
import json
import re
import sys
import zipfile

root = Path(__file__).resolve().parent
output = Path(sys.argv[1])
output.mkdir(parents=True, exist_ok=True)
manifest = json.loads((root / 'plugin.json').read_text(encoding='utf-8'))
assert manifest['metadata']['type'] == 'translate'
for name in manifest['script'].values():
    assert (root / 'src' / name).is_file(), name
for source in (root / 'src').glob('*.js'):
    assert not re.search(r'sk-[A-Za-z0-9]{16,}', source.read_text(encoding='utf-8')), 'Embedded API key'
    for dependency in re.findall(r'''load\(['"](.*?\.js)['"]\);?''', source.read_text(encoding='utf-8')):
        imported = (root / 'src' / dependency).read_text(encoding='utf-8')
        assert not re.search(r'''load\(['"](.*?\.js)['"]\);?''', imported), 'vBook does not support nested load(): ' + dependency

plugin = output / 'vbook-convert-editor-local-1.0.1.zip'
files = [root / 'plugin.json', root / 'README.md', *sorted((root / 'src').glob('*.js'))]
icon = root / 'icon.png'
if icon.is_file():
    assert icon.stat().st_size <= 5 * 1024 * 1024, 'icon.png must be <= 5 MB'
    files.append(icon)
with zipfile.ZipFile(plugin, 'w', zipfile.ZIP_DEFLATED) as archive:
    for path in files:
        archive.write(path, path.relative_to(root).as_posix())
with zipfile.ZipFile(plugin) as archive:
    assert archive.testzip() is None
    assert all('src/' + name in archive.namelist() for name in manifest['script'].values())

source_zip = output / 'vbook-convert-editor-local-1.0.1-source.zip'
with zipfile.ZipFile(source_zip, 'w', zipfile.ZIP_DEFLATED) as archive:
    for path in sorted(root.rglob('*')):
        if path.is_file() and '.git' not in path.parts:
            archive.write(path, path.relative_to(root).as_posix())
for artifact in (plugin, source_zip):
    print(artifact.name, artifact.stat().st_size, 'SHA256', hashlib.sha256(artifact.read_bytes()).hexdigest())
