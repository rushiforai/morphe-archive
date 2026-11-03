"""Production downloader range/resume fixtures. Network, Android UI and codec boundaries simulated."""
from pathlib import Path
import subprocess,os,json,hashlib,sys
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision44'/('transfer'+(sys.argv[1] if len(sys.argv)>1 else ''));w.mkdir(exist_ok=False)
pkg='app/bdcrusher/ytmusic/playlists/';native='app/morphe/extension/music/patches/downloads/'
s={
'android/content/Context.java':'package android.content;public class Context{public static final String NOTIFICATION_SERVICE="notification";public Object getSystemService(String n){return null;}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long elapsedRealtime(){return System.nanoTime()/1000000;}}',
'androidx/annotation/Nullable.java':'package androidx.annotation;public @interface Nullable{}',
'app/morphe/extension/shared/StringRef.java':'package app.morphe.extension.shared;public class StringRef{public static String str(String s,Object...a){return s;}}',
'app/morphe/extension/shared/Utils.java':'package app.morphe.extension.shared;public class Utils{public static android.content.Context getContext(){return new android.content.Context();}public static void showToastShort(String s){}public static void verifyOffMainThread(){}public static void runOnMainThread(Runnable r){r.run();}public static void runOnBackgroundThread(Runnable r){r.run();}public static <T> java.util.concurrent.Future<T> submitOnBackgroundThread(java.util.concurrent.Callable<T> c){throw new AssertionError("enqueue not part of range fixture");}}',
'app/morphe/extension/shared/Logger.java':'package app.morphe.extension.shared;public class Logger{public static void printDebug(java.util.function.Supplier<String>s){}public static void printDebug(java.util.function.Supplier<String>s,Throwable t){}public static void printException(java.util.function.Supplier<String>s,Throwable t){}}',
'app/morphe/extension/music/shared/VideoInformation.java':'package app.morphe.extension.music.shared;public class VideoInformation{public static String getVideoId(){return "";}}',
'app/morphe/extension/music/settings/Settings.java':'package app.morphe.extension.music.settings;public class Settings{public record Field(Object get){}public static Field SPOOF_VIDEO_STREAMS_CLIENT_TYPE=new Field(null);}',
'app/morphe/extension/music/patches/scrobbling/ScrobbleManager.java':'package app.morphe.extension.music.patches.scrobbling;public class ScrobbleManager{public static ScrobbleManager getInstance(){return new ScrobbleManager();}public String getCurrentTitle(){return "";}public String getCurrentArtist(){return "";}public String getCurrentAlbum(){return "";}public int getCurrentDurationSeconds(){return 0;}public android.graphics.Bitmap getCurrentArtwork(){return null;}}',
'app/morphe/extension/music/patches/spoof/SpoofVideoStreamsPatch.java':'package app.morphe.extension.music.patches.spoof;public class SpoofVideoStreamsPatch{public static Object getAvailableClients(){return null;}}',
'app/morphe/extension/shared/spoof/requests/StreamingDataRequest.java':'package app.morphe.extension.shared.spoof.requests;public class StreamingDataRequest{public record StreamData(byte[] streamingData){}public StreamData getStream(){throw new AssertionError("No authenticated requests in range fixture");}public static StreamingDataRequest fetchRequestForDownload(String id,Object a,Object b){return new StreamingDataRequest();}public static StreamingDataRequest fetchRequestForOpusDownload(String id,Object a,Object b){return new StreamingDataRequest();}}',
'app/bdcrusher/ytmusic/common/FeatureDiagnostics.java':'package app.bdcrusher.ytmusic.common;public class FeatureDiagnostics{public static void record(String a,String b){}}',
pkg+'DownloadCatalog.java':'package app.bdcrusher.ytmusic.playlists;public class DownloadCatalog{public record Progress(String state){public int percent(){return 0;}}public static java.io.File directory(){return null;}public static java.io.File video(String id){return null;}public static Progress progress(String id){return null;}public static boolean videoSupported(app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format f){return true;}public static void update(String a,String b,long c,long d,String e,MediaSelection f){}public static void complete(String a,MediaSelection b,String c){}}',
pkg+'PlaylistRuntime.java':'package app.bdcrusher.ytmusic.playlists;public class PlaylistRuntime{public static java.io.File audio(String id){return null;}public static void finished(String id){}}',
pkg+'DownloadPrompt.java':'package app.bdcrusher.ytmusic.playlists;public class DownloadPrompt{public static void song(String id){}}',
pkg+'LocalPlayback.java':'package app.bdcrusher.ytmusic.playlists;public class LocalPlayback{public static byte[] response(String id){return null;}public static void saved(String id,app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format f,app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails d){}public static void savedVideo(String id,app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format f,app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails d,java.io.File file){}}',
pkg+'PlaylistArtwork.java':'package app.bdcrusher.ytmusic.playlists;public class PlaylistArtwork{public static void downloaded(String id,java.io.File f,Object d){}}',
pkg+'DownloadChapters.java':'package app.bdcrusher.ytmusic.playlists;public class DownloadChapters{public static void fetch(String id,int n){}}',
'app/bdcrusher/ytmusic/lyrics/LyricsPrefetch.java':'package app.bdcrusher.ytmusic.lyrics;public class LyricsPrefetch{public static void enqueue(Object c,String id,String t,String a,int d,java.util.function.Consumer<Boolean> r){}}',
native+'OfflineTrack.java':'package app.morphe.extension.music.patches.downloads;public class OfflineTrack{public static void save(java.io.File f,String id,String t,String a,String b,int d,android.graphics.Bitmap art){}}',
'android/util/AtomicFile.java':r'''package android.util;import java.io.*;public class AtomicFile{
 public static boolean fail;File base,tmp;public AtomicFile(File f){base=f;tmp=new File(f+".new");}
 public FileInputStream openRead()throws IOException{return new FileInputStream(base);}public FileOutputStream startWrite()throws IOException{if(fail)throw new IOException("fixture storage exhaustion");return new FileOutputStream(tmp);}
 public void finishWrite(FileOutputStream out)throws IOException{out.getFD().sync();out.close();java.nio.file.Files.move(tmp.toPath(),base.toPath(),java.nio.file.StandardCopyOption.REPLACE_EXISTING,java.nio.file.StandardCopyOption.ATOMIC_MOVE);}public void failWrite(FileOutputStream out){try{out.close();}catch(IOException ignored){}}
 public void delete(){base.delete();tmp.delete();}
}''',
'app/morphe/extension/shared/requests/Requester.java':r'''package app.morphe.extension.shared.requests;
import java.net.*;import java.io.*;import java.util.concurrent.atomic.*;
public class Requester{
 public static byte[] data;public static int limit=-1;public static boolean bad;public static AtomicLong bytes=new AtomicLong();
 public static HttpURLConnection openConnection(String url)throws IOException{
  if(!url.equals("https://fixture.invalid/stream"))throw new AssertionError("Unexpected request "+url);
  return new HttpURLConnection(new URL(url)){
   int start,end;public void connect(){}public boolean usingProxy(){return false;}public void disconnect(){}
   public int getResponseCode(){String[] r=getRequestProperty("Range").substring(6).split("-");start=Integer.parseInt(r[0]);end=Integer.parseInt(r[1]);return 206;}
   public String getHeaderField(String n){return n.equals("Content-Range")?(bad?"bytes 0-9/10":"bytes "+start+"-"+end+"/"+data.length):null;}
   public InputStream getInputStream(){int ceiling=limit<0?end+1:Math.min(end+1,(start/(data.length/4))*(data.length/4)+limit);int count=Math.max(0,ceiling-start);return new ByteArrayInputStream(data,start,count){public synchronized int read(byte[] b,int o,int len){int n=super.read(b,o,len);if(n>0)bytes.addAndGet(n);return n;}};}
  };
 }
}''',
'RangeCheck.java':r'''import java.io.*;import java.nio.file.*;import java.lang.reflect.*;import java.util.*;import app.bdcrusher.ytmusic.playlists.RangeResume;import app.morphe.extension.shared.requests.Requester;
public class RangeCheck{
 static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}static Method transfer;
 static boolean run(File file,String format)throws Exception{try{transfer.invoke(null,"abcdefghijk","Fixture","https://fixture.invalid/stream",file,(long)Requester.data.length,format);return true;}catch(InvocationTargetException e){return false;}}
 public static void main(String[] args)throws Exception{
  Class<?> manager=Class.forName("app.morphe.extension.music.patches.downloads.LocalDownloadManager");transfer=manager.getDeclaredMethod("downloadInParallel",String.class,String.class,String.class,File.class,long.class,String.class);transfer.setAccessible(true);
  byte[] data=new byte[8*1024*1024];for(int n=0;n<data.length;n++)data[n]=(byte)(n*31);Requester.data=data;File part=Path.of(args[0],"fixture.webm.part").toFile();
  Requester.limit=1400000;check(!run(part,"251:opus"));long durable;try(var in=new FileInputStream(part+".resume")){durable=RangeResume.read(in,data.length,4,"251:opus").completed();}check(durable>=1024*1024&&durable<data.length);
  Requester.limit=-1;Requester.bytes.set(0);check(run(part,"251:opus"));check(Requester.bytes.get()==data.length-durable);check(Arrays.equals(data,Files.readAllBytes(part.toPath())));
  Requester.bytes.set(0);check(run(part,"251:opus"));check(Requester.bytes.get()==0);
  Requester.bytes.set(0);check(run(part,"248:video"));check(Requester.bytes.get()==data.length);check(Arrays.equals(data,Files.readAllBytes(part.toPath())));
  Requester.bad=true;check(!run(part,"different"));Requester.bad=false;
  android.util.AtomicFile.fail=true;check(!run(part,"disk-full"));android.util.AtomicFile.fail=false;
  check(Files.size(part.toPath())==data.length);check(!new String(Files.readAllBytes(Path.of(part+".resume")),java.nio.charset.StandardCharsets.ISO_8859_1).contains("fixture.invalid"));
  System.out.println("PASS "+checks+" actual transfer/journal checks");
 }
}'''
}
# A second scenario executes the full production item scheduler, using deterministic media responses.
s['app/morphe/extension/shared/Utils.java']=s['app/morphe/extension/shared/Utils.java'].replace('public class Utils{','public class Utils{public static java.util.concurrent.ExecutorService workers=java.util.concurrent.Executors.newFixedThreadPool(6);').replace('throw new AssertionError("enqueue not part of range fixture");','return workers.submit(c);')
s['android/graphics/BitmapFactory.java']='package android.graphics;public class BitmapFactory{public static Bitmap decodeStream(java.io.InputStream in){return null;}}'
s['android/media/MediaExtractor.java']='package android.media;public class MediaExtractor{boolean video;public void setDataSource(String path){video=path.contains(".video.");}public int getTrackCount(){return 1;}public MediaFormat getTrackFormat(int n){return new MediaFormat(video?"video/vp9":"audio/opus");}public void selectTrack(int n){}public int readSampleData(java.nio.ByteBuffer b,int off){return 1;}public void release(){}}'
s['android/media/MediaFormat.java']='package android.media;public class MediaFormat{public static final String KEY_MIME="mime";String mime;public MediaFormat(String m){mime=m;}public String getString(String key){return mime;}}'
s['app/morphe/extension/shared/spoof/requests/StreamingDataRequest.java']=r'''package app.morphe.extension.shared.spoof.requests;
public class StreamingDataRequest{
 public static java.util.Map<String,byte[]> responses=new java.util.concurrent.ConcurrentHashMap<>();public static String blocked="";public static java.util.concurrent.CountDownLatch arrived=new java.util.concurrent.CountDownLatch(1),release=new java.util.concurrent.CountDownLatch(1);public static java.util.concurrent.atomic.AtomicBoolean once=new java.util.concurrent.atomic.AtomicBoolean();
 String id;StreamingDataRequest(String id){this.id=id;}public record StreamData(byte[] streamingData){}
 public StreamData getStream(){if(id.equals(blocked)&&once.compareAndSet(false,true)){arrived.countDown();try{if(!release.await(3,java.util.concurrent.TimeUnit.SECONDS))throw new AssertionError("blocked fixture timeout");}catch(InterruptedException e){throw new RuntimeException(e);}}return new StreamData(responses.get(id));}
 public static StreamingDataRequest fetchRequestForDownload(String id,Object a,Object b){return new StreamingDataRequest(id);}public static StreamingDataRequest fetchRequestForOpusDownload(String id,Object a,Object b){return new StreamingDataRequest(id);}
}'''
s[pkg+'DownloadCatalog.java']=r'''package app.bdcrusher.ytmusic.playlists;
public class DownloadCatalog{
 public static java.io.File root;public static java.util.Map<String,Progress> states=new java.util.concurrent.ConcurrentHashMap<>();public static int max;
 public record Progress(String state,MediaSelection selection,String detail){public int percent(){return 0;}}
 public static java.io.File directory(){return root;}public static java.io.File video(String id){java.io.File f=new java.io.File(root,id+".video.webm");return f.isFile()?f:null;}public static Progress progress(String id){return states.get(id);}public static boolean videoSupported(app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format f){return true;}
 public static synchronized void update(String a,String b,long c,long d,String e,MediaSelection f){states.put(a,new Progress(b,f,e));max=Math.max(max,(int)states.values().stream().filter(p->p.state.equals("downloading")).count());}public static void complete(String a,MediaSelection b,String c){update(a,"complete",1,1,c,b);}
}'''
s[pkg+'PlaylistRuntime.java']='package app.bdcrusher.ytmusic.playlists;public class PlaylistRuntime{public static java.io.File audio(String id){java.io.File f=new java.io.File(DownloadCatalog.directory(),id+".webm");return f.isFile()?f:null;}public static void finished(String id){}}'
s[pkg+'LocalPlayback.java']=r'''package app.bdcrusher.ytmusic.playlists;import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.*;
public class LocalPlayback{static java.util.Map<String,PlayerResponse> data=new java.util.concurrent.ConcurrentHashMap<>();public static byte[] response(String id){PlayerResponse p=data.get(id);return p==null?null:p.toByteArray();}public static void saved(String id,Format f,VideoDetails d){data.put(id,PlayerResponse.newBuilder().setVideoDetails(d).setStreamingData(StreamingData.newBuilder().addAdaptiveFormats(f)).build());}public static void savedVideo(String id,Format f,VideoDetails d,java.io.File file){data.put(id,data.get(id).toBuilder().setStreamingData(data.get(id).getStreamingData().toBuilder().addAdaptiveFormats(f)).build());}}
'''
s[native+'OfflineTrack.java']='package app.morphe.extension.music.patches.downloads;public class OfflineTrack{public static java.util.Map<String,String> titles=new java.util.concurrent.ConcurrentHashMap<>();public static void save(java.io.File f,String id,String t,String a,String b,int d,android.graphics.Bitmap art){titles.put(id,t);}}'
s['app/morphe/extension/shared/requests/Requester.java']=s['app/morphe/extension/shared/requests/Requester.java'].replace('if(!url.equals("https://fixture.invalid/stream"))','if(!url.equals("https://fixture.invalid/stream")&&!url.startsWith("https://i.ytimg.com/vi/"))').replace('public int getResponseCode(){String[] r=', 'public int getResponseCode(){if(url.toString().startsWith("https://i.ytimg.com/vi/"))return 200;String[] r=')
s['ManagerCheck.java']=r'''import app.bdcrusher.ytmusic.playlists.*;import app.morphe.extension.music.patches.downloads.*;import app.morphe.extension.shared.requests.Requester;import app.morphe.extension.shared.spoof.requests.StreamingDataRequest;import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.*;
public class ManagerCheck{
 static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}static void waitFor(java.util.function.BooleanSupplier b)throws Exception{long end=System.nanoTime()+TimeUnit.SECONDS.toNanos(20);while(!b.getAsBoolean()){if(System.nanoTime()>end)throw new AssertionError("manager timeout "+DownloadCatalog.states);Thread.sleep(5);}}
 static byte[] response(String id,boolean video){Format a=Format.newBuilder().setItag(251).setUrl("https://fixture.invalid/stream").setMimeType("audio/webm; codecs=opus").setContentLength(Requester.data.length).setBitrate(160000).build();StreamingData.Builder streams=StreamingData.newBuilder().addAdaptiveFormats(a);if(video)streams.addAdaptiveFormats(Format.newBuilder().setItag(247).setUrl("https://fixture.invalid/stream").setMimeType("video/webm; codecs=vp9").setContentLength(Requester.data.length).setBitrate(1000000).setWidth(1280).setHeight(720));return PlayerResponse.newBuilder().setVideoDetails(VideoDetails.newBuilder().setVideoId(id).setTitle("Title "+id).setOwnerChannelName("Artist - Topic").setLengthSeconds(120)).setPlayabilityStatus(PlayabilityStatus.newBuilder().setStatus(Status.OK)).setStreamingData(streams).build().toByteArray();}
 public static void main(String[] args)throws Exception{try{
  DownloadCatalog.root=Path.of(args[0],"owned").toFile();DownloadCatalog.root.mkdirs();Requester.data=new byte[256*1024];Arrays.fill(Requester.data,(byte)73);Requester.limit=-1;Requester.bad=false;
  String a="abcdefghijk",b="01234567890",c="ZYXWVUTSRQP";for(String id:List.of(a,b,c))StreamingDataRequest.responses.put(id,response(id,!id.equals(c)));
  StreamingDataRequest.blocked=b;LocalDownloadManager.enqueueMedia(b,MediaSelection.audio(AudioQuality.Tier.HIGH));check(StreamingDataRequest.arrived.await(3,TimeUnit.SECONDS));LocalDownloadManager.enqueueMedia(b,new MediaSelection(MediaSelection.Kind.VIDEO,AudioQuality.Tier.HIGH,1080));StreamingDataRequest.release.countDown();
  LocalDownloadManager.enqueueMedia(a,new MediaSelection(MediaSelection.Kind.VIDEO,AudioQuality.Tier.HIGH,1080));LocalDownloadManager.enqueueMedia(c,new MediaSelection(MediaSelection.Kind.VIDEO,AudioQuality.Tier.HIGH,1080));
  waitFor(()->DownloadCatalog.states.size()==3&&DownloadCatalog.states.values().stream().allMatch(p->p.state().equals("complete"))&&!LocalDownloadManager.active(a)&&!LocalDownloadManager.active(b)&&!LocalDownloadManager.active(c));
  check(DownloadCatalog.max<=2);check(DownloadCatalog.video(a)!=null&&DownloadCatalog.video(b)!=null);check(DownloadCatalog.video(c)==null&&DownloadCatalog.progress(c).detail().equals("Audio only"));check(OfflineTrack.titles.get(a).equals("Title "+a));
  for(String id:List.of(a,b,c)){check(Arrays.equals(Requester.data,Files.readAllBytes(PlaylistRuntime.audio(id).toPath())));check(!Files.exists(Path.of(PlaylistRuntime.audio(id)+".part.resume")));}
  check(DownloadCatalog.progress(b).selection().kind()==MediaSelection.Kind.VIDEO);
  System.out.println("PASS "+checks+" actual item scheduler/variant/fallback checks");
 }finally{app.morphe.extension.shared.Utils.workers.shutdownNow();}}
}'''
actual=[h/'Personal-Patches/extensions/music/src/main/java'/native/'LocalDownloadManager.java']+[h/'Personal-Patches/extensions/music/src/main/java'/pkg/(n+'.java') for n in ['RangeResume','MediaSelection','AudioQuality']]+[h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/lyrics/ProtoWire.java']
paths=[]
for name,body in s.items():
 p=w/'src'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body,encoding='utf-8');paths.append(p)
classes=w/'classes';classes.mkdir();java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');proto=h/'Personal-Patches/extensions/shared-youtube/library/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes';jar=next((h/'BuildCache/Gradle Cache/caches/modules-2/files-2.1/com.google.protobuf/protobuf-javalite').glob('*/*/*.jar'));android=Path('USER_HOME/AppData/Local/Android/Sdk/platforms/android-36/android.jar');cp=os.pathsep.join(map(str,[classes,proto,jar,android]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(classes),*map(str,actual+paths)],cwd=w,env=env,check=True)
r=subprocess.run([str(java/'java.exe'),'-cp',cp,'RangeCheck',str(w)],cwd=w,env=env,capture_output=True,text=True,timeout=45)
if r.returncode:raise RuntimeError(r.stderr)
manager=subprocess.run([str(java/'java.exe'),'-cp',cp,'ManagerCheck',str(w)],cwd=w,env=env,capture_output=True,text=True,timeout=45)
if manager.returncode:raise RuntimeError(manager.stderr)
r.stdout+=manager.stdout
(w/'result.json').write_text(json.dumps({'stdout':r.stdout,'sources':{str(p.relative_to(h)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual},'scope':'Production range transfer and durable journals, generated bytes only. HTTP, Android atomic adapter, UI and codec boundaries simulated. No real network/media downloads.'},indent=2),encoding='utf-8');print(r.stdout)
