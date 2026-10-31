"""Fresh public-provider regressions through actual Java Catalog/Network; no token stored or bypassed."""
from pathlib import Path
import ast,hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision32-live-final';w.mkdir(exist_ok=False)
tree=ast.parse((h/'Verification/check_revision32_recovery.py').read_text(encoding='utf-8'))
base=ast.parse((h/'Verification/check_catalog_transport.py').read_text(encoding='utf-8'))
stubs=ast.literal_eval(next(n.value for n in base.body if isinstance(n,ast.Assign) and any(isinstance(t,ast.Name) and t.id=='stubs' for t in n.targets)))
updates=next(n for n in ast.walk(tree) if isinstance(n,ast.Call) and isinstance(n.func,ast.Attribute) and n.func.attr=='update').args[0]
stubs.update(ast.literal_eval(updates));stubs.pop('app/bdcrusher/ytmusic/lyrics/RecoveryCheck.java');stubs.pop('app/bdcrusher/ytmusic/lyrics/CatalogCheck.java');stubs.pop('app/bdcrusher/ytmusic/lyrics/LyricsNetwork.java')
stubs['app/bdcrusher/ytmusic/lyrics/LyricsDiskCache.java']=stubs['app/bdcrusher/ytmusic/lyrics/LyricsDiskCache.java'].replace('org.json.JSONObject get(String k){return null;}','org.json.JSONObject get(String k){return null;}org.json.JSONObject migrate(String k){return null;}')
stubs['android/net/NetworkCapabilities.java']=stubs['android/net/NetworkCapabilities.java'].replace('NET_CAPABILITY_INTERNET=12;','NET_CAPABILITY_INTERNET=12,NET_CAPABILITY_VALIDATED=16;')
stubs['app/bdcrusher/ytmusic/lyrics/LyricsConfig.java']='package app.bdcrusher.ytmusic.lyrics;class LyricsConfig{static android.content.SharedPreferences preferences(android.content.Context c){return new android.content.SharedPreferences();}static boolean brokerEnabled(android.content.Context c){return true;}static boolean enabled(android.content.Context c,String... keys){return true;}}'
stubs['app/bdcrusher/ytmusic/lyrics/LiveCheck.java']=r'''package app.bdcrusher.ytmusic.lyrics;
import java.util.concurrent.*;import java.util.concurrent.atomic.*;import org.json.*;
public class LiveCheck{
 public static void main(String[] args)throws Exception{
  android.content.SharedPreferences.jwt="";if(LyricsNetwork.retryAfter("172800")!=172800000||LyricsNetwork.retryAfter("9223372036854775807")!=Long.MAX_VALUE)throw new AssertionError("Retry-After was shortened");
  String[][] cases={{"sN_tJ8d3c0I","Wake Up","Imagine Dragons","LOOM","167","bLyrics-richsynced"},{"MYal8NoVQXs","Love Me Dead (Female Cover)","CottontailVA Music","","0","unison"},{"gF2KuOJLEQE","Man Areas","Jonny McGovern","","0","lrclib-synced"}};JSONArray reports=new JSONArray();
  for(String[] item:cases){CountDownLatch ready=new CountDownLatch(1);AtomicReference<JSONObject> found=new AtomicReference<>();
   try(var catalog=new LyricsCatalog(new android.content.Context(),new app.morphe.extension.music.patches.lyrics.model.TrackInfo(item[1],item[2],item[3],Integer.parseInt(item[4])),item[0],true,new LyricsCatalog.Sink(){public void notice(String message,boolean done){}public void result(JSONObject p){if(item[5].equals(p.optString("key"))||item[5].equals(p.optString("kind"))){found.set(p);ready.countDown();}}})){
    boolean loaded=ready.await(45,TimeUnit.SECONDS);JSONObject p=found.get();int length=0;if(p!=null)length=p.has("raw")?p.optString("raw").length():p.getJSONObject("data").getJSONObject("data").getString("lyrics").length();
    reports.put(new JSONObject().put("videoId",item[0]).put("source",item[5]).put("loaded",loaded).put("characters",length).put("exactRecording",p!=null&&p.optBoolean("recordingMatched")));
    System.out.println("LIVE: "+item[0]+" "+item[5]+" loaded="+loaded+" characters="+length);
   }
  }
  boolean pass=true;for(int i=0;i<reports.length();i++)pass&=reports.getJSONObject(i).getBoolean("loaded");java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),new JSONObject().put("passed",pass).put("cases",reports).put("actualJavaHttpTransport",true).put("credentialsPersisted",false).put("phoneVerified",false).toString(2));System.exit(pass?0:1);
 }
}'''
files=[]
for n,s in stubs.items():
 p=w/'stubs'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
src=h/'Personal-Patches/extensions/music/src/main/java';actual=[src/'app/bdcrusher/ytmusic/lyrics'/n for n in ['LyricsCatalog.java','LyricsNetwork.java','LyricsLookup.java','LyricsRetry.java']]+[src/'app/morphe/extension/music/patches/lyrics/model/TrackInfo.java'];files+=actual
jar=next((h/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=w/'classes';out.mkdir();cp=os.pathsep.join(map(str,[out,jar]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(out),*map(str,files)],cwd=w,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',cp,'app.bdcrusher.ytmusic.lyrics.LiveCheck',str(w/'verification.json')],cwd=w,env=env,check=True,timeout=150)
d=json.loads((w/'verification.json').read_text(encoding='utf-8'));d['sourceSha256']={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in actual};(w/'verification.json').write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8')
