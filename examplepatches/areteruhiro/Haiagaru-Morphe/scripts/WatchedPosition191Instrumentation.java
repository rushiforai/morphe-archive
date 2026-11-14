package app.haiagaru.tests.watchposition;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Real ListView/native response numbers, isolated fixture; no DAT download or public network. */
public final class WatchedPosition191Instrumentation extends Instrumentation {
 int checks;Class<?> navigation,position;Activity activity;ListView list;
 void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 Method method(Class<?> c,String name,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(name,p);m.setAccessible(true);return m;}
 <T>T main(Callable<T> action)throws Exception{FutureTask<T> task=new FutureTask<>(action);runOnMainSync(task);return task.get(10,TimeUnit.SECONDS);}
 public static final class Row {public o.processAdDisplayErrorPostbackForUserError response;Row(Object value){response=(o.processAdDisplayErrorPostbackForUserError)value;}}
 public static final class Fragment {public Object W;final Activity activity;final View root;Fragment(Activity a,View v,Object board){activity=a;root=v;W=board;}public Activity getActivity(){return activity;}public View getView(){return root;}}
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" watched position checks; public requests=0");finish(Activity.RESULT_OK,out);}catch(Throwable error){out.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,out);}}
 void test()throws Exception{
  Context app=getTargetContext();ok(app.getPackageName().endsWith("haiagaru.reporter191"),"isolated 191 only");ClassLoader loader=app.getClassLoader();
  navigation=loader.loadClass("app.morphe.extension.chmate.ThreadWatchNavigation");position=loader.loadClass("app.morphe.extension.chmate.FilterPosition");
  String url="https://egg.5ch.io/test/read.cgi/android/1792500780/";
  SharedPreferences prefs=app.getSharedPreferences("haiagaru-watch-navigation",0);Map<String,?> saved=prefs.getAll();
  SharedPreferences nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(app);boolean hadTablet=nativePrefs.contains("enableTabletHome2"),tablet=nativePrefs.getBoolean("enableTabletHome2",false);nativePrefs.edit().putBoolean("enableTabletHome2",false).commit();
  activity=startActivitySync(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  try{
   Fragment owner=main(()->{
    list=new ListView(activity);List<Row> rows=new ArrayList<>();Class<?> response=loader.loadClass("o.processAdDisplayErrorPostbackForUserError");
    for(int n=1;n<=100;n++)rows.add(new Row(response.getConstructor(int.class,String.class,String.class,String.class,String.class).newInstance(n,"name","","date","response "+n)));
    list.setAdapter(new BaseAdapter(){public int getCount(){return rows.size();}public Object getItem(int n){return rows.get(n);}public long getItemId(int n){return n;}public View getView(int n,View old,ViewGroup parent){TextView text=old instanceof TextView?(TextView)old:new TextView(activity);text.setText("response "+(n+1));text.setHeight(160);return text;}});
    activity.setContentView(list);
    Object board=loader.loadClass("jp.syoboi.a2chMate.client.BBSUrlInfo").getConstructor(String.class,String.class,Long.class,int.class,Integer.class,String.class).newInstance("egg.5ch.io","android",1792500780L,0,null,null);
    return new Fragment(activity,list,board);
   });Thread.sleep(700);
   main(()->{ok(list.isAttachedToWindow()&&list.isShown()&&list.getHeight()>0,"fixture is visible "+list.isAttachedToWindow()+"/"+list.isShown()+"/"+list.getHeight());Class<?> context=loader.loadClass("app.morphe.extension.chmate.NativeThreadContext");String actual=(String)method(context,"url",Object.class,String.class,int.class).invoke(null,owner.W,"0.8.10.191 dev",1);ok(actual!=null&&actual.contains("/test/read.cgi/android/1792500780/"),"native fixture URL: "+actual);method(navigation,"expect",Context.class,String.class,int.class).invoke(null,app,url,50);method(navigation,"register",Object.class,View.class).invoke(null,owner,list);return null;});Thread.sleep(700);
   main(()->{ok((Boolean)method(position,"responseVisible",ListView.class,int.class).invoke(null,list,50),"notification initially shows target");Field f=navigation.getDeclaredField("pending");f.setAccessible(true);ok(f.get(null)!=null,"target stays pending after initial success");((BaseAdapter)list.getAdapter()).notifyDataSetChanged();list.setSelectionFromTop(0,0);return null;});Thread.sleep(700);
   main(()->{ok((Boolean)method(position,"responseVisible",ListView.class,int.class).invoke(null,list,50),"target recovered after refresh restores old position");Class<?> preview=loader.loadClass("app.morphe.extension.chmate.XPostPreviewPosition");MotionEvent touch=MotionEvent.obtain(0,0,MotionEvent.ACTION_DOWN,2,2,0);method(preview,"onTouch",View.class,MotionEvent.class).invoke(null,list.getChildAt(0),touch);touch.recycle();list.setSelectionFromTop(0,0);return null;});Thread.sleep(700);
   main(()->{ok(list.getFirstVisiblePosition()==0,"manual interaction stops position correction");Field f=navigation.getDeclaredField("pending");f.setAccessible(true);ok(f.get(null)==null,"manual interaction clears pending request");return null;});
  }finally{
   main(()->{activity.finish();return null;});SharedPreferences.Editor restore=prefs.edit().clear();for(Map.Entry<String,?> e:saved.entrySet()){Object v=e.getValue();if(v instanceof String)restore.putString(e.getKey(),(String)v);else if(v instanceof Integer)restore.putInt(e.getKey(),(Integer)v);else if(v instanceof Long)restore.putLong(e.getKey(),(Long)v);}restore.commit();if(hadTablet)nativePrefs.edit().putBoolean("enableTabletHome2",tablet).commit();else nativePrefs.edit().remove("enableTabletHome2").commit();
  }
 }
}
