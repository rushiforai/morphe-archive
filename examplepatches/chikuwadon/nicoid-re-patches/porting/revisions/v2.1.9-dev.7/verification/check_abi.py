from pathlib import Path
import re, json, sys
from functools import lru_cache
family=('com/google/common/','com/google/thirdparty/','androidx/concurrent/futures/','androidx/exifinterface/')
def listing(d): return {p.relative_to(d).as_posix():p for p in Path(d).rglob('*.smali')}
base=listing('base');new=listing('new'); ext=listing('extension');delta=listing('delta')
remove={p for p in base if p.startswith(family)}; add={p for p in new if p.startswith(family)}
def cls(p):return 'L'+p[:-6]+';'
rx_sup=re.compile(r'^\.(?:super|implements) (L[^;]+;)$',re.M)
rx_ref=re.compile(r'(L[\w/$-]+;)->([^\s,}{"\n]+)')
rx_type=re.compile(r'L[\w/$-]+;')
def info(p):
 s=p.read_text(); mem=set()
 for line in s.splitlines():
  if line.startswith('.method '):mem.add(line.split()[-1])
  elif line.startswith('.field '):mem.add(line.split(' = ')[0].split()[-1])
 return rx_sup.findall(s),mem
from android_class_index import read_android
baseinfo=read_android(sys.argv[1] if len(sys.argv)>1 else "../runtime-libs/android.jar");baseinfo.update({cls(k):info(p) for k,p in base.items()});newinfo={cls(k):info(new[k]) for k in add}
oldlib={cls(p) for p in remove};newlib=set(newinfo)
updated=baseinfo.copy();[updated.pop(k) for k in oldlib];updated.update(newinfo)
def resolver(table):
 @lru_cache(maxsize=None)
 def resolve(c,m):
  if c not in table:return False
  parents,mem=table[c]
  return m in mem or (not m.startswith('<init>(') and any(resolve(p,m) for p in parents))
 return resolve
oldresolve=resolver(baseinfo); newresolve=resolver(updated)
refs=set();missing=[];preexisting=[];types=set();external=list(ext.items())+list(delta.items())+[(k,p) for k,p in base.items() if k not in remove]
for k,p in external:
 s=p.read_text();types|=set(rx_type.findall(s))&oldlib
 for c,m in rx_ref.findall(s):
  if c not in oldlib or (c,m) in refs:continue
  refs.add((c,m))
  if not newresolve(c,m): (missing if oldresolve(c,m) else preexisting).append((k,c,m))
inner=set();bad=[]
for k in add:
 for c,m in rx_ref.findall(new[k].read_text()):
  if c in oldlib|newlib and (c,m) not in inner:
   inner.add((c,m))
   if not newresolve(c,m):bad.append((k,c,m))
report=dict(old_classes=len(remove),new_classes=len(add),external_referenced_members=len(refs),external_referenced_classes=len(types),removed_referenced_classes=sorted(types-newlib),newly_missing_external_members=missing,preexisting_unresolved=preexisting,internal_referenced_members=len(inner),internal_unresolved=bad,overlap_extension=sorted(add&set(ext)),overlap_delta=sorted(add&set(delta)))
print(json.dumps(report,ensure_ascii=False,indent=2));Path('abi-report.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
