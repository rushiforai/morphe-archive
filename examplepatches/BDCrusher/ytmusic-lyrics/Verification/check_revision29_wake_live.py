"""Actual Catalog/Network regression for both entry-button examples; no phone or credential claims."""
from pathlib import Path
import ast,hashlib,json,os,subprocess
home=Path(__file__).resolve().parents[1];work=home/'Verification/revision29-wake-live';assert not work.exists();work.mkdir()
# Reuse only the reviewed literal Android storage/UI stubs, never execute the older report helper.
tree=ast.parse((home/'Verification/check_catalog_transport.py').read_text(encoding='utf-8'))
stubs=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='stubs' for t in n.targets)))
stubs['app/bdcrusher/ytmusic/lyrics/CatalogCheck.java']='package app.bdcrusher.ytmusic.lyrics;\nimport java.util.concurrent.*;import java.util.concurrent.atomic.*;import org.json.*;\npublic class CatalogCheck{public static void main(String[] a)throws Exception{\nCountDownLatch done=new CountDownLatch(1);AtomicReference<JSONObject> result=new AtomicReference<>();\ntry(var c=new LyricsCatalog(new android.content.Context(),new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Wake Up","Imagine Dragons","LOOM",167),"sN_tJ8d3c0I",true,new LyricsCatalog.Sink(){public void result(JSONObject p){if("bLyrics-richsynced".equals(p.optString("key")))result.set(p);}public void notice(String m,boolean f){if(f)done.countDown();}})){\nif(!done.await(55,TimeUnit.SECONDS))throw new AssertionError("Catalog timed out");JSONObject p=result.get();if(p==null||p.optString("raw").length()<10000)throw new AssertionError("Actual Android transport failed to fetch Wake Up Better Lyrics");\njava.nio.file.Files.writeString(java.nio.file.Path.of(a[0]),new JSONObject().put("passed",true).put("videoId","sN_tJ8d3c0I").put("source","Better Lyrics").put("characters",p.getString("raw").length()).put("relaxedMetadata",p.getBoolean("relaxedMetadata")).put("androidPhoneVerified",false).toString(2));\n}}}'
files=[]
for name,content in stubs.items():
 p=work/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(p)
src=home/'Personal-Patches/extensions/music/src/main/java'
actual=[src/'app/bdcrusher/ytmusic/lyrics'/n for n in ('LyricsCatalog.java','LyricsNetwork.java','LyricsLookup.java','LyricsRetry.java')]+[src/'app/morphe/extension/music/patches/lyrics/model/TrackInfo.java']
jsonjar=next((home/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'))
java=Path('C:/Program Files/Java/jdk-25.0.5.0.2/bin');out=work/'classes';out.mkdir(exist_ok=True)
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(home/'BuildCache/Temp'),TEMP=str(home/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',str(jsonjar),'-d',str(out),*map(str,files+actual)],cwd=work,env=env,check=True)
report=home/'Verification/revision29-wake-live.json'
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(home/'BuildCache/Home'),'-Djava.io.tmpdir='+str(home/'BuildCache/Temp'),'-cp',str(out)+os.pathsep+str(jsonjar),'app.bdcrusher.ytmusic.lyrics.CatalogCheck',str(report)],cwd=work,env=env,check=True)
data=json.loads(report.read_text());data['actualSourceSha256']={str(p.relative_to(src)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};data['stubs']=list(stubs)
report.write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8')
