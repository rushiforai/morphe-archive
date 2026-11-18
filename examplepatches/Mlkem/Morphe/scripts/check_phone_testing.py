"""Require phone tests of the exact current patch/extension source tree."""
from pathlib import Path
import hashlib, json, sys
root=Path(__file__).resolve().parents[1]
paths=sorted([*root.glob('patches/src/**/*'),*root.glob('extensions/*/src/**/*')])
h=hashlib.sha256()
for p in paths:
    if p.is_file(): h.update(p.relative_to(root).as_posix().encode()+b'\0'+p.read_bytes()+b'\0')
digest=h.hexdigest()
if '--digest' in sys.argv:
    print(digest);sys.exit(0)
record=root/'docs/phone-test-approval.json'
if not record.exists(): sys.exit('Stable release blocked: no phone-test approval recorded.')
d=json.loads(record.read_text())
if d.get('source_sha256')!=digest or d.get('result')!='passed' or not d.get('tester') or not d.get('tested_at'):
    sys.exit('Stable release blocked: missing, failed, or outdated phone-test approval.')
print('Phone-test approval matches current sources.')
