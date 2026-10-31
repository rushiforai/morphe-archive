"""One-shot loopback handoff of a freshly issued test JWT through stdin, never disk/logs.
Run the actual Catalog/Network against the normal broker; Android storage is simulated.
"""
from pathlib import Path
from http.server import HTTPServer,BaseHTTPRequestHandler
import ast,hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];work=h/'Verification/revision30-java-service';assert not work.exists();work.mkdir()
tree=ast.parse((h/'Verification/check_catalog_transport.py').read_text(encoding='utf-8'))
stubs=ast.literal_eval(next(n.value for n in tree.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='stubs' for t in n.targets)))
stubs['android/content/SharedPreferences.java']='''package android.content;public class SharedPreferences{public static String jwt="";public String getString(String k,String d){return jwt;}public Editor edit(){return new Editor();}public static class Editor{public Editor remove(String k){jwt="";return this;}public void apply(){}}}'''
stubs['app/bdcrusher/ytmusic/lyrics/ServiceConnection.java']='''package app.bdcrusher.ytmusic.lyrics;final class ServiceConnection{static boolean expired(String jwt){return TokenExpiry.expired(jwt,System.currentTimeMillis()/1000);}}'''
stubs['app/bdcrusher/ytmusic/lyrics/CatalogCheck.java']=r'''package app.bdcrusher.ytmusic.lyrics;
import org.json.*;import java.util.*;import java.util.concurrent.*;import java.util.concurrent.atomic.*;
public class CatalogCheck{public static void main(String[] args)throws Exception{
 String jwt=new java.io.BufferedReader(new java.io.InputStreamReader(System.in)).readLine();if(jwt==null||ServiceConnection.expired(jwt))throw new IllegalArgumentException("A normally issued valid verification is required");android.content.SharedPreferences.jwt=jwt;
 Set<String> providers=ConcurrentHashMap.newKeySet();AtomicReference<JSONObject> health=new AtomicReference<>();CountDownLatch done=new CountDownLatch(1);AtomicInteger positives=new AtomicInteger();
 try(var catalog=new LyricsCatalog(new android.content.Context(),new app.morphe.extension.music.patches.lyrics.model.TrackInfo("Wake Up","Imagine Dragons","LOOM",167),"sN_tJ8d3c0I",true,new LyricsCatalog.Sink(){
  public void result(JSONObject p){if(LyricsCatalog.hasLyricsPayload(p))positives.incrementAndGet();if("provider".equals(p.optString("event"))){JSONObject data=p.optJSONObject("data");if(data!=null&&LyricsCatalog.hasLyricsPayload(p))providers.add(data.optString("provider"));}}
  public void health(JSONObject p){health.set(p);}public void notice(String message,boolean finished){if(finished)done.countDown();}
 })){
  if(!done.await(95,TimeUnit.SECONDS))throw new IllegalStateException("Live catalog timed out");
  JSONObject state=health.get();boolean passed=providers.containsAll(Set.of("golyrics","lrclib","musixmatch","qq","kugou","binimum"))&&state!=null&&state.getInt("pending")==0&&!state.getBoolean("connectionNeeded");
  System.out.println("RESULT "+new JSONObject().put("passed",passed).put("backendProviders",new JSONArray(providers)).put("positivePayloads",positives.get()).put("health",state).put("actualJavaHttpTransport",true).put("androidStorageSimulated",true).put("phoneVerified",false));
 }
}}
'''
files=[]
for n,s in stubs.items():
    p=work/'stubs'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
src=h/'Personal-Patches/extensions/music/src/main/java';actual=[src/'app/bdcrusher/ytmusic/lyrics'/n for n in ('LyricsCatalog.java','LyricsNetwork.java','LyricsLookup.java','LyricsRetry.java','TokenExpiry.java')]+[src/'app/morphe/extension/music/patches/lyrics/model/TrackInfo.java']
jar=next((h/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=work/'classes';out.mkdir()
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',str(jar),'-d',str(out),*map(str,files+actual)],cwd=work,env=env,check=True)
class Handler(BaseHTTPRequestHandler):
    def log_message(self,*args):pass
    def do_POST(self):
        length=int(self.headers.get('Content-Length','0'))
        if self.path!='/check' or not 0<length<=10000:self.send_error(400);return
        request=json.loads(self.rfile.read(length));jwt=request.get('jwt','')
        if not isinstance(jwt,str) or not 0<len(jwt)<=8192 or '\n' in jwt:self.send_error(400);return
        result=subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',str(out)+os.pathsep+str(jar),'app.bdcrusher.ytmusic.lyrics.CatalogCheck'],input=jwt+'\n',cwd=work,env=env,capture_output=True,text=True,encoding='utf-8',timeout=105)
        lines=[line[7:] for line in result.stdout.splitlines() if line.startswith('RESULT ')]
        data=json.loads(lines[-1]) if result.returncode==0 and lines else {'passed':False,'reason':'Actual Java transport did not complete; no credential output retained'}
        data['actualSourceSha256']={str(p.relative_to(src)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual}
        (work/'verification.json').write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8')
        body=json.dumps(data).encode();self.send_response(200);self.send_header('Content-Type','application/json');self.send_header('Content-Length',str(len(body)));self.end_headers();self.wfile.write(body)
with HTTPServer(('127.0.0.1',8767),Handler) as server:
    server.timeout=90;print('READY: one-shot actual Java source check; credentials stay in memory',flush=True);server.handle_request()
