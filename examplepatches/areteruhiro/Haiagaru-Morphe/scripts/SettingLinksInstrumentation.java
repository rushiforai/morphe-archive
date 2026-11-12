package app.haiagaru.tests.opentabs;
import android.app.*;import android.content.*;import android.os.*;import android.net.Uri;import android.graphics.Rect;import android.view.*;import android.widget.*;import android.text.*;import android.text.style.URLSpan;import android.view.accessibility.AccessibilityNodeInfo;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Isolated settings-link render, real writer, confirmation/cancel and copy integration checks. */
public final class SettingLinksInstrumentation extends Instrumentation {
 private Context app;private Activity host;private ClassLoader loader;private SharedPreferences prefs;private boolean ui,present,previous;private int checks;private static final String KEY="threadSearchIncludeId",LABEL="スレ内検索にIDを含める";
 private <T>T main(Callable<T> fn)throws Exception{FutureTask<T> task=new FutureTask<>(fn);runOnMainSync(task);return task.get(20,TimeUnit.SECONDS);}
 private Object call(String type,String name,Class<?>[] sig,Object...args)throws Exception{Method m=loader.loadClass("app.morphe.extension.chmate."+type).getDeclaredMethod(name,sig);m.setAccessible(true);return m.invoke(null,args);}
 private void ok(boolean b,String message){if(!b)throw new AssertionError(message);checks++;}
 private Field field(Class<?> c,String n)throws Exception{Field f=c.getDeclaredField(n);f.setAccessible(true);return f;}
 private AccessibilityNodeInfo find(AccessibilityNodeInfo node,String text,boolean prefix){if(node==null)return null;CharSequence s=node.getText();if(node.isVisibleToUser()&&s!=null&&(prefix?s.toString().startsWith(text):s.toString().equals(text)))return node;for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo hit=find(node.getChild(i),text,prefix);if(hit!=null)return hit;}return null;}
 private AccessibilityNodeInfo text(String s,boolean prefix)throws Exception{for(int i=0;i<100;i++){AccessibilityNodeInfo n=find(getUiAutomation().getRootInActiveWindow(),s,prefix);if(n!=null)return n;Thread.sleep(100);}throw new AssertionError("Missing UI: "+s);}
 private void tap(String s,boolean prefix)throws Exception{AccessibilityNodeInfo n=text(s,prefix);Rect r=new Rect();n.getBoundsInScreen(r);long now=SystemClock.uptimeMillis();sendPointerSync(MotionEvent.obtain(now,now,0,r.centerX(),r.centerY(),0));sendPointerSync(MotionEvent.obtain(now,now+50,1,r.centerX(),r.centerY(),0));Thread.sleep(350);}
 private AccessibilityNodeInfo edit(AccessibilityNodeInfo node){if(node==null)return null;if(node.isVisibleToUser()&&"android.widget.EditText".contentEquals(node.getClassName()))return node;for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo n=edit(node.getChild(i));if(n!=null)return n;}return null;}
 private String uri(Boolean value)throws Exception{Class<?> type=loader.loadClass("app.morphe.extension.chmate.SettingLinkRequest");Object request=type.getConstructor(String.class,String.class,Boolean.class).newInstance(KEY,"DISPLAY",value);return (String)type.getMethod("url").invoke(request);}
 private void launch(String uri){app.startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse(uri)).setPackage(app.getPackageName()).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));}
 @Override public void onCreate(Bundle args){super.onCreate(args);ui=args!=null&&"true".equals(args.getString("ui"));start();}
 @Override public void onStart(){Bundle out=new Bundle();int status=Activity.RESULT_CANCELED;try{
  app=getTargetContext();loader=app.getClassLoader();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated package");String prefName=(String)field(loader.loadClass("app.morphe.extension.chmate.WacchoiSearchOptions"),"PREFS").get(null);prefs=app.getSharedPreferences(prefName,0);present=prefs.contains(KEY);previous=prefs.getBoolean(KEY,false);
  app.startActivity(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(1500);
  for(int n=0;n<30&&host==null;n++){host=main(()->(Activity)call("Haiagaru","toolbarActivity",new Class<?>[]{Object.class},new Object[]{null}));if(host==null)Thread.sleep(1000);}ok(host!=null,"host resumed");
  main(()->{model();return null;});if(ui)ui();out.putString("result","PASS "+checks+" settings link checks; ui="+ui);status=Activity.RESULT_OK;
 }catch(Throwable failure){out.putString("error",android.util.Log.getStackTraceString(failure));}finally{if(prefs!=null){if(present)prefs.edit().putBoolean(KEY,previous).commit();else prefs.edit().remove(KEY).commit();}finish(status,out);}}
 private void model()throws Exception{
  String source="'Haiagaru.設定.スレ内にIDを含める.true'\n'Haiagaru.設定.スレ内にIDを含める.false'";Map<String,?> before=new HashMap<>(prefs.getAll());
  CharSequence applied=(CharSequence)call("SettingsOptionLinks","apply",new Class<?>[]{CharSequence.class},source);ok(applied.toString().equals(source),"post contents unchanged");URLSpan[] spans=((Spanned)applied).getSpans(0,applied.length(),URLSpan.class);ok(spans.length==2,"both requested plain command forms clickable");
  for(int i=0;i<2;i++){Object r=call("SettingLinkRequest","parse",new Class<?>[]{String.class},spans[i].getURL());ok(r.getClass().getField("value").get(r).equals(i==0),"span action "+i);}
  ok(call("SettingsOptionLinks","apply",new Class<?>[]{CharSequence.class},applied)==applied,"repeat bind does not duplicate spans or recreate text");
  String ordinary="normal text https://example.org/";ok(call("SettingsOptionLinks","apply",new Class<?>[]{CharSequence.class},ordinary)==ordinary,"ordinary posts use original object");
  CharSequence fast=new CharSequence(){String value="ordinary spanned text";public int length(){return value.length();}public char charAt(int p){return value.charAt(p);}public CharSequence subSequence(int a,int b){return value.subSequence(a,b);}public String toString(){throw new AssertionError("ordinary text copied");}};
  ok(call("SettingsOptionLinks","apply",new Class<?>[]{CharSequence.class},fast)==fast,"ordinary CharSequence is never converted to String");
  SpannableString linked=new SpannableString("Haiagaru.設定.abc.true");linked.setSpan(new URLSpan("https://example.org/"),0,linked.length(),33);ok(call("SettingsOptionLinks","apply",new Class<?>[]{CharSequence.class},linked)==linked,"native unrelated URL span preserved");
  ok(call("Haiagaru","processEmojiTextForView",new Class<?>[]{Object.class,CharSequence.class},new EditText(host),source)==source,"draft editor never gains command spans");
  List<?> entries=(List<?>)call("SettingLinkCatalog","category",new Class<?>[]{Activity.class,String.class},host,"DISPLAY");Object target=null;for(Object e:entries)if(e.getClass().getField("label").get(e).equals(LABEL))target=e;ok(target!=null,"ID search option present in real settings catalog");
  ok(target.getClass().getMethod("locator").invoke(target).equals(KEY),"stable key is resolved through existing control");
  Object alias=call("SettingLinkRequest","parse",new Class<?>[]{String.class},"Haiagaru.設定.スレ内にIDを含める.true");ok((Boolean)target.getClass().getMethod("matches",alias.getClass()).invoke(target,alias),"user example alias resolves to original UI control");
  Map<String,?> after=prefs.getAll();java.util.Set<String> changed=new java.util.TreeSet<>();changed.addAll(before.keySet());changed.addAll(after.keySet());changed.removeIf(k->java.util.Objects.equals(before.get(k),after.get(k)));ok(changed.isEmpty(),"rendering and catalog discovery do not change preferences: "+changed);
  Intent intent=new Intent(Intent.ACTION_VIEW,Uri.parse(uri(true))).setPackage(app.getPackageName());ok(app.getPackageManager().resolveActivity(intent,0)!=null,"custom scheme resolves in renamed installation");
 }
 private void ui()throws Exception{
  prefs.edit().putBoolean(KEY,false).commit();
  main(()->{TextView view=new TextView(host);CharSequence body=(CharSequence)call("SettingsOptionLinks","apply",new Class<?>[]{CharSequence.class},"Haiagaru.設定.スレ内にIDを含める.true");view.setText(body);view.measure(View.MeasureSpec.makeMeasureSpec(1000,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(0,View.MeasureSpec.UNSPECIFIED));view.layout(0,0,1000,view.getMeasuredHeight());Layout layout=view.getLayout();float x=layout.getPrimaryHorizontal(3),y=layout.getLineTop(0)+layout.getLineBottom(0)/2f;long now=SystemClock.uptimeMillis();
   ok((Boolean)call("XPostPreviewTouch","onTouch",new Class<?>[]{Object.class,MotionEvent.class},view,MotionEvent.obtain(now,now,0,x,y,0)),"body command touch DOWN consumed");
   ok((Boolean)call("XPostPreviewTouch","onTouch",new Class<?>[]{Object.class,MotionEvent.class},view,MotionEvent.obtain(now,now+50,1,x,y,0)),"body command touch UP opens confirmation");return null;});
  text("適用",false);ok(!prefs.getBoolean(KEY,true),"preview does not apply true");tap("閉じる",false);ok(!prefs.getBoolean(KEY,true),"closing confirmation never applies true");
  launch(uri(true));text("適用",false);tap("適用",false);ok(prefs.getBoolean(KEY,false),"Apply ON invokes real settings writer");tap("閉じる",false);
  launch(uri(false));text("適用",false);ok(prefs.getBoolean(KEY,false),"preview does not apply false");tap("適用",false);ok(!prefs.getBoolean(KEY,true),"Apply OFF invokes real settings writer");tap("閉じる",false);
  launch(uri(null));Thread.sleep(1500);Activity opened=main(()->(Activity)call("Haiagaru","toolbarActivity",new Class<?>[]{Object.class},new Object[]{null}));ok(opened!=null&&opened.getClass().getName().endsWith(".HaiagaruSettingsActivity")&&LABEL.equals(opened.getIntent().getStringExtra("haiagaru.settings.search")),"open-only link navigates to settings search");ok(!prefs.getBoolean(KEY,true),"open-only link never toggles");
  main(()->{opened.finish();return null;});Thread.sleep(300);
  ActivityMonitor creatorMonitor=addMonitor("app.morphe.extension.chmate.SettingLinkActivity",null,false);
  app.startActivity(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.SettingLinkActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  Activity creator=waitForMonitorWithTimeout(creatorMonitor,20000);removeMonitor(creatorMonitor);ok(creator!=null,"link creator resumed");
  EditText input=null;for(int i=0;i<100&&input==null;i++){input=main(()->(EditText)field(creator.getClass(),"search").get(creator));if(input==null)Thread.sleep(100);}ok(input!=null,"link catalog searchable input");final EditText searchInput=input;main(()->{searchInput.setText("スレ内検索にID");return null;});ok(main(()->searchInput.getText().toString().equals("スレ内検索にID")),"filter link catalog");Thread.sleep(500);tap(LABEL,true);tap("オンにする",false);tap("書き込み用の文字列",false);
  android.content.ClipboardManager clipboard=(android.content.ClipboardManager)app.getSystemService(Context.CLIPBOARD_SERVICE);String copied=clipboard.getPrimaryClip().getItemAt(0).getText().toString();Object r=call("SettingLinkRequest","parse",new Class<?>[]{String.class},copied);ok(Boolean.TRUE.equals(r.getClass().getField("value").get(r))&&LABEL.equals(r.getClass().getField("name").get(r)),"generated ON command round trip");ok(!prefs.getBoolean(KEY,true),"copying a settings link never applies it");tap("閉じる",false);
 }
}
