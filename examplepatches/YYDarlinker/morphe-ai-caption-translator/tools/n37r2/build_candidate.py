"""Offline JDK21 candidate build with bounded process watchdog and explicit composition status."""
from pathlib import Path
import json,hashlib,os,subprocess,time,shutil
ROOT=Path(__file__).resolve().parents[2]
JDK=Path(r'E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1')
ENV=dict(os.environ,JAVA_HOME=str(JDK),ANDROID_HOME=r'C:\Users\14776\AppData\Local\Android\Sdk')
ENV['PATH']=str(JDK/'bin')+';'+ENV['PATH']
E=ROOT/'.verification/n37r2';LABEL=os.environ.get('N37R2_BUILD_LABEL','candidate-01')
inputs={str(p.relative_to(ROOT)):hashlib.file_digest(p.open('rb'),'sha256').hexdigest() for folder in ['extensions/extension/src/main','patches/src/main','localization'] for p in (ROOT/folder).rglob('*') if p.is_file()}
(E/f'build-{LABEL}-inputs.json').write_text(json.dumps(inputs,indent=2),encoding='utf-8')
def run(task,args,limit):
 path=E/f'{task}-{LABEL}.log';assert not path.exists()
 cmd=['cmd','/c',str(ROOT/'gradlew.bat'),*args,'--offline','--console=plain',
      '-Pcomposition.patcherJar='+str(ROOT/'.verification/toolchain/morphe-patcher-1.14.1-all.jar'),'-Dorg.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g']
 start=time.monotonic()
 with path.open('wb') as log:
  proc=subprocess.Popen(cmd,cwd=ROOT,env=ENV,stdout=log,stderr=subprocess.STDOUT)
  while proc.poll() is None:
   if time.monotonic()-start>limit:
    (E/f'{task}-{LABEL}-WATCHDOG_TIMEOUT.txt').write_text('Preserve candidate and logs; process '+str(proc.pid)+' exceeded '+str(limit)+'s.')
    proc.terminate();raise RuntimeError(task+' watchdog timeout')
   time.sleep(.2)
  status=proc.returncode
 (E/f'{task}-{LABEL}-status.json').write_text(json.dumps({'exit':status,'elapsed_s':round(time.monotonic()-start,3),'argv':cmd},indent=2))
 assert status==0,(task,status)
 return path
run('build',[':patches:buildAndroid',':patches:generatePatchesList'],600)
mpp=ROOT/f'build/local-test/patches-1.3.5-local-n37r2-{LABEL}.mpp';mpe=ROOT/f'build/local-test/extension-1.3.5-local-n37r2-{LABEL}.mpe'
assert not mpp.exists() and not mpe.exists()
shutil.copyfile(ROOT/'patches/build/libs/patches-1.3.5.mpp',mpp);shutil.copyfile(ROOT/'extensions/extension/build/morphe/extensions/extension.mpe',mpe)
output=E/f'composition-{LABEL}';assert not output.exists()
log=run('composition',[':patches:verifyComposition',
 '-Pcomposition.input='+str(ROOT/'com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk'),
 '-Pcomposition.official='+str(ROOT/'patches-1.45.0.mpp'),'-Pcomposition.addon='+str(mpp),'-Pcomposition.output='+str(output),
 '-Pcomposition.selection=AI caption translator|Remember caption selection','-Pcomposition.compile=true'],900)
assert 'COMPOSITION_PASS' in log.read_text(encoding='utf-8',errors='replace'),'Missing actual patcher pass'
items=[]
for kind,p in [('mpp',mpp),('mpe',mpe),('apk',output/'patched-unsigned.apk')]:
 items.append({'kind':kind,'path':str(p),'bytes':p.stat().st_size,'sha256':hashlib.file_digest(p.open('rb'),'sha256').hexdigest().upper()})
(E/f'artifacts-{LABEL}.json').write_text(json.dumps({'candidate_only':True,'artifacts':items,'input_digest':hashlib.sha256(json.dumps(inputs,sort_keys=True).encode()).hexdigest()},indent=2),encoding='utf-8')
print('N37R2_CANDIDATE_BUILD_COMPOSITION_PASS');print(json.dumps(items,indent=2))
