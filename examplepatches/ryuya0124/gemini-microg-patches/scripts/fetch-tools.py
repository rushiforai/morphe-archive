"""Download pinned official tools and verify their SHA-256 before use."""
from pathlib import Path
import hashlib
import json
import urllib.request
import zipfile

root = Path(__file__).resolve().parents[1]
tools = root / 'tools'
tools.mkdir(exist_ok=True)
lock = json.loads((root / 'config/tools.lock.json').read_text())
for name, item in lock.items():
    target = tools / item['file']
    if not target.exists() or hashlib.sha256(target.read_bytes()).hexdigest() != item['sha256']:
        temporary = target.with_suffix(target.suffix + '.download')
        try:
            print('Downloading', name, item['version'], flush=True)
            urllib.request.urlretrieve(item['url'], temporary)
            if hashlib.sha256(temporary.read_bytes()).hexdigest() != item['sha256']:
                raise SystemExit('Checksum mismatch: ' + name)
            temporary.replace(target)
        finally:
            temporary.unlink(missing_ok=True)
    print('Verified', name, item['version'])
    if name == 'kotlin':
        with zipfile.ZipFile(target) as archive:
            for member in archive.infolist():
                output = (tools / member.filename).resolve()
                if tools.resolve() not in output.parents:
                    raise SystemExit('Unsafe archive path')
            archive.extractall(tools)
        for executable in (tools / 'kotlinc/bin').iterdir():
            if not executable.name.endswith('.bat'):
                executable.chmod(0o755)
