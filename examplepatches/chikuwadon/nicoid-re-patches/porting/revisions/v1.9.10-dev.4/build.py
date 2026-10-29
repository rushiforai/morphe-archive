from pathlib import Path
import subprocess,zipfile,shutil,struct,hashlib,json
ROOT=Path(__file__).resolve().parent
VERSION='1.9.10-dev.4'
def run(*args):subprocess.run([str(a) for a in args],check=True,cwd=ROOT)
cp=str(ROOT/'tools')+'/*'
(ROOT/'src/e/e/a/PatchVersion237.java').write_text('package e.e.a; public final class PatchVersion237 {public static String value(){return "'+VERSION+'";}public static String display(){return "v"+value()+" @chikuwadon";}}')
run('java','-jar',ROOT/'tools/ecj.jar','-1.8','-warn:none','-encoding','UTF-8','-cp',str(ROOT/'tools/android.jar')+':'+str(ROOT/'helpers.jar'),'-d',ROOT/'classes',*sorted((ROOT/'src').rglob('*.java')))
with zipfile.ZipFile(ROOT/'revision.jar','w') as z:
 for p in (ROOT/'classes').rglob('*.class'):z.write(p,p.relative_to(ROOT/'classes'))
(ROOT/'d8').mkdir(exist_ok=True)
run('java','-cp',ROOT/'tools/r8.jar','com.android.tools.r8.D8','--min-api','26','--lib',ROOT/'tools/android.jar','--lib','/usr/lib/jvm/java-17-openjdk-amd64','--classpath',ROOT/'helpers.jar','--output',ROOT/'d8',ROOT/'revision.jar')
shutil.rmtree(ROOT/'compiled-smali',ignore_errors=True)
run('java','-cp',cp,'org.jf.baksmali.Main','d',ROOT/'d8/classes.dex','-o',ROOT/'compiled-smali')
for p in (ROOT/'src/e/e/a').glob('*.java'):
 for old in (ROOT/'helpers/e/e/a').glob(p.stem+'*.smali'):
  if old.stem==p.stem or old.stem.startswith(p.stem+'$'):old.unlink()
shutil.copytree(ROOT/'compiled-smali',ROOT/'helpers',dirs_exist_ok=True)
shutil.copytree(ROOT/'helpers-overrides',ROOT/'helpers',dirs_exist_ok=True)
for directory in ['helpers','executor']:
 for p in (ROOT/directory).rglob('*.smali'):p.write_text(p.read_text().replace('"1.9.9"','"'+VERSION+'"').replace('"1.9.10-dev.1"','"'+VERSION+'"').replace('"1.9.10-dev.2"','"'+VERSION+'"').replace('"1.9.10-dev.3"','"'+VERSION+'"').replace('v1.9.9 @chikuwadon','v'+VERSION+' @chikuwadon'))
for directory in ['helpers','native','executor']:run('java','-cp',cp,'org.jf.smali.Main','a','-j','1',ROOT/directory,'-o',ROOT/(directory+'-final.dex'))
for directory in ['helpers','native','executor']:
 b=(ROOT/(directory+'-final.dex')).read_bytes();assert b[:4]==b'dex\n',directory+' invalid DEX header'
def class_version(data):
 count=struct.unpack_from('>H',data,8)[0];out=bytearray(data[:10]);p=10;i=1
 sizes={3:4,4:4,5:8,6:8,7:2,8:2,9:4,10:4,11:4,12:4,15:3,16:2,17:4,18:4,19:2,20:2}
 while i<count:
  tag=data[p];out.append(tag);p+=1
  if tag==1:
   n=struct.unpack_from('>H',data,p)[0];p+=2;s=data[p:p+n];p+=n;s=s.replace(b'1.9.10-dev.3',VERSION.encode()).replace(b'1.9.9',VERSION.encode());out.extend(struct.pack('>H',len(s)));out.extend(s)
  else:
   n=sizes[tag];out.extend(data[p:p+n]);p+=n
   if tag in [5,6]:i+=1
  i+=1
 out.extend(data[p:]);return bytes(out)
changes={'nicoid/helpers.mpe':(ROOT/'helpers-final.dex').read_bytes(),'nicoid/method-delta.dex':(ROOT/'native-final.dex').read_bytes(),'classes.dex':(ROOT/'executor-final.dex').read_bytes(),'nicoid/resources.zip':(ROOT/'resources.zip').read_bytes()}
output=ROOT/('nicoid-re-'+VERSION+'.mpp')
temporary=ROOT/(output.name+'.building')
with zipfile.ZipFile(ROOT/'base.mpp') as src,zipfile.ZipFile(temporary,'w',zipfile.ZIP_DEFLATED) as out:
 for name in src.namelist():
  data=changes.get(name,src.read(name))
  if name.endswith('.class'):data=class_version(data)
  if name=='META-INF/MANIFEST.MF':data=data.replace(b'1.9.10-dev.3',VERSION.encode()).replace(b'1.9.9',VERSION.encode())
  out.writestr(name,data)
with zipfile.ZipFile(temporary) as z:assert z.testzip() is None
import os
with temporary.open('rb') as stream:os.fsync(stream.fileno())
os.replace(temporary,output)
print('MPP',output.name,hashlib.sha256(output.read_bytes()).hexdigest())
