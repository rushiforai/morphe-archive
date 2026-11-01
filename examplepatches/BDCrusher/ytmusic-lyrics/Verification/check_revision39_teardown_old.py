"""Run the same cached-array traversal against the exact previous ShaderRuntime source."""
from pathlib import Path
import hashlib,json,os,subprocess,zipfile
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision39/teardown-old';w.mkdir(exist_ok=False)
name='Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/shaders/ShaderRuntime.java'
with zipfile.ZipFile(h/'Personal-Patches/dist/0.6.0-beta.1/ytmusic-lyrics-0.6.0-beta.1-source.zip') as z:raw=z.read(name)
source=w/'ShaderRuntime.java';source.write_bytes(raw);old=w/'classes';old.mkdir();current=h/'Verification/revision39/teardown/classes';jar=next((h/'BuildCache/Gradle Cache/caches/modules-2/files-2.1/org.json/json/20231013').glob('*/*.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',os.pathsep.join(map(str,[current,jar])),'-d',str(old),str(source)],cwd=w,env=env,check=True)
p=subprocess.run([str(java/'java.exe'),'-cp',os.pathsep.join(map(str,[old,current,jar])),'app.bdcrusher.ytmusic.shaders.TeardownCheck',str(w/'must-not-succeed.json')],cwd=w,env=env,capture_output=True,text=True,timeout=20)
(w/'expected-failure.txt').write_text(p.stdout+p.stderr,encoding='utf-8');assert p.returncode!=0 and 'NullPointerException' in p.stderr and 'android.view.ViewGroup.detach' in p.stderr,p.stderr
report={'passed':True,'checks':1,'exactOldImplementationReproducesNullChild':True,'oldSourceSha256':hashlib.sha256(raw).hexdigest(),'newSourceSha256':hashlib.sha256((h/name).read_bytes()).hexdigest(),'sameTraversalHarnessAsNew':True,'androidTraversalSimulated':True,'phoneVerified':False};(w/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(json.dumps(report))
