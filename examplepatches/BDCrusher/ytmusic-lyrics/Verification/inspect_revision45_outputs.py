"""Audit final manifests without signing, launching or installing APKs."""
from pathlib import Path
import hashlib
import json
import os
import subprocess

home = Path(__file__).resolve().parents[1]
work = home / 'Verification/revision45'
tool = Path('USER_HOME/AppData/Local/Android/Sdk/build-tools/36.0.0/aapt2.exe')
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
output = work / 'manifests'
assert not output.exists(); output.mkdir()
results = []
env = dict(os.environ, TMP=str(home / 'BuildCache/Temp'), TEMP=str(home / 'BuildCache/Temp'))
for case in json.loads((work / 'matrix-plan.json').read_text(encoding='utf-8'))['cases']:
    if case['mode'] == 'features-missing-downloads':
        continue
    apk = Path(case['directory']) / 'verified-unsigned.apk'
    result = subprocess.run([str(tool), 'dump', 'xmltree', str(apk), '--file', 'AndroidManifest.xml'],
                            env=env, cwd=home, capture_output=True, check=True, timeout=30)
    text = result.stdout.decode('utf-8')
    assert 'OfflinePlaybackService' not in text
    dump = output / (case['target'] + '-' + case['mode'] + '.txt')
    dump.write_bytes(result.stdout)
    results.append({'apk': str(apk), 'sha256': sha(apk), 'manifestDumpSha256': sha(dump),
                    'retiredOfflineServiceAbsent': True})
assert len(results) == 8
(work / 'manifest-audit.json').write_text(json.dumps({'passed': True, 'apks': results,
     'toolSha256': sha(tool), 'helperSha256': sha(Path(__file__)), 'phoneVerified': False}, indent=2) + '\n', encoding='utf-8')
print(json.dumps({'passed': True, 'manifests': len(results), 'retiredOfflineServiceAbsent': True}))
