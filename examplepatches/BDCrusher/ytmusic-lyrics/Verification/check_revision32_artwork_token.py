"""Actual normal artwork-token lifetime/single-flight flow with service/JS solver boundaries simulated."""
from pathlib import Path
import ast,hashlib,json,os,subprocess
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision32-artwork-token-r1';w.mkdir(exist_ok=False)
stubs={
'android/content/Context.java':'package android.content;public class Context{public Context getApplicationContext(){return this;}}',
'android/content/SharedPreferences.java':'''package android.content;public class SharedPreferences{public static String token="",other="keep private settings";public String getString(String k,String d){return k.equals("artworkToken")?token:d;}public Editor edit(){return new Editor();}public static class Editor{public Editor putString(String k,String v){if(k.equals("artworkToken"))token=v;return this;}public void apply(){}}}''',
'android/util/Base64.java':'package android.util;public class Base64{public static final int URL_SAFE=8;public static byte[] decode(String s,int f){return java.util.Base64.getUrlDecoder().decode(s);}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now;public static long elapsedRealtime(){return now;}}',
'android/os/Looper.java':'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/Handler.java':'package android.os;public class Handler{public static long last;public Handler(Looper l){}public void post(Runnable r){r.run();}public void postDelayed(Runnable r,long delay){last=delay;}public void removeCallbacks(Runnable r){}}',
'app/bdcrusher/ytmusic/shaders/ShaderRuntime.java':'package app.bdcrusher.ytmusic.shaders;class ShaderRuntime{static boolean visible=true;static int proofId;static boolean active(){return visible;}static boolean requestProof(int id,org.json.JSONObject challenge){proofId=id;return true;}}',
'app/bdcrusher/ytmusic/shaders/ArtworkRepository.java':'''package app.bdcrusher.ytmusic.shaders;import org.json.*;class ArtworkRepository{static final String API="https://artwork.boidu.dev";static final java.util.concurrent.ExecutorService io=java.util.concurrent.Executors.newSingleThreadExecutor();static int challenges,mints;static boolean fail;static JSONObject minted,body;static android.content.SharedPreferences preferences(android.content.Context c){return new android.content.SharedPreferences();}static JSONObject request(String url,String method,JSONObject value,String auth)throws Exception{if(auth!=null)throw new AssertionError("mint flow must not borrow credentials");if(fail)throw new java.io.IOException("fixture");if(url.endsWith("/challenge")){challenges++;return new JSONObject().put("fixture","normal challenge");}if(!url.endsWith("/mint")||!method.equals("POST"))throw new AssertionError("wrong mint endpoint");mints++;body=value;return minted;}}''',
'app/bdcrusher/ytmusic/shaders/TokenCheck.java':r'''package app.bdcrusher.ytmusic.shaders;
import org.json.*;import java.util.concurrent.*;
public class TokenCheck{
 static int checks;static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS: "+why);}
 static String token(double iat,double exp)throws Exception{return "fixture."+java.util.Base64.getUrlEncoder().withoutPadding().encodeToString(new JSONObject().put("iat",iat).put("exp",exp).toString().getBytes(java.nio.charset.StandardCharsets.UTF_8))+".fixture";}
 static void flush()throws Exception{ArtworkRepository.io.submit(()->{}).get(5,TimeUnit.SECONDS);}
 public static void main(String[] args)throws Exception{
  var c=new android.content.Context();double now=System.currentTimeMillis()/1000.0;
  android.content.SharedPreferences.token="malformed";check(ArtworkToken.usable(c)==null,"malformed token is unusable");android.content.SharedPreferences.token=token(now-2000,now-1);check(ArtworkToken.usable(c)==null,"expired token is not replayed");
  String valid=token(now-1000,now+1000);android.content.SharedPreferences.token=valid;ArtworkToken.ensure(c);flush();check(ArtworkRepository.challenges==0&&valid.equals(ArtworkToken.usable(c)),"valid token remains usable before renewal boundary");check(android.os.Handler.last>=599000&&android.os.Handler.last<=600100,"renewal timer uses exactly eighty percent of token lifetime");
  String renewing=token(now-5000,now+1000);android.content.SharedPreferences.token=renewing;for(int i=0;i<20;i++)ArtworkToken.ensure(c);flush();check(ArtworkRepository.challenges==1&&ShaderRuntime.proofId>0,"concurrent requests share one normal challenge operation");check(renewing.equals(ArtworkToken.usable(c)),"renewal does not discard the still-valid token");
  int id=ShaderRuntime.proofId;ArtworkRepository.minted=new JSONObject().put("token",token(now,now+3600));ArtworkToken.proof(c,id+1,"{}");flush();check(ArtworkRepository.mints==0,"stale solver callbacks cannot mint authorization");
  ArtworkToken.proof(c,id,"{\"fixture\":\"normal solver response\"}");flush();check(ArtworkRepository.mints==1&&ArtworkRepository.body.has("challenge")&&ArtworkRepository.body.has("solution"),"normal mint endpoint receives original challenge and solver result");
  check(!renewing.equals(ArtworkToken.usable(c))&&ArtworkToken.usable(c)!=null,"successful renewal atomically replaces authorization");check(android.content.SharedPreferences.other.equals("keep private settings"),"renewal preserves unrelated private settings");ArtworkToken.proof(c,id,"{}");flush();check(ArtworkRepository.mints==1,"duplicate completion cannot mint a second token");
  ShaderRuntime.visible=false;android.content.SharedPreferences.token="";android.os.SystemClock.now=400000;ArtworkToken.ensure(c);flush();check(ArtworkRepository.challenges==1&&android.os.Handler.last==60000,"hidden app defers verification without losing its next check");
  java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),new JSONObject().put("checks",checks).put("passed",true).put("serviceAndSolverSimulated",true).put("normalVerificationPreserved",true).toString(2));System.exit(0);
 }
}'''
}
files=[]
for n,s in stubs.items():
 p=w/'stubs'/n;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(s,encoding='utf-8');files.append(p)
actual=h/'Personal-Patches/extensions/music/src/main/java/app/bdcrusher/ytmusic/shaders/ArtworkToken.java';files.append(actual);jar=next((h/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=w/'classes';out.mkdir();cp=os.pathsep.join(map(str,[out,jar]));env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(out),*map(str,files)],cwd=w,env=env,check=True)
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(h/'BuildCache/Home'),'-Djava.io.tmpdir='+str(h/'BuildCache/Temp'),'-cp',cp,'app.bdcrusher.ytmusic.shaders.TokenCheck',str(w/'verification.json')],cwd=w,env=env,check=True,timeout=20)
d=json.loads((w/'verification.json').read_text(encoding='utf-8'));d['sourceSha256']=hashlib.sha256(actual.read_bytes()).hexdigest();(w/'verification.json').write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8')
