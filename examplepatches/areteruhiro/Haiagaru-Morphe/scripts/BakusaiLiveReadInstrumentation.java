package app.haiagaru.tests.boards;
import android.app.*;import android.content.*;import android.os.*;
import java.io.*;import java.lang.reflect.*;import java.util.*;
/** Isolated read-only upstream reader probe. Never calls the posting transport. */
public final class BakusaiLiveReadInstrumentation extends Instrumentation {
 private Object call(Object o,String name,Class<?>[] types,Object...args)throws Exception{Method m=o.getClass().getDeclaredMethod(name,types);m.setAccessible(true);try{return m.invoke(o,args);}catch(InvocationTargetException e){throw new IOException(e.getCause());}}
 private Object field(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
 private int requests;
 private String fetch(Object transport,String url)throws Exception{
  if(++requests>90)throw new IOException("probe request limit");
  Object response=call(transport,"get",new Class<?>[]{String.class},url);
  int status=(Integer)field(response,"status");
  String text=(String)call(response,"text",new Class<?>[]{});
  try(FileOutputStream output=new FileOutputStream(new File(getTargetContext().getCacheDir(),"bakusai-live-"+requests+".html"))){output.write(text.getBytes("UTF-8"));}
  Bundle progress=new Bundle();progress.putString("page",requests+" "+url+" status="+status+" bytes="+text.length());sendStatus(1,progress);
  if(status!=200)throw new IOException("HTTP "+status);
  return text;
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();SharedPreferences prefs=null;try{
  Context app=getTargetContext();ClassLoader loader=app.getClassLoader();prefs=app.getSharedPreferences("haiagaru.live-probe."+System.nanoTime(),0);
  Class<?> haiagaru=loader.loadClass("app.morphe.extension.chmate.Haiagaru");Method current=haiagaru.getDeclaredMethod("toolbarActivity",Object.class);current.setAccessible(true);
  Bundle waiting=new Bundle();waiting.putString("state","waiting for visible verification HomeActivity");sendStatus(1,waiting);
  boolean ready=false;for(int n=0;n<40;n++){java.util.concurrent.FutureTask<Boolean> visible=new java.util.concurrent.FutureTask<>(()->{Activity a=(Activity)current.invoke(null,new Object[]{null});return a!=null&&a.hasWindowFocus();});runOnMainSync(visible);if(visible.get()){ready=true;break;}Thread.sleep(250);}if(!ready)throw new IOException("Live probe requires foreground HomeActivity");
  Class<?> gateway=loader.loadClass("app.morphe.extension.chmate.SiteBoardGateway"),transportType=loader.loadClass(gateway.getName()+"$Transport");Constructor<?> ctor=gateway.getDeclaredConstructor(SharedPreferences.class,transportType);ctor.setAccessible(true);Object instance=ctor.newInstance(prefs,null),transport=field(instance,"transport");
  String url="https://bakusai.com/thr_res/acode=15/ctgid=111/bid=4437/tid=8520877/";
  Class<?> protocol=loader.loadClass("app.morphe.extension.chmate.SiteBoardProtocol");Method address=protocol.getDeclaredMethod("address",String.class);address.setAccessible(true);Object board=address.invoke(null,url);String initial=fetch(transport,url);
  Class<?> paging=loader.loadClass("app.morphe.extension.chmate.BakusaiPagination"),fetchType=loader.loadClass(paging.getName()+"$Fetch");Object fetch=java.lang.reflect.Proxy.newProxyInstance(loader,new Class<?>[]{fetchType},(p,m,a)->fetch(transport,(String)a[0]));Method read=paging.getDeclaredMethod("thread",board.getClass(),String.class,String.class,fetchType);read.setAccessible(true);Object page=read.invoke(null,board,"8520877",initial,fetch);List<?> rows=(List<?>)field(page,"entries");int missing=0;for(Object row:rows)if("未取得".equals(field(row,"name")))missing++;
  result.putString("result","PASS read-only native HTTP transport; requests="+requests+" rows="+rows.size()+" missing="+missing);finish(Activity.RESULT_OK,result);
 }catch(Throwable error){StringWriter trace=new StringWriter();error.printStackTrace(new PrintWriter(trace));result.putString("error",trace.toString());finish(Activity.RESULT_CANCELED,result);}finally{if(prefs!=null)prefs.edit().clear().commit();}}
}
