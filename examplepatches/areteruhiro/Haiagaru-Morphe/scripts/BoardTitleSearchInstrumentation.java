package app.haiagaru.tests.opentabs;
import android.app.*;import android.content.*;import android.os.*;import android.view.*;import java.lang.reflect.*;import java.util.concurrent.*;

/** Exercise actual 226 board, HOME and thread menu inflation; guard against duplicate Search. */
public final class BoardTitleSearchInstrumentation extends Instrumentation {
 private int checks;private void ok(boolean value,String text){if(!value)throw new AssertionError(text);checks++;}
 private Field field(Class<?> c,String name)throws Exception{for(;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException absent){}throw new NoSuchFieldException(name);}
 private void visibility(Activity host,ClassLoader loader)throws Exception{
  Class<?> unsafeType=Class.forName("sun.misc.Unsafe");Field singleton=field(unsafeType,"theUnsafe");Object unsafe=singleton.get(null);Method allocate=unsafeType.getMethod("allocateInstance",Class.class);
  Object probe=new MenuVisibilityProbe226();
  Object controller=field(loader.loadClass("androidx.fragment.app.FragmentActivity"),"e").get(host);Object callback=field(controller.getClass(),"d").get(controller);field(probe.getClass(),"mHost").set(probe,callback);
  Class<?> holderType=loader.loadClass("jp.syoboi.a2chMate.fragment.RoidonListFragment$read"),toolbarType=loader.loadClass("o.setAdInteractionListener"),modelType=loader.loadClass("o.PAGBannerAdWrapperListener"),buttonType=loader.loadClass("o.PAGBannerAdLoadCallback");
  Object holder=allocate.invoke(unsafe,holderType),toolbar=allocate.invoke(unsafe,toolbarType),model=allocate.invoke(unsafe,modelType),entry=allocate.invoke(unsafe,buttonType);
  field(buttonType,"b").setInt(entry,0x7f090100);field(modelType,"b").set(model,java.util.Collections.singletonList(entry));field(toolbarType,"h").set(toolbar,model);field(holderType,"f").set(holder,toolbar);field(probe.getClass(),"l").set(probe,holder);
  Menu menu=(Menu)loader.loadClass("o.getStream").getConstructor(Context.class,byte.class).newInstance(host,(byte)0);MenuItem search=menu.add(0,0x7f090100,0,"検索");
  for(boolean lower:new boolean[]{false,true,false}){field(buttonType,"c").setBoolean(entry,lower);((MenuVisibilityProbe226)probe).prepareNative(menu);ok(search.isVisible()!=lower,"native title Search is inverse of lower toolbar Search: "+lower);}
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{
  Context app=getTargetContext();ClassLoader loader=app.getClassLoader();
  app.startActivity(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));Thread.sleep(1500);
  for(int attempt=0;attempt<30;attempt++){FutureTask<Object> waiting=new FutureTask<>(()->{Class<?> h=loader.loadClass("app.morphe.extension.chmate.Haiagaru");Method m=h.getDeclaredMethod("toolbarActivity",Object.class);m.setAccessible(true);return m.invoke(null,new Object[]{null});});runOnMainSync(waiting);if(waiting.get(5,TimeUnit.SECONDS)!=null)break;Thread.sleep(1000);}
  FutureTask<Void> task=new FutureTask<>(()->{
   Class<?> extension=loader.loadClass("app.morphe.extension.chmate.Haiagaru");Method activity=extension.getDeclaredMethod("toolbarActivity",Object.class);activity.setAccessible(true);Activity host=(Activity)activity.invoke(null,new Object[]{null});ok(host!=null,"resumed host");
   for(String type:new String[]{"o.Yhp5","jp.syoboi.a2chMate.fragment.HomeFragment","jp.syoboi.a2chMate.ui.reslist.ResListFragment"}){
   Object board=loader.loadClass(type).getConstructor().newInstance();
   Menu menu=(Menu)loader.loadClass("o.getStream").getConstructor(Context.class,byte.class).newInstance(host,(byte)0);
   Method inflate=board.getClass().getMethod("b",Menu.class,MenuInflater.class);inflate.invoke(board,menu,new MenuInflater(host));
   MenuItem search=menu.findItem(0x7f090100);ok(search!=null,"Search present in board title menu");ok(search.getTitle().toString().equals("検索"),"native Search label");ok(search.getIcon()!=null,"Search icon");
   inflate.invoke(board,menu,new MenuInflater(host));int count=0;for(int n=0;n<menu.size();n++)if(menu.getItem(n).getItemId()==0x7f090100)count++;ok(count==1,"no duplicate Search when menu already contains it");}
   visibility(host,loader);return null;
  });runOnMainSync(task);task.get(20,TimeUnit.SECONDS);out.putString("result","PASS "+checks+" actual 226 board menu checks");finish(Activity.RESULT_OK,out);
 }catch(Throwable error){out.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,out);}}
}
