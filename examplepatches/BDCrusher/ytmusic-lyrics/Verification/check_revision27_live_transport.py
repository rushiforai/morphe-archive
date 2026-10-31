"""Actual Catalog/Network regression for both entry-button examples; no phone or credential claims."""
from pathlib import Path
import ast,hashlib,json,os,subprocess
home=Path(__file__).resolve().parents[1];work=home/'Verification/revision27-live-transport';work.mkdir(exist_ok=True)
# Reuse only the reviewed literal Android storage/UI stubs, never execute the older report helper.
tree=ast.parse((home/'Verification/check_catalog_transport.py').read_text(encoding='utf-8'))
stubs=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='stubs' for t in n.targets)))
stubs['app/bdcrusher/ytmusic/lyrics/CatalogCheck.java']='''package app.bdcrusher.ytmusic.lyrics;
import java.util.concurrent.*;import java.util.concurrent.atomic.*;import org.json.*;
public class CatalogCheck {public static void main(String[] args)throws Exception{
JSONArray cases=new JSONArray();for(int i=0;i<2;i++){
final boolean video=i==1;String id=video?"MYal8NoVQXs":"gF2KuOJLEQE";String title=video?"Love Me Dead (Female Cover)":"Man Areas";String artist=video?"CottontailVA Music":"Jonny McGovern";
CountDownLatch done=new CountDownLatch(1);AtomicReference<JSONObject> found=new AtomicReference<>();
try(LyricsCatalog catalog=new LyricsCatalog(new android.content.Context(),new app.morphe.extension.music.patches.lyrics.model.TrackInfo(title,artist,"",0),id,true,new LyricsCatalog.Sink(){
public void result(JSONObject p){if(video?"unison".equals(p.optString("kind")):"lrclib-synced".equals(p.optString("key")))found.set(p);}
public void notice(String m,boolean finished){if(finished)done.countDown();}
})){
if(!done.await(55,TimeUnit.SECONDS))throw new AssertionError("Catalog did not finish: "+id);
JSONObject p=found.get();if(p==null)throw new AssertionError("Expected source missing: "+id);
int count;if(video){if(!p.optBoolean("recordingMatched"))throw new AssertionError("Wrong recording");JSONObject d=p.getJSONObject("data").getJSONObject("data");count=d.getString("lyrics").length();if(!id.equals(d.getString("videoId")))throw new AssertionError("Wrong video");}else count=p.getString("raw").length();
if(count<(video?10000:1000))throw new AssertionError("Lyrics too short");
cases.put(new JSONObject().put("videoId",id).put("source",video?"Unison":"LRCLib synced").put("characters",count).put("passed",true));
System.out.println("PASS: actual catalog retrieves "+id+" from "+(video?"Unison":"LRCLib"));
}}
java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),new JSONObject().put("passed",true).put("cases",cases).put("androidPhoneVerified",false).toString(2));
}}'''
files=[]
for name,content in stubs.items():
 p=work/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(p)
src=home/'Personal-Patches/extensions/music/src/main/java'
actual=[src/'app/bdcrusher/ytmusic/lyrics'/n for n in ('LyricsCatalog.java','LyricsNetwork.java')]+[src/'app/morphe/extension/music/patches/lyrics/model/TrackInfo.java']
jsonjar=next((home/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'))
java=Path('C:/Program Files/Java/jdk-25.0.4.1/bin');out=work/'classes';out.mkdir(exist_ok=True)
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(home/'BuildCache/Temp'),TEMP=str(home/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',str(jsonjar),'-d',str(out),*map(str,files+actual)],cwd=work,env=env,check=True)
report=home/'Verification/revision27-live-transport.json'
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(home/'BuildCache/Home'),'-Djava.io.tmpdir='+str(home/'BuildCache/Temp'),'-cp',str(out)+os.pathsep+str(jsonjar),'app.bdcrusher.ytmusic.lyrics.CatalogCheck',str(report)],cwd=work,env=env,check=True)
data=json.loads(report.read_text());data['actualSourceSha256']={str(p.relative_to(src)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};data['stubs']=list(stubs)
report.write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8')
