package app.haiagaru.tests.sites;

import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;
import java.lang.reflect.*;import java.util.concurrent.*;

/** Exercises production per-board dialogs using isolated preferences; no public requests. */
public final class SiteBoardSettingsInstrumentation extends Instrumentation {
 private int checks;private Object gateway;private SharedPreferences prefs;private Activity activity;
 private void ok(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}
 private Object call(Object o,String name,Class<?>[] types,Object...args)throws Exception{Method m=o.getClass().getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(o,args);}
 private Switch toggle(View v){if(v instanceof Switch)return (Switch)v;if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++){Switch s=toggle(((ViewGroup)v).getChildAt(i));if(s!=null)return s;}return null;}
 private String text(View v){String out=v instanceof TextView?((TextView)v).getText().toString()+"\n":"";if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++)out+=text(((ViewGroup)v).getChildAt(i));return out;}
 private boolean used(String key)throws Exception{return (Boolean)call(gateway,"boardEnabled",new Class<?>[]{String.class},key);}
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();int code=Activity.RESULT_CANCELED;try{
  Context app=getTargetContext();ClassLoader loader=app.getClassLoader();Class<?> type=loader.loadClass("app.morphe.extension.chmate.SiteBoardGateway"),transport=loader.loadClass(type.getName()+"$Transport");prefs=app.getSharedPreferences("haiagaru.site-ui-tests."+System.nanoTime(),0);
  Constructor<?> ctor=type.getDeclaredConstructor(SharedPreferences.class,transport);ctor.setAccessible(true);Object stub=java.lang.reflect.Proxy.newProxyInstance(loader,new Class<?>[]{transport},(p,m,a)->{throw new AssertionError("No upstream requests permitted in UI test");});gateway=ctor.newInstance(prefs,stub);
  String first=(String)call(gateway,"register",new Class<?>[]{String.class,String.class},"https://dat.2chan.net/t/","試験の板A"),second=(String)call(gateway,"register",new Class<?>[]{String.class,String.class},"https://bbs.animanch.com/","試験の板B");
  Activity host=null;Class<?> haiagaru=loader.loadClass("app.morphe.extension.chmate.Haiagaru");Method current=haiagaru.getDeclaredMethod("toolbarActivity",Object.class);current.setAccessible(true);Bundle waiting=new Bundle();waiting.putString("state","waiting for visible verification HomeActivity");sendStatus(1,waiting);
  for(int n=0;n<25;n++){FutureTask<Activity> get=new FutureTask<>(()->(Activity)current.invoke(null,new Object[]{null}));runOnMainSync(get);host=get.get(5,TimeUnit.SECONDS);if(host!=null&&!host.isFinishing()&&!host.isDestroyed())break;host=null;Thread.sleep(1000);}ok(host!=null,"visible host for permitted activity launch");
  final Activity foreground=host;String activityName="app.morphe.extension.chmate.SiteBoardSettingsActivity";ActivityMonitor monitor=addMonitor(activityName,null,false);try{runOnMainSync(()->foreground.startActivity(new Intent().setClassName(app.getPackageName(),activityName)));activity=waitForMonitorWithTimeout(monitor,15000);}finally{removeMonitor(monitor);}ok(activity!=null,"settings activity starts within timeout");
  FutureTask<Void> task=new FutureTask<>(()->{Field field=activity.getClass().getDeclaredField("gateway");field.setAccessible(true);field.set(activity,gateway);call(activity,"render",new Class<?>[]{});
   String list=text(activity.getWindow().getDecorView());ok(list.contains("試験の板A")&&list.contains("試験の板B"),"individual board rows");ok(toggle(activity.getWindow().getDecorView())==null,"no ambiguous master toggle");
   AlertDialog dialog=(AlertDialog)call(activity,"boardSettings",new Class<?>[]{String.class,String.class},first,null);
   try{String contents=text(dialog.getWindow().getDecorView());ok(contents.contains("掲示板のURL\nhttps://dat.2chan.net/t/"),"selected board URL");ok(contents.contains("板の数\n1"),"one explicitly registered board");Switch use=toggle(dialog.getWindow().getDecorView());ok(use!=null&&!use.isChecked(),"new board OFF");use.performClick();ok(used(first)&&!used(second),"A ON leaves B OFF");ok(text(activity.getWindow().getDecorView()).contains("使用する"),"row reflects ON");}finally{dialog.dismiss();}
   dialog=(AlertDialog)call(activity,"boardSettings",new Class<?>[]{String.class,String.class},first,null);try{Switch use=toggle(dialog.getWindow().getDecorView());ok(use.isChecked(),"reopened dialog retains ON");use.performClick();ok(!used(first)&&!used(second),"A OFF leaves B OFF");ok(!(Boolean)call(gateway,"enabled",new Class<?>[]{}),"last OFF stops gateway");}finally{dialog.dismiss();}
   dialog=(AlertDialog)call(activity,"boardSettings",new Class<?>[]{String.class,String.class},second,null);try{ok(text(dialog.getWindow().getDecorView()).contains("https://bbs.animanch.com/"),"B dialog has own URL");ok(!toggle(dialog.getWindow().getDecorView()).isChecked(),"B remains OFF");}finally{dialog.dismiss();}
   return null;});runOnMainSync(task);task.get(20,TimeUnit.SECONDS);result.putString("result","PASS "+checks+" production per-board dialog checks; isolated preferences; public requests=0");code=Activity.RESULT_OK;
 }catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));}finally{if(activity!=null)runOnMainSync(activity::finish);if(gateway!=null)try{call(gateway,"stop",new Class<?>[]{});}catch(Exception ignored){}if(prefs!=null)prefs.edit().clear().commit();}finish(code,result);}
}
