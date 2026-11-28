#!/usr/bin/env python3
"""Reconstruct cumulative 110 and final smali from checked-in dev.5 DEX.
Usage: rebuild_bridge.py DEV5_ROOT FIXED_INPUT_DIR NEW_OUTPUT_DIR [helpers|method-delta]
Neither publishes nor asserts original source recovery.
"""
from pathlib import Path, PurePosixPath
import hashlib,json,subprocess,shutil,sys,os
T=Path(__file__).resolve().parent
D,I,O=map(lambda p:Path(p).resolve(),sys.argv[1:4]); O.mkdir(parents=True,exist_ok=True)
L=json.loads((T/'bridge-lock.json').read_text()); F=json.loads((T/'build-lock.json').read_text())
def h(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def inv(p):return {str(f.relative_to(p)):h(f) for f in p.rglob('*.smali')}
def treehash(d):return hashlib.sha256(''.join(f'{v}  {k}\n' for k,v in sorted(d.items())).encode()).hexdigest()
for item in F:assert h(I/item['path'])==item['sha256'],item['path']
cp=os.pathsep.join(str(I/p) for p in ['tools/assemble/*','tools/dexlib2.jar','libs/guava-new.jar','libs/failureaccess-new.jar'])
def run(main,*args):subprocess.run(['java','-Xmx2g','-cp',cp,main,*map(str,args)],check=True)
for part,rec in L['part'].items():
 if len(sys.argv)>4 and part!=sys.argv[4]:continue
 assert part in ('helpers','method-delta'); base=D/rec['base_file']; assert h(base)==rec['base_sha256'],base
 work=O/'smali'/part;assert not work.exists(),work
 run('org.jf.baksmali.Main','disassemble','--sequential-labels','-a','28','-j','2',base,'-o',work)
 for step in rec['steps']:
  before=inv(work); assert len(before)==step['before_count'] and treehash(before)==step['before_tree_sha256'],(part,step['name'],'before')
  for n,row in step['changes'].items():
   p=PurePosixPath(n);assert not p.is_absolute() and '..' not in p.parts and p.suffix=='.smali' and '\\' not in n
   assert before.get(n)==row['before'],(part,n,'before')
   if row['after'] is None:(work/n).unlink()
   else:
    src=T/'overlays'/step['name']/part/n;assert h(src)==row['after'],src
    dst=work/n;dst.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src,dst)
  after=inv(work);assert len(after)==step['after_count'] and treehash(after)==step['after_tree_sha256'],(part,step['name'],'after')
  stage=O/step['name'];stage.mkdir(exist_ok=True);dex=stage/(part+'.dex')
  run('org.jf.smali.Main','assemble','-a','28','-j','1',work,'-o',dex)
  check=stage/'roundtrip'/part;run('org.jf.baksmali.Main','disassemble','--sequential-labels','-a','28','-j','2',dex,'-o',check)
  actual=inv(check);assert actual==after,(part,step['name'],'roundtrip mismatch',sum(actual.get(k)!=after.get(k) for k in actual.keys()|after.keys()))
  print('PASS',part,step['name'],len(actual),'classes',h(dex),flush=True)
print('PASS requested dev.5 snapshot -> dev.110 -> final class transition',flush=True)
