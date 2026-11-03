"""Native-watch entry routing using production NativePlayback. Activity/Uri boundaries simulated."""
from pathlib import Path
import subprocess,json,os,hashlib
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision44/native-entry';w.mkdir(exist_ok=False);pkg='app/bdcrusher/ytmusic/playlists/'
s={
'android/net/Uri.java':r'''package android.net;public record Uri(String value){public static Uri parse(String s){return new Uri(s);}public Builder buildUpon(){return new Builder(value);}public static class Builder{String value;Builder(String s){value=s;}public Builder appendQueryParameter(String k,String v){value+=(value.contains("?")?"&":"?")+k+"="+java.net.URLEncoder.encode(v,java.nio.charset.StandardCharsets.UTF_8);return this;}public Uri build(){return new Uri(value);}}}''',
'android/content/Intent.java':'package android.content;public class Intent{public static final String ACTION_VIEW="view";public String action,pkg;public android.net.Uri uri;public Intent(String a,android.net.Uri u){action=a;uri=u;}public Intent(android.app.Activity a,Class<?> c){}public Intent setPackage(String p){pkg=p;return this;}}',
'android/app/Activity.java':'package android.app;public class Activity{public android.content.Intent opened;public int stops;public boolean fail;public String getPackageName(){return "fixture.music";}public void startActivity(android.content.Intent i){if(fail)throw new IllegalStateException("fixture");opened=i;}public void stopService(android.content.Intent i){stops++;}}',
'app/morphe/extension/shared/Utils.java':'package app.morphe.extension.shared;public class Utils{public static android.app.Activity activity=new android.app.Activity();public static String toast;public static android.app.Activity getActivity(){return activity;}public static void runOnMainThread(Runnable r){r.run();}public static void showToastShort(String s){toast=s;}}',
'app/bdcrusher/ytmusic/common/FeatureDiagnostics.java':'package app.bdcrusher.ytmusic.common;public class FeatureDiagnostics{public static void record(String a,String b){}}',
pkg+'PlaylistHeaderModel.java':'package app.bdcrusher.ytmusic.playlists;public class PlaylistHeaderModel{public static boolean validId(String id){return id!=null&&id.startsWith("PL")&&id.length()>11;}}',
pkg+'PlaylistRuntime.java':'package app.bdcrusher.ytmusic.playlists;public class PlaylistRuntime{public static java.util.List<org.json.JSONObject> data=java.util.List.of();public static java.util.List<org.json.JSONObject> snapshot(){return data;}}',
pkg+'LocalPlayback.java':'package app.bdcrusher.ytmusic.playlists;public class LocalPlayback{public static boolean saved=true;public static byte[] response(String id){return saved?new byte[]{1}:null;}}',
pkg+'PlaylistBrowse.java':'package app.bdcrusher.ytmusic.playlists;public class PlaylistBrowse{public static boolean disconnected;public static boolean offline(){return disconnected;}}',
'app/morphe/extension/music/patches/downloads/OfflinePlaybackService.java':'package app.morphe.extension.music.patches.downloads;public class OfflinePlaybackService{}',
'EntryCheck.java':r'''import app.bdcrusher.ytmusic.playlists.*;import app.morphe.extension.shared.Utils;import org.json.*;import java.util.*;
public class EntryCheck{static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}public static void main(String[] args)throws Exception{
 String id="abcdefghijk",list="PLfixturePlaylist";NativePlayback.open(id);check(Utils.activity.opened.uri.value().equals("https://music.youtube.com/watch?v="+id));check(Utils.activity.opened.pkg.equals("fixture.music"));check(Utils.activity.stops==1);
 PlaylistRuntime.data=List.of(new JSONObject().put("id",list).put("entries",new JSONArray().put(new JSONObject().put("id",id)).put(new JSONObject().put("id",id))));NativePlayback.open(id);check(Utils.activity.opened.uri.value().contains("list="+list+"&index=0"));NativePlayback.open(id,list,1);check(Utils.activity.opened.uri.value().contains("index=1"));
 var previous=Utils.activity.opened;PlaylistBrowse.disconnected=true;LocalPlayback.saved=false;NativePlayback.open(id);check(Utils.activity.opened==previous&&Utils.toast.contains("Connect once"));PlaylistBrowse.disconnected=false;NativePlayback.open(id);check(Utils.activity.opened!=previous);
 previous=Utils.activity.opened;NativePlayback.open("../bad");check(Utils.activity.opened==previous);NativePlayback.open(id,"invalid",0);check(!Utils.activity.opened.uri.value().contains("list="));Utils.activity.fail=true;NativePlayback.open(id);check(Utils.toast.contains("native music player"));Utils.activity=null;NativePlayback.open(id);
 System.out.println("PASS "+checks+" actual native-watch entry checks");}}
'''
}
paths=[]
for name,body in s.items():
 p=w/'src'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body,encoding='utf-8');paths.append(p)
actual=h/'Personal-Patches/extensions/music/src/main/java'/pkg/'NativePlayback.java';classes=w/'classes';classes.mkdir();java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');jar=next((h/'BuildCache/Gradle Cache/caches/modules-2/files-2.1/org.json/json/20231013').glob('*/*.jar'));cp=os.pathsep.join(map(str,[classes,jar]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(classes),str(actual),*map(str,paths)],cwd=w,env=env,check=True)
r=subprocess.run([str(java/'java.exe'),'-cp',cp,'EntryCheck'],cwd=w,env=env,capture_output=True,text=True,check=True)
(w/'result.json').write_text(json.dumps({'stdout':r.stdout,'sources':{str(actual.relative_to(h)):hashlib.sha256(actual.read_bytes()).hexdigest()},'scope':'Production native-watch routing; Android Activity, native player, Uri and offline availability are fixture seams. No actual player/device/app launch.'},indent=2),encoding='utf-8');print(r.stdout)
