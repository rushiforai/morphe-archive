package app.haiagaru.tests.boards;

import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;import org.json.*;

/** Real AtomicFile/prefs deletion in an isolated directory, plus the production error dialog. */
public final class SharedDataAndErrorInstrumentation extends Instrumentation {
 private ClassLoader loader;private int checks;
 private Field field(Class<?> type,String name)throws Exception{Field f=type.getDeclaredField(name);f.setAccessible(true);return f;}
 private Object stat(Class<?> type,String name,Class<?>[] types,Object...args)throws Exception{Method m=type.getDeclaredMethod(name,types);m.setAccessible(true);try{return m.invoke(null,args);}catch(InvocationTargetException e){throw new IOException(e.getCause());}}
 private void ok(boolean value,String message){if(!value)throw new AssertionError(message);checks++;}
 private void cache()throws Exception{
  Context app=getTargetContext();Class<?> shared=loader.loadClass("app.morphe.extension.chmate.SharedNg");
  ((ExecutorService)field(shared,"IO").get(null)).submit(()->{}).get(15,TimeUnit.SECONDS);
  Object lock=field(shared,"SOURCE_LOCK").get(null);Map<Field,Object> saved=new LinkedHashMap<>();
  for(String name:new String[]{"context","rules","enabled","matchPlan","status","nextSync","sourceGeneration"}){Field f=field(shared,name);saved.put(f,f.get(null));}
  File dir=new File(app.getCacheDir(),"shared-ng-deletion-test-"+System.nanoTime());ok(dir.mkdir(),"isolated directory");
  SharedPreferences prefs=app.getSharedPreferences("haiagaru.deletion-test."+System.nanoTime(),0);
  Context isolated=new ContextWrapper(app){@Override public File getFilesDir(){return dir;}@Override public SharedPreferences getSharedPreferences(String n,int mode){return prefs;}};
  try{
   synchronized(lock){field(shared,"context").set(null,isolated);}
   String id=String.join("",Collections.nCopies(64,"a"));
   JSONObject row=new JSONObject().put("id",id).put("board","5ch/all").put("kind","keyword").put("value","容量削除のテスト").put("period","").put("votes",1);
   List<?> rules=(List<?>)stat(shared,"decode",new Class<?>[]{JSONArray.class},new JSONArray().put(row));
   prefs.edit().putBoolean("enabled",true).putLong("cursor",123).putLong("lastSync",456).putInt("threshold",7).putString("localEditsV1","{}").putString("reportQueue","[]").putStringSet("exceptions",Collections.singleton(id)).commit();
   field(shared,"rules").set(null,rules);field(shared,"enabled").set(null,true);field(shared,"matchPlan").set(null,null);
   stat(shared,"index",new Class<?>[]{});ok(field(shared,"matchPlan").get(null)!=null,"matching plan exists before deletion");
   stat(shared,"saveCache",new Class<?>[]{List.class,String.class},rules,stat(shared,"feedEndpoint",new Class<?>[]{}));
   File base=((android.util.AtomicFile)stat(shared,"cacheFile",new Class<?>[]{})).getBaseFile();
   for(String suffix:new String[]{".bak",".new"})try(FileOutputStream out=new FileOutputStream(base.getPath()+suffix)){out.write(new byte[]{1,2,3});}
   long bytes=(Long)stat(shared,"downloadedBytes",new Class<?>[]{});ok(bytes>6,"actual compressed file plus pending/backup bytes counted");
   long generation=field(shared,"sourceGeneration").getLong(null);
   long freed=(Long)stat(shared,"deleteDownloadedData",new Class<?>[]{});ok(freed==bytes,"reported freed capacity matches actual files");
   for(String suffix:new String[]{"",".bak",".new"})ok(!new File(base.getPath()+suffix).exists(),"cache file removed: "+suffix);
   ok(!(Boolean)field(shared,"enabled").get(null)&&!prefs.getBoolean("enabled",true),"online shared NG remains OFF");
   ok(((List<?>)field(shared,"rules").get(null)).isEmpty()&&field(shared,"matchPlan").get(null)==null,"downloaded memory and matching plan released");
   ok(prefs.getLong("cursor",-1)==0&&!prefs.contains("lastSync"),"next explicit enable starts a fresh download");
   ok(field(shared,"sourceGeneration").getLong(null)==generation+1,"in-flight loads/syncs invalidated");
   ok(prefs.getInt("threshold",0)==7&&prefs.getStringSet("exceptions",Collections.emptySet()).contains(id)&&prefs.getString("localEditsV1","").equals("{}")&&prefs.getString("reportQueue","").equals("[]"),"user settings/overlays/exclusions/report queue retained");
   stat(shared,"schedule",new Class<?>[]{});ok((Long)stat(shared,"downloadedBytes",new Class<?>[]{})==0,"automatic schedule does not recreate deleted data");
   ok((Long)stat(shared,"deleteDownloadedData",new Class<?>[]{})==0,"deleting already empty data succeeds");
  }finally{synchronized(lock){for(Map.Entry<Field,Object> entry:saved.entrySet())entry.getKey().set(null,entry.getValue());}prefs.edit().clear().commit();for(File file:Objects.requireNonNull(dir.listFiles()))file.delete();dir.delete();}
 }
 private void dialog()throws Exception{
  Class<?> haiagaru=loader.loadClass("app.morphe.extension.chmate.Haiagaru");
  Bundle waiting=new Bundle();waiting.putString("state","waiting for visible verification HomeActivity");sendStatus(1,waiting);
  Activity host=null;for(int n=0;n<40;n++){FutureTask<Activity> ready=new FutureTask<>(()->(Activity)stat(haiagaru,"toolbarActivity",new Class<?>[]{Object.class},new Object[]{null}));runOnMainSync(ready);host=ready.get();if(host!=null&&host.hasWindowFocus())break;host=null;Thread.sleep(250);}ok(host!=null,"foreground host for full error display");
  Class<?> errorType=loader.loadClass("app.morphe.extension.chmate.BakusaiAccessError"),ui=loader.loadClass("app.morphe.extension.chmate.SiteReadFailureUi");Constructor<?> ctor=errorType.getDeclaredConstructor(String.class);ctor.setAccessible(true);Exception error=(Exception)ctor.newInstance("thr_res:759");
  stat(ui,"show",new Class<?>[]{Exception.class},error);waitForIdleSync();
  FutureTask<Void> verify=new FutureTask<>(()->{AlertDialog shown=(AlertDialog)((java.lang.ref.WeakReference<?>)field(ui,"shown").get(null)).get();ok(shown!=null&&shown.isShowing(),"production source-error dialog visible");try{
   TextView message=shown.findViewById(android.R.id.message);ok(message!=null&&message.getText().toString().contains("しばらくしてアクセスし直してください")&&message.getText().toString().contains("thr_res:759"),"retry advice and actual upstream number fully present");
   TextView title=shown.findViewById(shown.getContext().getResources().getIdentifier("alertTitle","id","android"));ok(title!=null&&title.getText().toString().contains("BKS-759"),"clear application error code in title");
   android.text.Layout layout=message.getLayout();ok(layout!=null&&layout.getLineCount()>1,"full message has real layout");for(int line=0;line<layout.getLineCount();line++)ok(layout.getEllipsisCount(line)==0,"message line is not ellipsized");
  }finally{shown.dismiss();}return null;});runOnMainSync(verify);verify.get();
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();try{loader=getTargetContext().getClassLoader();cache();dialog();result.putString("result","PASS "+checks+" actual downloaded-file/prefs/memory cleanup and untruncated error-dialog checks; real user files/public requests=0");finish(Activity.RESULT_OK,result);}catch(Throwable error){StringWriter trace=new StringWriter();error.printStackTrace(new PrintWriter(trace));result.putString("error",trace.toString());finish(Activity.RESULT_CANCELED,result);}}
}
