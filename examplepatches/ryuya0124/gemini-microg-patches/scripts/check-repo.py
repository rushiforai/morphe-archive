"""Check version locks and prevent accidentally tracking generated/private files."""
from pathlib import Path
import json
import re
import subprocess

root = Path(__file__).resolve().parents[1]
lock = json.loads((root / 'config/tools.lock.json').read_text())
for item in lock.values():
    assert item['url'].startswith(('https://github.com/', 'https://dl.google.com/dl/android/maven2/'))
    assert re.fullmatch(r'[0-9a-f]{64}', item['sha256'])
    assert Path(item['file']).name == item['file']
tracked = subprocess.check_output(['git', 'ls-files', '-z'], cwd=root).decode().split('\0')
blocked = []
for name in filter(None, tracked):
    path = Path(name)
    if path.parts[0] in {'local', 'build', 'dist'} or name == '.env':
        blocked.append(name)
    if path.suffix in {'.apk', '.jar', '.mpp', '.p12', '.jks', '.keystore', '.log', '.png'}:
        blocked.append(name)
if blocked:
    raise SystemExit('Files must not be tracked: ' + ', '.join(blocked))
print('Repository layout and tool locks verified')
