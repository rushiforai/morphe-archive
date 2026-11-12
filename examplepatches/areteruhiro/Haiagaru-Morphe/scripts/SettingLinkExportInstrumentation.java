package app.haiagaru.tests.opentabs;
import app.haiagaru.tests.sites.FixtureTabSandbox;
import android.app.*;import android.content.*;import android.os.*;import android.net.Uri;import android.text.*;import android.text.style.URLSpan;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;import java.io.*;import org.json.*;

/** Export names and link strings only, never values entered into setting fields. */
public final class SettingLinkExportInstrumentation extends Instrumentation {
 private FixtureTabSandbox fixtureTabs;
 private Context app;private ClassLoader loader;private Activity host;private SharedPreferences prefs;private String previousLanguage;private boolean languagePresent;
 private Object call(String type,String name,Class<?>[] sig,Object...args)throws Exception{Method m=loader.loadClass("app.morphe.extension.chmate."+type).getDeclaredMethod(name,sig);m.setAccessible(true);return m.invoke(null,args);}
 private <T>T main(Callable<T> fn)throws Exception{FutureTask<T> f=new FutureTask<>(fn);runOnMainSync(f);return f.get(30,TimeUnit.SECONDS);}
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle out=new Bundle();int status=Activity.RESULT_CANCELED;try{
  app=getTargetContext();loader=app.getClassLoader();if(!app.getPackageName().matches(".*\\.reporter(191|226|242)"))throw new SecurityException("test packages only");
  Field pf=loader.loadClass("app.morphe.extension.chmate.WacchoiSearchOptions").getDeclaredField("PREFS");pf.setAccessible(true);prefs=app.getSharedPreferences((String)pf.get(null),0);languagePresent=prefs.contains("settingsLanguage");previousLanguage=prefs.getString("settingsLanguage","ja");prefs.edit().putString("settingsLanguage","ja").commit();
  fixtureTabs=new FixtureTabSandbox(app);
  app.startActivity(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(1500);
  for(int n=0;n<30&&host==null;n++){host=main(()->(Activity)call("Haiagaru","toolbarActivity",new Class<?>[]{Object.class},new Object[]{null}));if(host==null)Thread.sleep(1000);}if(host==null)throw new AssertionError("host not resumed");
  JSONArray rows=new JSONArray();Class<?> request=loader.loadClass("app.morphe.extension.chmate.SettingLinkRequest");int actions=0;
  for(String category:new String[]{"GENERAL","DISPLAY","POSTING","ADVANCED","CHECKER","MEDIA","SOCIAL","NG","ARCHIVE","HISTORY","BACKUP","UPLOAD","EXPERT"}){
   List<?> entries=main(()->(List<?>)call("SettingLinkCatalog","category",new Class<?>[]{Activity.class,String.class},host,category));
   for(Object entry:entries){Class<?> type=entry.getClass();String label=(String)type.getField("label").get(entry);boolean toggle=(Boolean)type.getMethod("toggle").invoke(entry);boolean available=main(()->(Boolean)type.getMethod("available").invoke(entry));
    JSONObject item=new JSONObject().put("category",category).put("categoryTitle",call("SettingLinkRequest","categoryTitle",new Class<?>[]{String.class},category)).put("label",label).put("toggle",toggle).put("available",available);JSONObject links=new JSONObject();
    for(Boolean value:toggle?new Boolean[]{null,Boolean.TRUE,Boolean.FALSE}:new Boolean[]{null}){
     Object link=request.getConstructor(String.class,String.class,Boolean.class).newInstance(label,category,value);String url=(String)request.getMethod("url").invoke(link),command=(String)request.getMethod("command").invoke(link);
     CharSequence marked=main(()->(CharSequence)call("SettingsOptionLinks","apply",new Class<?>[]{CharSequence.class},command));boolean clickable=marked instanceof Spanned&&((Spanned)marked).getSpans(0,marked.length(),URLSpan.class).length==1;
     JSONObject formats=new JSONObject().put("url",url).put("command",command).put("intent",new Intent(Intent.ACTION_VIEW,Uri.parse(url)).setPackage(app.getPackageName()).toUri(Intent.URI_INTENT_SCHEME)).put("clickable",clickable);
     links.put(value==null?"open":value?"on":"off",formats);actions++;
    }rows.put(item.put("links",links));
   }
  }
  String version=app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName;File file=new File(app.getExternalFilesDir(null),"haiagaru-setting-links.json");
  try(Writer writer=new OutputStreamWriter(new FileOutputStream(file),"UTF-8")){writer.write(new JSONObject().put("version",version).put("package",app.getPackageName()).put("settings",rows).toString(2));}
  out.putString("path",file.getAbsolutePath());out.putString("result","PASS exported "+rows.length()+" Japanese setting entries / "+actions+" actions");status=Activity.RESULT_OK;
 }catch(Throwable error){out.putString("error",android.util.Log.getStackTraceString(error));}finally{if(prefs!=null){if(languagePresent)prefs.edit().putString("settingsLanguage",previousLanguage).commit();else prefs.edit().remove("settingsLanguage").commit();}try{if(host!=null){runOnMainSync(host::finish);waitForIdleSync();}if(fixtureTabs!=null)fixtureTabs.restore();}catch(Exception error){out.putString("tabRestoreError",error.toString());status=Activity.RESULT_CANCELED;}finish(status,out);}}
}
