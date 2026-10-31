"""Exercise the actual current-track repository with deterministic transport/main boundaries."""
from pathlib import Path
import hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision37/repository-final';w.mkdir(exist_ok=False)
stubs={
'android/content/Context.java':'package android.content;public class Context{public Context getApplicationContext(){return this;}}',
'android/os/Looper.java':'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/Handler.java':'package android.os;public class Handler{public Handler(Looper l){}public boolean post(Runnable r){r.run();return true;}}',
'app/morphe/extension/music/patches/lyrics/model/TrackInfo.java':'package app.morphe.extension.music.patches.lyrics.model;public record TrackInfo(String title,String artist,String album,int durationSeconds){}',
'app/bdcrusher/ytmusic/lyrics/LyricsLibrary.java':'package app.bdcrusher.ytmusic.lyrics;class LyricsLibrary{static int offers;LyricsLibrary(android.content.Context c){}void offer(String id,org.json.JSONObject p){offers++;}}',
'app/bdcrusher/ytmusic/lyrics/LyricsCatalog.java':'''package app.bdcrusher.ytmusic.lyrics;import org.json.*;import java.util.*;
class LyricsCatalog{interface Sink{default void result(JSONObject p){}default void notice(String s,boolean done){}default void health(JSONObject p){}default void completion(boolean empty){}default void reconnect(){}}
static final List<LyricsCatalog> created=new ArrayList<>();final Sink sink;boolean closed;int reconnects;
LyricsCatalog(android.content.Context c,app.morphe.extension.music.patches.lyrics.model.TrackInfo t,String id,boolean refresh,Sink sink){this.sink=sink;created.add(this);}
static boolean hasLyricsPayload(JSONObject p){return !p.optString("raw").isEmpty();}void refine(app.morphe.extension.music.patches.lyrics.model.TrackInfo t){}void close(){closed=true;}void connectionChanged(){reconnects++;}}
''',
'app/bdcrusher/ytmusic/lyrics/RepositoryCheck.java':'''package app.bdcrusher.ytmusic.lyrics;import java.util.*;import org.json.*;import app.morphe.extension.music.patches.lyrics.model.TrackInfo;
public class RepositoryCheck{static int checks;static void check(boolean ok,String what){checks++;if(!ok)throw new AssertionError(what);}static JSONObject result(String key,String raw)throws Exception{return new JSONObject().put("key",key).put("raw",raw);}
static class Sink implements LyricsCatalog.Sink{List<JSONObject> results=new ArrayList<>();int health,done;public void result(JSONObject p){results.add(p);}public void health(JSONObject p){health++;}public void completion(boolean empty){done++;}}
public static void main(String[] args)throws Exception{
var c=new android.content.Context();var track=new TrackInfo("Song","Artist","Album",167);LyricsRepository.clear();LyricsRepository.ensure(c,track,"sN_tJ8d3c0I",false);var first=LyricsCatalog.created.get(0);var one=new Sink();LyricsRepository.subscribe(one);
first.sink.result(result("unison-richsynced","rich"));first.sink.health(new JSONObject().put("pending",1));check(one.results.size()==1&&one.health==1,"live result and health");
LyricsRepository.ensure(c,new TrackInfo("Song","Artist","More album",0),"sN_tJ8d3c0I",false);check(LyricsCatalog.created.size()==1,"duration and album refinements preserve repository and retries");LyricsRepository.unsubscribe(one);LyricsRepository.ensure(c,track,"sN_tJ8d3c0I",false);var reopened=new Sink();LyricsRepository.subscribe(reopened);check(LyricsCatalog.created.size()==1&&!first.closed,"reopen keeps one catalog and retry budget");check(reopened.results.size()==1&&reopened.health==1,"reopen immediately replays saved in-memory result");
LyricsRepository.subscribe(reopened);first.sink.result(result("unison-richsynced","new"));check(reopened.results.size()==2,"idempotent subscription");var latest=new Sink();LyricsRepository.subscribe(latest);check(latest.results.size()==1&&latest.results.get(0).getString("raw").equals("new"),"successful variant replaces its replay snapshot");
first.sink.result(result("unison-richsynced",""));var afterEmpty=new Sink();LyricsRepository.subscribe(afterEmpty);check(afterEmpty.results.stream().anyMatch(p->p.optString("raw").equals("new")),"empty reply cannot erase valid result");
int before=reopened.results.size();LyricsRepository.ensure(c,track,"sN_tJ8d3c0I",true);check(first.closed&&LyricsCatalog.created.size()==2,"explicit refresh replaces only transport");var second=LyricsCatalog.created.get(1);second.sink.result(result("bLyrics-richsynced","better"));check(reopened.results.size()==before+1,"refresh keeps existing subscribers");
first.sink.result(result("old","obsolete"));check(reopened.results.size()==before+1,"old generation ignored");var refreshReplay=new Sink();LyricsRepository.subscribe(refreshReplay);check(refreshReplay.results.stream().anyMatch(p->p.optString("raw").equals("new"))&&refreshReplay.results.stream().anyMatch(p->p.optString("raw").equals("better")),"refresh retains all positive sources");
LyricsRepository.connectionChanged();check(second.reconnects==1,"verification change reaches shared catalog");LyricsRepository.rerank(c,"otherId");check(LyricsLibrary.offers==0,"stale recording cannot rerank");LyricsRepository.rerank(c,"sN_tJ8d3c0I");check(LyricsLibrary.offers>=2,"retained sources offered under new cache policy");
LyricsRepository.ensure(c,new TrackInfo("Next","Artist","Album",200),"MYal8NoVQXs",false);check(second.closed,"track switch closes transport");second.sink.result(result("stale","late"));var next=new Sink();LyricsRepository.subscribe(next);check(next.results.isEmpty(),"new track cannot inherit previous payload");LyricsRepository.clear();check(LyricsCatalog.created.get(2).closed,"teardown closes current transport");
java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),new JSONObject().put("passed",true).put("checks",checks).put("transportAndMainBoundarySimulated",true).toString(2));
}}
'''
}
files=[]
for name,s in stubs.items():
 p=w/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
actual=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/lyrics/LyricsRepository.java';files.append(actual)
jar=next((h/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=w/'classes';out.mkdir();cp=os.pathsep.join(map(str,[out,jar]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(out),*map(str,files)],cwd=w,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',cp,'app.bdcrusher.ytmusic.lyrics.RepositoryCheck',str(w/'verification.json')],cwd=w,env=env,check=True)
d=json.loads((w/'verification.json').read_text());d['sourceSha256']=hashlib.sha256(actual.read_bytes()).hexdigest();(w/'verification.json').write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8');print(json.dumps({'passed':True,'checks':d['checks']}))
