package app.haiagaru.tests.authdialog;

import android.app.*;
import android.content.*;
import android.os.*;
import android.view.*;
import android.widget.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

/** Synthetic native inline errors in a dedicated package. Auth launches are blocked; no posts. */
public final class BoardAuthDialogInstrumentation extends Instrumentation {
 private Context app;private Class<?> auth;private int checks;private volatile Intent navigation;
 private <T>T main(Callable<T> action)throws Exception{FutureTask<T> task=new FutureTask<>(action);runOnMainSync(task);return task.get(15,TimeUnit.SECONDS);}
 private void ok(boolean b,String label){if(!b)throw new AssertionError(label);checks++;}
 private Method method(Class<?> c,String n,Class<?>...types)throws Exception{Method m=c.getDeclaredMethod(n,types);m.setAccessible(true);return m;}
 private Dialog current(Activity a)throws Exception{Field f=auth.getDeclaredField("dialogs");f.setAccessible(true);WeakReference<?> ref=(WeakReference<?>)((Map<?,?>)f.get(null)).get(a);return ref==null?null:(Dialog)ref.get();}
 private Button button(Dialog dialog,int which)throws Exception{return (Button)dialog.getClass().getMethod("getButton",int.class).invoke(dialog,which);}
 private EditText input(View v){if(v instanceof EditText)return (EditText)v;if(v instanceof ViewGroup)for(int i=0;i<((ViewGroup)v).getChildCount();i++){EditText found=input(((ViewGroup)v).getChildAt(i));if(found!=null)return found;}return null;}
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();try{test();result.putString("result","PASS "+checks+" automatic auth-dialog checks; authentication launches intercepted; public posts=0");finish(Activity.RESULT_OK,result);}catch(Throwable t){result.putString("error",android.util.Log.getStackTraceString(t));finish(Activity.RESULT_CANCELED,result);}}
 private void test()throws Exception{
  app=getTargetContext();ok(app.getPackageName().endsWith("haiagaru.reporter242"),"dedicated verification package only");
  auth=app.getClassLoader().loadClass("app.morphe.extension.chmate.ExternalBoardAuth");
  SharedPreferences prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);Map<String,?> old=prefs.getAll();
  SharedPreferences links=app.getSharedPreferences("haiagaru.external-board-auth",0);String key="url:https://bbs.eddibb.cc";boolean had=links.contains(key);String saved=links.getString(key,"");
  ActivityMonitor launches=new ActivityMonitor(){@Override public ActivityResult onStartActivity(Intent intent){if(intent.getComponent()!=null&&intent.getComponent().getClassName().equals("app.morphe.extension.chmate.ExternalBoardAuthActivity")){navigation=new Intent(intent);return new ActivityResult(Activity.RESULT_CANCELED,null);}return null;}};
  addMonitor(launches);Activity editor=null;ClipData original=null;ClipboardManager clipboard=null;boolean clipboardRead=false;
  try{
   editor=startActivitySync(new Intent(Intent.ACTION_SENDTO,android.net.Uri.parse("https://egg.5ch.io/test/read.cgi/android/1792500780/")).setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.ResEditActivity$Dialog").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
   final Activity a=editor;Thread.sleep(1200);
   Object fragment=main(()->{Object manager=a.getClass().getMethod("h").invoke(a);for(Object f:(List<?>)manager.getClass().getMethod("q").invoke(manager))if(f.getClass().getName().equals("jp.syoboi.a2chMate.feature.resedit.ResEditFragment"))return f;throw new AssertionError("native posting fragment");});
   main(()->{auth.getMethod("target",Object.class,String.class,EditText.class).invoke(null,fragment,"https://bbs.eddibb.cc/liveedge/",(EditText)a.findViewById(2131296421));return null;});
   Method error=method(fragment.getClass(),"b",String.class,boolean.class);
   String message="認証コード「TEST242」を用いて認証してください。https://bbs.eddibb.cc/auth-code";
   prefs.edit().putBoolean("showExternalBoardAuthMenu",false).commit();
   main(()->{error.invoke(fragment,message,false);return null;});Thread.sleep(700);
   main(()->{Dialog d=current(a);ok(d==null||!d.isShowing(),"OFF does not show an automatic dialog");return null;});
   prefs.edit().putBoolean("showExternalBoardAuthMenu",true).commit();
   main(()->{error.invoke(fragment,message,false);return null;});Thread.sleep(900);
   Dialog dialog=main(()->{Dialog d=current(a);ok(d!=null&&d.isShowing(),"ON automatically shows dialog from native inline error");ok("認証コードをコピー".contentEquals(button(d,-3).getText()),"copy code action");ok("認証サイトを開く".contentEquals(button(d,-1).getText()),"open site action in same dialog");return d;});
   main(()->{auth.getMethod("observe",CharSequence.class).invoke(null,message);return null;});Thread.sleep(600);
   main(()->{ok(current(a)==dialog,"repeated observer uses one dialog");return null;});
   clipboard=(ClipboardManager)a.getSystemService(Context.CLIPBOARD_SERVICE);final ClipboardManager cb=clipboard;
   original=main(cb::getPrimaryClip);clipboardRead=true;
   main(()->{button(dialog,-3).performClick();ok(dialog.isShowing(),"copy keeps authentication dialog open");ClipData clip=cb.getPrimaryClip();ok(clip!=null&&"TEST242".contentEquals(clip.getItemAt(0).getText()),"exact labelled code copied");return null;});
   main(()->{Field spec=dialog.getClass().getDeclaredField("spec");spec.setAccessible(true);Object builder=spec.get(dialog);Field view=builder.getClass().getDeclaredField("view");view.setAccessible(true);EditText url=input((View)view.get(builder));ok(url!=null&&"https://bbs.eddibb.cc/auth-code".contentEquals(url.getText()),"auth URL available without another configuration dialog");url.setText("javascript:invalid");button(dialog,-1).performClick();ok(dialog.isShowing()&&navigation==null&&url.getError()!=null,"invalid destination remains in same dialog");url.setText("https://bbs.eddibb.cc/auth-code");button(dialog,-1).performClick();return null;});
   Thread.sleep(700);
   main(()->{ok(navigation!=null&&"https://bbs.eddibb.cc/auth-code".equals(navigation.getStringExtra("auth")),"open action navigates directly to auth screen");ok(!dialog.isShowing(),"dialog removed before navigation");return null;});
  }finally{
   removeMonitor(launches);
   if(editor!=null){final Activity a=editor;main(()->{Dialog d=current(a);if(d!=null)d.dismiss();a.finish();return null;});}
   if(clipboardRead&&clipboard!=null){final ClipboardManager cb=clipboard;final ClipData clip=original;main(()->{if(clip!=null)cb.setPrimaryClip(clip);else if(Build.VERSION.SDK_INT>=28)cb.clearPrimaryClip();return null;});}
   SharedPreferences.Editor restore=prefs.edit();if(old.containsKey("showExternalBoardAuthMenu"))restore.putBoolean("showExternalBoardAuthMenu",(Boolean)old.get("showExternalBoardAuthMenu"));else restore.remove("showExternalBoardAuthMenu");restore.commit();
   if(had)links.edit().putString(key,saved).commit();else links.edit().remove(key).commit();
  }
 }
}
