"""Current playlist implementation + retained private native pages; Android/client/media simulated."""
from pathlib import Path
import os,subprocess,json,hashlib,sys
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision40'/('playlists'+(sys.argv[1] if len(sys.argv)>1 else ''));w.mkdir(exist_ok=False)
old=h/'Verification/revision38/playlists-r3/stubs';s={p.relative_to(old).as_posix():p.read_text(encoding='utf-8') for p in old.rglob('*.java')}
pkg='app/bdcrusher/ytmusic/playlists/'
s['android/net/Uri.java']=s['android/net/Uri.java'].replace('public class Uri{','public class Uri{public static Uri parse(String s){return new Uri();}')
s['android/app/Activity.java']=s['android/app/Activity.java'].replace('public boolean isFinishing()', 'public String getPackageName(){return "fixture.music";}public static android.content.Intent opened;public void startActivity(android.content.Intent i){opened=i;}public boolean isFinishing()')
s['android/content/ActivityNotFoundException.java']='package android.content;public class ActivityNotFoundException extends RuntimeException{}'
s['android/content/Intent.java']=s['android/content/Intent.java'].replace('public class Intent{','public class Intent{public static final String ACTION_VIEW="view";public Intent(String a,android.net.Uri u){}public Intent setPackage(String p){return this;}')
s[pkg+'DownloadPrompt.java']='''package app.bdcrusher.ytmusic.playlists;public class DownloadPrompt {static AudioQuality.Tier selected(android.content.Context c){return AudioQuality.Tier.HIGH;}static void playlist(android.app.Activity a,String i,String t,Runnable r){r.run();}}'''
s[pkg+'LocalPlayback.java']='''package app.bdcrusher.ytmusic.playlists;public class LocalPlayback {static byte[] response(String id){return PlaylistRuntime.audio(id)==null?null:new byte[]{1};}}'''
s[pkg+'NativeMediaCache.java']='''package app.bdcrusher.ytmusic.playlists;public class NativeMediaCache {static void prepare(String p,String i,int n){}static boolean ready(String p,String i,int n){return PlaylistRuntime.audio(i)!=null;}}'''
s['app/bdcrusher/ytmusic/common/FeatureDiagnostics.java']='package app.bdcrusher.ytmusic.common;public class FeatureDiagnostics {public static void record(String a,String b){}}'
manager='app/morphe/extension/music/patches/downloads/LocalDownloadManager.java'
s[manager]=s[manager].replace('public static void enqueue(','''public record AudioOptions(java.util.List<app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format> formats,int seconds){}public static AudioOptions options(String i){return new AudioOptions(java.util.List.of(),0);}public static void enqueueBatch(String id,app.bdcrusher.ytmusic.playlists.AudioQuality.Tier tier){enqueue(id);}public static void enqueue(''')
test=s[pkg+'PlaylistCheck.java']
start=test.index('  JSONArray ordered=');end=test.index('  check(pageCalls[0]==3',start)
test=test[:start]+'''  PlaylistRuntime.play(app.morphe.extension.shared.Utils.activity,new JSONObject().put("id",id));waitFor(()->android.app.Activity.opened!=null);check(OfflinePlaybackService.last==null,"progress action opens original playlist without a second playback service");
'''+test[end:]
test=test.replace('  var task=new PlaylistFuture(','''  check(a.entries.get(0).seconds()==206,"native duration parsed for audio size preview");
  byte[] playPage=ProtoWire.message(ProtoWire.blob(9,new ProtoWire(first).child(9)),ProtoWire.blob(11,ProtoWire.message(ProtoWire.blob(48687626,ProtoWire.message(ProtoWire.blob(2,id.getBytes(StandardCharsets.US_ASCII)))))));
  byte[] offlinePage=PlaylistPageModel.rewrite(playPage,id);ProtoWire playCommand=new ProtoWire(path(offlinePage,11));check(playCommand.one(48687626)==null&&playCommand.one(48687757)!=null,"offline whole-play command reuses a saved native row endpoint");check(text(path(playCommand.child(48687757),2)).equals(id),"offline whole-play preserves the original playlist identity");check(!PlaylistRuntime.command(()->nativeRow.child(5)),"normal row command remains in the native player");
  byte[] alternative=ProtoWire.message(ProtoWire.blob(99,ProtoWire.message(ProtoWire.blob(373186255,path(header,172660663,1,168777401,5,373186255)))));check(!Arrays.equals(alternative,PlaylistHeaderModel.rewrite(alternative)),"native header VM works beneath a different wrapper");
  var task=new PlaylistFuture(''')
s[pkg+'PlaylistCheck.java']=test
files=[]
for name,body in s.items():
 p=w/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body,encoding='utf-8');files.append(p)
root=h/'Personal-Patches/extensions/music/src/main/java';actual=[root/'app/bdcrusher/ytmusic/lyrics/ProtoWire.java']+[root/pkg/n for n in ['AudioQuality.java','PlaylistHeaderModel.java','PlaylistPage.java','PlaylistRuntime.java','PlaylistPageModel.java','PlaylistFuture.java']]+[h/'Personal-Patches/extensions/youtube/stub/src/main/java/com/google/common/util/concurrent/ListenableFuture.java'];files+=actual
jar=next((h/'BuildCache/Gradle Cache/caches/modules-2/files-2.1/org.json/json/20231013').glob('*/*.jar'));proto=h/'Personal-Patches/extensions/shared-youtube/library/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes';pj=next((h/'BuildCache/Gradle Cache/caches/modules-2/files-2.1/com.google.protobuf/protobuf-javalite').glob('*/*/*.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=w/'classes';out.mkdir();cp=os.pathsep.join(map(str,[out,jar,proto,pj]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(out),*map(str,files)],cwd=w,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',cp,'app.bdcrusher.ytmusic.playlists.PlaylistCheck',str(h/'Inputs/playlist-regression-20261025'),str(w/'data'),str(w/'verification.json')],cwd=w,env=env,check=True,timeout=30)
report=json.loads((w/'verification.json').read_text());report['sourceSha256']={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};(w/'verification.json').write_text(json.dumps(report,indent=2)+'\n')
