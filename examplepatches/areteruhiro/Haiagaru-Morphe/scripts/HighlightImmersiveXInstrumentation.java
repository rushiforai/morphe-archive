package app.haiagaru.tests.highlightimmersive;
import android.app.*;import android.content.*;import android.content.pm.ActivityInfo;import android.content.res.Configuration;import android.os.*;import android.view.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;import org.json.*;
public final class HighlightImmersiveXInstrumentation extends Instrumentation {
 int checks;void ok(boolean value,String why){if(!value)throw new AssertionError(why);checks++;}
 Method method(Class<?> t,String n,Class<?>...p)throws Exception{Method m=t.getDeclaredMethod(n,p);m.setAccessible(true);return m;}
 <T>T main(Callable<T> callable)throws Exception{FutureTask<T> task=new FutureTask<>(callable);runOnMainSync(task);return task.get(10,TimeUnit.SECONDS);}
 public void onCreate(Bundle b){super.onCreate(b);start();}
 public void onStart(){Bundle out=new Bundle();Activity activity=null;try{
  Context app=getTargetContext();ok(app.getPackageName().endsWith("reporter242"),"isolated242");ClassLoader loader=app.getClassLoader();Class<?> preview=loader.loadClass("app.morphe.extension.chmate.XPostPreview");Method parse=method(preview,"parse",String.class,String.class);String prefix="{\"id_str\":\"123\",\"user\":{\"name\":\"name\",\"screen_name\":\"tester\"},";
  String full="あ".repeat(140);Object clipped=parse.invoke(null,prefix+"\"text\":\""+full+"\",\"truncated\":true}","123");Method notice=method(clipped.getClass(),"notice",boolean.class);ok(((String)notice.invoke(clipped,true)).contains("一部のみ"),"explicit upstream truncation labelled");
  Object uncertain=parse.invoke(null,prefix+"\"text\":\""+full+"\"}","123");ok(((String)notice.invoke(uncertain,true)).contains("可能性"),"clean ending at140 does not imply complete");
  Object same=parse.invoke(null,prefix+"\"text\":\""+full+"\",\"full_text\":\""+full+"\",\"truncated\":true}","123");ok(((String)notice.invoke(same,true)).contains("一部のみ"),"identical full_text cannot hide explicit upstream truncation");
  Object recovered=parse.invoke(null,prefix+"\"text\":\"short\",\"truncated\":true,\"full_text\":\""+full+"続き\"}","123");ok(((String)notice.invoke(recovered,true)).isEmpty(),"provided full text removes truncation warning");ok(((String)notice.invoke(recovered,false)).contains("140文字"),"local excerpt labelled");
  Object shortPost=parse.invoke(null,prefix+"\"text\":\"短い完全な文。\"}","123");ok(((String)notice.invoke(shortPost,true)).isEmpty(),"short post no false warning");
  Class<?> h=loader.loadClass("app.morphe.extension.chmate.Haiagaru");Field context=h.getDeclaredField("applicationContext");context.setAccessible(true);Object old=context.get(null);context.set(null,app);
  Class<?> highlight=loader.loadClass("app.morphe.extension.chmate.PosterHighlight");Field hc=highlight.getDeclaredField("context");hc.setAccessible(true);Object oldHighlight=hc.get(null);SharedPreferences temporary=app.getSharedPreferences("test.highlight-expiry",0);temporary.edit().clear().commit();
  Context isolated=new ContextWrapper(app){public Context getApplicationContext(){return this;}public SharedPreferences getSharedPreferences(String n,int m){return temporary;}};
  try{
   hc.set(null,isolated);long now=System.currentTimeMillis();JSONArray rules=new JSONArray();
   rules.put(new JSONObject().put("kind",1).put("scope",2).put("target","").put("value","expired").put("expiresAt",now-1));
   rules.put(new JSONObject().put("kind",1).put("scope",2).put("target","").put("value","permanent"));
   rules.put(new JSONObject().put("kind",2).put("scope",2).put("target","").put("value","temporary").put("expiresAt",now+1200));
   temporary.edit().putString("rules",rules.toString()).putBoolean("enabled",true).commit();Method reload=method(highlight,"reload");main(()->{reload.invoke(null);return null;});
   ok(new JSONArray(temporary.getString("rules","[]")).length()==2,"expired saved registration removed on reload");
   Thread.sleep(1700);JSONArray remaining=new JSONArray(temporary.getString("rules","[]"));ok(remaining.length()==1&&remaining.getJSONObject(0).getString("value").equals("permanent"),"deadline removes registration automatically while preserving legacy rules");
  }finally{hc.set(null,oldHighlight);if(oldHighlight!=null)main(()->{method(highlight,"reload").invoke(null);return null;});temporary.edit().clear().commit();}
  SharedPreferences prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);String[] keys={"videoViewerEnabled","videoLandscapeImmersive","videoAutoplay"};Map<String,?> before=prefs.getAll();
  try{
   prefs.edit().putBoolean(keys[0],true).putBoolean(keys[1],true).putBoolean(keys[2],false).commit();
   activity=startActivitySync(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.VideoViewerActivity").setData(android.net.Uri.parse("https://cdn.imgpile.com/f/O5cw4e6.mp4")).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Activity player=activity;
   main(()->{player.setShowWhenLocked(true);player.setTurnScreenOn(true);player.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);return null;});
   boolean landscape=false;int flags=0;for(int i=0;i<40&&!landscape;i++){Thread.sleep(150);landscape=main(()->player.getResources().getConfiguration().orientation==Configuration.ORIENTATION_LANDSCAPE&&(player.getWindow().getDecorView().getSystemUiVisibility()&View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY)!=0);}
   flags=main(()->player.getWindow().getDecorView().getSystemUiVisibility());ok(landscape,"rotated resources and immersive flag: "+flags);ok((flags&View.SYSTEM_UI_FLAG_FULLSCREEN)!=0,"landscape fullscreen flag");
   main(()->{player.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);return null;});boolean portrait=false;for(int i=0;i<40&&!portrait;i++){Thread.sleep(150);portrait=main(()->player.getResources().getConfiguration().orientation==Configuration.ORIENTATION_PORTRAIT&&(player.getWindow().getDecorView().getSystemUiVisibility()&View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY)==0);}ok(portrait,"portrait restores ordinary system UI");
  }finally{if(activity!=null){Activity a=activity;main(()->{a.finish();return null;});activity=null;}SharedPreferences.Editor edit=prefs.edit();for(String key:keys){Object v=before.get(key);if(v instanceof Boolean)edit.putBoolean(key,(Boolean)v);else edit.remove(key);}edit.commit();context.set(null,old);}
  out.putString("result","PASS "+checks+" truncation and actual viewer rotation checks");finish(Activity.RESULT_OK,out);
 }catch(Throwable e){out.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,out);}finally{if(activity!=null){Activity a=activity;runOnMainSync(a::finish);}}}
}
