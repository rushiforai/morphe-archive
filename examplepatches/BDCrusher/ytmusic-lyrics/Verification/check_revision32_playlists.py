"""Actual playlist model/parser/batch repository; Android, host browse and media transport boundaries simulated."""
from pathlib import Path
import hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];work=h/'Verification/revision32-playlists-r5';work.mkdir(exist_ok=False)
stubs={
'android/content/Context.java':'''package android.content;public class Context{public static java.io.File root;public Context getApplicationContext(){return this;}public java.io.File getFilesDir(){return new java.io.File(root,"files");}public java.io.File getExternalFilesDir(String type){return new java.io.File(root,"external");}}''',
'android/app/Activity.java':'''package android.app;public class Activity extends android.content.Context{public boolean isFinishing(){return false;}public void startForegroundService(android.content.Intent i){app.morphe.extension.music.patches.downloads.OfflinePlaybackService.last=i;}}''',

'android/app/AlertDialog.java':'''package android.app;public class AlertDialog{public static int shown;public interface Click{void onClick(Object d,int which);}public static class Builder{public Builder(android.content.Context c){}public Builder setTitle(String s){return this;}public Builder setMessage(String s){return this;}public Builder setNegativeButton(String s,Click c){return this;}public Builder setPositiveButton(String s,Click c){return this;}public void show(){shown++;}}}''',
'android/content/Intent.java':'''package android.content;public class Intent{public final java.util.Map<String,Object> extras=new java.util.HashMap<>();public Intent(Context c,Class<?> t){}public void setAction(String s){}public void putExtra(String k,String v){extras.put(k,v);}public void putExtra(String k,int v){extras.put(k,v);}public void putStringArrayListExtra(String k,java.util.ArrayList<String> v){extras.put(k,v);}}''',
'android/os/Environment.java':'''package android.os;public class Environment{public static final String DIRECTORY_MUSIC="Music";}''',
'android/os/Looper.java':'''package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}''',
'android/os/Handler.java':'''package android.os;public class Handler{public Handler(Looper l){}public void post(Runnable r){r.run();}}''',
'android/util/AtomicFile.java':'''package android.util;import java.io.*;public class AtomicFile{final File f;public AtomicFile(File f){this.f=f;}public InputStream openRead()throws IOException{return new FileInputStream(f);}public FileOutputStream startWrite()throws IOException{return new FileOutputStream(new File(f+".new"));}public void finishWrite(FileOutputStream s)throws IOException{s.close();java.nio.file.Files.move(new File(f+".new").toPath(),f.toPath(),java.nio.file.StandardCopyOption.REPLACE_EXISTING);}public void failWrite(FileOutputStream s){try{if(s!=null)s.close();new File(f+".new").delete();}catch(Exception ignored){}}}''',
'android/net/Uri.java':'''package android.net;public class Uri{public static String decode(String s){return java.net.URLDecoder.decode(s,java.nio.charset.StandardCharsets.UTF_8);}}''',
'android/util/Base64.java':'''package android.util;public class Base64{public static final int URL_SAFE=8;public static byte[] decode(String s,int flags){return java.util.Base64.getUrlDecoder().decode(s);}}''',
'app/bdcrusher/ytmusic/common/PersonalRuntime.java':'''package app.bdcrusher.ytmusic.common;public class PersonalRuntime{public static boolean installed(android.content.Context c,String f){return true;}}''',
'app/bdcrusher/ytmusic/playlists/PlaylistSettingsPage.java':'''package app.bdcrusher.ytmusic.playlists;public class PlaylistSettingsPage{public static void showBatches(android.app.Activity a){}}''',
'app/morphe/extension/shared/Utils.java':'''package app.morphe.extension.shared;public class Utils{public static android.app.Activity activity=new android.app.Activity();public static android.app.Activity getActivity(){return activity;}public static android.content.Context getContext(){return activity;}public static void showToastShort(String s){}}''',
'app/morphe/extension/shared/patches/DownloadMode.java':'''package app.morphe.extension.shared.patches;public enum DownloadMode{DEFAULT,IN_APP,EXTERNAL}''',
'app/morphe/extension/music/settings/Settings.java':'''package app.morphe.extension.music.settings;import app.morphe.extension.shared.patches.DownloadMode;public class Settings{public static Mode DOWNLOAD_MODE=new Mode();public static class Mode{public DownloadMode value=DownloadMode.DEFAULT;public DownloadMode get(){return value;}}}''',
'app/morphe/extension/shared/settings/preference/ExternalDownloaderPreference.java':'''package app.morphe.extension.shared.settings.preference;public class ExternalDownloaderPreference{public static String last;public static int calls;public static void launchExternalDownloader(String id,android.content.Context c,String url){calls++;last=url;}}''',
'app/morphe/extension/music/patches/downloads/LocalDownloadManager.java':'''package app.morphe.extension.music.patches.downloads;public class LocalDownloadManager{public static final java.util.Set<String> active=java.util.concurrent.ConcurrentHashMap.newKeySet();public static int max;public static void enqueue(String id){active.add(id);max=Math.max(max,active.size());}public static void finish(String id,boolean success)throws Exception{if(success){java.io.File f=new java.io.File(app.morphe.extension.shared.Utils.getContext().getExternalFilesDir("Music"),"Morphe/"+id+".m4a");f.getParentFile().mkdirs();java.nio.file.Files.writeString(f.toPath(),"simulated media boundary");}active.remove(id);app.bdcrusher.ytmusic.playlists.PlaylistRuntime.finished(id);}}''',
'app/morphe/extension/music/patches/downloads/OfflinePlaybackService.java':'''package app.morphe.extension.music.patches.downloads;public class OfflinePlaybackService{public static android.content.Intent last;public static final String ACTION_PLAY_FILE="play",EXTRA_PATH="path",EXTRA_QUEUE="queue",EXTRA_QUEUE_INDEX="index";}''',
'app/bdcrusher/ytmusic/playlists/PlaylistCheck.java':r'''package app.bdcrusher.ytmusic.playlists;
import app.bdcrusher.ytmusic.lyrics.ProtoWire;import java.nio.file.*;import java.nio.charset.StandardCharsets;import java.util.*;import java.util.concurrent.*;import org.json.*;
import app.morphe.extension.music.settings.Settings;import app.morphe.extension.shared.patches.DownloadMode;import app.morphe.extension.music.patches.downloads.*;
public class PlaylistCheck{
 static int checks;static String id;
 static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS: "+why);}
 static byte[] path(byte[] b,int... ns){for(int n:ns)b=new ProtoWire(b).child(n);return b;}
 static String text(byte[] b){return new String(b,StandardCharsets.UTF_8);}
 static List<ProtoWire.Field> actions(byte[] b){return new ProtoWire(path(b,172660663,1,168777401,5,373186255,14)).fields.stream().filter(f->f.number==7).toList();}
 static void waitFor(java.util.function.BooleanSupplier condition)throws Exception{long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(6);while(!condition.getAsBoolean()&&System.nanoTime()<deadline)Thread.sleep(5);if(!condition.getAsBoolean())throw new AssertionError("asynchronous state did not settle");}
 static JSONObject batch(){return PlaylistRuntime.snapshot().stream().filter(o->id.equals(o.optString("id"))).findFirst().orElse(null);}
 public static void main(String[] args)throws Exception{
  Path fixtures=Path.of(args[0]);id=text(path(Files.readAllBytes(fixtures.resolve("first-page.pb")),9,58173949,1,58174010,4,49399797,1,175617300,1));android.content.Context.root=Path.of(args[1]).toFile();android.content.Context.root.mkdirs();
  byte[] header=path(Files.readAllBytes(fixtures.resolve("header-native.pb")),13,361650780,2,153515154),rewritten=PlaylistHeaderModel.rewrite(header);
  var before=actions(header);var after=actions(rewritten);check(after.size()==before.size()+1,"one native header action is added");
  int download=-1;for(int i=0;i<before.size();i++)if(new ProtoWire(before.get(i).data).one(3)!=null)download=i;
  check(download>=0&&Arrays.equals(before.get(download).encoded,after.get(download).encoded),"original Download action is byte-identical");
  var button=new ProtoWire(path(after.get(download+1).data,1));check(text(button.child(1)).equals("yt_outline_bdcrusher_download_playlist_vd_theme_24"),"distinct native playlist/download icon");
  check(text(button.child(7)).equals("Download playlist")&&button.one(8).value==2,"native secondary circle style and accessible label");
  byte[] command=path(button.child(6),169495254);var marked=new ProtoWire(command);String target=text(path(marked.child(PlaylistHeaderModel.MARKER),1));check(target.equals(id),"command uses displayed playlist identity");
  marked.remove(PlaylistHeaderModel.MARKER);check(Arrays.equals(marked.bytes(),path(before.get(download).data,3,9)),"DEFAULT retains exact native whole-playlist command");
  for(int i=0;i<before.size();i++)check(Arrays.equals(before.get(i).encoded,after.get(i<=download?i:i+1).encoded),"unrelated native action preserved "+i);
  check(Arrays.equals(rewritten,PlaylistHeaderModel.rewrite(rewritten)),"header rewriting is idempotent");
  byte[] invalid={1,2,3};check(PlaylistHeaderModel.rewrite(invalid)==invalid,"unknown/malformed native model is untouched");
  check(!PlaylistHeaderModel.validId("../x")&&!PlaylistHeaderModel.validId("sN_tJ8d3c0I"),"a song is never accepted as playlist fallback");
  byte[] first=Files.readAllBytes(fixtures.resolve("first-page.pb")),second=Files.readAllBytes(fixtures.resolve("playlist-page-2.pb"));
  PlaylistPage a=PlaylistPage.parse(first,id,false),b=PlaylistPage.parse(second,id,true);check(a.entries.size()==20&&b.entries.size()==100,"real first and second native pages parsed completely");
  check(!a.continuation.isEmpty()&&!b.continuation.isEmpty()&&!a.continuation.equals(b.continuation),"playlist pagination uses shelf tokens");
  check(a.entries.get(0).title().equals("Dracula")&&a.entries.stream().allMatch(e->e.videoId().length()==11),"native titles and exact recording identities preserved");
  try{PlaylistPage.parse(first,"PLinvalid_identity",false);throw new AssertionError("wrong identity accepted");}catch(IllegalArgumentException expected){checks++;}
  try{PlaylistPage.parse(Files.readAllBytes(fixtures.resolve("continuation-page.pb")),id,true);throw new AssertionError("recommendations accepted as complete playlist");}catch(IllegalArgumentException expected){checks++;}
  Settings.DOWNLOAD_MODE.value=DownloadMode.DEFAULT;check(!PlaylistRuntime.command(()->command),"default routing remains native");
  Settings.DOWNLOAD_MODE.value=DownloadMode.EXTERNAL;check(PlaylistRuntime.command(()->command)&&app.morphe.extension.shared.settings.preference.ExternalDownloaderPreference.calls==1&&app.morphe.extension.shared.settings.preference.ExternalDownloaderPreference.last.equals("https://music.youtube.com/playlist?list="+id),"external mode hands off one canonical playlist URL via existing review flow");
  check(!PlaylistRuntime.command(()->marked.bytes()),"ordinary native Download is not intercepted");
  final int[] pageCalls={0};PlaylistRuntime.capture(new PlaylistRuntime.PhoneClient(){
   public Future<?> bd_playlistBrowse(String browse,Executor executor){check(browse.equals("VL"+id),"host authenticated browse receives displayed playlist ID");pageCalls[0]++;return CompletableFuture.completedFuture((PlaylistRuntime.PhoneResponse)()->first);}
   public Future<?> bd_playlistContinue(String token,Executor executor){pageCalls[0]++;if(token.equals(a.continuation))return CompletableFuture.completedFuture((PlaylistRuntime.PhoneResponse)()->second);CompletableFuture<Object> fail=new CompletableFuture<>();fail.completeExceptionally(new java.io.IOException("simulated partial page failure"));return fail;}
  });
  PlaylistRuntime.start(id,"No idea");waitFor(()->batch()!=null&&batch().optString("status").contains("incomplete"));
  check(batch().getJSONArray("entries").length()==120&&!batch().getBoolean("enumerated"),"partial enumeration never reports completion");
  check(LocalDownloadManager.max<=2&&LocalDownloadManager.active.size()==2,"at most two tracks are delegated concurrently");
  PlaylistRuntime.control(id,"pause");waitFor(()->!batch().optBoolean("running"));
  var active=new ArrayList<>(LocalDownloadManager.active);LocalDownloadManager.finish(active.get(0),true);LocalDownloadManager.finish(active.get(1),false);waitFor(()->{var entries=batch().optJSONArray("entries");int finished=0;for(int i=0;i<entries.length();i++){String state=entries.optJSONObject(i).optString("state");if(state.equals("complete")||state.equals("failed"))finished++;}return finished==2;});
  check(batch().getJSONArray("entries").toString().contains("failed")&&LocalDownloadManager.active.isEmpty(),"typed completion records success/failure and pause starts no new tracks");
  PlaylistRuntime.control(id,"cancel");waitFor(()->batch().optString("status").startsWith("Cancelled"));check(PlaylistRuntime.audio(active.get(0))!=null,"cancelling remaining work preserves completed files");
  JSONObject saved=new JSONObject(Files.readString(Path.of(args[1],"files/bdcrusher-offline-playlists/"+id+".json")));check(saved.getJSONArray("entries").length()==120&&saved.getString("title").equals("No idea"),"playlist identity, title, order and outcomes persist atomically");
  JSONArray ordered=new JSONArray().put(new JSONObject().put("id",active.get(0))).put(new JSONObject().put("id","xxxxxxxxxxx")).put(new JSONObject().put("id",active.get(0)));
  PlaylistRuntime.play(app.morphe.extension.shared.Utils.activity,new JSONObject().put("entries",ordered));var queue=(ArrayList<?>)OfflinePlaybackService.last.extras.get("queue");check(queue.size()==2&&queue.get(0).equals(queue.get(1)),"offline playback keeps repeated positions and skips unavailable files");
  check(pageCalls[0]==3,"only the needed pages were requested before failure");

  PlaylistRuntime.capture(new PlaylistRuntime.PhoneClient(){public Future<?> bd_playlistBrowse(String s,Executor e){throw new AssertionError("resume must not restart pagination");}public Future<?> bd_playlistContinue(String s,Executor e){return CompletableFuture.completedFuture((PlaylistRuntime.PhoneResponse)()->second);}});
  PlaylistRuntime.control(id,"resume");waitFor(()->batch().optString("status").contains("Repeated continuation"));check(batch().getJSONArray("entries").length()==120&&!batch().optBoolean("enumerated"),"repeated continuation is rejected without appending duplicate pages");
  PlaylistRuntime.control(id,"pause");waitFor(()->batch().optString("status").startsWith("Paused"));for(String running:new ArrayList<>(LocalDownloadManager.active))LocalDownloadManager.finish(running,true);
  byte[] firstRow=path(first,9,58173949,1,58174010,4,49399797,1,175617300);byte[] originalRow=new ProtoWire(firstRow).fields.stream().filter(f->f.number==3).findFirst().orElseThrow().data;
  byte[] terminal=ProtoWire.message(ProtoWire.blob(10,ProtoWire.message(ProtoWire.blob(175617300,ProtoWire.message(ProtoWire.blob(3,originalRow),ProtoWire.blob(3,originalRow))))));
  PlaylistRuntime.capture(new PlaylistRuntime.PhoneClient(){public Future<?> bd_playlistBrowse(String s,Executor e){throw new AssertionError("resume must preserve continuation");}public Future<?> bd_playlistContinue(String s,Executor e){return CompletableFuture.completedFuture((PlaylistRuntime.PhoneResponse)()->terminal);}});
  PlaylistRuntime.control(id,"retry");waitFor(()->batch().optBoolean("enumerated"));
  long deadline=System.nanoTime()+TimeUnit.SECONDS.toNanos(10);while(batch().optBoolean("running")&&System.nanoTime()<deadline){for(String running:new ArrayList<>(LocalDownloadManager.active))LocalDownloadManager.finish(running,true);Thread.sleep(5);}
  check(batch().optString("status").startsWith("Finished with 1 unavailable")&&batch().getJSONArray("entries").length()==122,"resume/retry completes every page and keeps repeated final positions");
  check(LocalDownloadManager.max<=2,"large resumed batch never exceeds two delegated track downloads");
  JSONObject completeRecord=new JSONObject(Files.readString(Path.of(args[1],"files/bdcrusher-offline-playlists/"+id+".json")));completeRecord.put("running",true);Files.writeString(Path.of(args[1],"files/bdcrusher-offline-playlists/"+id+".json"),completeRecord.toString());
  var stateField=PlaylistRuntime.class.getDeclaredField("STATE");stateField.setAccessible(true);ExecutorService state=(ExecutorService)stateField.get(null);
  state.submit(()->{try{var loaded=PlaylistRuntime.class.getDeclaredField("loaded");loaded.setAccessible(true);loaded.setBoolean(null,false);var batches=PlaylistRuntime.class.getDeclaredField("batches");batches.setAccessible(true);((Map<?,?>)batches.get(null)).clear();}catch(Exception ex){throw new RuntimeException(ex);}}).get();PlaylistRuntime.init();state.submit(()->{}).get();
  check(batch().optString("status").startsWith("Interrupted")&&!batch().optBoolean("running")&&android.app.AlertDialog.shown==1,"restart retains ordered collection and offers explicit interrupted-batch resume");
  Files.writeString(Path.of(args[2]),new JSONObject().put("checks",checks).put("passed",true).put("nativeFixtures",true).put("androidAndMediaTransportSimulated",true).put("realDownloadsLaunched",false).toString(2));System.exit(0);
 }
}'''
}
files=[]
for name,content in stubs.items():
 p=work/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(p)
src=h/'Personal-Patches/extensions/music/src/main/java';actual=[src/'app/bdcrusher/ytmusic/lyrics/ProtoWire.java']+[src/'app/bdcrusher/ytmusic/playlists'/n for n in ['PlaylistHeaderModel.java','PlaylistPage.java','PlaylistRuntime.java']];files+=actual
jar=next((h/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=work/'classes';out.mkdir();cp=os.pathsep.join(map(str,[out,jar]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(out),*map(str,files)],cwd=work,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',cp,'app.bdcrusher.ytmusic.playlists.PlaylistCheck',str(h/'Inputs/playlist-regression-20261025'),str(work/'data'),str(work/'verification.json')],cwd=work,env=env,check=True,timeout=25)
report=json.loads((work/'verification.json').read_text());report['sourceSha256']={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};(work/'verification.json').write_text(json.dumps(report,indent=2)+'\n',encoding='utf-8')
