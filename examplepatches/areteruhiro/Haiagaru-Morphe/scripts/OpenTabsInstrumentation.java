package app.haiagaru.tests.opentabs;

import android.app.*;
import android.content.*;
import android.os.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

/** Isolated native models/data only; never enqueues work or changes native NG rules. */
public final class OpenTabsInstrumentation extends Instrumentation {
 private int checks;private ClassLoader loader;private Context app;private boolean old,mid;private Class<?> api,scope,row,page;
 private android.content.SharedPreferences nativePrefs;private boolean modePresent,modeValue,testTablet;
 private void restoreMode(){if(nativePrefs!=null){android.content.SharedPreferences.Editor e=nativePrefs.edit();if(modePresent)e.putBoolean("enableTabletHome2",modeValue);else e.remove("enableTabletHome2");e.commit();}}
 private void check(boolean value,String text){if(!value)throw new AssertionError(text);checks++;}
 private Field field(Class<?> owner,String name)throws Exception{for(Class<?> c=owner;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
 private Object value(Object obj,String name)throws Exception{return field(obj.getClass(),name).get(obj);}
 private Object call(Class<?> owner,String name,Class<?>[] types,Object...args)throws Exception{Method m=owner.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);}
 @Override public void onCreate(Bundle args){super.onCreate(args);testTablet=args!=null&&"true".equals(args.getString("tablet"));start();}
 @Override public void onStart(){Bundle out=new Bundle();try{
  app=getTargetContext();loader=app.getClassLoader();old=app.getPackageName().endsWith("191");mid=app.getPackageName().endsWith("226");
  Intent launch=new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  FutureTask<Void> task=new FutureTask<>(()->{runChecks(null);return null;});runOnMainSync(task);task.get(20,TimeUnit.SECONDS);
  if(testTablet){
  nativePrefs=android.preference.PreferenceManager.getDefaultSharedPreferences(app);modePresent=nativePrefs.contains("enableTabletHome2");modeValue=nativePrefs.getBoolean("enableTabletHome2",false);
  runOnMainSync(()->nativePrefs.edit().putBoolean("enableTabletHome2",true).commit());
  Intent tabletIntent=new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.TabletHomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  app.startActivity(tabletIntent);Thread.sleep(1500);FutureTask<Void> paneTest=new FutureTask<>(()->{
   Activity live=(Activity)call(loader.loadClass("app.morphe.extension.chmate.Haiagaru"),"toolbarActivity",new Class<?>[]{Object.class},new Object[]{null});
   check(live!=null&&!live.isFinishing()&&!live.isDestroyed()&&live.getClass().getName().endsWith(".TabletHomeActivity"),"tablet resumed: "+(live==null?"null":live.getClass().getName()));
   Class<?> tabs=loader.loadClass("app.morphe.extension.chmate.NativeToolTabs");
   List<?> open=(List<?>)call(tabs,"openPages",new Class<?>[]{Activity.class},live);
   check(open!=null,"actual tablet pane snapshot API");
   Object captured=call(api,"snapshot",new Class<?>[]{Context.class,List.class},app,open);
   check(captured!=null,"actual tablet page arguments parsed without navigation or work enqueue");
   live.finish();return null;
  });runOnMainSync(paneTest);paneTest.get(20,TimeUnit.SECONDS);
  }
  restoreMode();out.putString("result","PASS "+checks+" native open-tab/UA/NG checks; network requests=0");finish(Activity.RESULT_OK,out);
 }catch(Throwable e){restoreMode();out.putString("checksBeforeFailure",String.valueOf(checks));out.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,out);}}
 private Object page(int type,String address)throws Exception{Bundle args=new Bundle();if(address!=null)args.putString("_data",address);return page.getConstructor(int.class,Bundle.class).newInstance(type,args);}
 private Object snapshot(Object...pages)throws Exception{return call(api,"snapshot",new Class<?>[]{Context.class,List.class},app,Arrays.asList(pages));}
 private Set<?> set(Object obj,String name)throws Exception{return (Set<?>)value(obj,name);}
 private Object newScope(Collection<String> keys,boolean download)throws Exception{Constructor<?> c=scope.getDeclaredConstructor(Collection.class,boolean.class);c.setAccessible(true);return c.newInstance(keys,download);}
 private Object mark(Collection<String> keys,boolean download)throws Exception{
  Object selected=newScope(keys,download);ThreadLocal<Object> scheduling=(ThreadLocal<Object>)field(api,"scheduling").get(null);
  Map<String,Object> input=new HashMap<>();scheduling.set(selected);
  try{call(api,"writeScope",new Class<?>[]{Map.class},input);}finally{scheduling.remove();}
  Class<?> data=loader.loadClass(old?"o.a6":mid?"o.InMobiMediationAdapterNativeAdViewListener11":"o.isAndroid");
  Object nativeData=data.getConstructor(Map.class).newInstance(input),worker=new Object();
  call(api,"mark",new Class<?>[]{Object.class,Object.class},worker,nativeData);
  check((Boolean)call(api,"active",new Class<?>[]{Object.class},worker),"scope survives native Data constructor");
  return worker;
 }
 private List<?> filter(String name,Object worker,List<?> rows)throws Exception{return (List<?>)call(api,name,new Class<?>[]{Object.class,List.class},worker,rows);}
 private Object row(String board,long id)throws Exception{
  Class<?>[] types={long.class,long.class,String.class,String.class,int.class,int.class,int.class,old||mid?byte.class:int.class,int.class,int.class};
  Constructor<?> c=row.getDeclaredConstructor(types);c.setAccessible(true);
  Object flag=old||mid?(Object)Byte.valueOf((byte)0):Integer.valueOf(0);
  return c.newInstance(123L,id,board,"fixture",0,10,0,flag,0,0);
 }
 private void runChecks(Activity activity)throws Exception{
  api=loader.loadClass("app.morphe.extension.chmate.OpenTabsRefresh");scope=loader.loadClass(api.getName()+"$Scope");
  page=loader.loadClass(old?"o.MediationServiceImpldExternalSyntheticLambda0":mid?"o.Kjv":"o.zzeq");
  row=loader.loadClass("jp.syoboi.a2chMate.autocheck.AutoCheckWork$"+(mid?"write":"RemoteActionCompatParcelizer"));
  String thread="https://egg.5ch.io/test/read.cgi/android/1784210927/",other="https://medaka.5ch.io/pc/",same="https://egg.5ch.io/android/";
  Object one=snapshot(page(2,thread));String key=(String)set(one,"threads").iterator().next();String board=key.substring(0,key.lastIndexOf('\n'));
  check(set(one,"threads").size()==1&&set(one,"boards").isEmpty(),"thread snapshot from uninstantiated page");
  Object both=snapshot(page(2,thread),page(2,thread),page(1,same),page(1,other),page(1,other),page(0,null),page(4,null));
  check(set(both,"threads").size()==1,"same thread in both panes deduplicated");
  check(set(both,"boards").size()==1&&((Number)value(both,"boardCount")).intValue()==2,"same-board subject merged with thread request");
  Object livePlan=call(api,"snapshot",new Class<?>[]{Context.class,List.class,boolean.class},app,Arrays.asList(page(2,thread),page(1,same),page(1,other)),false);
  check(set(livePlan,"boards").size()==2,"live thread refresh does not consume a board's subject request");
  check(!(Boolean)call(api,"nativeRefresh",new Class<?>[]{Object.class},new Object()),"native UI dispatcher rejects unrelated fragments");
  check(!(Boolean)call(api,"dispatching",new Class<?>[0]),"ordinary refresh is not marked as batch UI dispatch");
  check(set(snapshot(page(0,null),page(3,null),page(4,null)),"threads").isEmpty(),"home/blank/tool pages excluded");
  Object info=call(api,"parseInfo",new Class<?>[]{Context.class,String.class},app,thread);
  Class<?> targets=loader.loadClass("app.morphe.extension.chmate.RefreshTargets");
  Object bid=call(targets,"nativeBoard",new Class<?>[]{Object.class,String.class},info,app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName);
  Bundle args=new Bundle();args.putParcelable("bid",(android.os.Parcelable)bid);Object boardPage=page.getConstructor(int.class,Bundle.class).newInstance(1,args);
  check(set(snapshot(boardPage),"boards").contains(board),"native bid board tab supported");
  String second=(String)set(both,"boards").iterator().next();
  Object worker=mark(Arrays.asList(key,board+"\n999999999"),true);
  Object selected=row(board,1784210927L),unselected=row(board,17),unrelated=row(second,19);
  List<Object> input=new ArrayList<>(Arrays.asList(selected,unselected,unrelated));List<?> rows=filter("filter",worker,input);
  check(rows.size()==2&&rows.get(0)==selected,"requested thread preserved, missing thread materialized");
  check(input.size()==3&&input.get(1)==unselected,"native input list untouched");
  Object synthetic=rows.get(1);check(((Number)value(synthetic,old?"d":mid?"b":"c")).longValue()==999999999L,"synthetic thread ID");
  check(filter("downloadRows",worker,input).equals(Collections.singletonList(selected)),"subject-added candidates cannot download unrelated DAT");
  check((Boolean)call(api,"downloadGroup",new Class<?>[]{Object.class,Object.class,List.class,boolean.class},worker,null,input,false),"thread work always obtains DAT");
  Object boardWorker=mark(Arrays.asList(board,second),false);rows=filter("filter",boardWorker,input);
  check(rows.size()==2,"one native representative per board");
  check(!(Boolean)call(api,"downloadGroup",new Class<?>[]{Object.class,Object.class,List.class,boolean.class},boardWorker,null,input,true),"board-only work disables DAT even with image patrol enabled");
  check(filter("filter",new Object(),input)==input,"ordinary patrol uses original rows");
  check(filter("downloadRows",new Object(),input)==input,"ordinary DAT selection unchanged");
  Object emptyWorker=mark(Collections.singletonList("fixture.invalid/empty"),false);rows=filter("filter",emptyWorker,Collections.emptyList());
  check(rows.size()==1&&((Number)value(rows.get(0),old?"d":mid?"b":"c")).longValue()==0,"empty board still receives subject acquisition");
  Class<?> ua=loader.loadClass("app.morphe.extension.chmate.BrowserUaTemplates");
  for(int i=0;i<3;i++){String saved=(String)call(ua,"value",new Class<?>[]{int.class},i);check(((Number)call(ua,"selectedIndex",new Class<?>[]{String.class},saved)).intValue()==i,"UA selected radio index "+i);check(((String)call(ua,"selectedLabel",new Class<?>[]{String.class},saved)).contains("Android "+(14+i)),"UA selected label "+i);}
  check(((Number)call(ua,"selectedIndex",new Class<?>[]{String.class},"custom-UA")).intValue()==-1,"custom UA not falsely marked as template");
  check(((String)call(ua,"selectedLabel",new Class<?>[]{String.class},"custom-UA")).contains("カスタム"),"custom UA label");
  String ng=old?"o.MaxFullscreenAdImplExternalSyntheticLambda4":mid?"o.unsharedCopy":"o.AdRequestBuilder";
  boolean patchedResume=false;for(Method m:loader.loadClass(ng).getDeclaredMethods())if(m.getName().equals("onResume")&&m.getParameterTypes().length==0)patchedResume=true;
  check(!patchedResume,"native NG editor no injected auto-dialog onResume");
  int resource=app.getResources().getIdentifier("haiagaru_refresh_open_tabs","string",app.getPackageName());check(resource!=0,"toolbar choice label resource");
  check(app.getResources().getIdentifier("haiagaru_refresh_open_tabs","drawable",app.getPackageName())!=0,"toolbar icon resource");
  Class<?> scheduler=loader.loadClass(old?"o.mdExternalSyntheticLambda0":mid?"o.settings":"o.TTRewardVideoActivity8");
  check(scheduler.getDeclaredMethod("haiagaruRefreshOpenThreads",Context.class,boolean.class)!=null&&scheduler.getDeclaredMethod("haiagaruRefreshOpenBoards",Context.class,boolean.class)!=null,"both scoped native scheduling bridges");
 }
}
