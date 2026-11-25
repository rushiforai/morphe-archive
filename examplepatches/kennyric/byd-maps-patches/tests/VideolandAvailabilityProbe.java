import dalvik.system.PathClassLoader;
import java.lang.reflect.*;
import java.util.*;

/** Executes owned filtering code and actual app models; never installs or starts the app. */
public final class VideolandAvailabilityProbe {
 static ClassLoader apk;static Object unsafe;static Method allocate;static int checks;
 static final String MODEL="com.bedrockstreaming.component.layout.domain.core.model.";
 static Class<?> type(String n)throws Exception{return Class.forName(n,false,apk);}
 static Object instance(String n)throws Exception{return allocate.invoke(unsafe,type(n));}
 static void set(Object o,String n,Object v)throws Exception{Field f=o.getClass().getDeclaredField(n);f.setAccessible(true);f.set(o,v);}
 static Object get(Object o,String n)throws Exception{Field f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 static Object stat(String n,String f)throws Exception{return type(n).getField(f).get(null);}
 static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS "+why);}
 static Object call(String method,Class<?>[] params,Object...args)throws Exception{
  try{return type("patches.videoland.Availability").getMethod(method,params).invoke(null,args);}
  catch(InvocationTargetException e){Throwable t=e.getCause();if(t instanceof Exception)throw (Exception)t;if(t instanceof Error)throw (Error)t;throw e;}
 }
 static Object lock(String kind,Object retained)throws Exception{
  Object t=instance(MODEL+"Target$Lock$"+kind);set(t,kind.equals("RequireSubscriptionLock")?"O":"N",retained);return t;
 }
 static Object item(Object target)throws Exception{Object a=instance(MODEL+"Action");set(a,"P",target);Object i=instance(MODEL+"ClassicItem");set(i,"N",a);set(i,"Q","fixture");return i;}
 static boolean keep(Object o)throws Exception{return Boolean.TRUE.equals(call("keep",new Class<?>[]{Object.class},o));}
 static List<?> filter(List<?> items)throws Exception{return (List<?>)call("filter",new Class<?>[]{List.class},items);}
 static Object block(String template,List<?> items)throws Exception{
  Object pagination=type(MODEL+"ItemPagination").getConstructor(int.class,Integer.class,int.class).newInstance(10,null,items.size());
  Object content=type(MODEL+"LayoutBlockContent").getConstructor(type(MODEL+"BlockTheme"),type(MODEL+"Title"),type(MODEL+"BlockTemplateId"),List.class,type(MODEL+"ItemPagination"),String.class)
    .newInstance(instance(MODEL+"BlockTheme"),null,stat(MODEL+"BlockTemplateId",template),items,pagination,"fixture");
  return type(MODEL+"Block$LayoutBlock").getConstructor(type(MODEL+"Action"),String.class,type(MODEL+"LayoutBlockContent"),type(MODEL+"AlternativeBlockContent"),type(MODEL+"Bag"))
    .newInstance(null,"fixture",content,null,null);
 }
 static void predicates()throws Exception{
  Object play=instance(MODEL+"Target$App$Play"),available=item(play),blocked=item(lock("RequireSubscriptionLock",play));
  check(keep(null)&&keep(new Object()),"null and unknown items remain visible");
  check(keep(available)&&keep(item(null)),"ordinary and unknown primary targets remain visible");
  check(!keep(blocked),"subscription primary target is unavailable");
  check(!keep(item(lock("RequireAuthLock",lock("RequireSubscriptionLock",play)))),"nested subscription is detected");
  check(!keep(item(lock("RequireSubscriptionLock",lock("RequireAuthLock",play)))),"outer subscription remains unavailable");
  check(keep(item(lock("RequireAuthLock",play)))&&keep(item(lock("ParentalCodeLock",play))),"login and parental restrictions remain separate");
  set(available,"O",Collections.singletonList(get(blocked,"N")));
  check(keep(available),"secondary subscription action does not hide primary content");
  Object optional=instance(MODEL+"Target$OptionalTargetLock$RequireAuthLock");set(optional,"N",lock("RequireSubscriptionLock",play));
  check(!keep(item(optional)),"optional retained lock chain is inspected");
  Object cycle=lock("RequireAuthLock",null);set(cycle,"N",cycle);
  check(keep(item(cycle)),"cyclic unknown availability stays visible");
  List<Object> original=new ArrayList<>(Arrays.asList(blocked,available,blocked,null));
  List<?> visible=filter(original);
  check(visible.size()==2&&visible.get(0)==available&&visible.get(1)==null,"visible order and object identity retained");
  check(original.size()==4&&original.get(0)==blocked&&get(get(blocked,"N"),"P")!=null,"input collections and targets unchanged");
  List<Object> unlocked=Collections.singletonList(available);check(filter(unlocked)==unlocked,"unlocked list identity retained");
  check(filter(Collections.singletonList(blocked)).isEmpty(),"wholly locked materialized list filters empty");
  check(filter(Collections.emptyList()).isEmpty(),"empty source remains empty");
  for(String template:new String[]{"R","S","T","U","V","X"}){
   Object raw=block(template,original),rawContent=get(raw,"U");
   Object copy=call("visibleBlock",new Class<?>[]{type(MODEL+"Block")},raw);
   check(copy!=raw&&((List<?>)get(get(copy,"U"),"Q")).size()==2,"collection projection "+template);
   check(get(raw,"U")==rawContent&&get(rawContent,"Q")==original,"raw cached model retained "+template);
  }
  for(String template:new String[]{"W","Y","Z"}){
   Object raw=block(template,original);check(call("visibleBlock",new Class<?>[]{type(MODEL+"Block")},raw)==raw,"structural template preserved "+template);
  }
  Object series=block("V",Arrays.asList(blocked,available,blocked));
  check(Integer.valueOf(0).equals(call("visibleIndex",new Class<?>[]{type(MODEL+"Block"),int.class},series,1)),"retained selection maps into compact list");
  check(Integer.valueOf(0).equals(call("visibleIndex",new Class<?>[]{type(MODEL+"Block"),int.class},series,2)),"removed selection moves to usable neighbor");
 }

 static void integration()throws Exception{
  Object play=instance(MODEL+"Target$App$Play"),available=item(play),blocked=item(lock("RequireSubscriptionLock",play));
  List<Object> items=Arrays.asList(blocked,available,blocked);Object raw=block("V",items);
  Object legacy=type("d8.a").getConstructor(type(MODEL+"Block"),type("w4.A1"),int.class).newInstance(raw,null,1);
  check(get(legacy,"N")!=raw&&get(legacy,"P").equals(0)&&((List<?>)get(get(get(legacy,"N"),"U"),"Q")).get(0)==available,"actual legacy constructor projects model and selection");
  Class<?> flowType=type("Ev.j");Object flow=Proxy.newProxyInstance(apk,new Class<?>[]{flowType},(p,m,a)->null);
  Object compose=type("f8.a").getConstructor(type(MODEL+"Block"),flowType,int.class).newInstance(raw,flow,1);
  check(get(compose,"a")!=raw&&get(compose,"b")==flow&&get(compose,"c").equals(0),"actual newer constructor projects model and retains native flow");
  Object solo=block("Y",items),info=type("d8.a").getConstructor(type(MODEL+"Block"),type("w4.A1"),int.class).newInstance(solo,null,1);
  check(get(info,"N")==solo&&get(info,"P").equals(1)&&items.size()==3,"actual structural constructor preserves original items and index");
 }

 static Object state(Object value)throws Exception{
  return Proxy.newProxyInstance(apk,new Class<?>[]{type("d0.q0")},(p,m,a)->m.getName().equals("getValue")?value:null);
 }
 static void composeEmpty()throws Exception{
  Object page=instance("x4.c");Object empty=type("w4.i0").getConstructor(int.class,int.class,List.class).newInstance(0,0,Collections.emptyList());set(page,"c",state(empty));
  Object ended=type("w4.s0$b").getConstructor(boolean.class).newInstance(true),pending=type("w4.s0$b").getConstructor(boolean.class).newInstance(false);
  Object status=instance("w4.C");set(status,"a",pending);set(status,"b",ended);set(status,"c",ended);set(page,"d",state(status));
  Object collection=block("V",Collections.emptyList());Class<?>[] signature={type(MODEL+"Block"),type("x4.c")};
  check(Boolean.TRUE.equals(call("hideEmpty",signature,collection,page)),"newer exhausted empty collection hides its heading and content");
  set(status,"c",pending);check(Boolean.FALSE.equals(call("hideEmpty",signature,collection,page)),"newer empty collection stays visible while later pages remain");
  set(status,"c",ended);set(status,"a",null);check(Boolean.FALSE.equals(call("hideEmpty",signature,collection,page)),"newer unknown refresh keeps retry UI");
  set(status,"a",type("w4.s0$a").getConstructor(Throwable.class).newInstance(new IllegalArgumentException("fixture")));check(Boolean.FALSE.equals(call("hideEmpty",signature,collection,page)),"newer native refresh error retains retry UI");
  set(status,"a",pending);set(status,"c",type("w4.s0$a").getConstructor(Throwable.class).newInstance(new IllegalArgumentException("fixture")));check(Boolean.FALSE.equals(call("hideEmpty",signature,collection,page)),"newer native append error retains retry UI");set(status,"c",ended);
  set(status,"a",pending);check(Boolean.FALSE.equals(call("hideEmpty",signature,block("Y",Collections.emptyList()),page)),"newer structural blocks remain visible even when empty");
  Object nonempty=type("w4.i0").getConstructor(int.class,int.class,List.class).newInstance(0,0,Collections.singletonList(new Object()));set(page,"c",state(nonempty));
  check(Boolean.FALSE.equals(call("hideEmpty",signature,collection,page)),"newer available content remains visible at end of paging");
 }

 static void buttons()throws Exception{
  Class<?> factoryType=type("kn.e");Object factory=Proxy.newProxyInstance(apk,new Class<?>[]{factoryType},(p,m,a)->null);
  Method presentation=type("kn.k").getMethod("c",type(MODEL+"Action"),factoryType);
  Object play=instance(MODEL+"Target$App$Play"),subscribe=get(item(lock("RequireSubscriptionLock",play)),"N");set(subscribe,"N","Abonneren op Videoland");
  Object originalTarget=get(subscribe,"P");
  check(presentation.invoke(null,subscribe,factory)==null,"actual subscription CTA maps to native absent action");
  check(get(subscribe,"P")==originalTarget&&get(subscribe,"N").equals("Abonneren op Videoland"),"subscription CTA keeps cached action and target unchanged");
  Object available=get(item(play),"N");set(available,"N","Afspelen");check(presentation.invoke(null,available,factory)!=null,"actual available play CTA remains present");
  Object login=get(item(lock("RequireAuthLock",play)),"N");set(login,"N","Inloggen");check(presentation.invoke(null,login,factory)!=null,"actual login-only CTA remains present");
  Object nested=get(item(lock("RequireAuthLock",lock("RequireSubscriptionLock",play))),"N");set(nested,"N","Abonneren op Videoland");check(presentation.invoke(null,nested,factory)==null,"nested subscription CTA maps to native absent action");
 }
 public static void main(String[]args)throws Exception{
  try{
   apk=new PathClassLoader((args.length>1?args[1]+":" : "")+args[0],ClassLoader.getSystemClassLoader());
   try{type("patches.videoland.Availability");}catch(ClassNotFoundException missing){throw new AssertionError("Availability helper missing",missing);}
   Class<?> u=Class.forName("sun.misc.Unsafe");Field f=u.getDeclaredField("theUnsafe");f.setAccessible(true);unsafe=f.get(null);allocate=u.getMethod("allocateInstance",Class.class);
   predicates();
   if(args.length>2){integration();composeEmpty();buttons();}
   if(args.length>1)checks+=((Integer)type("fixtures.availability.AvailabilityPaging").getMethod("run").invoke(null)).intValue();
   System.out.println("PASS: "+checks+" actual Videoland availability ART assertions");
  }catch(Throwable failure){failure.printStackTrace();System.exit(1);}
 }
}
