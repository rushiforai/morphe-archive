#!/usr/bin/env python3
"""Local candidate build. Requires Java 17, ECJ, D8, smali and dex2jar; no GitHub writes."""
from pathlib import Path
import argparse,subprocess,zipfile,shutil,tempfile,struct,hashlib,sys,io
from popup_xml import replace_pool
VERSION='1.9.12-dev.8'
BASE_SHA='59099c17f2ec7bfabd696c5a2a3d0b4ff1626998865399a4a6880ca196d616a4'
ROOT=Path(__file__).resolve().parent
p=argparse.ArgumentParser();p.add_argument('--base',required=True,type=Path);p.add_argument('--tools',required=True,type=Path);p.add_argument('--output',type=Path,default=Path('nicoid-re-'+VERSION+'.mpp'));args=p.parse_args()
base=args.base.resolve();tools=args.tools.resolve();output=args.output.resolve()
assert hashlib.sha256(base.read_bytes()).hexdigest()==BASE_SHA,'Use the official unmodified 1.9.11 MPP'
def run(*cmd):subprocess.run([str(x) for x in cmd],check=True)
run(sys.executable,ROOT/'test/verify_menu_hooks.py',ROOT/'native-overrides')
def jvm(data):
 count=struct.unpack_from('>H',data,8)[0];out=bytearray(data[:10]);at=10;index=1;sizes={3:4,4:4,5:8,6:8,7:2,8:2,9:4,10:4,11:4,12:4,15:3,16:2,17:4,18:4,19:2,20:2}
 while index<count:
  tag=data[at];out.append(tag);at+=1
  if tag==1:
   n=struct.unpack_from('>H',data,at)[0];at+=2;s=data[at:at+n];at+=n;s=s.replace(b'1.9.11',VERSION.encode());out.extend(struct.pack('>H',len(s)));out.extend(s)
  else:
   n=sizes[tag];out.extend(data[at:at+n]);at+=n
   if tag in [5,6]:index+=1
  index+=1
 out.extend(data[at:]);return bytes(out)
with tempfile.TemporaryDirectory(prefix='nicoid-1912-') as temp:
 work=Path(temp);cp=str(tools/'*')
 with zipfile.ZipFile(base) as z:
  for name,entry in [('helpers','nicoid/helpers.mpe'),('native','nicoid/method-delta.dex'),('executor','classes.dex')]:
   (work/(name+'.dex')).write_bytes(z.read(entry));run('java','-cp',cp,'org.jf.baksmali.Main','d',work/(name+'.dex'),'-o',work/name)
 run('bash',tools/'dex-tools-v2.4/d2j-dex2jar.sh',work/'helpers.dex','-o',work/'helpers.jar','--force')
 source=ROOT/'src/e/e/a';run('java','-jar',tools/'ecj.jar','-1.8','-warn:none','-encoding','UTF-8','-cp',str(tools/'android.jar')+':'+str(work/'helpers.jar'),'-d',work/'classes',*sorted(source.glob('*.java')))
 with zipfile.ZipFile(work/'revision.jar','w') as z:
  for f in (work/'classes').rglob('*.class'):z.write(f,f.relative_to(work/'classes'))
 (work/'d8').mkdir();run('java','-cp',tools/'r8.jar','com.android.tools.r8.D8','--min-api','28','--lib',tools/'android.jar','--lib',Path(shutil.which('java')).resolve().parent.parent,'--classpath',work/'helpers.jar','--output',work/'d8',work/'revision.jar')
 run('java','-cp',cp,'org.jf.baksmali.Main','d',work/'d8/classes.dex','-o',work/'compiled')
 for f in source.glob('*.java'):
  for old in (work/'helpers/e/e/a').glob(f.stem+'*.smali'):
   if old.stem==f.stem or old.stem.startswith(f.stem+'$'):old.unlink()
 shutil.copytree(work/'compiled',work/'helpers',dirs_exist_ok=True)
 shutil.copytree(ROOT/'helper-overrides',work/'helpers',dirs_exist_ok=True);shutil.copytree(ROOT/'native-overrides',work/'native',dirs_exist_ok=True)
 for directory in ['helpers','executor']:
  for f in (work/directory).rglob('*.smali'):f.write_text(f.read_text().replace('"1.9.11"','"'+VERSION+'"').replace('v1.9.11 @chikuwadon','v'+VERSION+' @chikuwadon'))
 for name in ['helpers','native','executor']:run('java','-cp',cp,'org.jf.smali.Main','a','-j','1',work/name,'-o',work/(name+'-final.dex'))
 changes={'nicoid/helpers.mpe':(work/'helpers-final.dex').read_bytes(),'nicoid/method-delta.dex':(work/'native-final.dex').read_bytes(),'classes.dex':(work/'executor-final.dex').read_bytes()}
 output.parent.mkdir(parents=True,exist_ok=True)
 with zipfile.ZipFile(base) as inp,zipfile.ZipFile(output,'w',zipfile.ZIP_DEFLATED) as out:
  for n in inp.namelist():
   data=changes.get(n,inp.read(n))
   if n=='nicoid/resources.zip':
    target=io.BytesIO()
    with zipfile.ZipFile(io.BytesIO(data)) as resources,zipfile.ZipFile(target,'w',zipfile.ZIP_DEFLATED) as edited:
     for resource in resources.infolist():
      content=resources.read(resource.filename)
      if resource.filename=='res/layout/popup.xml':content=replace_pool(content)
      edited.writestr(resource,content)
    data=target.getvalue()
   if n.endswith('.class'):data=jvm(data)
   if n=='META-INF/MANIFEST.MF':data=data.replace(b'1.9.11',VERSION.encode())
   out.writestr(n,data)
 with zipfile.ZipFile(output) as z:assert z.testzip() is None
 print(output,hashlib.sha256(output.read_bytes()).hexdigest())
