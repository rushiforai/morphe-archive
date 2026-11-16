package app.haiagaru.tests.archivehome;
import android.app.*;import android.content.*;import android.os.*;import java.lang.reflect.*;import java.net.*;import java.io.*;import java.util.*;import java.util.concurrent.*;
public final class ArchiveHomeInstrumentation extends Instrumentation {
 Context app;ClassLoader loader;Activity host;int checks;boolean live,ngOnly;
 Field f(Class<?> c,String n)throws Exception{for(;c!=null;c=c.getSuperclass())try{Field x=c.getDeclaredField(n);x.setAccessible(true);return x;}catch(NoSuchFieldException e){}throw new NoSuchFieldException(n);}
 Method m(Class<?> c,String n,Class<?>...p)throws Exception{Method x=c.getDeclaredMethod(n,p);x.setAccessible(true);return x;}
 Class<?> ext(String n)throws Exception{return loader.loadClass("app.morphe.extension.chmate."+n);}
 void ok(boolean b,String s){if(!b)throw new AssertionError(s);checks++;}
 Object alloc(Class<?> c)throws Exception{Class<?> u=Class.forName("sun.misc.Unsafe");return u.getMethod("allocateInstance",Class.class).invoke(f(u,"theUnsafe").get(null),c);}
 <T>T main(Callable<T> call)throws Exception{FutureTask<T> task=new FutureTask<>(call);runOnMainSync(task);return task.get(20,TimeUnit.SECONDS);}
 @Override public void onCreate(Bundle b){super.onCreate(b);live=b!=null&&"true".equals(b.getString("live"));ngOnly=b!=null&&"true".equals(b.getString("ngOnly"));start();}
 @Override public void onStart(){Bundle b=new Bundle();try{app=getTargetContext();loader=app.getClassLoader();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated package");host=startActivitySync(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));waitForIdleSync();if(live)probe(b);else main(()->{if(!ngOnly)home();firstNg();return null;});b.putString("result","PASS "+checks+" archive/HOME checks");finish(Activity.RESULT_OK,b);}catch(Throwable e){b.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,b);}}
 void probe(Bundle b)throws Exception{
  Class<?> gateway=ext("SiteBoardGateway");Object instance=m(gateway,"get",Context.class).invoke(null,app);Object transport=f(gateway,"transport").get(instance);
  Method get=transport.getClass().getDeclaredMethod("get",String.class);get.setAccessible(true);
  Object r=get.invoke(transport,"https://bbs.animanch.com/board/7557374/");String html=(String)m(r.getClass(),"text").invoke(r);b.putString("status",String.valueOf(f(r.getClass(),"status").get(r)));File file=new File(app.getExternalFilesDir(null),"animanch-7557374.html");try(FileOutputStream out=new FileOutputStream(file)){out.write(html.getBytes("UTF-8"));}b.putString("page",file.toString());
  java.util.regex.Matcher match=java.util.regex.Pattern.compile("(?:https://bbs\\.animanch\\.com)?/(?:arc/)?img/[^\\s\\\"'<>]+").matcher(html);LinkedHashSet<String> paths=new LinkedHashSet<>();while(match.find()&&paths.size()<20)paths.add(match.group());b.putString("images",paths.toString());
  Object page=m(ext("AnimanchProtocol"),"thread",String.class,String.class).invoke(null,html,"https://bbs.animanch.com/board/7557374/");
  for(Object reply:(List<?>)f(page.getClass(),"replies").get(page)){int number=f(reply.getClass(),"number").getInt(reply);if(number==98||number==135){List<?> images=(List<?>)f(reply.getClass(),"images").get(reply);b.putString("reply"+number,images.toString());ok(images.size()==1,"reported cross-thread image retained "+number);String source=images.get(0).toString(),normal=source.replace("/arc/img/","/img/");String statuses="";for(String address:new String[]{normal.replace("/img/","/arc/img/"),normal}){Object image=get.invoke(transport,address);int status=f(image.getClass(),"status").getInt(image);byte[] bytes=(byte[])f(image.getClass(),"bytes").get(image);android.graphics.BitmapFactory.Options options=new android.graphics.BitmapFactory.Options();options.inJustDecodeBounds=true;android.graphics.BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);statuses+=status+":"+options.outWidth+"x"+options.outHeight+" ";}b.putString("download"+number,statuses);}}

 }
 void firstNg()throws Exception{
  String v=app.getPackageName().substring(app.getPackageName().length()-3);boolean old=v.equals("191"),middle=v.equals("226");
  Class<?> response=loader.loadClass(old?"o.processAdDisplayErrorPostbackForUserError":middle?"o.BouncyCastleSocketAdapterCompanion":"o.KeJ11");
  Object one=alloc(response),two=alloc(response);String number=middle?"l":"o",refs=old?"d":middle?"a":"b";
  f(response,number).setInt(one,1);f(response,number).setInt(two,2);f(response,refs).set(one,new int[0]);f(response,refs).set(two,new int[0]);
  Object rows=java.lang.reflect.Array.newInstance(response,2);java.lang.reflect.Array.set(rows,0,one);java.lang.reflect.Array.set(rows,1,two);
  Class<?> projector=loader.loadClass(old?"o.mb":middle?"o.setPushObserverokhttp":"o.zzaX");Method project=null;for(Method candidate:projector.getDeclaredMethods())if(candidate.getParameterTypes().length>=8&&candidate.getParameterTypes()[0].isArray()&&candidate.getParameterTypes()[0].getComponentType()==response){project=candidate;break;}ok(project!=null,"native tree projector exists");project.setAccessible(true);
  SharedPreferences prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);
  String key="disableFirstResponseNg";
  Boolean previous=prefs.contains(key)?prefs.getBoolean(key,true):null;
  Class<?> policy=ext("FirstResponseNg");
  Method disabled=m(policy,"disabled"), visible=m(policy,"visibleFlags",int.class,int.class);
  try{
   prefs.edit().remove(key).commit();
   android.view.ViewGroup settings=(android.view.ViewGroup)m(ext("Haiagaru"),"settingsNG",Activity.class).invoke(null,host);
   android.widget.Switch toggle=null;
   for(int i=0;i<settings.getChildCount();i++){
    if(settings.getChildAt(i) instanceof android.widget.Switch){
     android.widget.Switch candidate=(android.widget.Switch)settings.getChildAt(i);
     if(">>1 レスNGを無効化する".contentEquals(candidate.getText())||"Exclude the first response from NG".contentEquals(candidate.getText())){toggle=candidate;break;}
    }
   }
   ok(toggle!=null&&toggle.isChecked(),"settings initially shows opening post exclusion ON");
   toggle.performClick();
   ok(prefs.contains(key)&&!prefs.getBoolean(key,true),"switch saves explicit OFF");
   for(Boolean configured:new Boolean[]{null,false,true}){
    if(configured==null)prefs.edit().remove(key).commit();else prefs.edit().putBoolean(key,configured).commit();
    boolean exempt=configured==null||configured;
    ok((Boolean)disabled.invoke(null)==exempt,"unset defaults ON; explicit setting respected");
    int input=0x1010|0x01;
    ok((Integer)visible.invoke(null,1,input)==(exempt?1:input),"only opening NG flags removed");
    ok((Integer)visible.invoke(null,2,input)==input,"second reply flags unchanged");
    Map<Integer,Integer> sourceFlags=new HashMap<>();sourceFlags.put(1,input);sourceFlags.put(2,input);
    Map<?,?> filtered=(Map<?,?>)m(policy,"modernFlags",Map.class).invoke(null,sourceFlags);
    ok(filtered.get(1).equals(exempt?1:input)&&filtered.get(2).equals(input)&&sourceFlags.get(1)==input,"modern projection leaves source map untouched");
    for(boolean hide:new boolean[]{false,true}){
     ArrayList<Object> out=new ArrayList<>();Class<?>[] types=project.getParameterTypes();Object[] args=new Object[types.length];args[0]=rows;args[1]=0;args[2]=1;args[3]=out;
     if(old){android.util.SparseIntArray flags=new android.util.SparseIntArray();if(hide)flags.put(1,16);args[4]=flags;}
     else if(middle){Class<?> map=types[4];Object flags=map.getConstructor().newInstance();if(hide){Method put=map.getMethod("c",int.class,int.class);put.invoke(flags,1,16);}args[4]=flags;}
     else{HashMap<Integer,Integer> flags=new HashMap<>();if(hide)flags.put(1,16);args[4]=flags;}
     args[5]=false;args[6]=9999;args[7]=false;
     if(types.length>8)args[8]=Collections.emptyMap();if(types.length>9){args[9]=alloc(types[9]);for(Method method:types[9].getDeclaredMethods())if(java.lang.reflect.Modifier.isStatic(method.getModifiers())&&method.getParameterTypes().length==0&&method.getReturnType()==types[9]){method.setAccessible(true);args[9]=method.invoke(null);break;}}
     project.invoke(java.lang.reflect.Modifier.isStatic(project.getModifiers())?null:alloc(projector),args);
     ok(out.size()==(hide&&!exempt?1:2),"opening post tree projection exemption="+exempt+" hide="+hide+" size="+out.size());
    }
   }
  }finally{
   if(previous==null)prefs.edit().remove(key).commit();else prefs.edit().putBoolean(key,previous).commit();
  }
 }

 Object findHome(Object manager)throws Exception{
  for(Object fragment:(List<?>)((Method)m(ext("DeleteReadThreads"),"fragmentsMethod",Object.class).invoke(null,manager)).invoke(manager)){
   if(fragment==null)continue;String n=fragment.getClass().getName();if(n.equals("o.r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk")||n.endsWith(".HomeFragment"))return fragment;
   Object child=findHome(fragment.getClass().getMethod("getChildFragmentManager").invoke(fragment));if(child!=null)return child;
  }return null;
 }

 void home()throws Exception{
  Class<?> order=ext("HomeThreadOrder");String v=app.getPackageName().substring(app.getPackageName().length()-3);boolean old=v.equals("191"),middle=v.equals("226");
  Class<?> boardType=loader.loadClass(old?"jp.syoboi.a2chMate.client.BBSUrlInfo$BoardID":"jp.syoboi.a2chMate.client.BoardID");Constructor<?> bc=boardType.getDeclaredConstructor(String.class,String.class,String.class,String.class);bc.setAccessible(true);Object board=bc.newInstance("example.invalid","fixture","http://example.invalid/fixture/","fixture");
  Class<?> row=loader.loadClass(old?"o.onAdDisplayed$IconCompatParcelizer":middle?"o.Yy2$RemoteActionCompatParcelizer":"o.getAvailabilityStatus$ComponentActivity");Object a=alloc(row),z=alloc(row);f(row,old?"a":middle?"d":"a").set(a,board);Object board2=bc.newInstance("example.invalid","fixture2","http://example.invalid/fixture2/","fixture2");f(row,old?"a":middle?"d":"a").set(z,board2);
  f(row,old?"e":middle?"e":"d").set(a,"fixture A");f(row,old?"e":middle?"e":"d").set(z,"fixture B");
  Object fragment;
  if(old){fragment=null;List<?> tracked=(List<?>)f(ext("BrowsingHistory"),"legacyFragments").get(null);for(Object entry:tracked){Object candidate=((java.lang.ref.WeakReference<?>)f(entry.getClass(),"fragment").get(entry)).get();if(candidate!=null&&candidate.getClass().getMethod("getActivity").invoke(candidate)==host){fragment=candidate;break;}}}
  else fragment=findHome(m(ext("DeleteReadThreads"),"fragmentManager",Activity.class).invoke(null,host));ok(fragment!=null,"actual HOME fragment attached");
  int initial=(Integer)m(order,"mode",Object.class).invoke(null,fragment);
  try{for(int tab:new int[]{102,107,101,103}){
    m(fragment.getClass(),old||middle?"a":"d",int.class).invoke(fragment,tab);
    int actual=(Integer)m(order,"mode",Object.class).invoke(null,fragment);ok(actual==tab,"native selected HOME mode "+tab+" actual="+actual);
    android.widget.PopupMenu popup=new android.widget.PopupMenu(host,new android.view.View(host));android.view.Menu menu=popup.getMenu();
    m(fragment.getClass(),old?"Wy_":"d",android.view.Menu.class).invoke(fragment,menu);
    android.view.MenuItem item=menu.findItem(0x48690133);ok(item!=null&&item.isVisible(),"native prepared menu shows reorder tab "+tab);
  }}finally{if(initial>0)m(fragment.getClass(),old||middle?"a":"d",int.class).invoke(fragment,initial);}
  String ka=(String)m(order,"key",Object.class).invoke(null,a),kz=(String)m(order,"key",Object.class).invoke(null,z);ok(ka!=null&&kz!=null&&!ka.equals(kz),"board stable keys");
  SharedPreferences prefs=app.getSharedPreferences("haiagaru.home-thread-order",0);String previous=prefs.getString("order:107",null);Set<String> pins=prefs.contains("pins:107")?new HashSet<>(prefs.getStringSet("pins:107",Collections.emptySet())):null;
  Object navigation=null;
  List<?> source=Arrays.asList(a,z);
  if(!old&&!middle){
   Class<?> action=loader.loadClass("o.getAvailabilityStatus$IconCompatParcelizer");
   Constructor<?> nav=action.getDeclaredConstructor(String.class);nav.setAccessible(true);
   navigation=nav.newInstance("板一覧へ");
   source=Arrays.asList(navigation,a,z);
  }
  Method apply=m(order,"apply",List.class,int.class);
  try{
   prefs.edit().putString("order:107",new org.json.JSONArray(Arrays.asList(kz,ka)).toString()).remove("pins:107").commit();
   List<?> out=(List<?>)apply.invoke(null,source,107);
   ok(out.indexOf(z)>=0&&out.indexOf(z)<out.indexOf(a),"board persisted sort");
   if(navigation!=null)ok(out.size()==3&&out.get(0)==navigation,"native board-list navigation remains first after manual sort");
   prefs.edit().putStringSet("pins:107",new HashSet<>(Arrays.asList(ka))).commit();
   out=(List<?>)apply.invoke(null,source,107);
   ok(out.indexOf(a)>=0&&out.indexOf(a)<out.indexOf(z),"board pins precede manual ranks");
   if(navigation!=null)ok(out.size()==3&&out.get(0)==navigation,"native board-list navigation remains first after pinning");
   prefs.edit().remove("order:107").remove("pins:107").commit();
   ok(apply.invoke(null,source,107)==source,"standard order retains the entire native list");
  }finally{SharedPreferences.Editor e=prefs.edit();if(previous==null)e.remove("order:107");else e.putString("order:107",previous);if(pins==null)e.remove("pins:107");else e.putStringSet("pins:107",pins);e.commit();}
 }
}
