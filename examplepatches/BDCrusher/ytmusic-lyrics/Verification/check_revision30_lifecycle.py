"""Execute actual repository/coordinator with a deterministic main queue and explicit Android/UI/network stubs."""
from pathlib import Path
import hashlib, json, os, subprocess
home=Path(__file__).resolve().parents[1]
work=home/'Verification/revision30-lifecycle-final'
assert not work.exists();work.mkdir()
src=home/'Personal-Patches/extensions/music/src/main/java'
stubs={
'app/bdcrusher/ytmusic/lyrics/ServiceConnection.java':'''package app.bdcrusher.ytmusic.lyrics;final class ServiceConnection{static int ensures,cancels;static void ensure(android.app.Activity a){ensures++;}static void cancel(){cancels++;}}''',
'android/content/Context.java':'''package android.content; public class Context {public Context getApplicationContext(){return this;}}''',
'android/content/SharedPreferences.java':'''package android.content; public class SharedPreferences {public interface OnSharedPreferenceChangeListener {void onSharedPreferenceChanged(SharedPreferences p,String k);} public OnSharedPreferenceChangeListener listener;public void registerOnSharedPreferenceChangeListener(OnSharedPreferenceChangeListener l){listener=l;}}''',
'android/app/Activity.java':'''package android.app; public class Activity extends android.content.Context {public boolean finishing,destroyed;public boolean isFinishing(){return finishing;}public boolean isDestroyed(){return destroyed;}}''',
'android/os/Looper.java':'''package android.os; public class Looper {public static Looper getMainLooper(){return new Looper();}}''',
'android/os/Handler.java':'''package android.os; import java.util.*; public class Handler {static ArrayDeque<Runnable> queue=new ArrayDeque<>();public Handler(Looper l){}public void post(Runnable r){queue.add(r);}public void postDelayed(Runnable r,long ms){}public static void drain(){int n=0;while(!queue.isEmpty()){if(++n>1000)throw new AssertionError("runaway main queue");queue.remove().run();}}}''',
'app/morphe/extension/shared/Utils.java':'''package app.morphe.extension.shared; public class Utils {public static android.app.Activity activity=new android.app.Activity();public static android.app.Activity getActivity(){return activity;}}''',
'app/morphe/extension/music/settings/Settings.java':'''package app.morphe.extension.music.settings;public class Settings {public static final Flag LYRICS_ENABLED=new Flag();public static class Flag{public boolean enabled=true;public boolean get(){return enabled;}}}''',
'app/morphe/extension/music/shared/VideoInformation.java':'''package app.morphe.extension.music.shared;public class VideoInformation {public static String id="gF2KuOJLEQE";public static String getVideoId(){return id;}}''',
'app/morphe/extension/music/patches/lyrics/model/TrackInfo.java':'''package app.morphe.extension.music.patches.lyrics.model;public record TrackInfo(String title,String artist,String album,int durationSeconds){}''',
'app/morphe/extension/music/patches/lyrics/model/Lyrics.java':'''package app.morphe.extension.music.patches.lyrics.model;public class Lyrics {}''',
'app/morphe/extension/music/patches/lyrics/LyricsManager.java':'''package app.morphe.extension.music.patches.lyrics;import app.morphe.extension.music.patches.lyrics.model.*;public class LyricsManager {public enum State {LOADING,LOADED,NOT_FOUND}public interface Listener{void onLyricsChanged(State s,Lyrics l);}static final LyricsManager instance=new LyricsManager();public static LyricsManager getInstance(){return instance;}public TrackInfo track=new TrackInfo("Man Areas","Jonny McGovern","",0);public String committed="gF2KuOJLEQE";public Listener listener;public void addListener(Listener l){listener=l;l.onLyricsChanged(State.LOADING,null);}public boolean hasLyrics(){return false;}public TrackInfo getCurrentTrack(){return track;}public String getCommittedVideoId(){return committed;}}''',
'app/bdcrusher/ytmusic/lyrics/LyricsEntryButton.java':'''package app.bdcrusher.ytmusic.lyrics;final class LyricsEntryButton {static int updates,clears;static String bound="",pending="";void orderWhilePending(String k){pending=k;}void notFound(String k){bound="";pending="";}void update(android.app.Activity a,String k){updates++;bound=k;pending="";}void clear(){clears++;bound="";pending="";}void trackChanged(String k){bound="";pending="";}void hideButton(){bound="";pending="";}}''',
'app/bdcrusher/ytmusic/lyrics/LyricsConfig.java':'''package app.bdcrusher.ytmusic.lyrics;final class LyricsConfig {static final android.content.SharedPreferences prefs=new android.content.SharedPreferences();static android.content.SharedPreferences preferences(android.content.Context c){return prefs;}}''',
'app/bdcrusher/ytmusic/lyrics/LyricsDiagnostics.java':'''package app.bdcrusher.ytmusic.lyrics;final class LyricsDiagnostics {static void record(String s,String m){}}''',
'app/bdcrusher/ytmusic/lyrics/LyricsCatalog.java':'''package app.bdcrusher.ytmusic.lyrics;import org.json.*;import java.util.*;import app.morphe.extension.music.patches.lyrics.model.TrackInfo;final class LyricsCatalog {interface Sink{void result(JSONObject p);void notice(String m,boolean d);default void reconnect(){}default void completion(boolean b){}default void health(JSONObject status){}}static List<LyricsCatalog> created=new ArrayList<>();final Sink sink;final String id;int renewals;void connectionChanged(){renewals++;}boolean closed,refresh;LyricsCatalog(android.content.Context c,TrackInfo t,String id,boolean r,Sink s){this.id=id;this.refresh=r;sink=s;created.add(this);}void close(){closed=true;}    static boolean hasLyricsPayload(JSONObject payload){         if(!payload.optString("raw").trim().isEmpty())return true;         if("unison".equals(payload.optString("kind"))){JSONObject data=payload.optJSONObject("data");if(data!=null&&data.optJSONObject("data")!=null)data=data.optJSONObject("data");return data!=null&&!data.optString("lyrics").trim().isEmpty();}         if(!"provider".equals(payload.optString("event")))return false;         JSONObject data=payload.optJSONObject("data"),results=data==null?null:data.optJSONObject("results");if(results==null)return false;         for(String key:new String[]{"lyrics","synced","plain","wordByWord"})if(!results.optString(key).trim().isEmpty())return true;         return false;     } }''',
'app/bdcrusher/ytmusic/lyrics/EntryCheck.java':r'''package app.bdcrusher.ytmusic.lyrics;
import android.os.Handler;import org.json.*;import app.morphe.extension.music.patches.lyrics.LyricsManager;import app.morphe.extension.music.patches.lyrics.model.TrackInfo;import app.morphe.extension.music.shared.VideoInformation;import app.morphe.extension.music.settings.Settings;
public class EntryCheck {
static int checks;static void check(boolean v,String message){if(!v)throw new AssertionError(message);checks++;System.out.println("PASS: "+message);}
static JSONObject raw(String text)throws Exception{return new JSONObject().put("key","lrclib-synced").put("raw",text);}
public static void main(String[] args)throws Exception{
 LyricsEntryCoordinator.onPlaybackEvent();Handler.drain();
 check(LyricsCatalog.created.size()==1,"lookup starts from playback without any panel");
 LyricsCatalog first=LyricsCatalog.created.get(0);
 check(LyricsEntryButton.pending.startsWith("gF2KuOJLEQE")&&LyricsEntryButton.bound.isEmpty(),"pending lookup orders without enabling native action");
 first.sink.completion(false);Handler.drain();check(!LyricsEntryButton.pending.isEmpty(),"connection failure preserves pending ordering");
 first.sink.completion(true);Handler.drain();check(LyricsEntryButton.pending.isEmpty(),"definite all-not-found restores unavailable ordering");
 final Boolean[] completion={null};LyricsCatalog.Sink completedView=new LyricsCatalog.Sink(){public void result(JSONObject p){}public void notice(String m,boolean d){}public void completion(boolean b){completion[0]=b;}};
 LyricsRepository.subscribe(completedView);check(Boolean.TRUE.equals(completion[0]),"repository replays typed completion to late subscribers");LyricsRepository.unsubscribe(completedView);

 check(LyricsEntryButton.bound.isEmpty(),"no entry promoted before a provider response");
 first.sink.notice("Not found",true);Handler.drain();
 check(LyricsEntryButton.bound.isEmpty(),"not found does not falsely promote an entry");
 first.sink.health(new JSONObject().put("pending",2));Handler.drain();
 final int[] healthPending={-1};LyricsCatalog.Sink healthView=new LyricsCatalog.Sink(){public void result(JSONObject p){}public void notice(String m,boolean d){}public void health(JSONObject p){healthPending[0]=p.optInt("pending");}};LyricsRepository.subscribe(healthView);check(healthPending[0]==2,"typed source health replays to late panel subscribers");LyricsRepository.unsubscribe(healthView);
 first.sink.result(raw("[00:01]synthetic"));Handler.drain();
 check(LyricsEntryButton.bound.startsWith("gF2KuOJLEQE"),"LRCLib result enables entry without native lyrics");
 final int[] replay={0};LyricsCatalog.Sink view=new LyricsCatalog.Sink(){public void result(JSONObject p){replay[0]++;}public void notice(String m,boolean d){}};
 LyricsRepository.subscribe(view);
 check(replay[0]==1&&LyricsCatalog.created.size()==1,"opening panel replays cached result without a new lookup");
 LyricsRepository.unsubscribe(view);first.sink.result(raw("[00:02]synthetic"));Handler.drain();
 check(replay[0]==1&&!first.closed,"panel detach leaves current track discovery alive");
 var manager=LyricsManager.getInstance();VideoInformation.id="MYal8NoVQXs";
 LyricsEntryCoordinator.onPlaybackEvent();Handler.drain();
 check(first.closed&&LyricsEntryButton.bound.isEmpty()&&LyricsCatalog.created.size()==1,"video/metadata mismatch cancels old lookup and clears entry");
 first.sink.completion(true);first.sink.result(raw("stale"));Handler.drain();check(LyricsEntryButton.bound.isEmpty(),"late cancelled response cannot reenable old track");
 manager.committed=VideoInformation.id;manager.track=new TrackInfo("Love Me Dead (Female Cover)","CottontailVA Music","",0);
 manager.listener.onLyricsChanged(LyricsManager.State.LOADING,null);Handler.drain();
 check(LyricsCatalog.created.size()==2,"committed track change starts lookup before opening");
 var second=LyricsCatalog.created.get(1);JSONObject unison=new JSONObject().put("kind","unison").put("data",new JSONObject().put("data",new JSONObject().put("lyrics","<tt>synthetic</tt>")));
 second.sink.result(unison);Handler.drain();check(LyricsEntryButton.bound.startsWith(VideoInformation.id),"Unison-only video promotes its own entry");
 LyricsConfig.prefs.listener.onSharedPreferenceChanged(LyricsConfig.prefs,"serviceJwt");Handler.drain();
 check(!second.closed&&LyricsCatalog.created.size()==2&&second.renewals==1,"connection renewal adds sources without replacing the track session");
 second.sink.result(unison);Handler.drain();check(!LyricsEntryButton.bound.isEmpty(),"renewal preserves existing available lyrics and native entry");
 var third=second;third.sink.result(unison);Handler.drain();
 Settings.LYRICS_ENABLED.enabled=false;LyricsEntryCoordinator.onPlaybackEvent();Handler.drain();
 check(third.closed&&LyricsEntryButton.bound.isEmpty(),"disabling lyrics cancels discovery and restores native entry");
 third.sink.result(unison);Handler.drain();check(LyricsEntryButton.bound.isEmpty(),"disabled feature ignores late success");
 Settings.LYRICS_ENABLED.enabled=true;LyricsEntryCoordinator.onPlaybackEvent();Handler.drain();
 check(LyricsCatalog.created.size()==3,"re-enable restarts discovery without requiring a panel");
 var fourth=LyricsCatalog.created.get(2);for(int i=0;i<70;i++)fourth.sink.result(raw("synthetic-"+i));Handler.drain();
 replay[0]=0;LyricsRepository.subscribe(view);check(replay[0]==64,"replay memory stays bounded");
 check(ServiceConnection.ensures>0&&ServiceConnection.cancels>0,"playback prewarms verification and disabling cancels it");
 check(!LyricsEntryCoordinator.hasLyricsPayload(new JSONObject().put("event","metadata").put("data",new JSONObject().put("song","synthetic"))),"metadata is not mistaken for lyrics");
 check(!LyricsEntryCoordinator.hasLyricsPayload(new JSONObject().put("event","provider").put("data",new JSONObject().put("results",new JSONObject()))),"empty provider is not mistaken for lyrics");
 check(LyricsEntryCoordinator.hasLyricsPayload(new JSONObject().put("event","provider").put("data",new JSONObject().put("results",new JSONObject().put("wordByWord","synthetic")))),"broker word lyrics promote entry");
 java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),new JSONObject().put("passed",true).put("checks",checks).put("androidPhoneVerified",false).toString(2));
}}
'''
}
files=[]
for name,content in stubs.items():
 p=work/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(p)
actual=[src/'app/bdcrusher/ytmusic/lyrics'/name for name in ('LyricsRepository.java','LyricsEntryCoordinator.java')]
jsonjar=next((home/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'))
java=Path('C:/Program Files/Java/jdk-25.0.5.0.2/bin');out=work/'classes';out.mkdir(exist_ok=True)
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(home/'BuildCache/Temp'),TEMP=str(home/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',str(jsonjar),'-d',str(out),*map(str,files+actual)],cwd=work,env=env,check=True)
report=home/'Verification/revision30-lifecycle-final.json'
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(home/'BuildCache/Home'),'-Djava.io.tmpdir='+str(home/'BuildCache/Temp'),'-cp',str(out)+os.pathsep+str(jsonjar),'app.bdcrusher.ytmusic.lyrics.EntryCheck',str(report)],cwd=work,env=env,check=True)
data=json.loads(report.read_text());data['actualSourceSha256']={str(p.relative_to(src)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};data['stubs']=list(stubs)
report.write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8')
