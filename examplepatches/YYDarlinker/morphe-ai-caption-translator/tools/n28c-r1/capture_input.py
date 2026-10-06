from pathlib import Path
import hashlib,json,subprocess,shutil
R=Path(__file__).resolve().parents[2]; O=R/'.verification/n28c-r1'; old=R/'.verification/n28c-scheduler-fix/2026-10-02T05-46-38-772884Z'
if (O/'input-manifest.json').exists():raise SystemExit('Input evidence already exists; never overwrite it')
def sha(p):
 with p.open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest()
tracked=subprocess.check_output(['git','ls-files','-z']).decode().split('\0')
files={p:sha(R/p) for p in tracked if p and (R/p).is_file()}
history=[]
for folder in ['build/local-test','.verification/n28c-scheduler-fix','.verification/n28c-deadlock','.verification/n28c-review-20261002']:
 for p in (R/folder).rglob('*'):
  if p.is_file():history.append({'path':str(p.relative_to(R)),'sha256':sha(p),'bytes':p.stat().st_size})
p=R/'build/n28c-composition-final/YouTube-21.16.256-本地测试包-n28c-unsigned.apk';history.append({'path':str(p.relative_to(R)),'sha256':sha(p),'bytes':p.stat().st_size})
for row in json.loads((old/'input-manifest.json').read_text(encoding='utf-8'))['history']:
 if row['path'] not in {x['path'] for x in history}:history.append({'path':row['path'],'sha256':sha(R/row['path']),'bytes':(R/row['path']).stat().st_size})
(O/'input-manifest.json').write_text(json.dumps({'head':subprocess.check_output(['git','rev-parse','HEAD']).decode().strip(),'files':files,'history':history},indent=2),encoding='utf-8')
shutil.copytree(R/'extensions/extension/src/test',O/'tests-before',dirs_exist_ok=True)
shutil.copytree(old/'delivery-records',O/'presentation-before',dirs_exist_ok=True)
shutil.copyfile(R/'.verification/n28c-review-20261002/short-pages-review.json',O/'short-pages-before.json')
print('Preserved',len(files),'tracked inputs;',len(history),'historical files')

