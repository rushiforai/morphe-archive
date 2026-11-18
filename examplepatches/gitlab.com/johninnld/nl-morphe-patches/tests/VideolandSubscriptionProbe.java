import dalvik.system.PathClassLoader;
import java.lang.reflect.*;
import java.util.*;

/** Executes the APK's real NavigationMapper, HandleActionUseCase and continuation.
 * Only queue/player dependencies are substituted; no network or app install.
 */
public class VideolandSubscriptionProbe {
 static ClassLoader apk;static Object unsafe;static Method allocate;static int checks;
 static final String ROOT="com.bedrockstreaming.", MODEL=ROOT+"component.layout.domain.core.model.", NAV=ROOT+"component.navigation.domain.", USE=ROOT+"feature.player.domain.mediaplayer.usecase.", FACTORY=ROOT+"feature.player.domain.queue.item.NavigationRequestQueueItem$Factory";
 static Class<?> type(String n)throws Exception{return Class.forName(n,false,apk);}
 static Object instance(String n)throws Exception{return allocate.invoke(unsafe,type(n));}
 static void set(Object o,String n,Object v)throws Exception{Field f=o.getClass().getDeclaredField(n);f.setAccessible(true);f.set(o,v);}
 static Object get(Object o,String n)throws Exception{Field f=o.getClass().getDeclaredField(n);f.setAccessible(true);return f.get(o);}
 static Object stat(String c,String n)throws Exception{return type(c).getDeclaredField(n).get(null);}
 static void stat(String c,String n,Object v)throws Exception{type(c).getDeclaredField(n).set(null,v);}
 static void check(boolean b,String why){if(!b)throw new AssertionError(why);checks++;System.out.println("PASS "+why);}
 static Object invoke(Method m,Object receiver,Object... args)throws Exception{
  try{return m.invoke(receiver,args);}catch(InvocationTargetException e){Throwable t=e.getCause();if(t instanceof Exception)throw (Exception)t;if(t instanceof Error)throw (Error)t;throw e;}
 }
 static Object wrapper(Object original,String kind)throws Exception{
  Object lock=instance(MODEL+"Target$Lock$RequireSubscriptionLock"), attributes=instance(MODEL+"Target$Lock$RequireSubscriptionLock$Attributes");
  Object unlock=instance(MODEL+"Target$App$"+kind);
  if(kind.equals("Premium")){Object details=instance(MODEL+"Target$App$Premium$Details");set(details,"N",Collections.emptyList());set(unlock,"O",details);}
  set(attributes,"N",unlock);set(lock,"N",attributes);set(lock,"O",original);return lock;
 }
 static Object layout(String kind)throws Exception{Object o=instance(MODEL+"Target$Layout");set(o,"N","fixture");set(o,"O",kind);return o;}
 static Object map(Object target)throws Exception{
  Object mapper=instance(NAV+"NavigationMapper");
  set(mapper,"a",Proxy.newProxyInstance(apk,new Class<?>[]{type("Ap.b")},(p,m,a)->false));
  Method m=type(NAV+"NavigationMapper").getDeclaredMethod("a",type(NAV+"NavigationMapper"),type(MODEL+"Target"),String.class,List.class,type(MODEL+"Item"),int.class);
  Object result=invoke(m,null,mapper,target,"fixture",Collections.emptyList(),null,0);
  return get(result,"a");
 }
 static boolean retains(Object destination,Object target)throws Exception{
  for(Field f:destination.getClass().getDeclaredFields())if(!Modifier.isStatic(f.getModifiers())){f.setAccessible(true);if(f.get(destination)==target)return true;}return false;
 }
 static void navigation()throws Exception{
  for(String kind:new String[]{"video","page","live"}){
   Object target=layout(kind);String expected=kind.equals("video")?"ReplayDestination":kind.equals("live")?"LiveDestination":"LayoutDestination";
   for(String unlock:new String[]{"Premium","Upsell"}){
    Object d=map(wrapper(target,unlock));check(d.getClass()==type(NAV+expected)&&retains(d,target),"N01 "+unlock+" -> "+expected+" retains identity");
   }
   Object d=map(target);check(d.getClass()==type(NAV+expected)&&retains(d,target),"N01 ordinary "+kind);
  }
  Object play=instance(MODEL+"Target$App$Play");Object d=map(wrapper(play,"Upsell"));
  check(d.getClass()==type(NAV+"AppDestination")&&retains(d,play),"N01 subscription -> Play");
  for(String lock:new String[]{"RequireAuthLock","ParentalCodeLock"}){
   Object target=instance(MODEL+"Target$Lock$"+lock);Object leaf=layout("video");set(target,"N",leaf);
   Object routed=map(wrapper(target,"Upsell")),ordinary=map(target);
   check(routed.getClass()==ordinary.getClass()&&!routed.getClass().getSimpleName().equals("ReplayDestination"),"N01 preserves "+lock);
  }
  Object nested=wrapper(wrapper(play,"Upsell"),"Upsell");
  check(map(nested).getClass()==type(NAV+"UpsellDestination"),"N01 nested subscription retains fallback");
  check(map(wrapper(null,"Premium")).getClass()==type(NAV+"OffersDestination"),"N01 null original retains fallback");
 }
 static void actionCase(int wrappers,boolean suspend,boolean empty,boolean layout)throws Exception{
  String replay=USE+"AddReplayQueueItemUseCase";
  stat(replay,"calls",0);stat(replay,"suspend",suspend);stat(FACTORY,"calls",0);stat(FACTORY,"target",null);
  Object handler=instance(USE+"HandleActionUseCase"), queue=instance("mf.d"), media=instance(MODEL+"MediaItem"), action=instance(MODEL+"Action");
  Object target=empty?null:layout?layout("page"):instance(MODEL+"Target$App$Play");Object leaf=target;
  for(int i=0;i<wrappers;i++)target=wrapper(target,i%2==0?"Premium":"Upsell");set(action,"P",target);
  set(handler,"d",instance(replay));set(handler,"g",instance(FACTORY));
  set(handler,"a",Proxy.newProxyInstance(apk,new Class<?>[]{type("C6.i")},(p,m,a)->null));
  Object player=instance(ROOT+"feature.player.presentation.mediaplayer.MediaPlayerImpl");
  Method m=type(USE+"HandleActionUseCase").getDeclaredMethod("a",type("Ze.c"),type("mf.d"),type("R7.g"),type(MODEL+"MediaItem"),type(MODEL+"Action"),String.class,String.class,String.class,type("bv.c"));
  Object result=invoke(m,handler,player,queue,null,media,action,"fixture","video","fixture",null);
  Object unit=stat("Vu.M","a");
  if(suspend&&!empty&&!layout){
   check(result==stat("av.a","N"),"N02 suspension marker");Object continuation=stat(replay,"continuation");
   check(Integer.valueOf(1).equals(get(continuation,"Z")),"N02 continuation state saved");
   result=invoke(continuation.getClass().getDeclaredMethod("invokeSuspend",Object.class),continuation,unit);
  }
  check(result==unit,"N02 normal completion");
  check(Integer.valueOf(empty||layout?0:1).equals(stat(replay,"calls")),"N02 replay call count");
  check(Integer.valueOf(empty?0:1).equals(get(queue,"calls")),"N02 queue operation count");
  check(Integer.valueOf(!empty&&layout?1:0).equals(stat(FACTORY,"calls")),"N02 no upsell queue operation");
  if(!empty)check(layout?stat(FACTORY,"target")==leaf:stat(replay,"media")==media,"N02 original destination/media identity");
  check(get(action,"P")==target,"N02 Action unchanged");
  System.out.println("CASE wrappers="+wrappers+" suspended="+suspend+" empty="+empty+" layout="+layout);
 }
 static void authActionCase(int wrappers)throws Exception{
  String replay=USE+"AddReplayQueueItemUseCase";
  stat(replay,"calls",0);stat(replay,"suspend",false);stat(FACTORY,"calls",0);stat(FACTORY,"target",null);
  Object handler=instance(USE+"HandleActionUseCase"),queue=instance("mf.d"),media=instance(MODEL+"MediaItem"),action=instance(MODEL+"Action");
  Object auth=instance(MODEL+"Target$Lock$RequireAuthLock");set(auth,"N",instance(MODEL+"Target$App$Play"));Object target=auth;
  for(int i=0;i<wrappers;i++)target=wrapper(target,"Upsell");set(action,"P",target);
  set(handler,"d",instance(replay));set(handler,"g",instance(FACTORY));
  set(handler,"a",Proxy.newProxyInstance(apk,new Class<?>[]{type("C6.i")},(p,m,a)->null));
  Object player=instance(ROOT+"feature.player.presentation.mediaplayer.MediaPlayerImpl");
  Method method=type(USE+"HandleActionUseCase").getDeclaredMethod("a",type("Ze.c"),type("mf.d"),type("R7.g"),type(MODEL+"MediaItem"),type(MODEL+"Action"),String.class,String.class,String.class,type("bv.c"));
  Object result=invoke(method,handler,player,queue,null,media,action,"fixture","video","fixture",null);
  check(result==stat("Vu.M","a"),"N02 auth normal completion, wrappers="+wrappers);
  check(Integer.valueOf(0).equals(stat(replay,"calls")),"N02 auth prevents replay");
  check(Integer.valueOf(1).equals(get(queue,"calls")),"N02 auth queues exactly once");
  Object queued=stat(FACTORY,"target");
  check(Integer.valueOf(1).equals(stat(FACTORY,"calls"))&&queued.getClass()==type(MODEL+"Target$Lock$RequireAuthLock"),"N02 preserves login navigation");
  Object retained=get(queued,"N");
  check(retained.getClass()==type(MODEL+"Target$Layout")&&"fixture".equals(get(retained,"N"))&&"video".equals(get(retained,"O"))&&"fixture".equals(get(retained,"P")),"N02 auth retains requested identity");
  check(get(action,"P")==target,"N02 auth leaves Action unchanged");
 }
 static void layoutResponse()throws Exception{
  String owner=ROOT+"component.layout.data.core.remote.LayoutRemoteDataSource";
  Method method=type(owner).getDeclaredMethod("f",type(owner),type("Hw.U"));
  Object entity=instance("G7.A");set(entity,"a","fixture");set(entity,"c","video");
  Object body=instance("G7.Z");set(body,"b",entity);
  Object block=instance("G7.b0"),content=instance("G7.d0"),item=instance("G7.x0"),media=instance("J7.u");
  List<Object> assets=Collections.singletonList(instance("J7.b"));
  set(item,"d","fixture");set(item,"q",media);set(media,"c",assets);
  set(content,"d",Collections.singletonList(item));set(block,"d",content);set(block,"b","player_block_fixture");set(body,"a",Collections.singletonList(block));
  Object modal=instance("G7.n0");set(modal,"b",Collections.singletonList(block));
  Object[] roots={body,block,modal};String[] names={"layout","block","modal"};
  for(int root=0;root<roots.length;root++){
   for(int flags=0;flags<4;flags++){
    Object raw=instance("okhttp3.r");set(raw,"Q",200);
    Object network=(flags&1)==0?null:instance("okhttp3.r"),cache=(flags&2)==0?null:instance("okhttp3.r");
    set(raw,"U",network);set(raw,"V",cache);
    Object response=instance("Hw.U");set(response,"a",raw);set(response,"b",roots[root]);
    check(invoke(method,null,null,response)==roots[root],names[root]+" response body identity, transport flags="+flags);
    check(get(raw,"U")==network&&get(raw,"V")==cache,names[root]+" transport provenance unchanged");
   }
   check(get(item,"q")==media&&get(media,"c")==assets,names[root]+" supplied media/assets unchanged");
  }
  Object raw=instance("okhttp3.r");set(raw,"Q",200);Object response=instance("Hw.U"),other=new Object();
  set(response,"a",raw);set(media,"c",Collections.emptyList());
  for(int root=0;root<roots.length;root++){
   set(response,"b",roots[root]);
   check(invoke(method,null,null,response)==roots[root],names[root]+" empty supplied assets preserve response identity");
  }
  set(content,"d",null);set(response,"b",block);
  check(invoke(method,null,null,response)==block,"block missing items preserves response identity");
  set(modal,"b",null);set(response,"b",modal);
  check(invoke(method,null,null,response)==modal,"modal missing blocks preserves response identity");
  set(response,"a",raw);set(response,"b",other);
  check(invoke(method,null,null,response)==other,"other successful response body preserved");
  set(raw,"Q",403);set(response,"b",block);
  try{invoke(method,null,null,response);throw new AssertionError("Failed response with body accepted");}
  catch(Exception expected){check(expected.getClass()==type(MODEL+"UnknownServerException"),"failed block response preserves original error path");}
 }
 static Object parseJson(String source)throws Exception{
  return invoke(type("Tv.b").getDeclaredMethod("b",type("Ov.a"),String.class),stat("bp.a","a"),stat("Tv.m","a"),source);
 }
 static void rawItems()throws Exception{
  Method summary=type("L7.f").getDeclaredMethod("morpheItemAssetSummary",type("Tv.k"));
  Method select=type("L7.f").getDeclaredMethod("e",type("Tv.k"));Object selector=stat("L7.f","c");
  Method decode=type("Tv.b").getDeclaredMethod("a",type("Ov.a"),type("Tv.k"));
  String normal="\"id\":\"clip_fixture\",\"secondaryActions\":[],\"actionLinks\":[],\"pictos\":[]";
  Object supplied=parseJson("{\"itemType\":\"classic\",\"itemContent\":{"+normal+",\"video\":{\"assets\":[{\"reference\":\"private-reference-value\"},{}]},\"media\":{\"assets\":[]},\"assets\":[{}]}}");
  String observed=(String)invoke(summary,null,supplied);
  check(observed.equals("type=classic id=clip_fixture videoAssets=2 mediaAssets=0 directAssets=1"),"raw classic counts extra supplied assets before DTO decoding");
  check(!observed.contains("private-reference-value"),"raw asset probe omits reference values");
  check(invoke(select,selector,supplied)==stat("L7.m","d"),"raw probe preserves classic serializer selection");
  Object decoded=invoke(decode,stat("bp.a","a"),selector,supplied);
  check(decoded.getClass()==type("G7.s")&&"clip_fixture".equals(get(decoded,"d")),"actual classic decoder preserves normal fields with extra assets");
  Object absent=parseJson("{\"itemType\":\"classic\",\"itemContent\":{"+normal+"}}");
  check(invoke(summary,null,absent).equals("type=classic id=clip_fixture videoAssets=-1 mediaAssets=-1 directAssets=-1"),"raw classic missing asset paths remain absent");
  check(invoke(decode,stat("bp.a","a"),selector,absent).getClass()==type("G7.s"),"actual ordinary classic decoding preserved");
  for(String kind:new String[]{"video","epg"}){
   Object item=parseJson("{\"itemType\":\""+kind+"\",\"itemContent\":{\"id\":\"fixture\"}}");
   check(invoke(select,selector,item)==stat(kind.equals("video")?"L7.o":"L7.n","d"),"raw probe preserves "+kind+" serializer selection");
  }
  Object unsafeId=parseJson("{\"itemType\":\"classic\",\"itemContent\":{\"id\":\"private/reference?value\",\"video\":{\"assets\":{}}}}");
  check(invoke(summary,null,unsafeId).equals("type=classic id=<omitted> videoAssets=-2 mediaAssets=-1 directAssets=-1"),"raw probe omits unsafe IDs and distinguishes nonarray assets");
  Object missing=parseJson("{\"itemType\":\"classic\"}");
  check(invoke(summary,null,missing).equals("type=classic content=absent"),"raw probe tolerates missing itemContent");
  check(invoke(select,selector,missing)==stat("L7.m","d"),"raw probe leaves missing-content selection unchanged");
  try{invoke(decode,stat("bp.a","a"),selector,missing);throw new AssertionError("Missing itemContent accepted");}
  catch(Exception expected){check(expected.getClass()==type("kotlinx.serialization.SerializationException"),"actual missing-content decoder error preserved");}
  Object unknown=parseJson("{\"itemType\":\"private/reference?value\"}");
  check(invoke(summary,null,unknown).equals("type=other content=absent"),"raw probe omits unknown itemType values");
  try{invoke(select,selector,unknown);throw new AssertionError("Unknown itemType accepted");}
  catch(Exception expected){check(expected.getClass()==type("kotlinx.serialization.SerializationException"),"actual unknown-type selector error preserved");}
  Object primitive=parseJson("false");check(invoke(summary,null,primitive)==null,"raw probe ignores nonobject input");
  try{invoke(select,selector,primitive);throw new AssertionError("Nonobject item accepted");}
  catch(Exception expected){check(expected.getClass()==type("kotlinx.serialization.SerializationException"),"actual nonobject selector error preserved");}
 }
 public static void main(String[]args)throws Exception{
  try {
  apk=new PathClassLoader(args[1]+":"+args[0],ClassLoader.getSystemClassLoader());
  Class<?> u=Class.forName("sun.misc.Unsafe");Field f=u.getDeclaredField("theUnsafe");f.setAccessible(true);unsafe=f.get(null);allocate=u.getMethod("allocateInstance",Class.class);
  navigation();
  layoutResponse();
  if(args.length>2&&Boolean.parseBoolean(args[2]))rawItems();
  Object request=instance("K7.l");set(request,"N",2);
  try{invoke(type("K7.l").getDeclaredMethod("invokeSuspend",Object.class),request,(Object)null);throw new AssertionError("Invalid request coroutine state accepted");}
  catch(IllegalStateException expected){check(expected.getMessage().contains("resume"),"request coroutine verifies and preserves invalid-state failure");}

  for(int wraps:new int[]{0,1,3}){actionCase(wraps,false,false,false);actionCase(wraps,true,false,false);actionCase(wraps,false,false,true);}
  actionCase(0,false,true,false);actionCase(2,false,true,false);
  authActionCase(0);authActionCase(2);
  System.out.println("PASS: "+checks+" actual Videoland subscription ART assertions");
  } catch(Throwable failure) {failure.printStackTrace();System.exit(1);}
 }
}
