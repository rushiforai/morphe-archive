"""Actual catalog/retry/repository with virtual timers and deterministic transport fixtures."""
from pathlib import Path
import ast,hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];work=h/'Verification/revision37/recovery-final';work.mkdir(exist_ok=False)
tree=ast.parse((h/'Verification/check_catalog_transport.py').read_text(encoding='utf-8'))
stubs=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='stubs' for t in n.targets)))
stubs.pop('app/bdcrusher/ytmusic/lyrics/CatalogCheck.java')
stubs['app/bdcrusher/ytmusic/lyrics/LyricsDiskCache.java']=stubs['app/bdcrusher/ytmusic/lyrics/LyricsDiskCache.java'].replace('org.json.JSONObject get(String k){return null;}','org.json.JSONObject get(String k){return null;}org.json.JSONObject migrate(String k){return null;}')
stubs.update({
'android/content/Context.java':'''package android.content;public class Context{public static final String CONNECTIVITY_SERVICE="network";public Context getApplicationContext(){return this;}public Object getSystemService(String s){return new android.net.ConnectivityManager();}}''',
'android/content/SharedPreferences.java':'''package android.content;public class SharedPreferences{public static String jwt="fixture";public String getString(String k,String d){return jwt;}public Editor edit(){return new Editor();}public static class Editor{public Editor remove(String k){jwt="";return this;}public void apply(){}}}''',
'android/app/Activity.java':'''package android.app;public class Activity{public static boolean active=true;public boolean isFinishing(){return false;}public boolean isDestroyed(){return false;}public boolean hasWindowFocus(){return active;}}''',
'android/net/ConnectivityManager.java':'''package android.net;public class ConnectivityManager{public static boolean online=true;public Object getActiveNetwork(){return null;}public NetworkCapabilities getNetworkCapabilities(Object n){return online?new NetworkCapabilities():null;}}''',
'android/net/NetworkCapabilities.java':'''package android.net;public class NetworkCapabilities{public static int NET_CAPABILITY_INTERNET=12,NET_CAPABILITY_VALIDATED=16;public boolean hasCapability(int c){return true;}}''',
'android/os/Looper.java':'''package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}''',
'android/os/Handler.java':'''package android.os;public class Handler{public Handler(Looper l){}public void post(Runnable r){r.run();}}''',
'app/morphe/extension/shared/Utils.java':'''package app.morphe.extension.shared;public class Utils{public static android.app.Activity getActivity(){return new android.app.Activity();}}''',
'app/bdcrusher/ytmusic/lyrics/LyricsConfig.java':'''package app.bdcrusher.ytmusic.lyrics;class LyricsConfig{static android.content.SharedPreferences preferences(android.content.Context c){return new android.content.SharedPreferences();}static boolean brokerEnabled(android.content.Context c){return true;}static boolean enabled(android.content.Context c,String... keys){return java.util.Arrays.asList(keys).contains("bLyrics-richsynced");}}''',
'app/bdcrusher/ytmusic/lyrics/LyricsLibrary.java':'''package app.bdcrusher.ytmusic.lyrics;class LyricsLibrary{static org.json.JSONObject saved;LyricsLibrary(android.content.Context c){}org.json.JSONObject get(String id){return saved;}void offer(String id,org.json.JSONObject p){}}''',
'app/bdcrusher/ytmusic/lyrics/ServiceConnection.java':'''package app.bdcrusher.ytmusic.lyrics;class ServiceConnection{static int renewals;static boolean expired(String s){return false;}static void renew(android.content.Context c){renewals++;}}''',
'app/bdcrusher/ytmusic/lyrics/LyricsNetwork.java':r'''package app.bdcrusher.ytmusic.lyrics;
import java.io.*;import java.net.*;import java.util.*;
class LyricsNetwork implements AutoCloseable{
 static String BROKER="https://fixture/";static int calls,failUntil,code=503,brokerCode=200;static long retryAfter;static boolean malformed;static String stream="event: complete\ndata: {}\n\n";
 static class HttpFailure extends IOException{final int status;final long retryAfterMs;HttpFailure(int s,String h){status=s;retryAfterMs=retryAfter;}}
 static class PayloadLimit extends IOException{}
 static String encode(String s){return java.net.URLEncoder.encode(s,java.nio.charset.StandardCharsets.UTF_8);}
 String request(String u,String m,String b,String t)throws Exception{calls++;if(calls<=failUntil)throw new HttpFailure(code,null);if(malformed)return "bad JSON";return "{\"ttml\":\"<tt><body><p begin='1s' end='2s'>Fixture lyric</p></body></tt>\"}";}
 HttpURLConnection open(String u,String m,String b,String t)throws Exception{return new HttpURLConnection(new URL(u)){public int getResponseCode(){return brokerCode;}public String getHeaderField(String n){return null;}public InputStream getInputStream(){return new ByteArrayInputStream(stream.getBytes(java.nio.charset.StandardCharsets.UTF_8));}public void disconnect(){}public boolean usingProxy(){return false;}public void connect(){}};}
 void release(HttpURLConnection c){}public void close(){}
}''',
'app/bdcrusher/ytmusic/lyrics/RecoveryCheck.java':r'''package app.bdcrusher.ytmusic.lyrics;
import java.util.*;import java.util.concurrent.*;import org.json.*;
public class RecoveryCheck{
 static int checks;static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS: "+why);}
 static class Direct extends AbstractExecutorService{boolean closed;public void execute(Runnable r){if(closed)throw new RejectedExecutionException();r.run();}public void shutdown(){closed=true;}public List<Runnable> shutdownNow(){closed=true;return List.of();}public boolean isShutdown(){return closed;}public boolean isTerminated(){return closed;}public boolean awaitTermination(long t,TimeUnit u){return closed;}}
 static class Timers extends ScheduledThreadPoolExecutor{
  long now;boolean closed;final List<Long> delays=new ArrayList<>();final PriorityQueue<Event> queue=new PriorityQueue<>(Comparator.comparingLong(e->e.at));
  record Event(long at,Runnable work){}Timers(){super(1);}
  public ScheduledFuture<?> schedule(Runnable r,long d,TimeUnit u){long ms=u.toMillis(d);delays.add(ms);queue.add(new Event(now+ms,r));return new ScheduledFuture<Object>(){public long getDelay(TimeUnit u){return u.convert(ms,TimeUnit.MILLISECONDS);}public int compareTo(Delayed d){return 0;}public boolean cancel(boolean b){return queue.removeIf(e->e.work==r);}public boolean isCancelled(){return false;}public boolean isDone(){return false;}public Object get(){return null;}public Object get(long t,TimeUnit u){return null;}};}
  void next(){Event e=queue.remove();now=e.at;if(!closed)e.work.run();}void drain(int max){for(int i=0;!queue.isEmpty()&&i<max;i++)next();}
  public List<Runnable> shutdownNow(){closed=true;queue.clear();return super.shutdownNow();}
 }
 static class Sink implements LyricsCatalog.Sink{List<JSONObject> results=new ArrayList<>();JSONObject health;Boolean missing;int reconnect;public void result(JSONObject p){results.add(p);}public void health(JSONObject p){health=p;}public void completion(boolean b){missing=b;}public void notice(String s,boolean done){}public void reconnect(){reconnect++;}}
 static LyricsCatalog start(Timers timers,Sink sink){return new LyricsCatalog(new android.content.Context(),new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Fixture","Artist","",180),"sN_tJ8d3c0I",true,sink,new Direct(),timers);}
 static void reset(){LyricsNetwork.calls=0;LyricsNetwork.failUntil=100;LyricsNetwork.code=503;LyricsNetwork.retryAfter=0;LyricsNetwork.malformed=false;LyricsNetwork.brokerCode=200;LyricsNetwork.stream="event: complete\ndata: {}\n\n";android.content.SharedPreferences.jwt="fixture";android.net.ConnectivityManager.online=true;android.app.Activity.active=true;LyricsLibrary.saved=null;}
 public static void main(String[] args)throws Exception{
  reset();Timers timers=new Timers();Sink sink=new Sink();var catalog=start(timers,sink);timers.drain(20);
  check(LyricsNetwork.calls==9&&timers.delays.size()==8,"six attempts plus exactly three spaced recovery checks");
  long[] minimum={750,1500,3000,6000,10000,30000,120000,300000};for(int i=0;i<minimum.length;i++)check(timers.delays.get(i)>=minimum[i]&&timers.delays.get(i)<=minimum[i]+250,"retry minimum plus bounded positive jitter "+i);
  check(sink.health.getInt("pending")==0&&sink.health.getBoolean("failed")&&!sink.missing,"exhausted connection failure is not not-found");catalog.close();
  reset();LyricsNetwork.failUntil=8;timers=new Timers();sink=new Sink();catalog=start(timers,sink);timers.drain(20);check(LyricsNetwork.calls==9&&sink.results.size()>0&&!sink.health.getBoolean("failed"),"ninth attempt can recover and clear failure without losing lyrics");catalog.close();
  reset();LyricsNetwork.retryAfter=900000;timers=new Timers();sink=new Sink();catalog=start(timers,sink);check(timers.delays.get(0)>=900000,"long server Retry-After is never shortened");catalog.close();
  reset();android.net.ConnectivityManager.online=false;LyricsLibrary.saved=new JSONObject().put("key","bLyrics-richsynced").put("raw","[00:01]Offline fixture");timers=new Timers();sink=new Sink();catalog=start(timers,sink);timers.drain(4);check(LyricsNetwork.calls==0&&sink.results.size()==1,"offline startup displays saved lyrics without consuming network attempts");android.net.ConnectivityManager.online=true;timers.next();check(LyricsNetwork.calls==1,"connectivity recovery starts the first budgeted attempt");catalog.close();
  reset();timers=new Timers();sink=new Sink();catalog=start(timers,sink);int calls=LyricsNetwork.calls;android.app.Activity.active=false;timers.drain(3);check(LyricsNetwork.calls==calls,"inactive app suspends retries without consuming attempts");android.app.Activity.active=true;timers.next();check(LyricsNetwork.calls==calls+1,"foreground resume continues the existing budget");catalog.close();
  reset();LyricsNetwork.code=404;timers=new Timers();sink=new Sink();catalog=start(timers,sink);check(timers.delays.size()==1&&timers.delays.get(0)==30000,"genuine not-found receives one delayed confirmation");timers.drain(5);check(LyricsNetwork.calls==4&&Boolean.TRUE.equals(sink.missing)&&!sink.health.getBoolean("failed"),"confirmed not-found is distinct from errors");catalog.close();
  reset();LyricsNetwork.failUntil=0;LyricsNetwork.malformed=true;timers=new Timers();sink=new Sink();catalog=start(timers,sink);check(timers.queue.isEmpty()&&sink.health.getBoolean("failed")&&!sink.missing,"invalid JSON is a parsing outcome, not a retry storm or not-found");catalog.close();
  reset();LyricsNetwork.failUntil=0;LyricsNetwork.stream="event: provider\ndata: broken\n\nevent: provider\ndata: {\"provider\":\"golyrics\",\"results\":{\"lyrics\":\"<tt>fixture</tt>\"}}\n\n";timers=new Timers();sink=new Sink();catalog=start(timers,sink);check(sink.results.size()>=2&&sink.health.getBoolean("failed")&&sink.health.getBoolean("found"),"malformed stream event preserves later successes and readable partial-failure state");catalog.close();
  reset();LyricsNetwork.failUntil=0;LyricsNetwork.brokerCode=403;timers=new Timers();sink=new Sink();catalog=start(timers,sink);check(sink.reconnect==1&&sink.health.getBoolean("connectionNeeded")&&sink.health.getBoolean("found"),"expired/rejected broker authorization renews while valid direct lyrics remain");LyricsNetwork.brokerCode=200;android.content.SharedPreferences.jwt="renewed";catalog.connectionChanged();check(sink.results.size()>0&&!sink.health.getBoolean("connectionNeeded"),"new authorization adds sources without clearing results");catalog.close();
  reset();timers=new Timers();sink=new Sink();catalog=start(timers,sink);catalog.close();timers.drain(20);check(LyricsNetwork.calls==1&&timers.queue.isEmpty(),"stale-track close cancels all scheduled recovery");
  reset();LyricsNetwork.failUntil=0;timers=new Timers();sink=new Sink();catalog=start(timers,sink);int beforeRefine=sink.results.size();int beforeCalls=LyricsNetwork.calls;catalog.refine(new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Fixture","Artist","Album",181));check(sink.results.size()>=beforeRefine&&LyricsNetwork.calls>beforeCalls,"metadata refinement adds conservative query without discarding positive results");int afterRefine=LyricsNetwork.calls;catalog.refine(new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Other","Artist","Album",181));check(LyricsNetwork.calls==afterRefine,"different recording metadata cannot refine existing catalog");catalog.close();
  check(!java.nio.file.Files.readString(java.nio.file.Path.of(args[1])).contains("Thread.sleep"),"actual catalog contains no worker-blocking retry sleeps");
  java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),new JSONObject().put("checks",checks).put("passed",true).put("transportAndClockSimulated",true).toString(2));System.exit(0);
 }
}'''
})
files=[]
for n,s in stubs.items():
 p=work/'stubs'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
src=h/'Personal-Patches/extensions/music/src/main/java';actual=[src/'app/bdcrusher/ytmusic/lyrics'/n for n in ['LyricsCatalog.java','LyricsLookup.java','LyricsRetry.java']]+[src/'app/morphe/extension/music/patches/lyrics/model/TrackInfo.java'];files+=actual
jar=next((h/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=work/'classes';out.mkdir();cp=os.pathsep.join(map(str,[out,jar]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(out),*map(str,files)],cwd=work,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',cp,'app.bdcrusher.ytmusic.lyrics.RecoveryCheck',str(work/'verification.json'),str(actual[0])],cwd=work,env=env,check=True,timeout=20)
d=json.loads((work/'verification.json').read_text());d['sourceSha256']={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};(work/'verification.json').write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8')
