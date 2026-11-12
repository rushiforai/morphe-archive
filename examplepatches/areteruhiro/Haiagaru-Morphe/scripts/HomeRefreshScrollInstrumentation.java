package app.haiagaru.tests.boards;

import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Actual native HOME callback with in-memory rows; no DB changes or network requests. */
public final class HomeRefreshScrollInstrumentation extends Instrumentation {
 private int checks;private boolean baseline;private ClassLoader loader;
 private Field field(Class<?> type,String name)throws Exception{for(;type!=null;type=type.getSuperclass())try{Field f=type.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException absent){}throw new NoSuchFieldException(name);}
 private void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 private Object home(Object manager)throws Exception{
  List<?> fragments=(List<?>)manager.getClass().getMethod("getFragments").invoke(manager);
  for(Object f:fragments){if(f==null)continue;if(f.getClass().getName().equals("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk"))return f;try{Object child=home(f.getClass().getMethod("getChildFragmentManager").invoke(f));if(child!=null)return child;}catch(Exception ignored){}}
  return null;
 }
 private Object find(Activity a)throws Exception{
  Class<?> history=loader.loadClass("app.morphe.extension.chmate.BrowsingHistory");List<?> entries=(List<?>)field(history,"legacyFragments").get(null);
  synchronized(entries){for(Object entry:entries){Object f=((java.lang.ref.WeakReference<?>)field(entry.getClass(),"fragment").get(entry)).get();if(f!=null&&f.getClass().getName().equals("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk")&&f.getClass().getMethod("getActivity").invoke(f)==a){View root=(View)f.getClass().getMethod("getView").invoke(f);if(root!=null&&root.isShown())return f;}}}return null;
 }
 private Object callbackTarget;
 private void test()throws Exception{
  Context app=getTargetContext();loader=app.getClassLoader();Class<?> haiagaru=loader.loadClass("app.morphe.extension.chmate.Haiagaru");Method current=haiagaru.getDeclaredMethod("toolbarActivity",Object.class);current.setAccessible(true);
  Bundle status=new Bundle();status.putString("state","waiting for foreground native HomeActivity");sendStatus(1,status);
  Activity host=null;for(int n=0;n<60;n++){FutureTask<Activity> get=new FutureTask<>(()->{Activity a=(Activity)current.invoke(null,new Object[]{null});return a!=null&&a.hasWindowFocus()?a:null;});runOnMainSync(get);host=get.get();if(host!=null)break;Thread.sleep(250);}ok(host!=null,"foreground native activity for isolated native HOME fixture");final Activity activity=host;
  FutureTask<Void> task=new FutureTask<>(()->{
   Object f=loader.loadClass("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk").getConstructor().newInstance();
   ListView list=(ListView)loader.loadClass("o.qhf").getConstructor(Context.class,android.util.AttributeSet.class).newInstance(activity,null);
   BaseAdapter adapter=(BaseAdapter)loader.loadClass("o.r8lambdaXZREaGE4vvLAA2ZOtsKBd3knAPA").getConstructor(Context.class).newInstance(activity);
   Object button=loader.loadClass("o.r8lambdaAcLFFW49T1Yql_ZgYak67s2Jmds").getConstructor(Context.class,android.util.AttributeSet.class).newInstance(activity,null);
   Class<?> unsafeType=Class.forName("sun.misc.Unsafe");Object unsafe=field(unsafeType,"theUnsafe").get(null);
   Object binding=unsafeType.getMethod("allocateInstance",Class.class).invoke(unsafe,loader.loadClass("o.r8lambdahIGIGCNpKpFqE0lgDli724UCuDM$read"));
   field(binding.getClass(),"j").set(binding,button);field(loader.loadClass("o.r8lambdahIGIGCNpKpFqE0lgDli724UCuDM"),"o").set(f,binding);field(loader.loadClass("o.AdControlButton"),"d").set(f,list);field(f.getClass(),"e").set(f,adapter);list.setAdapter(adapter);list.layout(0,0,600,900);
   Object model=unsafeType.getMethod("allocateInstance",Class.class).invoke(unsafe,loader.loadClass("o.r8lambdaiLoqz4JSFvjggbOq1XDrH5tgYdk"));Class<?> flow=loader.loadClass("o.doHash");
   field(model.getClass(),"p").set(model,flow.getConstructor().newInstance());field(loader.loadClass("o.r8lambdasUaVt9eJw2dqjr6LSsa1Gk1ll2Q"),"k").set(model,flow.getConstructor(Object.class).newInstance(101));
   field(f.getClass(),"c").set(f,model);field(loader.loadClass("o.r8lambdahIGIGCNpKpFqE0lgDli724UCuDM"),"p").set(f,model);
   Dialog fixtureDialog=new Dialog(activity);fixtureDialog.setContentView(list);fixtureDialog.show();fixtureDialog.getWindow().setLayout(600,900);
   ok(list!=null&&adapter!=null&&list.getWidth()>0,"real native HOME fragment/ListView/adapter/completion button");
   Map<Field,Object> previous=new LinkedHashMap<>();for(String name:new String[]{"g","i","j"}){Field store=field(adapter.getClass(),name);previous.put(store,store.get(adapter));}
   Parcelable state=list.onSaveInstanceState();int width=list.getWidth(),height=list.getHeight();
   try{
    Class<?> rowType=loader.loadClass("o.onAdDisplayed$setIcon"),rowsType=loader.loadClass("o.onAdDisplayed$setBackgroundResource");Constructor<?> rowCtor=rowType.getDeclaredConstructors()[0];rowCtor.setAccessible(true);
    Class<?> tabs=loader.loadClass("app.morphe.extension.chmate.OpenTabsRefresh");Method parse=tabs.getDeclaredMethod("parseInfo",Context.class,String.class);parse.setAccessible(true);Object info=parse.invoke(null,app,"https://fixture.invalid/homefixture/");
    Class<?> targets=loader.loadClass("app.morphe.extension.chmate.RefreshTargets");Method nativeBoard=targets.getDeclaredMethod("nativeBoard",Object.class,String.class);nativeBoard.setAccessible(true);Object board=nativeBoard.invoke(null,info,app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName);
    ArrayList<Object> rows=new ArrayList<>();for(int n=0;n<150;n++)rows.add(rowCtor.newInstance((long)n+1,"スクロール位置検証 "+n,board,1790002801L+n,0,0,0,1790002800000L,0,(byte)0,0,0L));Object nativeRows=rowsType.getConstructor(List.class).newInstance(rows);
    for(Field store:previous.keySet())store.set(adapter,nativeRows);adapter.notifyDataSetChanged();
    list.setSelectionFromTop(130,-7);list.forceLayout();list.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));list.layout(list.getLeft(),list.getTop(),list.getRight(),list.getBottom());
    int before=list.getFirstVisiblePosition(),top=list.getChildAt(0).getTop();ok(before>100,"native list scrolled near bottom");
    Class<?> eventType=loader.loadClass("o.me");Method callback=f.getClass().getDeclaredMethod("e",eventType);callback.setAccessible(true);
    for(int n=0;n<4;n++){
     Object event=eventType.getConstructor(int.class,int.class,boolean.class).newInstance(0,0,true);
     callback.invoke(f,event);list.forceLayout();list.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));list.layout(list.getLeft(),list.getTop(),list.getRight(),list.getBottom());
     if(baseline){ok(list.getFirstVisiblePosition()==0,"original completed-refresh callback forces top; before="+before+" after="+list.getFirstVisiblePosition()+" count="+list.getCount()+" selected="+list.getSelectedItemPosition());break;}
     ok(list.getFirstVisiblePosition()==before,"completed-refresh callback preserves visible row");ok(list.getChildAt(0).getTop()==top,"completed-refresh callback preserves pixel offset");
    }
    if(!baseline){Method jump=loader.loadClass("o.r8lambdahIGIGCNpKpFqE0lgDli724UCuDM").getDeclaredMethod("n_");jump.setAccessible(true);jump.invoke(f);list.forceLayout();list.measure(View.MeasureSpec.makeMeasureSpec(width,View.MeasureSpec.EXACTLY),View.MeasureSpec.makeMeasureSpec(height,View.MeasureSpec.EXACTLY));list.layout(list.getLeft(),list.getTop(),list.getRight(),list.getBottom());ok(list.getFirstVisiblePosition()==0,"explicit native scroll-to-top still works");}
   }finally{for(Map.Entry<Field,Object> entry:previous.entrySet())entry.getKey().set(adapter,entry.getValue());adapter.notifyDataSetChanged();list.onRestoreInstanceState(state);fixtureDialog.dismiss();}
   return null;
  });runOnMainSync(task);task.get();
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);baseline=args!=null&&"true".equals(args.getString("baseline"));start();}
 @Override public void onStart(){Bundle result=new Bundle();try{test();result.putString("result","PASS "+checks+" actual native HOME completion/scroll "+(baseline?"baseline reproduction":"position regression")+" checks; DB/network writes=0");finish(Activity.RESULT_OK,result);}catch(Throwable error){StringWriter trace=new StringWriter();error.printStackTrace(new PrintWriter(trace));result.putString("error",trace.toString());finish(Activity.RESULT_CANCELED,result);}}
}
