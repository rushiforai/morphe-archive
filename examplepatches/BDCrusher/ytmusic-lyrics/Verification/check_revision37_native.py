from pathlib import Path
import hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision37/native';w.mkdir(exist_ok=False)
s=json.loads((h/'Verification/revision34-native-stubs.json').read_text(encoding='utf-8'))
files=[]
for name,text in s.items():
 p=w/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8');files.append(p)
root=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic'
actual=[root/'common'/n for n in ['NavigationWindow.java','LyricsViewport.java','PersonalSettings.java']]+[root/'shaders/AnimatedCoverSurface.java'];files+=actual
java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=w/'classes';out.mkdir();env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-d',str(out),*map(str,files)],cwd=w,env=env,check=True)
results={}
for key,main in [('navigation','app.bdcrusher.ytmusic.common.NavCheck'),('cover','app.bdcrusher.ytmusic.shaders.CoverCheck')]:
 path=w/(key+'.json');subprocess.run([str(java/'java.exe'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',str(out),main,str(path)],cwd=w,env=env,check=True);results[key]=json.loads(path.read_text())
report={'passed':True,'checks':sum(x['checks'] for x in results.values()),'results':results,'androidBoundariesSimulated':True,'phoneVerified':False,'sourceSha256':{str(p.relative_to(root)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual}}
(w/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8');print(json.dumps({'passed':True,'checks':report['checks']}))
