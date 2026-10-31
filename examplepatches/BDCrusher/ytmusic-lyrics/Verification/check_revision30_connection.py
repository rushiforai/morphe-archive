"""Actual verification lifecycle with deterministic Android/browser boundaries, not device acceptance."""
from pathlib import Path
import hashlib,json,os,subprocess
home=Path(__file__).resolve().parents[1]
work=home/'Verification/revision30-connection-final2';assert not work.exists();work.mkdir()
stubs={
'android/content/ContextWrapper.java':'package android.content;public class ContextWrapper extends Context{Context base;public ContextWrapper(Context c){base=c;}public Context getBaseContext(){return base;}}',
'android/annotation/SuppressLint.java':'package android.annotation;public @interface SuppressLint{String[] value();}',
'android/content/Context.java':'package android.content;public class Context{public android.content.res.Resources getResources(){return new android.content.res.Resources();}}',
'android/content/res/Resources.java':'package android.content.res;public class Resources{public Metrics getDisplayMetrics(){return new Metrics();}public static class Metrics{public float density=1;}}',
'android/content/SharedPreferences.java':'''package android.content;public class SharedPreferences{public String jwt="";public String getString(String k,String d){return jwt;}public Editor edit(){return new Editor();}public class Editor{public Editor putString(String k,String v){jwt=v;return this;}public void apply(){}}}''',
'android/os/Looper.java':'package android.os;public class Looper{public static Looper getMainLooper(){return new Looper();}}',
'android/os/SystemClock.java':'package android.os;public class SystemClock{public static long now=1;public static long elapsedRealtime(){return now;}}',
'android/os/Handler.java':'''package android.os;import java.util.*;public class Handler{record Job(long at,Runnable r){}static List<Job> jobs=new ArrayList<>();public Handler(Looper l){}public void postDelayed(Runnable r,long delay){jobs.add(new Job(SystemClock.now+delay,r));}public void removeCallbacks(Runnable r){jobs.removeIf(j->j.r==r);}public static void advance(long delta){long end=SystemClock.now+delta;int guard=0;while(true){Job j=jobs.stream().filter(x->x.at<=end).min(Comparator.comparingLong(Job::at)).orElse(null);if(j==null)break;if(++guard>2000)throw new AssertionError("runaway handler");jobs.remove(j);SystemClock.now=j.at;j.r.run();}SystemClock.now=end;}}''',
'android/view/View.java':'''package android.view;public class View{public static final int IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS=4,IMPORTANT_FOR_ACCESSIBILITY_AUTO=0;public Object parent;public float alpha=1;public Object getParent(){return parent;}public void setAlpha(float a){alpha=a;}public void setFocusable(boolean b){}public void setFocusableInTouchMode(boolean b){}public void setImportantForAccessibility(int v){}public void setMinimumHeight(int h){}}''',
'android/view/ViewGroup.java':'''package android.view;import java.util.*;public class ViewGroup extends View{public List<View> children=new ArrayList<>();public void addView(View v,LayoutParams p){children.add(v);v.parent=this;}public void removeView(View v){children.remove(v);v.parent=null;}public static class LayoutParams{public LayoutParams(int w,int h){}}}''',
'android/view/Window.java':'package android.view;public class Window{public ViewGroup decor=new ViewGroup();public View getDecorView(){return decor;}}',
'android/app/Activity.java':'package android.app;public class Activity extends android.content.Context{public boolean finishing,destroyed,focus=true;public android.view.Window window=new android.view.Window();public boolean isFinishing(){return finishing;}public boolean isDestroyed(){return destroyed;}public boolean hasWindowFocus(){return focus;}public android.view.Window getWindow(){return window;}}',
'android/app/AlertDialog.java':'''package android.app;public class AlertDialog{public static int shown;public interface Dismiss{void dismiss(Object d);}Dismiss listener;public void setOnDismissListener(Dismiss l){listener=l;}public void dismiss(){if(listener!=null)listener.dismiss(this);}public void show(){shown++;}public static class Builder{public Builder(android.content.Context c){}public Builder setTitle(String s){return this;}public Builder setMessage(String s){return this;}public Builder setView(android.view.View v){return this;}public Builder setNegativeButton(String s,Object o){return this;}public AlertDialog create(){return new AlertDialog();}}}''',
'android/net/Uri.java':'package android.net;public class Uri{String s;public Uri(String s){this.s=s;}public String getScheme(){return java.net.URI.create(s).getScheme();}public String getHost(){return java.net.URI.create(s).getHost();}public String toString(){return s;}}',
'android/webkit/WebResourceRequest.java':'package android.webkit;public interface WebResourceRequest{android.net.Uri getUrl();boolean isForMainFrame();}',
'android/webkit/RenderProcessGoneDetail.java':'package android.webkit;public class RenderProcessGoneDetail{}',
'android/webkit/WebViewClient.java':'package android.webkit;public class WebViewClient{public boolean shouldOverrideUrlLoading(WebView v,WebResourceRequest r){return false;}public boolean onRenderProcessGone(WebView v,RenderProcessGoneDetail d){return false;}public void onPageFinished(WebView v,String url){}}',
'android/webkit/CookieManager.java':'package android.webkit;public class CookieManager{public static CookieManager getInstance(){return new CookieManager();}public void setAcceptThirdPartyCookies(WebView w,boolean b){}}',
'android/webkit/WebView.java':'''package android.webkit;public class WebView extends android.view.View{public static int created,destroyed;public static WebView last;public String result="{\\\"waiting\\\":true}",url,probe;public int loads;public WebViewClient client;public WebView(android.content.Context c){created++;last=this;}public void setWebViewClient(WebViewClient c){client=c;}public String getUrl(){return url;}public void loadUrl(String s){url=s;loads++;}public void evaluateJavascript(String s,java.util.function.Consumer<String> callback){probe=s;callback.accept(org.json.JSONObject.quote(result));}public void stopLoading(){}public void destroy(){destroyed++;}public Settings getSettings(){return new Settings();}public static class Settings{public void setJavaScriptEnabled(boolean b){}public void setDomStorageEnabled(boolean b){}public void setAllowFileAccess(boolean b){}public void setAllowContentAccess(boolean b){}}}''',
'android/widget/Toast.java':'package android.widget;public class Toast{public static final int LENGTH_LONG=1;public static Toast makeText(android.content.Context c,String s,int n){return new Toast();}public void show(){}}',
'app/bdcrusher/ytmusic/lyrics/LyricsConfig.java':'package app.bdcrusher.ytmusic.lyrics;public class LyricsConfig{static android.content.SharedPreferences p=new android.content.SharedPreferences();static android.content.SharedPreferences preferences(android.content.Context c){return p;}}',
'app/bdcrusher/ytmusic/lyrics/LyricsNetwork.java':'package app.bdcrusher.ytmusic.lyrics;final class LyricsNetwork{static final String BROKER="https://lyrics.api.dacubeking.com/";}',
'app/bdcrusher/ytmusic/lyrics/LyricsDiagnostics.java':'package app.bdcrusher.ytmusic.lyrics;public class LyricsDiagnostics{static void record(String s,String m){System.out.println(s+": "+m);}}',
'app/bdcrusher/ytmusic/lyrics/ConnectionCheck.java':r'''package app.bdcrusher.ytmusic.lyrics;
import android.app.*;import android.os.*;import android.webkit.*;import org.json.*;
public class ConnectionCheck{
 static int checks;static long now=System.currentTimeMillis()/1000;
 static void check(boolean b,String m){if(!b)throw new AssertionError(m);checks++;System.out.println("PASS: "+m);}
 static String jwt(long exp){return "local."+java.util.Base64.getUrlEncoder().withoutPadding().encodeToString(("{\"exp\":"+exp+"}").getBytes(java.nio.charset.StandardCharsets.UTF_8))+".fixture";}
 static void cooldown(){Handler.advance(300001);}
 public static void main(String[] args)throws Exception{
  check(!TokenExpiry.needsRenewal(jwt(now+3601),now),"outside one-hour boundary reuses valid token");
  check(TokenExpiry.needsRenewal(jwt(now+3600),now)&&!TokenExpiry.expired(jwt(now+3600),now),"exactly one hour renews without expiring existing token");
  check(!TokenExpiry.expired(jwt(now+1),now)&&TokenExpiry.expired(jwt(now),now),"expiry follows actual exp time");
  for(String bad:new String[]{"","bad","a.e30.b","a.%%%%.b","x".repeat(8193)})check(TokenExpiry.needsRenewal(bad,now)&&TokenExpiry.expired(bad,now),"invalid or missing token requires ordinary verification");
  Activity activity=new Activity();LyricsConfig.p.jwt=jwt(now+7200);ServiceConnection.ensure(activity);check(WebView.created==0,"healthy token creates no verification WebView");
  LyricsConfig.p.jwt=jwt(now+3500);String old=LyricsConfig.p.jwt;ServiceConnection.ensure(activity);WebView first=WebView.last;
  check(WebView.created==1&&AlertDialog.shown==0&&first.alpha==0&&activity.window.decor.children.size()==1,"near-expiry verification runs without a dialog");
  ServiceConnection.ensure(activity);check(WebView.created==1,"automatic verification is single flight");
  Handler.advance(750);check(LyricsConfig.p.jwt.equals(old),"valid existing token is preserved while verification is pending");
  check(first.probe.contains("credentials:'include'")&&first.probe.contains("fetch('/verify-turnstile'")&&!first.probe.contains("JavascriptInterface"),"exchange preserves same-origin browser cookies without a native bridge");
  first.result=new JSONObject().put("jwt",jwt(now+10000)).put("status",200).toString();Handler.advance(750);
  check(!LyricsConfig.p.jwt.equals(old)&&WebView.destroyed==1&&activity.window.decor.children.isEmpty(),"successful renewal replaces token and removes hidden WebView");
  cooldown();LyricsConfig.p.jwt=jwt(now+3000);ServiceConnection.ensure(activity);WebView failed=WebView.last;failed.result="{\"status\":403}";Handler.advance(750);
  check(LyricsConfig.p.jwt.equals(jwt(now+3000))&&failed.loads==1,"rejected verification retains the still-valid token without denial retries");
  int before=WebView.created;ServiceConnection.ensure(activity);check(WebView.created==before,"automatic failure backs off across repeated playback callbacks");
  cooldown();LyricsConfig.p.jwt="";ServiceConnection.ensure(activity);WebView retries=WebView.last;retries.result="{\"status\":503}";Handler.advance(15000);
  check(retries.loads==3&&WebView.destroyed==3,"temporary verification failures use at most three fresh challenges");
  cooldown();ServiceConnection.ensure(activity);WebView interactive=WebView.last;ServiceConnection.show(new android.content.ContextWrapper(activity));
  check(WebView.last==interactive&&AlertDialog.shown==1&&interactive.alpha==1,"Connect sources reveals the same in-flight challenge");
  ServiceConnection.cancel();check(WebView.destroyed==4,"cancel destroys the challenge and scheduled work");
  cooldown();ServiceConnection.ensure(activity);activity.destroyed=true;Handler.advance(750);check(WebView.destroyed==5,"destroyed activity releases verification session");
  cooldown();activity.destroyed=false;activity.focus=false;before=WebView.created;ServiceConnection.ensure(activity);check(WebView.created==before,"automatic challenge waits for an active foreground host");
  activity.focus=true;ServiceConnection.ensure(activity);WebView timeout=WebView.last;timeout.result="{\"waiting\":true}";Handler.advance(121000);
  check(WebView.destroyed==6&&activity.window.decor.children.isEmpty(),"unresolved interactive challenge times out without blocking lyrics");
  WebResourceRequest blocked=new WebResourceRequest(){public android.net.Uri getUrl(){return new android.net.Uri("https://example.invalid/");}public boolean isForMainFrame(){return true;}};
  check(timeout.client.shouldOverrideUrlLoading(timeout,blocked),"remote verification cannot navigate to unrelated origins");
  WebResourceRequest blank=new WebResourceRequest(){public android.net.Uri getUrl(){return new android.net.Uri("about:srcdoc");}public boolean isForMainFrame(){return false;}};
  check(!timeout.client.shouldOverrideUrlLoading(timeout,blank),"ordinary challenge srcdoc subframes remain allowed");

  for(int status:new int[]{408,429,500,502,503,504})check(LyricsRetry.delay(new LyricsNetwork.HttpFailure(status),1)==750,"transient HTTP status retries: "+status);
  for(int status:new int[]{400,401,403,404,501})check(LyricsRetry.delay(new LyricsNetwork.HttpFailure(status),1)<0,"permanent HTTP status does not retry: "+status);
  check(LyricsRetry.delay(new java.net.SocketTimeoutException(),2)==2000&&LyricsRetry.delay(new java.net.SocketTimeoutException(),3)<0,"timeouts stop after three total attempts");
  check(LyricsRetry.delay(new LyricsNetwork.HttpFailure(429,"5"),1)==5000&&LyricsRetry.delay(new LyricsNetwork.HttpFailure(429,"60"),1)<0,"Retry-After controls delay and forbids early long-backoff retry");
  check(LyricsRetry.delay(new javax.net.ssl.SSLException("fixture"),1)<0&&LyricsRetry.delay(new LyricsNetwork.PayloadLimit(),1)<0&&LyricsRetry.delay(new org.json.JSONException("fixture"),1)<0,"TLS, payload limits and parsing failures do not retry");
  check(LyricsNetwork.retryAfter("-1")==0&&LyricsNetwork.retryAfter("2")==2000&&LyricsNetwork.retryAfter("bad")==0,"numeric Retry-After parsing is bounded and rejects invalid values");
  check(LyricsNetwork.retryAfter(java.time.ZonedDateTime.now(java.time.ZoneOffset.UTC).plusSeconds(20).format(java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME))>18000,"HTTP-date Retry-After is honored");
  java.nio.file.Files.writeString(java.nio.file.Path.of(args[0]),new JSONObject().put("passed",true).put("checks",checks).put("browserAndAndroidSimulated",true).put("phoneVerified",false).toString(2));
 }
}'''
}
del stubs['app/bdcrusher/ytmusic/lyrics/LyricsNetwork.java']
files=[]
for name,content in stubs.items():
    p=work/'stubs'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf-8');files.append(p)
src=home/'Personal-Patches/extensions/music/src/main/java'
actual=[src/'app/bdcrusher/ytmusic/lyrics'/n for n in ('TokenExpiry.java','ServiceConnection.java','SourceVerification.java','LyricsNetwork.java','LyricsRetry.java')]
jar=next((home/'BuildCache').glob('**/org.json/json/20231013/*/json-20231013.jar'))
java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');out=work/'classes';out.mkdir()
env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(home/'BuildCache/Temp'),TEMP=str(home/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',str(jar),'-d',str(out),*map(str,files+actual)],cwd=work,env=env,check=True)
report=work/'verification.json'
subprocess.run([str(java/'java.exe'),'-Duser.home='+str(home/'BuildCache/Home'),'-Djava.io.tmpdir='+str(home/'BuildCache/Temp'),'-cp',str(out)+os.pathsep+str(jar),'app.bdcrusher.ytmusic.lyrics.ConnectionCheck',str(report)],cwd=work,env=env,check=True)
d=json.loads(report.read_text());d['actualSourceSha256']={str(p.relative_to(src)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual}
report.write_text(json.dumps(d,indent=2)+'\n',encoding='utf-8')
