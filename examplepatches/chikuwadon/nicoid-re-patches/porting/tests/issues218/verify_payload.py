"""Check the candidate MPP and the disassembled APK produced by applying it."""
from pathlib import Path
import argparse,zipfile,re,json,hashlib,io
p=argparse.ArgumentParser();p.add_argument('--base',type=Path,required=True);p.add_argument('--mpp',type=Path,required=True);p.add_argument('--applied-dir',type=Path,required=True);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
with zipfile.ZipFile(a.base) as base,zipfile.ZipFile(a.mpp) as candidate:
 assert candidate.testzip() is None
 assert set(base.namelist())==set(candidate.namelist())
 for n in base.namelist():
  if n!='nicoid/helpers.mpe':assert base.read(n)==candidate.read(n),n
 resources=zipfile.ZipFile(io.BytesIO(candidate.read('nicoid/resources.zip')))
 pngs=[n for n in resources.namelist() if n.endswith('.png')]
 for n in pngs:assert resources.read(n).startswith(b'\x89PNG\r\n\x1a\n'),n
classes={};paths={}
for root in a.applied_dir.glob('*-smali'):
 for f in root.rglob('*.smali'):
  s=f.read_text();name=re.search(r'(?m)^\.class [^\n]*?(L[^ \n]+;)',s).group(1)
  assert name not in classes,name
  parent=re.search(r'(?m)^\.super (L[^\n]+;)',s)
  classes[name]=({m.split()[-1] for m in re.findall(r'(?m)^\.method [^\n]+',s)},parent.group(1) if parent else None);paths[name]=f
assert not any(n.startswith(('Le/e/a/Nicolive','Landroidx/media3/')) for n in classes)
repo=Path(__file__).resolve().parents[3]
with zipfile.ZipFile(repo/'porting/helpers-v1.9.3.zip') as z:helpers={'L'+n[:-6]+';' for n in z.namelist() if n.endswith('.smali')}
def resolve(name,method,seen=None):
 seen=set() if seen is None else seen
 if name in seen:return False
 if name not in classes:return name.startswith(('Landroid/','Ljava/'))
 seen.add(name);methods,parent=classes[name];return method in methods or bool(parent and resolve(parent,method,seen))
checks=0
for name,path in paths.items():
 for target,method in re.findall(r'invoke-\S+ \{[^}]*\}, (Le/e/a/[^;]+;)->([^\s]+)',path.read_text()):
  assert target in classes,(name,target)
  if target not in helpers:continue
  assert resolve(target,method),(name,target,method);checks+=1
for family,method in [('CommentUi','publish'),('FullscreenControls','update'),('SettingsIntegrity','settings'),('ModernPlayback','pickVideo'),('Quality195','outputs'),('CommentJump','player'),('CommentListExtras$Follow','player')]:
 assert 'Le/e/a/CastControls218;->'+method in paths['Le/e/a/'+family+';'].read_text(),family
assert 'Le/e/a/PopupBackground217;->enter' in paths['Le/e/a/PopupControls193;'].read_text()
assert 'Le/e/a/PlaybackRequest217;->request' in paths['Le/e/a/ModernPlayback;'].read_text()
result={'base':'v1.9.7','mpp_sha256':hashlib.sha256(a.mpp.read_bytes()).hexdigest(),'classes':len(classes),'duplicate_classes':0,'resolved_helper_calls':checks,'unchanged_png_entries':len(pngs),'non_helper_entries_unchanged':True,'nicolive_included':False,'version_unchanged':True,'device_verified':False,'published':False}
a.output.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
