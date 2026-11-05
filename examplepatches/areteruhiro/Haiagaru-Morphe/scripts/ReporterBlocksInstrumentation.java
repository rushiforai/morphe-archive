package app.morphe.extension.chmate;

import android.app.*;
import android.content.*;
import android.os.*;
import android.graphics.Rect;
import android.view.*;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.*;
import java.util.concurrent.*;
import java.lang.reflect.*;
import org.json.*;

/** Signed instrumentation for isolated test packages; no ART method hooks or real submissions. */
public final class ReporterBlocksInstrumentation extends Instrumentation {
 private static final String A=repeat('a'),B=repeat('b'),BODY="共有NGテスト条件";
 private Activity activity;private Context app;private Map<String,?> oldPrefs,oldBlocks,oldCommands;private Object oldRules;private long oldNext;private boolean expectedDefaultOne;private final List<String> checks=new ArrayList<>();
 private static String repeat(char c){char[] chars=new char[64];Arrays.fill(chars,c);return new String(chars);}
 private static Field field(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f;}
 private <T>T main(Callable<T> fn)throws Exception{FutureTask<T> task=new FutureTask<>(fn);runOnMainSync(task);return task.get(10,TimeUnit.SECONDS);}
 private void check(boolean ok,String label){if(!ok)throw new AssertionError(label);checks.add(label);}
 private List<SharedNgRules.Rule> rules(String value,List<String> contributors){return Collections.singletonList(new SharedNgRules.Rule(repeat('c'),"5ch/all","keyword",value,"",contributors.size(),false,1,1,false,contributors));}
 private ProgrammableNgScript.Input input(){Map<String,Object> map=new LinkedHashMap<>();map.put("boardUrl","https://egg.5ch.io/android/");map.put("responseId","FixtureID");map.put("name","FixtureName");return new ProgrammableNgScript.Input(BODY,map);}
 private boolean match(){return SharedNg.match(Collections.singletonList(input()))[0];}
 private SharedPreferences blocks(){return app.getSharedPreferences(SharedNgReporterBlocks.PREFS,0);}
 private void tap(String text,boolean prefix)throws Exception{
  for(int n=0;n<30;n++){
   AccessibilityNodeInfo root=getUiAutomation().getRootInActiveWindow();AccessibilityNodeInfo hit=root==null?null:find(root,text,prefix);
   if(hit!=null){Rect bounds=new Rect();hit.getBoundsInScreen(bounds);long now=SystemClock.uptimeMillis();sendPointerSync(MotionEvent.obtain(now,now,MotionEvent.ACTION_DOWN,bounds.centerX(),bounds.centerY(),0));sendPointerSync(MotionEvent.obtain(now,now+40,MotionEvent.ACTION_UP,bounds.centerX(),bounds.centerY(),0));waitForIdleSync();return;}
   SystemClock.sleep(100);
  }
  throw new AssertionError("Missing UI: "+text);
 }
 private AccessibilityNodeInfo find(AccessibilityNodeInfo node,String text,boolean prefix){
  CharSequence value=node.getText();if(node.isVisibleToUser()&&node.isEnabled()&&value!=null&&(prefix?value.toString().startsWith(text):value.toString().equals(text))&&app.getPackageName().contentEquals(node.getPackageName()))return node;
  for(int i=0;i<node.getChildCount();i++){AccessibilityNodeInfo child=node.getChild(i);if(child!=null){AccessibilityNodeInfo hit=find(child,text,prefix);if(hit!=null)return hit;}}return null;
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);expectedDefaultOne=args!=null&&"1".equals(args.getString("expectedDefault"));start();}
 @Override public void onStart(){Bundle result=new Bundle();int status=Activity.RESULT_CANCELED;
  try{
   app=getTargetContext();if(!app.getPackageName().matches(".*\\.reporter(191|226|242)"))throw new SecurityException("isolated packages only");
   Intent intent=new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);activity=startActivitySync(intent);waitForIdleSync();SystemClock.sleep(300);
   main(()->{oldPrefs=new HashMap<>(SharedNg.prefs().getAll());oldBlocks=new HashMap<>(blocks().getAll());oldCommands=new HashMap<>(app.getSharedPreferences("haiagaru_thread_commands",0).getAll());oldRules=field(SharedNg.class,"rules").get(null);oldNext=field(SharedNg.class,"nextSync").getLong(null);field(SharedNg.class,"nextSync").setLong(null,System.currentTimeMillis()+3600000);if(expectedDefaultOne){SharedNg.prefs().edit().remove("threshold").commit();SharedNg.reload();check(field(SharedNg.class,"threshold").getInt(null)==1,"default report threshold one");SharedNg.prefs().edit().putInt("threshold",5).commit();SharedNg.reload();check(field(SharedNg.class,"threshold").getInt(null)==5,"saved threshold preserved");}blocks().edit().clear().commit();SharedNg.prefs().edit().putBoolean("enabled",true).putInt("threshold",1).putBoolean("kind.keyword",true).putStringSet("exceptions",Collections.emptySet()).putStringSet("excludedBoards",Collections.emptySet()).commit();field(SharedNg.class,"rules").set(null,rules(BODY,Arrays.asList(A,B)));SharedNg.reload();check(match(),"baseline two contributors");SharedNg.showResponseExclusions(activity,input());return null;});
   tap(SharedNgReporterBlocks.ACTION,false);tap(SharedNgReporterBlocks.label(A),false);tap("除外する",false);
   main(()->{check(blocks().getStringSet("ignored",Collections.emptySet()).equals(Collections.singleton(A)),"touch excludes selected reporter only");check(match(),"other reporter remains");SharedNg.prefs().edit().putInt("threshold",2).commit();SharedNg.reload();check(!match(),"effective vote threshold");SharedNg.prefs().edit().putInt("threshold",1).commit();field(SharedNg.class,"rules").set(null,rules("共有NGテスト",Collections.singletonList(A)));SharedNg.reload();check(!match(),"future condition excluded");field(SharedNg.class,"rules").set(null,rules(BODY,Arrays.asList(A,B)));SharedNg.reload();return null;});
   main(()->{String v=app.getPackageName().substring(app.getPackageName().length()-3);String[] spec=v.equals("191")?new String[]{"o.processAdDisplayErrorPostbackForUserError","o","h","n","c"}:v.equals("226")?new String[]{"o.BouncyCastleSocketAdapterCompanion","l","j","m","d"}:new String[]{"o.KeJ11","o","g","n","h"};Class<?> unsafeClass=Class.forName("sun.misc.Unsafe"),model=Class.forName(spec[0]);Object unsafe=field(unsafeClass,"theUnsafe").get(null),row=unsafeClass.getMethod("allocateInstance",Class.class).invoke(unsafe,model);field(model,spec[1]).setInt(row,7);field(model,spec[2]).set(row,"FixtureID");field(model,spec[3]).set(row,"FixtureName");field(model,spec[4]).set(row,BODY);check(SharedNg.matchNativeRows(Collections.singletonList(row),"https://egg.5ch.io/android/").size()==1,"native raw field binding");SharedNg.prefs().edit().putInt("threshold",2).commit();SharedNg.reload();check(SharedNg.matchNativeRows(Collections.singletonList(row),"https://egg.5ch.io/android/").isEmpty(),"native cache invalidation");SharedNg.prefs().edit().putInt("threshold",1).commit();SharedNg.reload();return null;});
   main(()->{Method capture=HaiagaruSyncSnapshot.class.getDeclaredMethod("captureSettings",Context.class);capture.setAccessible(true);JSONObject data=(JSONObject)capture.invoke(null,app);check(data.has(SharedNgReporterBlocks.PREFS),"backup captures exclusions");blocks().edit().clear().commit();Method merge=HaiagaruSyncSnapshot.class.getDeclaredMethod("mergeMissingSettings",Context.class,JSONObject.class,String.class);merge.setAccessible(true);merge.invoke(null,app,data,app.getPackageName());check(blocks().getStringSet("ignored",Collections.emptySet()).contains(A),"backup restores exclusions");check(PersonalNgSubmissions.requestIdentity("identity").getString("deviceKey").length()==64,"hashed identity payload");SharedNgReporterBlocks.show(activity,rules(BODY,Arrays.asList(A,B)));return null;});
   tap(SharedNgReporterBlocks.label(A),true);tap("保存",false);
   main(()->{check(blocks().getStringSet("ignored",Collections.emptySet()).isEmpty(),"touch restores reporter");SharedNg.prefs().edit().putInt("threshold",2).commit();SharedNg.reload();check(match(),"restored vote applies");return null;});
   if(expectedDefaultOne)testKenmo();result.putString("checks",new JSONArray(checks).toString());result.putBoolean("ok",true);status=Activity.RESULT_OK;
  }catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));}
  finally{try{main(()->{if(oldPrefs!=null)restore(SharedNg.prefs(),oldPrefs);if(oldBlocks!=null)restore(blocks(),oldBlocks);if(oldCommands!=null)restore(app.getSharedPreferences("haiagaru_thread_commands",0),oldCommands);if(oldRules!=null)field(SharedNg.class,"rules").set(null,oldRules);SharedNg.reload();if(oldPrefs!=null)field(SharedNg.class,"nextSync").setLong(null,oldNext);if(activity!=null)activity.finish();return null;});}catch(Exception cleanup){result.putString("cleanupError",cleanup.getClass().getName());status=Activity.RESULT_CANCELED;}finish(status,result);}
 }
 private void testKenmo()throws Exception{
  final android.widget.EditText[] body=new android.widget.EditText[1];
  main(()->{check(ThreadCommandRules.profile("https://kenmo.org/poverty/").equals("kenmo"),"Kenmo posting profile");check(ThreadCommandRules.values("kenmo").length==19,"Kenmo command menu");app.getSharedPreferences("haiagaru_thread_commands",0).edit().remove("kenmo.15").commit();body[0]=new android.widget.EditText(activity);body[0].setText("本文");Method edit=ThreadCommands.class.getDeclaredMethod("edit",android.widget.EditText.class,String.class,int.class);edit.setAccessible(true);edit.invoke(null,body[0],"kenmo",15);return null;});
  AccessibilityNodeInfo input=null;for(int n=0;n<30&&input==null;n++){AccessibilityNodeInfo root=getUiAutomation().getRootInActiveWindow();if(root!=null)input=find(root,"!reauth:60",false);if(input==null)SystemClock.sleep(100);}
  check(input!=null,"Kenmo editable seconds field");Bundle change=new Bundle();change.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE,"!reauth:120");check(input.performAction(AccessibilityNodeInfo.ACTION_SET_TEXT,change),"Kenmo edit seconds action");waitForIdleSync();tap("本文に追加",false);
  main(()->{check(body[0].getText().toString().equals("!reauth:120\n本文"),"Kenmo inserts edited command into draft without posting");return null;});
 }
 private static void restore(SharedPreferences prefs,Map<String,?> saved){SharedPreferences.Editor edit=prefs.edit().clear();for(Map.Entry<String,?> entry:saved.entrySet()){String k=entry.getKey();Object v=entry.getValue();if(v instanceof Boolean)edit.putBoolean(k,(Boolean)v);else if(v instanceof Integer)edit.putInt(k,(Integer)v);else if(v instanceof Long)edit.putLong(k,(Long)v);else if(v instanceof Float)edit.putFloat(k,(Float)v);else if(v instanceof String)edit.putString(k,(String)v);else if(v instanceof Set)edit.putStringSet(k,(Set<String>)v);}edit.commit();}
}
