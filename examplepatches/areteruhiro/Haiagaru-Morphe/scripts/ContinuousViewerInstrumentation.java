package app.haiagaru.tests.opentabs;
import android.app.*;import android.content.*;import android.os.*;import android.view.View;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Native selectors/intent factories with three synthetic URLs; block launch before any download. */
public final class ContinuousViewerInstrumentation extends Instrumentation {
 private Intent captured;private int checks;private void ok(boolean value,String text){if(!value)throw new AssertionError(text);checks++;}
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();SharedPreferences nativePrefs=null;boolean had=false;int old=0;ActivityMonitor monitor=null;try{
  Context app=getTargetContext();ClassLoader loader=app.getClassLoader();boolean legacy=app.getPackageName().endsWith("191"),modern=app.getPackageName().endsWith("242");
  nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(app);had=nativePrefs.contains("imageViewerType");old=nativePrefs.getInt("imageViewerType",0);final SharedPreferences prefs=nativePrefs;
  app.startActivity(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(1500);
  for(int n=0;n<30;n++){FutureTask<Activity> currentHost=new FutureTask<>(()->{Method current=loader.loadClass("app.morphe.extension.chmate.Haiagaru").getDeclaredMethod("toolbarActivity",Object.class);current.setAccessible(true);return (Activity)current.invoke(null,new Object[]{null});});runOnMainSync(currentHost);if(currentHost.get(20,TimeUnit.SECONDS)!=null)break;Thread.sleep(1000);}
  monitor=new ActivityMonitor(){@Override public ActivityResult onStartActivity(Intent intent){captured=new Intent(intent);return new ActivityResult(Activity.RESULT_CANCELED,null);}};addMonitor(monitor);
  FutureTask<Void> test=new FutureTask<>(()->{
   Method current=loader.loadClass("app.morphe.extension.chmate.Haiagaru").getDeclaredMethod("toolbarActivity",Object.class);current.setAccessible(true);Activity host=(Activity)current.invoke(null,new Object[]{null});ok(host!=null,"native host resumed");
   Class<?> owner=loader.loadClass(legacy?"o.lo":modern?"o.TTRewardVideoActivity1":"jp.syoboi.a2chMate.RoidonApp$RemoteActionCompatParcelizer");
   Class<?>[] types=modern?new Class<?>[]{Activity.class,int.class,View.class,ArrayList.class,int.class,ArrayList.class}:new Class<?>[]{Activity.class,View.class,ArrayList.class,int.class};Method selector=owner.getDeclaredMethod(legacy?"b":"e",types);selector.setAccessible(true);
   ArrayList<String> links=new ArrayList<>(Arrays.asList("https://fixture.invalid/first.jpg","https://fixture.invalid/second.gif","https://fixture.invalid/third.mp4"));
   View clicked=host.getWindow().getDecorView();
   for(int mode:new int[]{1,2}){prefs.edit().putInt("imageViewerType",mode).commit();captured=null;selector.invoke(null,modern?new Object[]{host,0,clicked,links,2,null}:new Object[]{host,clicked,links,2});
    ok(captured!=null,"native launch captured for mode "+mode);ok(captured.getComponent().getClassName().equals("jp.syoboi.a2chMate.activity.ImageListActivity"),"standard continuous viewer mode "+mode);
    ok(captured.getIntExtra("index",-1)==(mode==1?2:0),"clicked/first index policy mode "+mode);ok(links.equals(captured.getStringArrayListExtra("links")),"all mixed media URLs retained mode "+mode);
   }return null;
  });runOnMainSync(test);test.get(20,TimeUnit.SECONDS);result.putString("result","PASS "+checks+" actual native continuous viewer/index checks; launches blocked, network=0");finish(Activity.RESULT_OK,result);
 }catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}finally{if(monitor!=null)removeMonitor(monitor);if(nativePrefs!=null){if(had)nativePrefs.edit().putInt("imageViewerType",old).commit();else nativePrefs.edit().remove("imageViewerType").commit();}}}
}
