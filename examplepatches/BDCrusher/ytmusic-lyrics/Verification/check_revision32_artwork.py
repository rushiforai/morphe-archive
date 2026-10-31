"""Actual artwork repository with deterministic HTTPS, Wi-Fi, storage and decoder boundaries."""
from pathlib import Path
import hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision32-artwork-r2';w.mkdir(exist_ok=False)
stubs={
'android/content/Context.java':'''package android.content;public class Context{public static java.io.File root;public static final int MODE_PRIVATE=0;public static final String CONNECTIVITY_SERVICE="network";public Context getApplicationContext(){return this;}public java.io.File getFilesDir(){return new java.io.File(root,"files");}public java.io.File getCacheDir(){return new java.io.File(root,"cache");}public Object getSystemService(String s){return new android.net.ConnectivityManager();}public SharedPreferences getSharedPreferences(String s,int m){return new SharedPreferences();}}''',
'android/content/SharedPreferences.java':'''package android.content;public class SharedPreferences{public static int cap=128;public int getInt(String s,int d){return s.equals("mediaLimit")?cap:d;}}''',
'android/net/ConnectivityManager.java':'''package android.net;public class ConnectivityManager{public static boolean wifi=true,metered;public Object getActiveNetwork(){return null;}public NetworkCapabilities getNetworkCapabilities(Object n){return new NetworkCapabilities();}public boolean isActiveNetworkMetered(){return metered;}}''',
'android/net/NetworkCapabilities.java':'''package android.net;public class NetworkCapabilities{public static final int TRANSPORT_WIFI=1,NET_CAPABILITY_INTERNET=12;public boolean hasTransport(int t){return ConnectivityManager.wifi;}public boolean hasCapability(int c){return true;}}''',
'android/net/Uri.java':'package android.net;public class Uri{}',
'android/os/Looper.java':'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/Handler.java':'package android.os;public class Handler{public Handler(Looper l){}public void post(Runnable r){r.run();}}',
'android/util/AtomicFile.java':'''package android.util;import java.io.*;public class AtomicFile{final File f;public AtomicFile(File f){this.f=f;}public byte[] readFully()throws IOException{return java.nio.file.Files.readAllBytes(f.toPath());}public FileOutputStream startWrite()throws IOException{return new FileOutputStream(new File(f+".new"));}public void finishWrite(FileOutputStream s)throws IOException{s.close();java.nio.file.Files.move(new File(f+".new").toPath(),f.toPath(),java.nio.file.StandardCopyOption.REPLACE_EXISTING);}public void failWrite(FileOutputStream s){try{if(s!=null)s.close();new File(f+".new").delete();}catch(Exception ignored){}}}''',
'android/media/MediaMetadataRetriever.java':'''package android.media;public class MediaMetadataRetriever{public static final int METADATA_KEY_VIDEO_WIDTH=1;public static boolean supported=true;public void setDataSource(String s){}public String extractMetadata(int key){return supported?"128":null;}public void release(){}}''',
'app/morphe/extension/shared/Logger.java':'package app.morphe.extension.shared;public class Logger{public static void printDebug(java.util.function.Supplier<String> s){}}',
'app/bdcrusher/ytmusic/shaders/ArtworkToken.java':'package app.bdcrusher.ytmusic.shaders;class ArtworkToken{static void ensure(android.content.Context c){}static String usable(android.content.Context c){return null;}}',
'app/bdcrusher/ytmusic/shaders/ArtworkCheck.java':r'''package app.bdcrusher.ytmusic.shaders;
import java.net.*;import java.io.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;import org.json.*;
public class ArtworkCheck{
 static int checks,metadataCalls,mediaCalls;static boolean truncated,unsupportedUrl;static CountDownLatch requestGate;
 static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS: "+why);}
 static void flush()throws Exception{ArtworkRepository.io.submit(()->{}).get(5,TimeUnit.SECONDS);}
 static File lookup(android.content.Context c,String album)throws Exception{CountDownLatch done=new CountDownLatch(1);AtomicReference<File> file=new AtomicReference<>();ArtworkRepository.lookup(c,new ArtworkRepository.Track("sN_tJ8d3c0I","Fixture","Artist",album,180),(f,k)->{file.set(f);done.countDown();});if(!done.await(5,TimeUnit.SECONDS))throw new AssertionError("lookup did not finish");return file.get();}
 public static void main(String[] args)throws Exception{
  android.content.Context.root=Path.of(args[0]).toFile();android.content.Context.root.mkdirs();var c=new android.content.Context();
  URL.setURLStreamHandlerFactory(protocol->protocol.equals("https")?new URLStreamHandler(){protected URLConnection openConnection(URL url){return new HttpURLConnection(url){byte[] bytes;
   {if(url.getHost().equals("artwork.boidu.dev")){metadataCalls++;bytes=("{\"videoUrl\":\"https://"+(unsupportedUrl?"untrusted.example":"mvod.itunes.apple.com")+"/"+(url.getQuery().contains("al=Truncated")?"truncated":url.getQuery().contains("al=Unsupported")?"unsupported":"fixture")+".mp4\",\"artworkUrl\":\"https://ignored/hls.m3u8\"}").getBytes(java.nio.charset.StandardCharsets.UTF_8);}else{mediaCalls++;bytes=new byte[256];bytes[4]='f';bytes[5]='t';bytes[6]='y';bytes[7]='p';}}
   public int getResponseCode(){return 200;}public long getContentLengthLong(){return bytes.length+(truncated?1:0);}public InputStream getInputStream(){if(requestGate!=null)try{requestGate.await(2,TimeUnit.SECONDS);}catch(Exception ignored){}return new ByteArrayInputStream(bytes);}public void disconnect(){}public void connect(){}public boolean usingProxy(){return false;}
  };}}:null);
  android.net.ConnectivityManager.wifi=false;check(lookup(c,"Cellular")==null&&metadataCalls==0&&mediaCalls==0,"cellular access does not download new artwork");
  android.net.ConnectivityManager.wifi=true;android.net.ConnectivityManager.metered=true;check(lookup(c,"Metered")==null&&mediaCalls==0,"metered Wi-Fi does not download new loops");
  android.net.ConnectivityManager.metered=false;File file=lookup(c,"Album");check(file!=null&&file.length()==256&&metadataCalls==1&&mediaCalls==1,"unmetered Wi-Fi atomically caches progressive MP4 only");
  check(ArtworkRepository.metadataDirectory(c).listFiles().length==1&&ArtworkRepository.mediaDirectory(c).listFiles().length==1,"metadata and cover files are separate bounded stores");
  android.net.ConnectivityManager.wifi=false;check(lookup(c,"Album").equals(file)&&mediaCalls==1&&metadataCalls==1,"cached album loop works offline without network");
  android.net.ConnectivityManager.wifi=true;requestGate=new CountDownLatch(1);CountDownLatch callbacks=new CountDownLatch(2);ArtworkRepository.Track track=new ArtworkRepository.Track("MYal8NoVQXs","Fixture","Artist","Shared",180);
  ArtworkRepository.lookup(c,track,(f,k)->callbacks.countDown());ArtworkRepository.lookup(c,track,(f,k)->callbacks.countDown());requestGate.countDown();check(callbacks.await(5,TimeUnit.SECONDS)&&metadataCalls==2&&mediaCalls==1,"album lookups are single-flight and shared loops deduplicate by media identity");requestGate=null;
  truncated=true;check(lookup(c,"Truncated")==null,"incomplete media is never committed");truncated=false;
  check(Arrays.stream(ArtworkRepository.mediaDirectory(c).listFiles()).noneMatch(f->f.getName().endsWith(".part")),"failed temporary downloads are removed");
  android.media.MediaMetadataRetriever.supported=false;check(lookup(c,"Unsupported")==null,"native decoder rejection falls back to still artwork");android.media.MediaMetadataRetriever.supported=true;
  unsupportedUrl=true;int oldMedia=mediaCalls;check(lookup(c,"Untrusted")==null&&mediaCalls==oldMedia,"only the inspected progressive artwork origin is accepted");unsupportedUrl=false;
  File folder=ArtworkRepository.mediaDirectory(c);File oldest=new File(folder,"a".repeat(64)+".mp4"),recent=new File(folder,"b".repeat(64)+".mp4"),newest=new File(folder,"c".repeat(64)+".mp4");
  for(File f:new File[]{oldest,recent,newest})try(RandomAccessFile sparse=new RandomAccessFile(f,"rw")){sparse.setLength(48L*1024*1024);}oldest.setLastModified(1);recent.setLastModified(2);newest.setLastModified(3);
  ArtworkRepository.trim(c);flush();check(!oldest.exists()&&recent.exists()&&newest.exists(),"cache limit evicts least recently used cover files");
  File lyric=new File(c.getFilesDir(),"bdcrusher-lyrics-library-v2/"+"d".repeat(64)+".json");lyric.getParentFile().mkdirs();Files.writeString(lyric.toPath(),"indefinite lyric fixture");
  CountDownLatch clear=new CountDownLatch(1);ArtworkRepository.clear(c,clear::countDown);check(clear.await(5,TimeUnit.SECONDS)&&folder.listFiles().length==0&&ArtworkRepository.metadataDirectory(c).listFiles().length==0&&lyric.isFile(),"clearing artwork never touches permanent lyrics");
  Files.writeString(Path.of(args[1]),new JSONObject().put("checks",checks).put("passed",true).put("networkAndNativeDecoderSimulated",true).put("realMediaDownloaded",false).toString(2));System.exit(0);
 }
}'''
}
files=[]
for n,s in stubs.items():
 p=w/'stubs'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
actual=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/shaders/ArtworkRepository.java';files.append(actual);jar=next((h/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=w/'classes';out.mkdir();cp=os.pathsep.join(map(str,[out,jar]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(out),*map(str,files)],cwd=w,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',cp,'app.bdcrusher.ytmusic.shaders.ArtworkCheck',str(w/'data'),str(w/'verification.json')],cwd=w,env=env,check=True,timeout=25)
d=json.loads((w/'verification.json').read_text(encoding='utf-8'));d['sourceSha256']=hashlib.sha256(actual.read_bytes()).hexdigest();(w/'verification.json').write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8')
