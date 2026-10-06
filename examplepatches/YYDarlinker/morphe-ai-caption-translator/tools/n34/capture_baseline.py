"""Capture canonical immutable history, avoiding millions of regenerated Patcher session files."""
from pathlib import Path
import hashlib,json,os,time
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.verification/n34/baseline'
OUT.mkdir(parents=True,exist_ok=True)
assert not (OUT/'historical-identities.json').exists(),'Historical identity snapshot already exists; use verify_history.py instead.'
before=json.loads((ROOT/'.verification/n33/baseline/historical-identities.json').read_text(encoding='utf-8'))
paths={Path(row['path']).resolve():row for row in before}
# Patcher session-* directories are non-authoritative unpacked derivatives, never touched by N34.
for base in (ROOT/'.verification/n33',ROOT/'.verification/n34-planner'):
 for directory,dirs,files in os.walk(base):
  dirs[:]=[name for name in dirs if not name.startswith('session-') and name not in {'classes','agent-classes','__pycache__'}]
  for name in files:
   p=(Path(directory)/name).resolve();paths.setdefault(p,None)
for directory in (ROOT/'build').iterdir():
 if directory.is_dir():
  for p in directory.iterdir():
   if p.is_file() and p.suffix in {'.apk','.mpp','.mpe'}:paths.setdefault(p.resolve(),None)
for records in ('n34-planner/input-identities.json','n33-planner/input-identities.json'):
 for row in json.loads((ROOT/'.verification'/records).read_text(encoding='utf-8')):paths.setdefault(Path(row['path']).resolve(),None)
actual=[];started=time.monotonic()
for index,(p,want) in enumerate(paths.items()):
 with p.open('rb') as f: sha=hashlib.file_digest(f,'sha256').hexdigest().upper()
 row={'path':str(p),'bytes':p.stat().st_size,'sha256':sha}
 if want:assert (row['bytes'],row['sha256'])==(want['bytes'],want['sha256']),str(p)
 actual.append(row)
 if index and index%25000==0:print('HISTORY_CAPTURE',index,len(paths),flush=True)
(OUT/'historical-identities.json').write_text(json.dumps(actual,ensure_ascii=False,indent=2),encoding='utf-8')
(OUT/'n33-source.json').write_bytes((ROOT/'.verification/n34/pre-edit-source.json').read_bytes())
(OUT/'capture-summary.json').write_text(json.dumps({'files':len(actual),'inherited_immutable_before_n33':len(before),'pruned_only_untouched_patcher_session_derivatives':True,'elapsed_s':time.monotonic()-started},indent=2),encoding='utf-8')
print('HISTORY_CAPTURE_PASS',len(actual),flush=True)
