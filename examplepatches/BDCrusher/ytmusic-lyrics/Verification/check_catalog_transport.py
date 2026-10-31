"""Run actual native Catalog/Network code on the JVM with minimal Android storage/UI stubs."""
from pathlib import Path
import subprocess,hashlib,json,os
home=Path(__file__).resolve().parents[1];folder=home/'Verification/catalog-transport';folder.mkdir(exist_ok=True)
src=home/'Personal-Patches/extensions/music/src/main/java'
stubs={
'android/content/Context.java':'package android.content; public class Context {}',
'android/content/SharedPreferences.java':'''package android.content; public class SharedPreferences { public String getString(String k,String d){return d;} public Editor edit(){return new Editor();} public static class Editor {public Editor remove(String k){return this;}public void apply(){}} }''',
'androidx/annotation/Nullable.java':'package androidx.annotation; public @interface Nullable {}',
'androidx/annotation/NonNull.java':'package androidx.annotation; public @interface NonNull {}',
'app/bdcrusher/ytmusic/lyrics/LyricsConfig.java':'package app.bdcrusher.ytmusic.lyrics; final class LyricsConfig {static android.content.SharedPreferences preferences(android.content.Context c){return new android.content.SharedPreferences();}}',
'app/bdcrusher/ytmusic/lyrics/LyricsDiskCache.java':'package app.bdcrusher.ytmusic.lyrics; final class LyricsDiskCache {LyricsDiskCache(android.content.Context c){} org.json.JSONObject get(String k){return null;}void put(String k,org.json.JSONObject v){}}',
'app/bdcrusher/ytmusic/lyrics/ServiceConnection.java':'package app.bdcrusher.ytmusic.lyrics; final class ServiceConnection {static boolean expired(String s){return false;}}',
'app/bdcrusher/ytmusic/lyrics/LyricsDiagnostics.java':'package app.bdcrusher.ytmusic.lyrics; final class LyricsDiagnostics {static void record(String s,String m){System.out.println(s+": "+m);}}',
'app/bdcrusher/ytmusic/lyrics/CatalogCheck.java':'''package app.bdcrusher.ytmusic.lyrics;
import java.util.concurrent.*;import java.util.concurrent.atomic.*;import org.json.*;
public class CatalogCheck {public static void main(String[] args)throws Exception{
CountDownLatch done=new CountDownLatch(1);AtomicReference<JSONObject> found=new AtomicReference<>();
try(LyricsCatalog catalog=new LyricsCatalog(new android.content.Context(),new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Love Me Dead (Female Cover)","CottontailVA Music","",0),"MYal8NoVQXs",true,new LyricsCatalog.Sink(){
public void result(JSONObject p){if("unison".equals(p.optString("kind")))found.set(p);}
public void notice(String m,boolean finished){if(finished)done.countDown();}
})) {if(!done.await(55,TimeUnit.SECONDS))throw new AssertionError("Catalog did not finish");
JSONObject p=found.get();if(p==null||!p.optBoolean("recordingMatched"))throw new AssertionError("Exact recording not retrieved");
JSONObject d=p.getJSONObject("data").getJSONObject("data");if(!"ttml".equals(d.optString("format"))||d.getString("lyrics").length()<10000)throw new AssertionError("Missing video TTML");
JSONObject report=new JSONObject().put("passed",true).put("jvmCatalog",true).put("androidVerified",false).put("recordingVideoId",p.getString("recordingVideoId")).put("exactRecording",true).put("ttmlChars",d.getString("lyrics").length());
java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),report.toString(2));System.out.println("PASS: actual native catalog retrieves exact supplied music-video recording");
}}}'''
}
files=[]
for name,text in stubs.items():
 p=folder/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(text,encoding='utf-8');files.append(p)
actual=[src/'app/bdcrusher/ytmusic/lyrics'/n for n in ['LyricsCatalog.java','LyricsNetwork.java']]+[src/'app/morphe/extension/music/patches/lyrics/model/TrackInfo.java']
jsonjar=home/'BuildCache/Gradle 8/caches/modules-2/files-2.1/org.json/json/20231013/e22e0c040fe16f04ffdb85d851d77b07fc05ea52/json-20231013.jar'
out=folder/'classes';out.mkdir(exist_ok=True)
java=Path('C:/Program Files/Java/jdk-25.0.4.1/bin')
env=dict(os.environ,TMP=str(home/'BuildCache/Temp'),TEMP=str(home/'BuildCache/Temp'),JAVA_TOOL_OPTIONS='-XX:-UsePerfData')
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',str(jsonjar),'-d',str(out),*map(str,files+actual)],cwd=folder,env=env,check=True)
report=home/'Verification/revision3-catalog-transport.json'
subprocess.run([str(java/'java.exe'),'-XX:-UsePerfData','-Duser.home='+str(home/'BuildCache/Home'),'-Djava.io.tmpdir='+str(home/'BuildCache/Temp'),'-cp',str(out)+os.pathsep+str(jsonjar),'app.bdcrusher.ytmusic.lyrics.CatalogCheck',str(report)],cwd=folder,env=env,check=True)
data=json.loads(report.read_text());data['actualSourceSha256']={str(p.relative_to(src)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};data['stubbedAndroidParts']=list(stubs)
report.write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8')
