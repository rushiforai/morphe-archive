"""Actual Catalog against deterministic HTTP responses; no service verification bypass."""
from pathlib import Path
import ast,hashlib,json,os,subprocess
home=Path(__file__).resolve().parents[1];work=home/'Verification/revision29-catalog';assert not work.exists();work.mkdir()
tree=ast.parse((home/'Verification/check_catalog_transport.py').read_text(encoding='utf-8'))
stubs=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='stubs' for t in n.targets)))
stubs['android/content/SharedPreferences.java']='''package android.content;public class SharedPreferences {public static String jwt="local-test";public static int removed;public String getString(String k,String d){return jwt;}public Editor edit(){return new Editor();}public static class Editor{public Editor remove(String k){removed++;jwt="";return this;}public void apply(){}}}'''
stubs['app/bdcrusher/ytmusic/lyrics/ServiceConnection.java']='''package app.bdcrusher.ytmusic.lyrics;final class ServiceConnection{static boolean expired(String s){return s.equals("expired-test");}}'''
stubs['app/bdcrusher/ytmusic/lyrics/LyricsNetwork.java']=r'''package app.bdcrusher.ytmusic.lyrics;
import java.io.*;import java.net.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
final class LyricsNetwork implements AutoCloseable{
 static final String BROKER="https://lyrics.api.dacubeking.com/";static int mode;static List<String> urls=new CopyOnWriteArrayList<>();static CountDownLatch gate;
 static class HttpFailure extends IOException{final int status;final long retryAfterMs;HttpFailure(int s){status=s;retryAfterMs=0;}HttpFailure(int s,String ignored){status=s;retryAfterMs=mode==18?60000:0;}}
 static class PayloadLimit extends IOException{}
 static AtomicInteger brokerCalls=new AtomicInteger(),betterCalls=new AtomicInteger();
 static String encode(String s){return java.net.URLEncoder.encode(s,java.nio.charset.StandardCharsets.UTF_8);}
 String request(String u,String m,String b,String t)throws Exception{urls.add(u);if(mode==20&&u.contains("api.betterlyrics.org")&&betterCalls.incrementAndGet()<3)throw new SocketTimeoutException();if(mode==14&&u.contains("api.betterlyrics.org"))return "invalid JSON";if(mode==9&&gate!=null)gate.await();
  if(u.contains("lrclib.net/api/search")&&(mode==10||mode==11))return "[{\"trackName\":\"Local Song\",\"artistName\":\""+(mode==10?"Local Artist":"Wrong Artist")+"\",\"duration\":180,\"syncedLyrics\":\"[00:01]Local search fixture\"}]";
  if(mode==12&&u.contains("lrclib.net/api/get"))throw new HttpFailure(403);
  if(!u.contains("api.betterlyrics.org"))throw new HttpFailure(404);
  boolean full=u.contains("&al=")||u.contains("&d=");
  if(mode==20)return "{\"ttml\":\"<tt>recovered</tt>\"}";
  if(mode==1&&full)throw new HttpFailure(404);if(mode==2&&full)return "{}";
  if(mode==3)throw new HttpFailure(403);if(mode==4)throw new HttpFailure(429);if(mode==5)throw new IOException("local simulation");if(mode>=6)throw new HttpFailure(404);
  return "{\"ttml\":\"<tt>local fixture</tt>\"}";
 }
 HttpURLConnection open(String u,String m,String b,String t)throws Exception{int call=brokerCalls.incrementAndGet();return new HttpURLConnection(new URL(u)){
  public void connect(){}public boolean usingProxy(){return false;}public void disconnect(){}
  public int getResponseCode(){return mode==8?403:mode==18?429:mode==19&&call<3?503:200;}
  public InputStream getInputStream(){String data="";if(mode==15||mode==16||mode==17){data="event: provider\ndata: {\"provider\":\"binimum\",\"results\":{\"lyrics\":\"<tt>rich fixture</tt>\"}}\n\n";if(mode==16&&call==1)data+="event: provider\ndata: {\"provider\":\"musixmatch\",\"error\":\"Temporary upstream failure\",\"status\":503}\n\n";if(mode==17)data="event: provider\ndata: invalid JSON\n\n"+data;data+="data: [DONE]\n\n";}return new ByteArrayInputStream(data.getBytes(java.nio.charset.StandardCharsets.UTF_8));}
 };}
 void release(HttpURLConnection c){c.disconnect();}public void close(){if(gate!=null)gate.countDown();}
}'''
stubs['app/bdcrusher/ytmusic/lyrics/CatalogCheck.java']=r'''package app.bdcrusher.ytmusic.lyrics;
import org.json.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public class CatalogCheck{
 static int checks;static void check(boolean b,String m){if(!b)throw new AssertionError(m);checks++;System.out.println("PASS: "+m);}
 static class Capture implements LyricsCatalog.Sink{CountDownLatch done=new CountDownLatch(1);AtomicReference<JSONObject> result=new AtomicReference<>();Boolean notFound;int renew,events;public void result(JSONObject p){events++;result.set(p);}public void completion(boolean b){notFound=b;}public void reconnect(){renew++;}public void notice(String m,boolean finished){if(finished)done.countDown();}}
 static Capture run(int mode,String jwt)throws Exception{LyricsNetwork.mode=mode;LyricsNetwork.urls.clear();LyricsNetwork.brokerCalls.set(0);LyricsNetwork.betterCalls.set(0);android.content.SharedPreferences.jwt=jwt;Capture sink=new Capture();try(var c=new LyricsCatalog(new android.content.Context(),new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Local Song","Local Artist","Album mismatch",180),"local-video",true,sink)){check(sink.done.await(5,TimeUnit.SECONDS),"catalog completes bounded local case "+mode);}return sink;}
 static long better(){return LyricsNetwork.urls.stream().filter(u->u.contains("api.betterlyrics.org")).count();}
 public static void main(String[] a)throws Exception{
  Capture s=run(0,"local-test");check(better()==1&&!s.result.get().getBoolean("relaxedMetadata")&&!s.notFound,"exact metadata success has one request and preserves result");
  for(int m:new int[]{1,2}){s=run(m,"local-test");check(better()==2&&s.result.get().getBoolean("relaxedMetadata")&&!s.notFound,"404 or empty result retries only title+artist: "+m);check(LyricsNetwork.urls.stream().filter(u->u.contains("api.betterlyrics.org")).anyMatch(u->!u.contains("&al=")&&!u.contains("&d=")),"relaxed retry omits only album and duration");}
  for(int m:new int[]{3,4,5}){s=run(m,"local-test");check(better()==(m==3?1:3)&&s.result.get()==null&&!s.notFound,"denial is not retried; rate/connection failures are bounded and never not-found: "+m);}
  s=run(6,"local-test");check(s.notFound&&s.result.get()==null,"all completed empty sources are definitely not found");
  s=run(7,"");check(!s.notFound,"unconnected combined service leaves availability unknown");
  int before=android.content.SharedPreferences.removed;s=run(7,"expired-test");check(!s.notFound&&s.renew==0&&android.content.SharedPreferences.removed==before,"expired token is retained until replacement; automatic coordinator handles renewal");
  s=run(8,"local-test");check(!s.notFound&&s.renew==1,"rejected broker connection is unknown and renews normally");
  check(LyricsLookup.title("Song (Official Music Video)").equals("Song")&&LyricsLookup.artist("Artist - Topic").equals("Artist"),"presentation labels normalize without dropping identity");
  check(LyricsLookup.title("Song (Live)").equals("Song (Live)")&&LyricsLookup.title("Song (Female Cover)").equals("Song (Female Cover)")&&LyricsLookup.title("Song (Remix)").equals("Song (Remix)"),"live cover and remix qualifiers remain significant");
  JSONArray choices=new JSONArray().put(new JSONObject().put("trackName","Song").put("artistName","Wrong Artist").put("duration",180).put("syncedLyrics","wrong")).put(new JSONObject().put("trackName","Song (Live)").put("artistName","Artist").put("duration",180).put("syncedLyrics","wrong")).put(new JSONObject().put("trackName","Song").put("artistName","Artist").put("duration",183).put("syncedLyrics","wrong")).put(new JSONObject().put("trackName","Song").put("artistName","Artist").put("duration",181).put("syncedLyrics","local exact fixture"));
  check(LyricsLookup.best(choices,"Song","Artist",180).getString("syncedLyrics").equals("local exact fixture"),"search accepts only exact title/artist and a maximum 2-second duration mismatch");
  check(LyricsLookup.best(choices,"Unrelated","Artist",180)==null,"search never substitutes an unrelated title");
  s=run(10,"local-test");check(s.result.get()!=null&&s.result.get().optString("key").equals("lrclib-synced")&&!s.notFound,"actual catalog recovers a valid exact LRCLib search result after get404");
  s=run(11,"local-test");check(s.result.get()==null&&s.notFound,"actual catalog rejects a wrong-artist LRCLib search response");
  s=run(12,"local-test");check(s.result.get()==null&&!s.notFound&&LyricsNetwork.urls.stream().noneMatch(u->u.contains("lrclib.net/api/search")),"LRCLib access denial never triggers search fallback");
  LyricsNetwork.mode=9;LyricsNetwork.gate=new CountDownLatch(1);Capture canceled=new Capture();var c=new LyricsCatalog(new android.content.Context(),new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Local","Local","Album",1),"local",true,canceled);c.close();Thread.sleep(80);check(canceled.events==0&&canceled.notFound==null,"canceled track cannot emit result or completion");

  s=run(14,"local-test");check(better()==1&&!s.notFound,"malformed provider JSON is a parsing failure without retries");
  s=run(15,"local-test");check(s.result.get()!=null&&!s.notFound&&LyricsNetwork.brokerCalls.get()==1,"stream DONE sentinel preserves rich provider result without a parse failure");
  s=run(16,"local-test");check(s.result.get()!=null&&!s.notFound&&LyricsNetwork.brokerCalls.get()==2&&s.events==2,"partial stream retries and deduplicates the unchanged rich result");
  s=run(17,"local-test");check(s.result.get()!=null&&!s.notFound&&LyricsNetwork.brokerCalls.get()==1,"one malformed event cannot prevent later providers from loading");
  s=run(18,"local-test");check(!s.notFound&&LyricsNetwork.brokerCalls.get()==1,"long Retry-After is respected without early retries");
  s=run(19,"local-test");check(LyricsNetwork.brokerCalls.get()==3,"broker transient HTTP failure succeeds on third bounded attempt");
  s=run(20,"local-test");check(better()==3&&s.result.get()!=null,"public provider survives two temporary timeouts");
  LyricsNetwork.mode=15;LyricsNetwork.brokerCalls.set(0);android.content.SharedPreferences.jwt="";Capture late=new Capture();try(var connected=new LyricsCatalog(new android.content.Context(),new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Local","Artist","",1),"video",true,late)){
    check(late.done.await(5,TimeUnit.SECONDS),"public lookup can finish before verification");
    android.content.SharedPreferences.jwt="renewed-test";connected.connectionChanged();Thread.sleep(120);
    check(late.result.get()!=null&&LyricsNetwork.brokerCalls.get()==1,"new token adds broker results without replacing catalog");
    connected.connectionChanged();Thread.sleep(30);check(LyricsNetwork.brokerCalls.get()==1,"same token never starts duplicate stream");
  }
  java.nio.file.Files.writeString(java.nio.file.Path.of(a[0]),new JSONObject().put("passed",true).put("checks",checks).put("httpSimulated",true).put("phoneVerified",false).toString(2));
 }
}'''
files=[]
for n,s in stubs.items():
 p=work/'stubs'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
src=home/'Personal-Patches/extensions/music/src/main/java';actual=[src/'app/bdcrusher/ytmusic/lyrics/LyricsCatalog.java',src/'app/bdcrusher/ytmusic/lyrics/LyricsLookup.java',src/'app/bdcrusher/ytmusic/lyrics/LyricsRetry.java',src/'app/morphe/extension/music/patches/lyrics/model/TrackInfo.java']
jar=next((home/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=work/'classes';out.mkdir()
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(home/'BuildCache/Temp'),TEMP=str(home/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',str(jar),'-d',str(out),*map(str,files+actual)],cwd=work,env=env,check=True)
report=work/'verification.json';subprocess.run([str(java/'java.exe'),'-Duser.home='+str(home/'BuildCache/Home'),'-Djava.io.tmpdir='+str(home/'BuildCache/Temp'),'-cp',str(out)+os.pathsep+str(jar),'app.bdcrusher.ytmusic.lyrics.CatalogCheck',str(report)],cwd=work,env=env,check=True)
d=json.loads(report.read_text());d['actualSourceSha256']={str(p.relative_to(src)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};report.write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8')

