"""Package the current cached compile and run Release/API26 D8; not a Gradle release."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
import xml.etree.ElementTree as ET
import zipfile

root = Path(__file__).resolve().parents[2]
compiled = root / 'build/background-blue-noise-kotlin'
stage = root / 'build/background-blue-noise-package'
report = Path(__file__).resolve().parent
for p in (compiled / 'test-results').glob('TEST-*.xml'):
    suite = ET.parse(p).getroot()
    assert int(suite.get('failures', 0)) == int(suite.get('errors', 0)) == 0
assert list((compiled / 'test-results').glob('TEST-*.xml'))
version = re.search(r'(?m)^version\s*=\s*(\S+)', (root / 'gradle.properties').read_text()).group(1)
patcher = re.search(r'morphe-patcher\s*=\s*"([^"]+)"', (root / 'gradle/libs.versions.toml').read_text()).group(1)
fields = {'Manifest-Version': '1.0', 'Name': 'Steam Link GalaxyXR Patches', 'Version': version,
          'Description': 'Local cached validation bundle with separate layer blue noise',
          'Source': 'https://github.com/AngelDark92/steamlink-patches', 'Author': 'AngelDark92',
          'License': 'GPLv3', 'Patcher-Version': patcher}
lines = []
for key, value in fields.items():
    line = f'{key}: {value}'
    while len(line) > 70:
        lines.append(line[:70])
        line = ' ' + line[70:]
    lines.append(line)
entries = {'META-INF/MANIFEST.MF': ('\r\n'.join(lines) + '\r\n\r\n').encode('ascii')}
for source, classes_only in [(compiled / 'classes', True),
                             (root / 'patches/src/main/resources', False),
                             (compiled / 'resources', False)]:
    for path in sorted(source.rglob('*')):
        if not path.is_file() or (classes_only and path.suffix not in ('.class', '.kotlin_module')):
            continue
        name = path.relative_to(source).as_posix()
        assert name not in entries, name
        entries[name] = path.read_bytes()
for name in ('extension.mpe', 'minimal-extension.mpe', 'battery-extension.mpe'):
    assert entries[f'extensions/{name}'].startswith(b'dex\n')
archive = stage / f'patches/build/libs/patches-{version}-background-blue-noise-local.mpp'
archive.parent.mkdir(parents=True, exist_ok=True)
def write_archive():
    with zipfile.ZipFile(archive, 'w', zipfile.ZIP_DEFLATED) as z:
        for name, data in entries.items():
            z.writestr(name, data)
write_archive()
cp = (compiled / 'runtime-classpath.txt').read_text().strip()
dependencies = [p for p in cp.split(';') if p.lower().endswith('.jar')]
dex = stage / 'dex.zip'
command = ['F:/Runtimes/Java21/bin/java.exe', '-cp', str(root / 'build/ci-d8-validation-20260915/r8-9.1.31.jar'),
           str(root / 'build/ci-d8-validation-20260915/D8Parity.java'), str(archive), str(dex),
           str(root / '.android-sdk/platforms/android-33/android.jar'), *dependencies]
run = subprocess.run(command, capture_output=True, text=True)
(report / 'd8-validation.txt').write_text(f'D8 Release/API26 exit code: {run.returncode}\n' + run.stdout + run.stderr)
assert run.returncode == 0, 'D8 failed; see d8-validation.txt'
with zipfile.ZipFile(dex) as z:
    for name in z.namelist():
        assert name.endswith('.dex')
        entries[name] = z.read(name)
write_archive()
receipt = {'archive': archive.relative_to(root).as_posix(),
           'sha256': hashlib.sha256(archive.read_bytes()).hexdigest(), 'entries': len(entries),
           'dex': [name for name in entries if name.endswith('.dex')],
           'payload_sha256': hashlib.sha256(entries['steamlink/blue-noise/libgxd.so']).hexdigest(),
           'boundary': 'Cached current compile plus Release/API26 D8; not Gradle release or headset validation.'}
(report / 'bundle-validation.json').write_text(json.dumps(receipt, indent=2) + '\n')
print(json.dumps(receipt, indent=2))
