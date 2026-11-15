package app.haiagaru.tests.settingsstock;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.view.accessibility.AccessibilityNodeInfo;import android.widget.*;
import java.lang.ref.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Isolated settings and native 242 menu tests. Never launches stock ChMate or posts. */
public final class SettingsStockBoardsInstrumentation extends Instrumentation {
 int checks;Activity activity;ClassLoader loader;Class<?> stock;Context app;
 void ok(boolean v,String s){if(!v)throw new AssertionError(s);checks++;}
 <T>T main(Callable<T> c)throws Exception{FutureTask<T> t=new FutureTask<>(c);runOnMainSync(t);return t.get(15,TimeUnit.SECONDS);}
 Method method(Class<?> c,String n,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(n,p);m.setAccessible(true);return m;}
 Field field(Class<?> c,String n)throws Exception{for(;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(n);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(n);}
 AccessibilityNodeInfo find(AccessibilityNodeInfo n,String text){if(n==null)return null;CharSequence t=n.getText();if(n.isVisibleToUser()&&t!=null&&text.contentEquals(t))return n;for(int i=0;i<n.getChildCount();i++){AccessibilityNodeInfo f=find(n.getChild(i),text);if(f!=null)return f;}return null;}
 boolean scroll(AccessibilityNodeInfo n){if(n==null)return false;if(n.isScrollable()&&n.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD))return true;for(int i=0;i<n.getChildCount();i++)if(scroll(n.getChild(i)))return true;return false;}
 AccessibilityNodeInfo waitText(String s)throws Exception{for(int i=0;i<50;i++){AccessibilityNodeInfo n=find(getUiAutomation().getRootInActiveWindow(),s);if(n!=null)return n;if(i>5&&i%5==0)scroll(getUiAutomation().getRootInActiveWindow());Thread.sleep(100);}throw new AssertionError("Missing "+s);}
 void tap(String s)throws Exception{AccessibilityNodeInfo n=waitText(s);while(n!=null&&!n.isClickable())n=n.getParent();ok(n!=null&&n.performAction(AccessibilityNodeInfo.ACTION_CLICK),"tap "+s);Thread.sleep(400);}
 @Override public void onCreate(Bundle b){super.onCreate(b);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" settings/native 242 board menu checks; posts/stock launches=0");finish(Activity.RESULT_OK,out);}catch(Throwable e){out.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,out);}}
 void test()throws Exception{
  app=getTargetContext();ok(app.getPackageName().endsWith("haiagaru.reporter242"),"isolated242 only");loader=app.getClassLoader();stock=loader.loadClass("app.morphe.extension.chmate.StockChmatePosting");
  SharedPreferences p=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);boolean had=p.contains("stockPostingShowMenu"),old=p.getBoolean("stockPostingShowMenu",true);p.edit().putBoolean("stockPostingShowMenu",true).commit();
  SharedPreferences consent=app.getSharedPreferences("haiagaru.personal-ng-submissions",0);boolean hadPrompt=consent.contains("settingsConsentShownV1"),prompt=consent.getBoolean("settingsConsentShownV1",false);boolean hadMinimal=p.contains("minimalSetupPromptV1"),minimal=p.getBoolean("minimalSetupPromptV1",false);consent.edit().putBoolean("settingsConsentShownV1",true).commit();p.edit().putBoolean("minimalSetupPromptV1",true).commit();
  // Block all outgoing stock-editor starts even if the test accidentally reaches a handoff action.
  ActivityMonitor monitor=new ActivityMonitor(){@Override public ActivityResult onStartActivity(Intent i){if(i.getComponent()!=null&&i.getComponent().getPackageName().equals("jp.co.airfront.android.a2chMate"))return new ActivityResult(Activity.RESULT_CANCELED,null);return null;}};addMonitor(monitor);
  try{
   activity=startActivitySync(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.HaiagaruSettingsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(900);
   for(String[] section:new String[][]{{"スレッド","画面・文字・テーマ","折りたたみ状態でスマホ／タブレット表示を自動切替"},{"アプリ・通信","基本設定・言語","設定内の機能名をタップして設定を開く"}}){
    tap(section[0]);waitText(section[1]);ok(find(getUiAutomation().getRootInActiveWindow(),section[0].equals("スレッド")?"画面・文字・コピー・リンクカード":"言語・広告・接続・外部板の認証")==null,"redundant category intro removed");android.graphics.Bitmap shot=getUiAutomation().takeScreenshot();if(shot!=null)try(java.io.FileOutputStream out=new java.io.FileOutputStream(new java.io.File(app.getExternalFilesDir(null),section[0].equals("スレッド")?"settings-reading.png":"settings-system.png"))){shot.compress(android.graphics.Bitmap.CompressFormat.PNG,100,out);}ok(find(getUiAutomation().getRootInActiveWindow(),section[2])==null,"section initially collapsed "+section[1]);tap(section[1]);waitText(section[2]);checks++;sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);Thread.sleep(400);tap(section[0]);waitText(section[1]);ok(find(getUiAutomation().getRootInActiveWindow(),section[2])==null,"reenter category is collapsed "+section[1]);sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);Thread.sleep(400);
   }
   main(()->{activity.finish();return null;});activity=null;
   for(String url:new String[]{"https://egg.5ch.io/test/read.cgi/android/9999999999/","https://phoebe.bbspink.com/test/read.cgi/pinkj/9999999999/","https://bbs.eddibb.cc/test/read.cgi/liveedge/9999999999/"}){
    activity=startActivitySync(new Intent(Intent.ACTION_SENDTO,android.net.Uri.parse(url)).setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.ResEditActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
    Map drafts=(Map)field(stock,"DRAFTS").get(null);Object draft=null;
    for(int i=0;i<50&&draft==null;i++){draft=main(()->drafts.get(activity));if(draft==null)Thread.sleep(100);}
    ok(draft!=null,"native242 editor registered "+url);Object d=draft;
    main(()->{ok(url.equals(field(d.getClass(),"target").get(d)),"exact native thread target");Object owner=((WeakReference)field(d.getClass(),"owner").get(d)).get();EditText body=(EditText)((WeakReference)field(d.getClass(),"body").get(d)).get();ok(body!=null&&body.isShown(),"native body visible");
     Menu menu=new PopupMenu(activity,body).getMenu();menu.add(0,0x7f09017e,0,"version");menu.add(0,0x7f090301,0,"uploads");
     // Actual patched preparation method, not a direct call to the extension.
     method(owner.getClass(),"d",Menu.class).invoke(owner,menu);int id=field(stock,"MENU").getInt(null);ok(menu.findItem(id)!=null&&menu.findItem(id).isVisible(),"native 242 overflow contains stock posting entry");
     p.edit().putBoolean("stockPostingShowMenu",false).commit();method(owner.getClass(),"d",Menu.class).invoke(owner,menu);ok(!menu.findItem(id).isVisible(),"OFF hides native menu entry");p.edit().putBoolean("stockPostingShowMenu",true).commit();return null;
    });main(()->{activity.finish();return null;});activity=null;
   }
  }finally{if(hadPrompt)consent.edit().putBoolean("settingsConsentShownV1",prompt).commit();else consent.edit().remove("settingsConsentShownV1").commit();if(hadMinimal)p.edit().putBoolean("minimalSetupPromptV1",minimal).commit();else p.edit().remove("minimalSetupPromptV1").commit();removeMonitor(monitor);if(activity!=null)main(()->{activity.finish();return null;});if(had)p.edit().putBoolean("stockPostingShowMenu",old).commit();else p.edit().remove("stockPostingShowMenu").commit();}
 }
}
