package app.haiagaru.tests.opentabs;
import android.app.*;
import android.content.*;
import android.os.*;
import android.graphics.Rect;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

/** Tests notification interval Cancel on an isolated emulator package, without registering monitoring. */
public final class NotificationNavigationInstrumentation extends Instrumentation {
 private Context app;private Activity activity;private ClassLoader loader;private int checks;
 private <T>T main(Callable<T> fn)throws Exception{FutureTask<T> task=new FutureTask<>(fn);runOnMainSync(task);return task.get(10,TimeUnit.SECONDS);}
 private Object call(Class<?> c,String name,Class<?>[] types,Object...args)throws Exception{Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);}
 private void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks++;}
 private AccessibilityNodeInfo find(AccessibilityNodeInfo node,String text){
  if(node==null)return null;CharSequence value=node.getText();
  if(node.isVisibleToUser()&&value!=null&&value.toString().equals(text))return node;
  for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo found=find(node.getChild(i),text);if(found!=null)return found;}return null;
 }
 private AccessibilityNodeInfo waitText(String text)throws Exception{for(int i=0;i<40;i++){AccessibilityNodeInfo hit=find(getUiAutomation().getRootInActiveWindow(),text);if(hit!=null)return hit;Thread.sleep(100);}throw new AssertionError("Missing UI: "+text);}
 private void tap(String text)throws Exception{AccessibilityNodeInfo hit=waitText(text);Rect bounds=new Rect();hit.getBoundsInScreen(bounds);long now=SystemClock.uptimeMillis();sendPointerSync(MotionEvent.obtain(now,now,0,bounds.centerX(),bounds.centerY(),0));sendPointerSync(MotionEvent.obtain(now,now+40,1,bounds.centerX(),bounds.centerY(),0));Thread.sleep(400);}
 private boolean checked(String text)throws Exception{AccessibilityNodeInfo n=waitText(text);for(int i=0;n!=null&&i<5;i++,n=n.getParent())if(n.isCheckable())return n.isChecked();throw new AssertionError("No checkbox: "+text);}
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{
  app=getTargetContext();loader=app.getClassLoader();check(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated test package");
  app.startActivity(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(1800);
  activity=main(()->(Activity)call(loader.loadClass("app.morphe.extension.chmate.Haiagaru"),"toolbarActivity",new Class<?>[]{Object.class},new Object[]{null}));check(activity!=null,"resumed host");
  Class<?> watch=loader.loadClass("app.morphe.extension.chmate.ThreadWatch");
  Map<String,?> options=new HashMap<>(app.getSharedPreferences("haiagaru_thread_watch_options",0).getAll());
  main(()->{call(watch,"showDefaults",new Class<?>[]{Activity.class},activity);return null;});waitText("書き込み後の自動監視");
  String auto="書き込み後に自動でスレを監視する";boolean old=checked(auto);tap(auto);check(checked(auto)!=old,"unsaved automatic monitoring toggle");
  tap("確認間隔");waitText("新着通知の確認間隔");tap("キャンセル");waitText("書き込み後の自動監視");check(checked(auto)!=old,"Cancel returns to same parent and retains unsaved toggle");tap("キャンセル");
  Object target=call(loader.loadClass("app.morphe.extension.chmate.ThreadWatchRules"),"target",new Class<?>[]{String.class},"https://egg.5ch.io/test/read.cgi/android/1784210927/");
  main(()->{call(watch,"show",new Class<?>[]{Activity.class,target.getClass()},activity,target);return null;});waitText("このスレの新着通知");
  tap("確認間隔を変更");waitText("新着通知の確認間隔");tap("キャンセル");waitText("このスレの新着通知");checks++;
  sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);Thread.sleep(300);
  check(options.equals(app.getSharedPreferences("haiagaru_thread_watch_options",0).getAll()),"Cancel never changes polling interval or duration");
  out.putString("result","PASS "+checks+" interval dialog UI checks; registrations/network=0");finish(Activity.RESULT_OK,out);
 }catch(Throwable error){out.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,out);}}
}
