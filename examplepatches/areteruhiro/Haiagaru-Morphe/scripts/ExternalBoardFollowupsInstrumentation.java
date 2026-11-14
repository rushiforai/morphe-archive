package app.haiagaru.tests.boardfollowups;
import android.app.*;import android.content.*;import android.database.*;import android.database.sqlite.*;import android.os.*;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Own isolated package/DB, synthetic 8,000-board catalogue and loopback-only transport. */
public final class ExternalBoardFollowupsInstrumentation extends Instrumentation {
 private Context app,test;private ClassLoader loader;private int checks,gets;private long cachedMs;private Class<?> gatewayType,search,cacheType;private Object gateway;
 private void ok(boolean b,String label){if(!b)throw new AssertionError(label);checks++;}
 private static Field field(Class<?> type,String name)throws Exception{for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
 private static Method method(Class<?> c,String name,Class<?>...types)throws Exception{Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m;}
 private Object call(Class<?> c,String name,Class<?>[] types,Object...args)throws Exception{return method(c,name,types).invoke(null,args);}
 private Object gateway(String name,Class<?>[] types,Object...args)throws Exception{return method(gatewayType,name,types).invoke(gateway,args);}
 private <T>T main(Callable<T> action)throws Exception{FutureTask<T> task=new FutureTask<>(action);runOnMainSync(task);return task.get(15,TimeUnit.SECONDS);}
 private final class TestContext extends ContextWrapper {
  TestContext(){super(app);}
  String db(String name){return name.equals("roidon.sqlite")?"followups-boards.sqlite":name.equals("haiagaru-title-snapshots.db")?"followups-snapshots.sqlite":name;}
  @Override public Context getApplicationContext(){return this;}
  @Override public File getDatabasePath(String name){return app.getDatabasePath(db(name));}
  @Override public SQLiteDatabase openOrCreateDatabase(String name,int mode,SQLiteDatabase.CursorFactory f){return app.openOrCreateDatabase(db(name),mode,f);}
  @Override public SQLiteDatabase openOrCreateDatabase(String name,int mode,SQLiteDatabase.CursorFactory f,DatabaseErrorHandler h){return app.openOrCreateDatabase(db(name),mode,f,h);}
 }
 public static final class Popup extends PopupWindow {public Object i,n,m;Popup(Context c,Object list){super(c);i=list;}}
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle result=new Bundle();try{run();result.putString("result","PASS "+checks+" external board/search/history checks; public posts=0; loopback upstream="+gets+"; cached="+cachedMs+"ms");finish(Activity.RESULT_OK,result);}catch(Throwable e){result.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}}
 private void run()throws Exception{
  app=getTargetContext();ok(app.getPackageName().endsWith("sitefix242"),"isolated target");loader=app.getClassLoader();test=new TestContext();
  gatewayType=loader.loadClass("app.morphe.extension.chmate.SiteBoardGateway");search=loader.loadClass("app.morphe.extension.chmate.GlobalTitleSearch");cacheType=loader.loadClass("app.morphe.extension.chmate.GlobalTitleSearchCache");
  SharedPreferences sitePrefs=app.getSharedPreferences("haiagaru.followups-sites",0);sitePrefs.edit().clear().putBoolean("enabled",true).putBoolean("bbs.haiagaru_site_bakusai.enable",true).putBoolean("bbs.haiagaru_site_edge.enable",true).putBoolean("bbs.haiagaru_site_futaba.enable",true).commit();
  Class<?> transport=loader.loadClass(gatewayType.getName()+"$Transport"),response=loader.loadClass(gatewayType.getName()+"$Response");Constructor<?> responseCtor=response.getDeclaredConstructor(int.class,byte[].class,String.class,String.class);responseCtor.setAccessible(true);
  Object source=java.lang.reflect.Proxy.newProxyInstance(loader,new Class[]{transport},(p,m,args)->{if(m.getName().equals("get")){gets++;String html="<table id=cattable><tr><td><a href='res/1792500780.htm'><small>SearchFixture title</small></a><font>103</font></td></tr></table>";return responseCtor.newInstance(200,html.getBytes("UTF-8"),"text/html; charset=UTF-8",null);}throw new AssertionError("No public request/post permitted");});
  Constructor<?> gatewayCtor=gatewayType.getDeclaredConstructor(SharedPreferences.class,transport);gatewayCtor.setAccessible(true);gateway=gatewayCtor.newInstance(sitePrefs,source);
  Field singleton=field(gatewayType,"instance");Object oldGateway=singleton.get(null);singleton.set(null,gateway);
  Field dbField=field(cacheType,"database");Object oldDb=dbField.get(null);Class<?> dbType=loader.loadClass(cacheType.getName()+"$Database");Constructor<?> dbCtor=dbType.getDeclaredConstructor(Context.class);dbCtor.setAccessible(true);SQLiteOpenHelper snapshots=(SQLiteOpenHelper)dbCtor.newInstance(test);dbField.set(null,snapshots);snapshots.getWritableDatabase().delete("subjects",null,null);
  Field memoryField=field(search,"CACHE"),characters=field(search,"cachedCharacters");Map memory=(Map)memoryField.get(null);Map oldMemory;int oldChars=characters.getInt(null);synchronized(memory){oldMemory=new LinkedHashMap(memory);memory.clear();characters.setInt(null,0);}
  SharedPreferences config=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);Object selected=config.getAll().get("globalTitleSearchBoards");
  try{
   String alias=(String)gateway("register",new Class[]{String.class,String.class},"https://dat.2chan.net/t/","Fixture Futaba"),url=(String)gateway("registrationUrl",new Class[]{String.class},alias);
   try(SQLiteDatabase db=test.openOrCreateDatabase("roidon.sqlite",0,null)){
    db.execSQL("DROP TABLE IF EXISTS boards");db.execSQL("CREATE TABLE boards(name TEXT,server TEXT,is_external INTEGER,title TEXT)");db.beginTransaction();
    try{SQLiteStatement put=db.compileStatement("INSERT INTO boards VALUES(?,?,1,?)");for(int n=0;n<8000;n++){put.bindString(1,"bakusai.com/board"+n);put.bindString(2,"bakusai.com");put.bindString(3,"Fixture "+n);put.executeInsert();}
     ContentValues row=new ContentValues();row.put("name","forum.example.org/custom");row.put("server","forum.example.org");row.put("is_external",1);row.put("title","Custom");db.insert("boards",null,row);
     java.net.URI local=java.net.URI.create(url);row=new ContentValues();row.put("name",local.getRawAuthority()+"/"+alias);row.put("server",local.getRawAuthority());row.put("is_external",1);row.put("title","Fixture Futaba");db.insert("boards",null,row);db.setTransactionSuccessful();
    }finally{db.endTransaction();}
   }
   List<?> all=(List<?>)call(search,"candidates",new Class[]{Context.class},test);ok(all.size()==8002,"enabled catalogue includes 8000 managed boards");
   sitePrefs.edit().putBoolean("bbs.haiagaru_site_bakusai.enable",false).commit();List<?> disabled=(List<?>)call(search,"candidates",new Class[]{Context.class},test);ok(disabled.size()==2,"OFF removes all 8000 managed candidates");
   ok(url.startsWith("http://"),"managed endpoint uses HTTP");boolean found=false;for(Object board:disabled)if(url.equals(field(board.getClass(),"url").get(board)))found=true;ok(found,"search keeps correct managed HTTP endpoint");
   groupChecks(sitePrefs);main(()->{animatorChecks();return null;});
   config.edit().putString("globalTitleSearchBoards",new org.json.JSONArray(Collections.singletonList(url)).toString()).commit();
   String base="native\t1\thttps://example.org/test/read.cgi/board/1792500000/\n";
   String fast=extend(true,base);ok(gets==0&&fast.contains("native"),"empty fast cache has no network and preserves native results");
   String latest=extend(false,base);ok(gets>0&&latest.contains("SearchFixture")&&latest.contains("\t104\t"),"latest mode fetches a live loopback board and adds results");int previousGets=gets;
   ExecutorService io=(ExecutorService)field(cacheType,"IO").get(null);io.submit(()->{}).get(10,TimeUnit.SECONDS);
   synchronized(memory){memory.clear();characters.setInt(null,0);}
   long before=SystemClock.elapsedRealtime();fast=extend(true,base);long elapsed=SystemClock.elapsedRealtime()-before;cachedMs=elapsed;
   ok(gets==previousGets&&fast.contains("SearchFixture"),"fast mode restores persisted snapshot without network");ok(elapsed<5000,"cached search is bounded: "+elapsed+"ms");
   sitePrefs.edit().putBoolean("bbs.haiagaru_site_futaba.enable",false).commit();ok(!extend(true,base).contains("SearchFixture"),"disabled board excluded even when a snapshot exists");
  }finally{
   ((ExecutorService)field(cacheType,"IO").get(null)).submit(()->{}).get(10,TimeUnit.SECONDS);dbField.set(null,oldDb);snapshots.close();
   synchronized(memory){memory.clear();memory.putAll(oldMemory);characters.setInt(null,oldChars);}
   if(selected==null)config.edit().remove("globalTitleSearchBoards").commit();else config.edit().putString("globalTitleSearchBoards",selected.toString()).commit();
   gateway("stop",new Class[]{});singleton.set(null,oldGateway);
  }
 }
 private String extend(boolean fast,String base)throws Exception{Class<?> jobType=loader.loadClass(search.getName()+"$Job");Constructor<?> c=jobType.getDeclaredConstructor(String.class,boolean.class);c.setAccessible(true);Object job=c.newInstance("SearchFixture",fast);try{return (String)call(search,"extend",new Class[]{Context.class,jobType,String.class},test,job,base);}finally{method(jobType,"cancel").invoke(job);}}
 private void animatorChecks()throws Exception{
  Class<?> recycler=loader.loadClass("androidx.recyclerview.widget.RecyclerView");Object view=recycler.getConstructor(Context.class).newInstance(app);Object animator=recycler.getMethod("getItemAnimator").invoke(view);ok(animator!=null,"native list initially has an animator");
  Popup popup=new Popup(app,view);Class<?> targets=loader.loadClass("app.morphe.extension.chmate.NativeTargetHistory");Object binding=call(targets,"show",new Class[]{PopupWindow.class,String.class,Context.class,List.class},popup,"0.8.10.242 dev",app,Collections.emptyList());
  ok(recycler.getMethod("getItemAnimator").invoke(view)==null,"target history disables initial diff animation");method(binding.getClass(),"restore").invoke(binding);ok(recycler.getMethod("getItemAnimator").invoke(view)==animator,"leaving targets restores native animator");
 }
 private void groupChecks(SharedPreferences prefs)throws Exception{
  Class<?> refresh=loader.loadClass("app.morphe.extension.chmate.OpenTabsRefresh"),targets=loader.loadClass("app.morphe.extension.chmate.RefreshTargets");Object info=call(refresh,"parseInfo",new Class[]{Context.class,String.class},app,"https://bbs.eddibb.cc/liveedge/");Object bid=call(targets,"nativeBoard",new Class[]{Object.class,String.class},info,"0.8.10.242 dev");
  Class<?> rowType=loader.loadClass("o.KeJGNk"),extra=loader.loadClass("o.KeJ19"),groupType=loader.loadClass("o.setUserHandle"),kindType=loader.loadClass("o.hasApi"),singleton=loader.loadClass("o.hasApi$IconCompatParcelizer");Object kind=null;for(Field f:singleton.getDeclaredFields())if(Modifier.isStatic(f.getModifiers())&&f.getType()==singleton){f.setAccessible(true);kind=f.get(null);break;}
  Object row=rowType.getConstructor(int.class,String.class,bid.getClass(),String.class,List.class,int.class,long.class,extra).newInstance(1,"bbs.eddibb.cc",bid,"Fixture Edge",Collections.emptyList(),0,0L,extra.getConstructor().newInstance());
  List<Object> rows=new ArrayList<>(Collections.nCopies(8000,row));Object group=groupType.getConstructor(String.class,String.class,kindType,List.class).newInstance("<otherGroup>","その他",kind,rows);List<?> source=Collections.singletonList(group);Class<?> groups=loader.loadClass("app.morphe.extension.chmate.ExternalBoardGroups");
  prefs.edit().putBoolean("bbs.haiagaru_site_edge.enable",false).commit();List<?> off=(List<?>)call(groups,"regroup",new Class[]{List.class},source);ok(off.isEmpty(),"OFF removes 8000 unmanaged-folder rows");ok(rows.size()==8000,"saved/source board records retained");
  prefs.edit().putBoolean("bbs.haiagaru_site_edge.enable",true).commit();List<?> on=(List<?>)call(groups,"regroup",new Class[]{List.class},source);ok(!on.isEmpty(),"ON restores retained records");
 }
}
