from pathlib import Path
import re,json
F=Path("final2-helpers")
checks=[]
def check(ok,msg):
 assert ok,msg;checks.append(msg)
def method(t,name):
 m=re.search(r'^\.method [^\n]*'+re.escape(name)+r'[^\n]*\n.*?^\.end method',t,re.M|re.S)
 assert m,name;return m.group()
def read(n):return (F/'e/e/a'/f'{n}.smali').read_text()
# Shared title and maintained dialog order.
temp=read('TemporaryCache221'); dev=read('Dev115'); ctl=read('CacheControl110'); worker=read('CacheControl110$$ExternalSyntheticLambda6'); img=read('ImageDiskCache');
title=method(temp,'videoTitle(Landroid/content/Context;)');strings=[bytes(v,'ascii').decode('unicode_escape') for v in re.findall(r'const-string v\d+, "([^"\n]*)"',title)]
check(strings==['Delete all cached videos','刪除所有已快取的影片','キャッシュ済み動画をすべて削除'],'JA/EN/ZH title exact')
for name,src,m in [('settings',temp,'install(Landroid/preference/PreferenceActivity;)'),('confirmation',dev,'confirm(Landroid/preference/PreferenceActivity;'),('fallback',ctl,'lambda$4(Landroid/preference/')]:
 check('TemporaryCache221;->videoTitle(' in method(src,m),name+' uses same localized title')
dialog=method(temp,'lambda$inspect$2(');check(dialog.index('Ljava/lang/String;->format(')<dialog.index('->confirmation(')<dialog.index('->setMessage('),'temporary-cache amount before explanation')
check('count(Landroid/content/Context;)' not in dev and dev.count('->count(Ljava/lang/String;)')==3,'all inventory callers use captured location')
check('->removeScoped(' in method(dev,'remove(Landroid/preference/') and '->folder(' in method(dev,'remove(Landroid/preference/'),'confirmation location rechecked before dispatch')
check('->f$3:Ljava/lang/String;' in worker and '->lambda$6(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)' in worker,'worker retains expected location')
wl=method(ctl,'lambda$6(');check(wl.index('->await()')<wl.index('invoke-static {p0, p1, p3}') and '->deleteScoped(' in wl,'check expected path after worker wait')
reg=method(ctl,'register(Ljava/lang/Thread;)'); clean=method(ctl,'cleanup(Le/e/a/CacheControl110$Job;)');
check(reg.index('->captureJobRoot()') < reg.index('->cacheRoot:') < reg.index('->jobs:'),'job root recorded before publishing worker')
check(clean.index('->cacheRoot:') < clean.index('->captureJobRoot()') < clean.index('Ljava/lang/String;->equals(') < clean.index('Le/e/a/CacheFile;-><init>'),'interrupted worker checks recorded root before enumeration')
check('CacheFolders;->root(' not in clean,'cleanup does not resolve a fresh folder for deletion')
check('const v4, 0x10000' in method(img,'get(Ljava/lang/String;)[B') and 'ByteArrayOutputStream;-><init>(I)' in method(img,'get(Ljava/lang/String;)[B') and '0x800000' in method(img,'get(Ljava/lang/String;)[B'),'bounded read buffer and existing 8 MiB read limit')
# Execute only the actual deletion method's instruction subset, with a controlled fake file provider.
# Any unimplemented opcode or invoke aborts the test rather than silently assuming success.
code=method(ctl,'deleteScoped('); body=[];labels={};
for line in code.splitlines()[1:-1]:
 line=line.strip()
 if not line or line.startswith('.') or line.startswith('#') or line.startswith('value =') or line in ('}','Ljava/io/IOException;'):continue
 if line.startswith(':'):labels[line]=len(body)
 else:body.append(line)
class FakeFile:
 def __init__(self,name,deleted=False):self.name=name;self.deleted=deleted
 def __repr__(self):return self.name

def execute(root,selected,expected,files,*,switch_after_root=None,invalidations=None):
 r={'p0':'context','p1':selected,'p2':expected};last=None;pc=0;opened=[];deleted=[];iterations=0;current=root;root_calls=0
 def invoke(ref,argv):
  nonlocal current,root_calls
  if ref=='Ljava/lang/String;->matches(Ljava/lang/String;)Z':return bool(re.fullmatch(argv[1],argv[0]))
  if ref=='Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;':
   root_calls+=1;val=current
   if switch_after_root is not None:current=switch_after_root
   return val
  if ref=='Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;':return str(argv[0])
  if ref=='Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V':argv[0].append(argv[1]);return None
  if ref=='Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;':argv[0].append(argv[1]);return argv[0]
  if ref=='Ljava/lang/StringBuilder;->toString()Ljava/lang/String;':return ''.join(argv[0])
  if ref=='Ljava/lang/String;->equals(Ljava/lang/Object;)Z':return argv[0]==argv[1]
  if ref=='Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V':argv[0]['path']=argv[1];opened.append(argv[1]);return None
  if ref=='Le/e/a/CacheFile;->listFiles()[Ljava/io/File;':return files.get(argv[0]['path'])
  if ref=='Ljava/io/File;->getName()Ljava/lang/String;':return argv[0].name
  if ref=='Le/e/a/CacheFolders;->videoId(Ljava/lang/String;)Ljava/lang/String;':
   m=re.fullmatch(r'((?:sm|so|nm|ss)[0-9]+)(?:[._].*)?',argv[0]);return m.group(1) if m else None
  if ref=='Le/e/a/CachePack;->invalidate(Ljava/io/File;)V':return None
  if ref=='Ljava/io/File;->exists()Z':return not argv[0].deleted
  if ref=='Ljava/io/File;->delete()Z':argv[0].deleted=True;deleted.append(argv[0].name);return True
  if ref=='Le/e/a/CacheFolders;->invalidateSummary(Landroid/content/Context;)V':return None
  raise AssertionError('unexpected invoke '+ref)
 def truth(x):return x is not None and x!=0
 while pc<len(body):
  iterations+=1;assert iterations<10000;line=body[pc];pc+=1
  op,_,tail=line.partition(' ');a=[x.strip() for x in tail.split(',')]
  if op.startswith('const-string'):r[a[0]]=json.loads(tail.split(',',1)[1].strip())
  elif op.startswith('const'):r[a[0]]=int(a[1],0)
  elif op.startswith('new-instance'):r[a[0]]=[] if a[1]=='Ljava/lang/StringBuilder;' else {}
  elif op.startswith('invoke-'):
   m=re.fullmatch(r'\{([^}]*)\}, (.*)',tail);assert m,line
   last=invoke(m.group(2),[r[k.strip()] for k in m.group(1).split(',') if k.strip()])
  elif op.startswith('move-result'):r[a[0]]=last
  elif op=='move-object':r[a[0]]=r[a[1]]
  elif op=='if-eqz':
   if not truth(r[a[0]]):pc=labels[a[1]]
  elif op=='if-nez':
   if truth(r[a[0]]):pc=labels[a[1]]
  elif op=='if-lt':
   if r[a[0]]<r[a[1]]:pc=labels[a[2]]
  elif op.startswith('goto'):pc=labels[a[0]]
  elif op=='array-length':r[a[0]]=len(r[a[1]])
  elif op=='aget-object':r[a[0]]=r[a[1]][r[a[2]]]
  elif op=='add-int/lit8':r[a[0]]=r[a[1]]+int(a[2],0)
  elif op=='return':return bool(r[a[0]]),opened,deleted,root_calls
  else:raise AssertionError('unsupported opcode '+line)
 raise AssertionError('fell through')
A='/@nicoid-cache/A';B='/@nicoid-cache/B';suffix='/nicoid/nicoid_cache/';ap=A+suffix;bp=B+suffix
def fixtures():return {ap:[FakeFile('sm1.mp4'),FakeFile('sm1.xml'),FakeFile('sm2.json'),FakeFile('settings.xml')],bp:[FakeFile('sm9.mp4')]}
check(execute(B,None,ap,fixtures())[:3]==(False,[],[]),'actual instruction path: changed location aborts before enumeration')
check(execute(A,None,ap,fixtures(),switch_after_root=B)[:3]==(True,[ap],['sm1.mp4','sm1.xml','sm2.json']),'actual instruction path: change after check never redirects deletion to new location')
check(execute(A,'sm1',None,fixtures())[:3]==(True,[ap],['sm1.mp4','sm1.xml']),'actual instruction path: single video filter retains other IDs and settings')
check(execute(A,'../settings',None,fixtures())[:3]==(False,[],[]),'actual instruction path: invalid video ID rejected')
check(execute(A,None,ap,{ap:None})[:3]==(False,[ap],[]),'actual instruction path: null inventory does not report success')
check(execute(A,None,ap,{ap:[]})[:3]==(True,[ap],[]),'actual instruction path: empty inventory safe')

print('PASS',len(checks),'dev.6 cache-specific assertions and simulated instruction-path tests')
print('\n'.join(checks))
