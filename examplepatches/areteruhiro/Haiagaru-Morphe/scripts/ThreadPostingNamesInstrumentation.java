package app.haiagaru.tests.threadnames;
import android.app.*;import android.content.*;import android.os.*;import android.widget.*;
import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Private synthetic names on isolated packages only; never submits a post. */
public final class ThreadPostingNamesInstrumentation extends Instrumentation {
 int checks;Activity host;Class<?> names;SharedPreferences config,saved;String keyA,keyB;Map<String,?> before;boolean had,enabled;
 void ok(boolean b,String label){if(!b)throw new AssertionError(label);checks++;}
 Method method(String n,Class<?>...p)throws Exception{Method m=names.getDeclaredMethod(n,p);m.setAccessible(true);return m;}
 <T>T main(Callable<T> action)throws Exception{FutureTask<T> t=new FutureTask<>(action);runOnMainSync(t);return t.get(10,TimeUnit.SECONDS);}
 EditText editor(String text,String url,boolean newThread)throws Exception{EditText e=new EditText(host);e.setText(text);method("bind",EditText.class,String.class,boolean.class).invoke(null,e,url,newThread);return e;}
 @Override public void onCreate(Bundle b){super.onCreate(b);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{test();out.putString("result","PASS "+checks+" per-thread posting-name checks; network/posts=0");finish(Activity.RESULT_OK,out);}catch(Throwable e){out.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,out);}}
 void test()throws Exception{
  Context app=getTargetContext();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated package");names=app.getClassLoader().loadClass("app.morphe.extension.chmate.ThreadPostingNames");
  config=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);had=config.contains("threadPostingNames");enabled=config.getBoolean("threadPostingNames",false);
  saved=app.getSharedPreferences("haiagaru_thread_posting_names",0);before=saved.getAll();String a="https://bbs.eddibb.cc/test/read.cgi/liveedge/9999999997/",b="https://bbs.eddibb.cc/test/read.cgi/liveedge/9999999998/";
  keyA=(String)method("key",String.class).invoke(null,a);keyB=(String)method("key",String.class).invoke(null,b);saved.edit().remove(keyA).remove(keyB).commit();
  host=startActivitySync(new Intent().setClassName(app.getPackageName(),"app.morphe.extension.chmate.ToolbarIconsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  try{main(()->{
   config.edit().remove("threadPostingNames").commit();EditText off=editor("board name",a,false);ok(off.getText().toString().equals("board name"),"initial OFF preserves board name");off.setText("native edit");ok(!saved.contains(keyA),"OFF never stores per-thread data");
   config.edit().putBoolean("threadPostingNames",true).commit();EditText first=editor("board name",a,false);ok(first.length()==0,"unseen thread starts blank");first.setText("名前A#fixture");ok(saved.getString(keyA,"").equals("名前A#fixture"),"typing persists a private thread name");
   EditText second=editor("名前A#fixture",b,false);ok(second.length()==0,"another thread does not inherit previous board name");second.setText("名前B");ok(!keyA.equals(keyB),"threads on the same board have separate keys");
   EditText reopened=editor("名前B",a,false);ok(reopened.getText().toString().equals("名前A#fixture"),"reopening restores only that thread name");reopened.setText("");ok(editor("board name",a,false).length()==0,"explicit empty name remains empty");ok(editor("default",b,false).getText().toString().equals("名前B"),"clearing A does not clear B");
   ok(keyA.equals(method("key",String.class).invoke(null,a+"17")),"response permalink shares thread key");
   ok(editor("creation name","https://bbs.eddibb.cc/liveedge/",true).getText().toString().equals("creation name"),"new-thread creation keeps board behavior");
   ok(editor("native name","https://example.invalid/board/",false).getText().toString().equals("native name"),"unknown URL never merges unrelated names");
   config.edit().putBoolean("threadPostingNames",false).commit();ok(editor("board default",b,false).getText().toString().equals("board default"),"OFF returns to native board behavior");second.setText("changed while off");ok(saved.getString(keyB,"").equals("名前B"),"existing listener stops saving when OFF");return null;
  });}finally{
   if(host!=null)main(()->{host.finish();return null;});if(had)config.edit().putBoolean("threadPostingNames",enabled).commit();else config.edit().remove("threadPostingNames").commit();
   SharedPreferences.Editor restore=saved.edit();for(String key:new String[]{keyA,keyB}){if(before.containsKey(key))restore.putString(key,(String)before.get(key));else restore.remove(key);}restore.commit();
  }
 }
}
