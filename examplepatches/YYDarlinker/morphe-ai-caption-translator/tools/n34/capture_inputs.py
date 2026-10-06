from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.verification/n34'
assert not (OUT/'pre-edit-source.json').exists(),'Before evidence already exists; preserve it and use the read-only scope/history auditors.'
def record(p):
 with p.open('rb') as f: sha=hashlib.file_digest(f,'sha256').hexdigest().upper()
 return {'path':str(p),'bytes':p.stat().st_size,'sha256':sha}
records=json.loads((ROOT/'.verification/n34-planner/input-identities.json').read_text(encoding='utf-8'))
records+=json.loads((ROOT/'.verification/n33-planner/input-identities.json').read_text(encoding='utf-8'))
by_path={v['path']:v for v in records}
for name,want in by_path.items():
 actual=record(Path(name));assert (actual["bytes"],actual["sha256"])==(want["bytes"],want["sha256"]),(actual,want)
state=ROOT/'docs/PROJECT-STATE.md'
mirror=Path(r'C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\PROJECT-STATE.md')
assert state.read_bytes()==mirror.read_bytes()
tracked={str(p.relative_to(ROOT)):record(p) for folder in ('extensions/extension/src','patches/src','localization','scoreboard') for p in (ROOT/folder).rglob('*') if p.is_file()}
tracked['ACCEPTANCE.md']=record(ROOT/'ACCEPTANCE.md')
(OUT/'pre-edit-source.json').write_text(json.dumps(tracked,ensure_ascii=False,indent=2),encoding='utf-8')
(OUT/'input-identities-before.json').write_text(json.dumps(list(by_path.values())+[record(state),record(mirror)],ensure_ascii=False,indent=2),encoding='utf-8')
print('INPUT_SHA_PASS',len(by_path),'source_paths',len(tracked),flush=True)
