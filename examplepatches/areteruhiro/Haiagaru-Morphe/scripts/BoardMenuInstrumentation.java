package app.haiagaru.tests.opentabs;
import android.app.*;import android.content.*;import android.os.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;
/** Native board/group constructors only; no network, DB mutation or user data import. */
public final class BoardMenuInstrumentation extends Instrumentation {
 private Context app;private ClassLoader loader;private boolean modern,old;private int checks;private Class<?> board,group,groups;private String rowsField,idField;
 private Field f(Class<?> c,String name)throws Exception{for(Class<?> t=c;t!=null;t=t.getSuperclass())try{Field f=t.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
 private Object get(Object o,String name)throws Exception{return f(o.getClass(),name).get(o);}
 private Object call(Class<?> c,String name,Class<?>[] types,Object...args)throws Exception{Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m.invoke(null,args);}
 private void ok(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}
 private Object bid(String url)throws Exception{Class<?> tabs=loader.loadClass("app.morphe.extension.chmate.OpenTabsRefresh");Object info=call(tabs,"parseInfo",new Class<?>[]{Context.class,String.class},app,url);return call(loader.loadClass("app.morphe.extension.chmate.RefreshTargets"),"nativeBoard",new Class<?>[]{Object.class,String.class},info,app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName);}
 private Object row(String server,String path,String title,String[] categories)throws Exception{
  Object id=bid("https://"+server+"/"+path+"/");
  if(modern){Class<?> extra=loader.loadClass("o.KeJ19");return board.getConstructor(int.class,String.class,id.getClass(),String.class,List.class,int.class,long.class,extra).newInstance(7,server,id,title,Arrays.asList(categories),3,123456789L,extra.getConstructor().newInstance());}
  return board.getConstructor(int.class,String.class,String.class,String.class,String[].class,byte.class,String.class,long.class).newInstance(7,server,id.toString(),title,categories,(byte)3,"{}",123456789L);
 }
 private Object group(String id,String title,List<?> rows)throws Exception{
  if(modern){Class<?> kind=loader.loadClass("o.hasApi"),singleton=loader.loadClass("o.hasApi$IconCompatParcelizer");Object other=null;for(Field f:singleton.getDeclaredFields())if(Modifier.isStatic(f.getModifiers())&&f.getType()==singleton){f.setAccessible(true);other=f.get(null);break;}if(other==null)throw new AssertionError("Other kind singleton");return group.getConstructor(String.class,String.class,kind,List.class).newInstance(id,title,other,rows);}
  Object made=group.getConstructor(String.class,String.class,String.class).newInstance(id,null,title);((List<Object>)get(made,rowsField)).addAll(rows);return made;
 }
 @Override public void onCreate(Bundle args){super.onCreate(args);start();}
 @Override public void onStart(){Bundle out=new Bundle();try{app=getTargetContext();loader=app.getClassLoader();old=app.getPackageName().endsWith("191");modern=app.getPackageName().endsWith("242");
  FutureTask<Void> task=new FutureTask<>(()->{test();return null;});runOnMainSync(task);task.get(20,TimeUnit.SECONDS);out.putString("result","PASS "+checks+" native external board/menu checks; DB/network=0");finish(Activity.RESULT_OK,out);
 }catch(Throwable t){out.putString("error",android.util.Log.getStackTraceString(t));finish(Activity.RESULT_CANCELED,out);}}
 private void test()throws Exception{
  groups=loader.loadClass("app.morphe.extension.chmate.ExternalBoardGroups");board=loader.loadClass(old?"o.MediationServiceImplExternalSyntheticLambda5":modern?"o.KeJGNk":"o.DeferredSocketAdapter");group=loader.loadClass(old?"o.MediationServiceImplExternalSyntheticLambda3":modern?"o.setUserHandle":"o.ConscryptSocketAdapterCompanionfactory1");rowsField=old?"d":modern?"e":"a";idField=old?"a":"c";
  Object broken=row("bbs.eddibb.cc","liveedge","wrong thread (42)ID:test",new String[]{"return text.toLowerCase().includes(rule.pattern.toLowerCase());","gtag('config','UA-test');","});"});
  Object operate=row("bbs.eddibb.cc","operate","運営",new String[]{"運営"});Object kenmo=row("kenmo.org","poverty","嫌儲",new String[]{"掲示板"});Object custom=row("forum.example.org","custom","任意板",new String[]{"カテゴリ"});Object five=row("egg.5ch.io","android","Android",new String[]{"家電製品"});
  Object nativeGroup=group("5ch.io","5ch.io",Collections.singletonList(five)),other=group("<otherGroup>","その他",Arrays.asList(broken,operate,kenmo,custom));List<Object> source=new ArrayList<>(Arrays.asList(nativeGroup,other));
  String prefName=(String)f(loader.loadClass("app.morphe.extension.chmate.WacchoiSearchOptions"),"PREFS").get(null);android.content.SharedPreferences prefs=app.getSharedPreferences(prefName,0);String option="externalBoardSiteGroups";boolean present=prefs.contains(option),previous=prefs.getBoolean(option,false);
  try{
  prefs.edit().remove(option).commit();List<?> defaultGroups=(List<?>)call(groups,"regroup",new Class<?>[]{List.class},source);ok(defaultGroups.size()==2&&get(defaultGroups.get(1),idField).equals("<otherGroup>"),"site grouping initially OFF, Other retained");
  Object defaultFixed=((List<?>)get(defaultGroups.get(1),rowsField)).get(0);ok(get(defaultFixed,modern?"h":"title").equals("エッヂ"),"damaged menu display repaired even with site grouping OFF");
  prefs.edit().putBoolean(option,true).commit();
  List<?> result=(List<?>)call(groups,"regroup",new Class<?>[]{List.class},source);ok(result.size()==4,"native group plus three external sites at root");ok(source.size()==2,"caller group list not mutated by modern API");
  Map<String,Object> byId=new LinkedHashMap<>();for(Object g:result){String id=(String)get(g,idField);byId.put(id,g);ok(!id.equals("<otherGroup>"),"no external boards remain under Other");}
  ok(byId.containsKey("5ch.io")&&byId.containsKey("<haiagaru-external:eddibb.cc>")&&byId.containsKey("<haiagaru-external:kenmo.org>")&&byId.containsKey("<haiagaru-external:forum.example.org>"),"stable site keys");
  List<?> edge=(List<?>)get(byId.get("<haiagaru-external:eddibb.cc>"),rowsField);ok(edge.size()==2,"same site boards combined");Object fixed=edge.get(0);
  ok(get(fixed,modern?"h":"title").equals("エッヂ"),"damaged Edge title repaired in view model");
  Object cats=get(fixed,modern?"a":"categories");List<?> list=cats instanceof String[]?Arrays.asList((String[])cats):(List<?>)cats;ok(list.equals(Collections.singletonList("エッヂ")),"script categories removed and one valid category supplied");
  ok(get(broken,modern?"h":"title").equals("wrong thread (42)ID:test"),"original board record not changed");
  ok(get(fixed,modern?"c":"bid").toString().equals(get(broken,modern?"c":"bid").toString()),"board identity retained");
  ok(((Number)get(fixed,modern?"e":"rating")).intValue()==3&&((Number)get(fixed,modern?"i":"updated")).longValue()==123456789L,"rating and timestamps retained");
  ok(edge.get(1)==operate,"valid external row retained");ok(((List<?>)get(byId.get("5ch.io"),rowsField)).get(0)==five,"normal native board retained");
  List<?> twice=(List<?>)call(groups,"regroup",new Class<?>[]{List.class},result);ok(twice.size()==result.size(),"repeated grouping never nests or duplicates site groups");
  List<Object> legacy=new ArrayList<>(source);call(groups,"regroupLegacy",new Class<?>[]{List.class},legacy);ok(legacy.size()==4,"constructor hook API updates legacy list");
  Class<?> html=loader.loadClass("app.morphe.extension.chmate.BbsMenuHtml");String prepared=(String)call(html,"prepare",new Class<?>[]{String.class,String.class},"https://bbs.eddibb.cc/liveedge","<html><title>エッヂ</title><script>return text.toLowerCase();</script><a href='/test/read.cgi/liveedge/1234567890/'>thread</a></html>");
  ok(prepared.contains("https://bbs.eddibb.cc/liveedge/")&&!prepared.contains("return text")&&!prepared.contains("read.cgi"),"native runtime sanitizer yields a board-only menu");
  String root=(String)call(html,"prepare",new Class<?>[]{String.class,String.class},"https://bbs.eddibb.cc/","<html><title>エッヂ</title><a href='/test/read.cgi/liveedge/1234567890/'>wrong thread headline</a></html>");
  ok(root.contains("https://bbs.eddibb.cc/liveedge/")&&!root.contains("wrong thread")&&!root.contains("read.cgi"),"modern Edge root never registers thread headlines as board names");
  }finally{if(present)prefs.edit().putBoolean(option,previous).commit();else prefs.edit().remove(option).commit();}
 }
}
