"""Production native cache/local response; only APK-generated adapter factories simulated."""
from pathlib import Path
import subprocess,os,json,hashlib,sys
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision40'/('native-cache'+(sys.argv[1] if len(sys.argv)>1 else ''));w.mkdir(exist_ok=False)
root=h/'Personal-Patches/extensions/music/src/main/java';pkg='app/bdcrusher/ytmusic/playlists/'
s={
pkg+'ExternalFiles.java':'''package app.bdcrusher.ytmusic.playlists;public class ExternalFiles {public record Item(byte[] nativeResponse){}public static Item get(String id){return null;}public static boolean granted(android.content.Context c){return false;}}''',
'android/content/Context.java':'''package android.content;public class Context {public java.io.File files,external;public java.io.File getFilesDir(){return files;}public java.io.File getExternalFilesDir(String s){return external;}}''',
'android/os/Environment.java':'''package android.os;public class Environment {public static final String DIRECTORY_MUSIC="Music";}''',
'android/os/SystemClock.java':'''package android.os;public class SystemClock {public static long elapsedRealtime(){return System.nanoTime()/1000000;}}''',
'android/util/Pair.java':'''package android.util;public record Pair<A,B>(A first,B second){public static <A,B> Pair<A,B> create(A a,B b){return new Pair<>(a,b);}}''',
'android/util/AtomicFile.java':'''package android.util;import java.io.*;public class AtomicFile {File base,tmp;public AtomicFile(File f){base=f;tmp=new File(f+".new");}public FileInputStream openRead()throws IOException{return new FileInputStream(base);}public FileOutputStream startWrite()throws IOException{File p=base.getParentFile();if(!p.isDirectory()&&!p.mkdirs())throw new IOException("directory");return new FileOutputStream(tmp);}public void finishWrite(FileOutputStream s)throws IOException{s.close();java.nio.file.Files.move(tmp.toPath(),base.toPath(),java.nio.file.StandardCopyOption.REPLACE_EXISTING,java.nio.file.StandardCopyOption.ATOMIC_MOVE);}public void failWrite(FileOutputStream s){try{s.close();}catch(Exception e){}tmp.delete();}}''',
'app/morphe/extension/shared/Utils.java':'''package app.morphe.extension.shared;public class Utils {public static android.content.Context context=new android.content.Context();public static android.content.Context getContext(){return context;}}''',
'app/bdcrusher/ytmusic/common/FeatureDiagnostics.java':'''package app.bdcrusher.ytmusic.common;public class FeatureDiagnostics {public static void record(String a,String b){}}''',
'app/bdcrusher/ytmusic/common/PersonalRuntime.java':'''package app.bdcrusher.ytmusic.common;public class PersonalRuntime {public static boolean enabled=true;public static boolean installed(android.content.Context c,String f){return enabled;}}''',
pkg+'PlaylistBrowse.java':'''package app.bdcrusher.ytmusic.playlists;public class PlaylistBrowse {public static boolean offline;static boolean offline(){return offline;}}''',
pkg+'PlaylistHeaderModel.java':'''package app.bdcrusher.ytmusic.playlists;public class PlaylistHeaderModel {static boolean validId(String id){return id.matches("[A-Za-z0-9_-]{2,150}");}}''',
pkg+'PlaylistRuntime.java':'''package app.bdcrusher.ytmusic.playlists;public class PlaylistRuntime {public static java.util.Map<String,java.io.File> audio=new java.util.concurrent.ConcurrentHashMap<>();static java.io.File audio(String id){return audio.get(id);}static void warmNativeMetadata(){}}''',
}
future=h/'Personal-Patches/extensions/youtube/stub/src/main/java/com/google/common/util/concurrent/ListenableFuture.java'
s['com/google/common/util/concurrent/ListenableFuture.java']=future.read_text()
actual=[root/(pkg+n+'.java') for n in ['LocalPlayback','PlaylistFuture','NativeMediaCache']]+[root/'app/bdcrusher/ytmusic/lyrics/ProtoWire.java']
native=actual[2].read_text();replacements={
'throw new IllegalStateException("Native song response decoder was not installed");':'return new CacheCheck.N(bytes);',
'throw new IllegalStateException("Native player response decoder was not installed");':'try{return app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse.parseFrom(bytes);}catch(Exception e){throw new IllegalArgumentException(e);}',
'throw new IllegalStateException("Native watch request constructor was not installed");':'return new CacheCheck.R(core);',
}
for old,new in replacements.items():assert native.count(old)==1;native=native.replace(old,new)
s[pkg+'NativeMediaCache.java']=native
s[pkg+'CacheCheck.java']=r'''package app.bdcrusher.ytmusic.playlists;
import java.io.*;import java.nio.file.*;import java.nio.charset.*;import java.util.*;import java.util.concurrent.*;import app.bdcrusher.ytmusic.lyrics.ProtoWire;import app.morphe.extension.shared.Utils;import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.*;
public class CacheCheck {
 static int checks;static final String ID="abcdefghijk",OTHER="01234567890",PL="PLfixture";
 static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}
 static class R implements NativeMediaCache.Request {byte[] bytes;R(byte[] b){bytes=b;}public String bd_recording(){try{return new String(new ProtoWire(bytes).child(1),StandardCharsets.US_ASCII);}catch(Exception e){return "";}}public byte[] bd_core(){return bytes;}public NativeMediaCache.Request bd_copy(byte[] c){return new R(c);}}
 record N(byte[] bd_nextBytes) implements NativeMediaCache.Next{}
 static R request(String id,String pl,int n){return new R(ProtoWire.message(ProtoWire.blob(1,id.getBytes(StandardCharsets.US_ASCII)),ProtoWire.blob(3,pl.getBytes(StandardCharsets.US_ASCII)),ProtoWire.number(4,n)));}
 static PlaylistFuture done(Object v){PlaylistFuture f=new PlaylistFuture(()->v,null);f.run();return f;}
 static void await(java.util.function.BooleanSupplier condition)throws Exception{long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(3);while(!condition.getAsBoolean()){if(System.nanoTime()>end)throw new AssertionError("async timeout");Thread.sleep(5);}check(true);}
 static Format format(long size){return Format.newBuilder().setMimeType("audio/webm; codecs=\"opus\"").setItag(251).setUrl("https://fixture.invalid/expired?secret=fixture").setSignatureCipher("fixture-secret").setContentLength(size).setBitrate(128000).build();}
 static VideoDetails details(String id){return VideoDetails.newBuilder().setVideoId(id).setTitle("fixture").setLengthSeconds(120).build();}
 static void audio(String id,Path dir)throws Exception{Path file=dir.resolve(id+".webm");Files.write(file,new byte[128]);PlaylistRuntime.audio.put(id,file.toFile());LocalPlayback.saved(id,format(128),details(id));}
 public static void main(String[] args)throws Exception{try{
  Path dir=Path.of(args[0]);Utils.context.files=dir.resolve("private").toFile();Utils.context.files.mkdirs();Utils.context.external=dir.resolve("external").toFile();Utils.context.external.mkdirs();PlaylistBrowse.offline=false;
  audio(ID,Utils.context.external.toPath());byte[] response=LocalPlayback.response(ID);check(response!=null);PlayerResponse saved=PlayerResponse.parseFrom(response);check(saved.getStreamingData().getAdaptiveFormats(0).getUrl().equals(LocalPlayback.ORIGIN+ID));check(saved.getStreamingData().getAdaptiveFormats(0).getSignatureCipher().isEmpty());check(saved.getVideoDetails().getTitle().equals("fixture"));check(LocalPlayback.duration(ID)==120);
  check(LocalPlayback.response("../invalid")==null);check(LocalPlayback.response(OTHER)==null);
  var original=PlayerResponse.newBuilder().setVideoDetails(details(ID)).setPlayabilityStatus(PlayabilityStatus.newBuilder().setStatus(Status.OK)).build();var replaced=PlayerResponse.parseFrom(LocalPlayback.replace(original.toByteArray()));check(replaced.getVideoDetails().equals(original.getVideoDetails()));check(replaced.getPlayabilityStatus().equals(original.getPlayabilityStatus()));check(replaced.getStreamingData().getAdaptiveFormatsCount()==1);
  check(LocalPlayback.replace(original.toBuilder().setPlayabilityStatus(PlayabilityStatus.newBuilder().setStatus(Status.LOGIN_REQUIRED)).build().toByteArray())==null);
  app.bdcrusher.ytmusic.common.PersonalRuntime.enabled=false;check(LocalPlayback.response(ID)==null);app.bdcrusher.ytmusic.common.PersonalRuntime.enabled=true;
  File audio=PlaylistRuntime.audio.get(ID);Files.write(audio.toPath(),new byte[129]);check(LocalPlayback.response(ID)==null);Files.write(audio.toPath(),new byte[128]);check(LocalPlayback.response(ID)!=null);
  R req=request(ID,PL,2);check(NativeMediaCache.cached(req)==null);check(NativeMediaCache.player(req)==null);byte[] next={8,1};var watched=NativeMediaCache.observe(done(new N(next)),req);check(watched.get(3,TimeUnit.SECONDS) instanceof N);check(NativeMediaCache.ready(PL,ID,2));
  PlaylistBrowse.offline=true;check(NativeMediaCache.cached(req).get(3,TimeUnit.SECONDS) instanceof N);check(NativeMediaCache.player(req).get(3,TimeUnit.SECONDS) instanceof PlayerResponse);check(NativeMediaCache.pair(req)!=null);check(NativeMediaCache.pair(request(ID,PL,3))==null);check(NativeMediaCache.pair(request(ID,"PLother",2))==null);check(NativeMediaCache.pair(request(OTHER,PL,2))==null);
  PlaylistBrowse.offline=false;check(NativeMediaCache.cached(req)==null);var auth=new PlaylistFuture(()->{throw new SecurityException("denied fixture");},null);auth.run();var observed=NativeMediaCache.observe(auth,req);try{observed.get(3,TimeUnit.SECONDS);throw new AssertionError();}catch(ExecutionException expected){check(expected.getCause() instanceof SecurityException);}check(NativeMediaCache.ready(PL,ID,2));
  var source=new PlaylistFuture(()->new N(next),null);var cancellation=NativeMediaCache.observe(source,req);check(cancellation.cancel(true));check(source.isCancelled());
  var upstreamCancelled=new PlaylistFuture(()->new N(next),null);var downstream=NativeMediaCache.observe(upstreamCancelled,req);upstreamCancelled.cancel(false);check(downstream.isCancelled());
  // Corrupt and oversized data cannot overwrite a previously useful response.
  var bad=NativeMediaCache.observe(done(new N(new byte[4*1024*1024+1])),req);bad.get(3,TimeUnit.SECONDS);PlaylistBrowse.offline=true;check(Arrays.equals(((N)NativeMediaCache.cached(req).get()).bd_nextBytes,next));PlaylistBrowse.offline=false;
  // A request may be mutated after interception; the cache keeps its original key.
  R mutable=request(ID,PL,7);var later=new PlaylistFuture(()->new N(new byte[]{8,7}),null);var result=NativeMediaCache.observe(later,mutable);mutable.bytes=request(ID,PL,8).bytes;later.run();result.get(3,TimeUnit.SECONDS);check(NativeMediaCache.ready(PL,ID,7));check(!NativeMediaCache.ready(PL,ID,8));
  // Storage failure must retain the original successful online response.
  File old=Utils.context.files;Utils.context.files=dir.resolve("blocked").toFile();Files.write(Utils.context.files.toPath(),new byte[]{1});Object value=new N(next);check(NativeMediaCache.observe(done(value),request(ID,PL,10)).get(3,TimeUnit.SECONDS)==value);Utils.context.files=old;
  // Native metadata warms even before a user has started playback, through one typed client.
  var calls=new java.util.concurrent.atomic.AtomicInteger();NativeMediaCache.initialized(r->{calls.incrementAndGet();return done(new N(new byte[]{8,9}));});NativeMediaCache.prepare(PL,ID,12);await(()->NativeMediaCache.ready(PL,ID,12));int count=calls.get();NativeMediaCache.prepare(PL,ID,12);Thread.sleep(30);check(calls.get()==count);
  // Local metadata survives an ordinary reopen (read from disk, no in-memory payload cache).
  PlaylistBrowse.offline=true;check(NativeMediaCache.cached(request(ID,PL,12)).get(3,TimeUnit.SECONDS) instanceof N);
  NativeMediaCache.remove(ID);await(()->!NativeMediaCache.ready(PL,ID,12));check(audio.isFile());check(LocalPlayback.response(ID)!=null);
  System.out.println("PASS "+checks+" actual native-cache/local-response checks");
 }finally{for(String n:List.of("IO","WARM")){var f=NativeMediaCache.class.getDeclaredField(n);f.setAccessible(true);((ExecutorService)f.get(null)).shutdownNow();}}}
}'''
paths=[]
for name,body in s.items():
 p=w/'src'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body,encoding='utf-8');paths.append(p)
classes=w/'classes';classes.mkdir();java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin')
proto=h/'Personal-Patches/extensions/shared-youtube/library/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes';jar=next((h/'BuildCache/Gradle Cache/caches/modules-2/files-2.1/com.google.protobuf/protobuf-javalite').glob('*/*/*.jar'));cp=os.pathsep.join(map(str,[classes,proto,jar]))
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(classes),*map(str,[p for p in actual if p.name!='NativeMediaCache.java']+paths)],cwd=w,env=env,check=True)
run=subprocess.run([str(java/'java.exe'),'-cp',cp,'app.bdcrusher.ytmusic.playlists.CacheCheck',str(w)],cwd=w,env=env,check=True,text=True,capture_output=True,timeout=30)
(w/'result.json').write_text(json.dumps({'stdout':run.stdout,'sources':{str(p.relative_to(h)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual},'adapterSeams':replacements,'scope':'actual production cache/future/local-response with production generated protobuf; only 3 APK-generated native adapter factories and Android/authenticated client boundaries simulated; no phone/download execution'},indent=2),encoding='utf-8');print(run.stdout)
