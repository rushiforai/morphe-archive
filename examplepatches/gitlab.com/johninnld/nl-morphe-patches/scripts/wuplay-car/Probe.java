package nl.johninnl.wuplaycarprobe;

import android.app.*;
import android.content.*;
import android.graphics.PixelFormat;
import android.media.Image;
import android.media.ImageReader;
import android.os.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** Instrumentation-only native/host probe. No account tokens or content URLs are collected. */
public final class Probe extends Instrumentation {
 private ClassLoader loader;private Bundle args;private Context target;private Object car;private ServiceConnection connection;
 private final Handler main=new Handler(Looper.getMainLooper());private final AtomicInteger frames=new AtomicInteger();private final AtomicInteger colored=new AtomicInteger();private final Set<Integer> pictures=Collections.synchronizedSet(new HashSet<>());
 @Override public void onCreate(Bundle arguments){args=arguments;super.onCreate(arguments);start();}
 private Class<?> type(String name)throws Exception{return Class.forName(name,true,loader);}
 private static boolean fits(Class<?>[] types,Object[] values){if(types.length!=values.length)return false;for(int i=0;i<types.length;i++){
  Class<?> t=types[i];if(t.isPrimitive())t=t==int.class?Integer.class:t==long.class?Long.class:t==boolean.class?Boolean.class:t;
  if(values[i]==null){if(types[i].isPrimitive())return false;}else if(!t.isInstance(values[i]))return false;}return true;}
 private Object make(String name,Object... values)throws Exception{for(Constructor<?> c:type(name).getDeclaredConstructors())if(fits(c.getParameterTypes(),values)){c.setAccessible(true);return c.newInstance(values);}throw new NoSuchMethodException(name+" constructor");}
 private Object invoke(Object object,String name,Object... values)throws Exception {
  for(Class<?> c=object instanceof Class?(Class<?>)object:object.getClass();c!=null;c=c.getSuperclass())for(Method m:c.getDeclaredMethods())if(m.getName().equals(name)&&fits(m.getParameterTypes(),values)){m.setAccessible(true);try{return m.invoke(object instanceof Class?null:object,values);}catch(InvocationTargetException e){throw new Exception("Native "+name+" failed",e.getCause());}}
  throw new NoSuchMethodException(object.getClass().getName()+"."+name);
 }
 private Object onMain(Callable<Object> action)throws Exception{AtomicReference<Object> value=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();runOnMainSync(()->{try{value.set(action.call());}catch(Throwable e){failure.set(e);}});if(failure.get()!=null)throw new Exception("Main operation failed",failure.get());return value.get();}
 private Object proxy(String name,InvocationHandler handler)throws Exception{return Proxy.newProxyInstance(loader,new Class[]{type(name)},handler);}
 private Object request(Object endpoint,String method,Object... parameters)throws Exception{
  CountDownLatch done=new CountDownLatch(1);AtomicReference<Object> result=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();
  Object callback=proxy("androidx.car.app.IOnDoneCallback",(p,m,a)->{
   if(m.getName().equals("getInterfaceVersion"))return 1;if(m.getName().equals("asBinder"))return null;
   if(m.getName().equals("onSuccess")){result.set(a[0]==null?null:invoke(a[0],"get"));done.countDown();}
   if(m.getName().equals("onFailure")){failure.set(new IllegalStateException(String.valueOf(a[0]==null?null:invoke(a[0],"get"))));done.countDown();}return null;
  });Object[] values=Arrays.copyOf(parameters,parameters.length+1);values[parameters.length]=callback;invoke(endpoint,method,values);
  if(!done.await(15,TimeUnit.SECONDS))throw new TimeoutException(method);if(failure.get()!=null)throw new Exception(method,failure.get());return result.get();
 }
 private Object bundle(Object value)throws Exception{return type("androidx.car.app.serialization.Bundleable").getMethod("create",Object.class).invoke(null,value);}
 private void connect()throws Exception{
  CountDownLatch connected=new CountDownLatch(1);
  connection=new ServiceConnection(){public void onServiceConnected(ComponentName name,IBinder binder){car=binder.queryLocalInterface("androidx.car.app.ICarApp");connected.countDown();}public void onServiceDisconnected(ComponentName name){}};
  Intent intent=new Intent().setClassName(target.getPackageName(),"nl.johninnl.wuplaycar.WuplayCarService");
  if(!target.bindService(intent,connection,Context.BIND_AUTO_CREATE))throw new IllegalStateException("Car service not bindable");
  if(!connected.await(10,TimeUnit.SECONDS)||car==null)throw new IllegalStateException("Car Binder not available");
  Object appInfo=request(car,"getAppInfo");if(!appInfo.getClass().getName().equals("androidx.car.app.AppInfo"))throw new IllegalStateException("Wrong app info");
  request(car,"onHandshakeCompleted",bundle(make("androidx.car.app.HandshakeInfo",target.getPackageName(),8)));
  Object appHost=proxy("androidx.car.app.IAppHost",(p,m,a)->{if(m.getName().equals("getInterfaceVersion"))return 1;return null;});
  Binder appBinder=new Binder();appBinder.attachInterface((IInterface)appHost,"androidx.car.app.IAppHost");
  Object host=proxy("androidx.car.app.ICarHost",(p,m,a)->{if(m.getName().equals("getHost"))return appBinder;if(m.getName().equals("getInterfaceVersion"))return 1;return null;});
  request(car,"onAppCreate",host,new Intent(Intent.ACTION_MAIN),target.getResources().getConfiguration());
  request(car,"onAppStart");request(car,"onAppResume");
  Object managerBinder=request(car,"getManager","app");Object manager=((IBinder)managerBinder).queryLocalInterface("androidx.car.app.IAppManager");
  Object wrapper=request(manager,"getTemplate");Object template=invoke(wrapper,"getTemplate");
  if(!template.getClass().getName().endsWith("TabTemplate"))throw new IllegalStateException("Wrong car root template");
 }
 private Object field(Object value,String name)throws Exception {
  for(Class<?> c=value.getClass();c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(value);}catch(NoSuchFieldException ignored){}
  throw new NoSuchFieldException(name);
 }
 private Object await(Object calls,Object receiver,String name,Object... values)throws Exception {
  return invoke(calls,"await",receiver,name,values);
 }
 private void installAddon(Bundle result)throws Exception {
  if(!Build.HARDWARE.contains("ranchu")&&!Build.HARDWARE.contains("goldfish"))throw new IllegalStateException("Test profile mutation is emulator-only");
  Object calls=make("nl.johninnl.wuplaycar.NativeCalls"),container=field(target.getApplicationContext(),"container"),settings=field(container,"userSettingsRepository"),repo=field(container,"addonRepository");
  Object profile=invoke(calls,"first",field(settings,"activeProfile"));
  if(profile==null||!"CarValidation".equals(field(profile,"name")))throw new IllegalStateException("Select the owned CarValidation test profile first");
  String url=args.getString("addon","http://10.0.2.2:8769/addon/manifest.json");
  Object candidate=make("app.wuplay.androidtv.domain.model.Addon",url,true,"","","",Collections.emptyList());
  Object manifest=await(calls,repo,"getManifest-gIAlu-s",candidate);List<String> resources=new ArrayList<>();
  for(Object resource:(List<?>)field(manifest,"resources"))resources.add((String)field(resource,"name"));
  Object addon=make("app.wuplay.androidtv.domain.model.Addon",url,true,field(manifest,"id"),field(manifest,"name"),field(manifest,"version"),resources);
  List<Object> desired=new ArrayList<>();for(Object old:(List<?>)field(profile,"addons"))if(!url.equals(field(old,"url")))desired.add(old);desired.add(addon);
  ArrayList<Object> wire=new ArrayList<>();for(Object value:desired)wire.add(invoke(type("app.wuplay.androidtv.network.BackendHttpClientKt"),"toSyncAddon",value));
  Object request=make("app.wuplay.androidtv.network.ProfileUpdateRequest",null,null,null,wire,null,46);
  if(field(request,"name")!=null||field(request,"settings")!=null)throw new IllegalStateException("Add-on-only request changed unrelated profile fields");
  Object token=invoke(calls,"first",field(settings,"deviceToken")),key=field(profile,"profileKey"),backend=field(container,"backendHttpClient");
  Object response=await(calls,type("androidx.emoji2.text.EmojiProcessor"),"patchProfile$default",backend,token,key,request);
  if(response!=null&&response.getClass().getName().equals("app.wuplay.androidtv.network.ApiResult$Success")) {
   await(calls,field(container,"syncService"),"syncProfile",key,token,null);result.putString("addonStorage","native backend profile update and native sync");
  } else {
   Object copy=invoke(type("app.wuplay.androidtv.domain.model.Profile"),"copy$default",profile,null,null,null,null,desired,null,false,false,null,null,false,null,null,false,null,null,131039);
   await(calls,settings,"upsertProfile",copy);result.putString("addonStorage","emulator-only native local profile fixture; backend rejected private URL");
  }
  List<?> enabled=(List<?>)invoke(calls,"first",field(repo,"enabledAddons"));boolean found=false;
  for(Object value:enabled)if(url.equals(field(value,"url")))found=true;
  if(!found)throw new IllegalStateException("Native enabled add-on Flow did not contain validation add-on");
  result.putInt("enabledAddons",enabled.size());result.putString("addonManifest","native manifest fetch and decode passed");invoke(calls,"close");
 }
 private ImageReader reader() {
  ImageReader reader=ImageReader.newInstance(640,360,PixelFormat.RGBA_8888,3);
  reader.setOnImageAvailableListener(r->{try(Image image=r.acquireLatestImage()){
   if(image==null)return;frames.incrementAndGet();java.nio.ByteBuffer b=image.getPlanes()[0].getBuffer();
   int hash=1;boolean visible=false;
   for(int i=0;i<b.remaining()-4;i+=400){int red=b.get(i)&255,green=b.get(i+1)&255,blue=b.get(i+2)&255;hash=31*hash+red*65536+green*256+blue;if(red>30||green>30||blue>30)visible=true;}
   pictures.add(hash);if(visible)colored.incrementAndGet();
  }},main);return reader;
 }
 public static final class EpisodeFixture {public Integer season=2,episode=1,runtime=24;public String title="Episode One",thumbnail="",overview="Episode description";}
 public static final class ParentFixture {public String runtime="1000 min",poster="",description="Series description";}
 private void artworkRatio(Bundle result)throws Exception {
  Object art=make("nl.johninnl.wuplaycar.CarArtwork",target);
  try{Object icon=invoke(art,"icon","http://10.0.2.2:8819/slow-poster.png","Natural poster");android.net.Uri uri=(android.net.Uri)invoke(invoke(icon,"getIcon"),"getUri");
   try(java.io.InputStream in=target.getContentResolver().openInputStream(uri)){android.graphics.Bitmap bitmap=android.graphics.BitmapFactory.decodeStream(in);if(bitmap==null)throw new IllegalStateException("Poster did not decode");int width=bitmap.getWidth(),height=bitmap.getHeight();bitmap.recycle();if(width*3!=height*2)throw new IllegalStateException("Poster was padded to "+width+"x"+height+" instead of keeping 2:3");result.putString("naturalPoster",width+"x"+height+"; original 2:3 aspect preserved");}
  }finally{invoke(art,"close");}
 }
 private void artworkBurst(Bundle result)throws Exception {
  Object art=make("nl.johninnl.wuplaycar.CarArtwork",target);ExecutorService pool=Executors.newFixedThreadPool(16);List<Future<Boolean>> images=new ArrayList<>();
  try{
   for(int i=0;i<16;i++){Object icon=invoke(art,"icon","http://10.0.2.2:8799/slow-poster.png?i="+i,"Poster "+i);android.net.Uri uri=(android.net.Uri)invoke(invoke(icon,"getIcon"),"getUri");images.add(pool.submit(()->{try(java.io.InputStream in=target.getContentResolver().openInputStream(uri)){android.graphics.Bitmap bitmap=android.graphics.BitmapFactory.decodeStream(in);if(bitmap==null)return false;bitmap.recycle();return true;}}));}
   int decoded=0;for(Future<Boolean> future:images)if(future.get(15,TimeUnit.SECONDS))decoded++;
   if(decoded!=16)throw new IllegalStateException("Slow artwork left blank tiles");
   Object before=invoke(invoke(invoke(art,"icon","","Same poster"),"getIcon"),"getUri");invoke(art,"refresh");Object after=invoke(invoke(invoke(art,"icon","","Same poster"),"getIcon"),"getUri");
   if(before.equals(after))throw new IllegalStateException("Artwork refresh retained host cache URI");
   result.putInt("decodedSlowArtwork",decoded);result.putString("artworkBurst","all slow requests delivered artwork/placeholders and refresh changed URI");
  }finally{pool.shutdownNow();invoke(art,"close");}
 }
 private void autoplayContract(Bundle result)throws Exception {
  Object service=field(car,"this$0"),nativeData=field(service,"data"),settings=field(nativeData,"settings"),calls=make("nl.johninnl.wuplaycar.NativeCalls");
  try{
   Object profile=invoke(calls,"first",field(settings,"activeProfile"));
   if(!"CarValidation".equals(field(profile,"name")))throw new IllegalStateException("Autoplay validation is restricted to the emulator fixture profile");
   if(Boolean.TRUE.equals(field(profile,"hasPinSet"))&&!Boolean.TRUE.equals(invoke(nativeData,"verifyPin",args.getString("pin",""))))throw new IllegalStateException("Unlock fixture profile with its test PIN");
   ParentFixture metadata=new ParentFixture();metadata.runtime="2.5 min";
   Object item=make("nl.johninnl.wuplaycar.NativeData$Item","movie","tt99999999","Generated validation clip","",null,null,metadata,Collections.emptyList());
   onMain(()->{invoke(service,"push",make("nl.johninnl.wuplaycar.WuplayCarService$PlayPage",service,item));return null;});
   long deadline=SystemClock.uptimeMillis()+45000;Object page=null;
   while(SystemClock.uptimeMillis()<deadline){page=onMain(()->((Deque<?>)field(service,"pages")).peekLast());if(page.getClass().getSimpleName().equals("PlayerPage")||field(page,"error")!=null)break;Thread.sleep(150);}
   Object choice=onMain(()->field(service,"playingChoice"));
   if("blocked".equals(args.getString("expect"))){if(choice!=null||page==null||!String.valueOf(field(page,"error")).contains("10 Mbps"))throw new IllegalStateException("Over-limit sources were not rejected");result.putString("autoplay","all-over-limit native add-on response rejected by actual Play page");}
   else{if(choice==null||!"Car validation".equals(field(field(choice,"value"),"name")))throw new IllegalStateException("Actual Play page did not choose the eligible source");long rate=(Long)field(choice,"rate");if(rate<=0||rate>10000000)throw new IllegalStateException("Wrong autoplay rate");result.putLong("selectedBitrateBps",rate);result.putString("autoplay","actual Play page automatically selected eligible source, skipping over-limit candidate");}
  }finally{invoke(calls,"close");}
 }
 private void homeContract(Bundle result)throws Exception {
  Object artwork=make("nl.johninnl.wuplaycar.CarArtwork",target);
  try{
   Object icon=invoke(artwork,"icon","","Demo title");
   Object roundtrip=invoke(bundle(icon),"get");Object compat=invoke(roundtrip,"getIcon");
   if(!Integer.valueOf(4).equals(invoke(compat,"getType")))throw new IllegalStateException("Icon wire type changed");
   android.net.Uri uri=(android.net.Uri)invoke(compat,"getUri");
   try(java.io.InputStream in=target.getContentResolver().openInputStream(uri)){android.graphics.Bitmap bitmap=android.graphics.BitmapFactory.decodeStream(in);if(bitmap==null||bitmap.getWidth()!=240||bitmap.getHeight()!=240)throw new IllegalStateException("Artwork provider failed");bitmap.recycle();}
   Object grid=invoke(invoke(invoke(make("androidx.car.app.model.GridItem$Builder"),"setTitle","Demo title"),"setImage",icon),"build");
   Object section=invoke(invoke(invoke(make("androidx.car.app.model.GridSection$Builder"),"setTitle","Demo shelf"),"addItem",grid),"build");
   Object restored=invoke(bundle(section),"get");Object delegate=invoke(restored,"getItemsDelegate");
   if(!Integer.valueOf(1).equals(invoke(delegate,"getSize")))throw new IllegalStateException("Populated shelf size changed");
   CountDownLatch loaded=new CountDownLatch(1);AtomicReference<Object> list=new AtomicReference<>();
   Object callback=proxy("androidx.car.app.OnDoneCallback",(p,m,a)->{if(m.getName().equals("onSuccess")){list.set(invoke(a[0],"get"));loaded.countDown();}if(m.getName().equals("onFailure"))loaded.countDown();return null;});
   onMain(()->{invoke(delegate,"requestItemRange",0,0,callback);return null;});
   if(!loaded.await(5,TimeUnit.SECONDS)||!(list.get() instanceof List)||((List<?>)list.get()).size()!=1)throw new IllegalStateException("Lazy shelf items did not cross Binder");
   result.putString("artwork","content URI, populated shelf serialization/lazy Binder items and 240px provider decode passed");
  }finally{invoke(artwork,"close");}
  Object item=make("nl.johninnl.wuplaycar.NativeData$Item","series","test:2:1","Series","S2 E1","test",1,new ParentFixture(),Collections.emptyList(),new EpisodeFixture());
  if(!Double.valueOf(1440).equals(invoke(item,"seconds")))throw new IllegalStateException("Series runtime leaked into episode rate");
  if(!"Episode One".equals(invoke(item,"displayTitle")))throw new IllegalStateException("Episode title lost");
  result.putString("episodes","episode runtime, title and metadata remain separate from parent series");
 }
 @Override public void onStart(){Bundle result=new Bundle();Object owner=null,renderer=null,data=null;ImageReader reader=null,second=null;int outcome=Activity.RESULT_CANCELED;
  try{
   target=getTargetContext();loader=target.getClassLoader();onMain(()->null);result.putInt("appUid",android.os.Process.myUid());
   if("install-addon".equals(args.getString("mode"))){installAddon(result);outcome=Activity.RESULT_OK;return;}
   if("artwork-ratio".equals(args.getString("mode"))){artworkRatio(result);outcome=Activity.RESULT_OK;return;}
   if("artwork-burst".equals(args.getString("mode"))){artworkBurst(result);outcome=Activity.RESULT_OK;return;}
   connect();result.putString("protocol","handshake and sectioned Home template passed");
   if("home-contract".equals(args.getString("mode"))){homeContract(result);outcome=Activity.RESULT_OK;return;}
   if("autoplay-contract".equals(args.getString("mode"))){autoplayContract(result);outcome=Activity.RESULT_OK;return;}
   data=make("nl.johninnl.wuplaycar.NativeData",target);Object nativeData=data;
   Object[] init=(Object[])onMain(()->{
    Object nativeStream=make("app.wuplay.androidtv.domain.stremio.Stream",args.getString("url","http://10.0.2.2:8769/plain-test.mp4"),null,128);
    Object item=make("nl.johninnl.wuplaycar.NativeData$Item","movie","tt99999999","Generated validation clip","",null,null,new Object(),Collections.emptyList());
    Object choice=make("nl.johninnl.wuplaycar.NativeData$Choice",nativeStream,"validation://local","Validation clip");
    Field rate=choice.getClass().getDeclaredField("rate");rate.setAccessible(true);rate.set(choice,1200000L);
    Object engine=make("nl.johninnl.wuplaycar.NativePlayer",target,nativeData);invoke(engine,"selection",item,choice);
    Object playback=make("nl.johninnl.wuplaycar.CarPlayback",engine);Object render=make("nl.johninnl.wuplaycar.CarVideoRenderer",playback,engine);
    return new Object[]{engine,playback,render};
   });Object engine=init[0];owner=init[1];renderer=init[2];reader=reader();ImageReader first=reader;Object finalRenderer=renderer,finalOwner=owner;
   onMain(()->{invoke(finalRenderer,"open",target,first.getSurface(),640,360,160);long token=(Long)invoke(finalOwner,"beginSelection");invoke(finalOwner,"select",token,args.getString("url","http://10.0.2.2:8769/plain-test.mp4"),Collections.emptyMap(),0L);return null;});
   Thread.sleep(5000);long before=(Long)onMain(()->{invoke(engine,"refresh");return invoke(engine,"position");});
   result.putLong("positionBeforePhoneStopMs",before);result.putInt("framesBeforePhoneStop",frames.get());
   int audioTracks=((List<?>)onMain(()->invoke(engine,"audioTracks"))).size();result.putInt("audioTracks",audioTracks);
   if(audioTracks<1)throw new IllegalStateException("Native audio track enumeration failed");
   Object nativePlayer=field(engine,"player");
   Object limits=onMain(()->invoke(nativePlayer,"getTrackSelectionParameters"));
   if(!Integer.valueOf(9000000).equals(field(limits,"maxVideoBitrate"))||!Integer.valueOf(1000000).equals(field(limits,"maxAudioBitrate"))||!Boolean.FALSE.equals(field(limits,"exceedVideoConstraintsIfNecessary"))||!Boolean.FALSE.equals(field(limits,"exceedAudioConstraintsIfNecessary")))throw new IllegalStateException("Adaptive cap not enforced");
   result.putString("adaptiveCap","9 Mbps video + 1 Mbps audio, no constraint-exceeding fallback");int audioBuffers=0;
   for(Object render:(Object[])field(nativePlayer,"renderers"))if(Integer.valueOf(1).equals(field(render,"trackType"))) {
    try{Object counters=field(render,"decoderCounters");if(counters!=null)audioBuffers+=(Integer)field(counters,"renderedOutputBufferCount");}catch(NoSuchFieldException ignored){}
   }
   result.putInt("decodedAudioBuffers",audioBuffers);if(audioBuffers<1)throw new IllegalStateException("Audio decoder did not output buffers");
   if(before<1000||colored.get()<3)throw new IllegalStateException("Video did not render: position="+before+" frames="+frames+" colored="+colored+" status="+onMain(()->invoke(engine,"status")));
   target.startActivity(new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
   second=reader();ImageReader next=second;onMain(()->{invoke(finalRenderer,"open",target,next.getSurface(),640,360,160);return null;});
   Thread.sleep(3000);long after=(Long)onMain(()->invoke(engine,"position"));result.putLong("positionAfterPhoneStopMs",after);result.putInt("renderedFrames",frames.get());result.putInt("nonBlackFrames",colored.get());result.putInt("uniqueVideoFrames",pictures.size());if(pictures.size()<5)throw new IllegalStateException("Video output did not animate");
   if(after<=before+1000)throw new IllegalStateException("Car playback stopped with phone Activity");
   int beforeOff=frames.get();try(android.os.ParcelFileDescriptor command=getUiAutomation().executeShellCommand("input keyevent 223")){}
   Thread.sleep(3000);long asleep=(Long)onMain(()->invoke(engine,"position"));
   result.putLong("positionWhileScreenOffMs",asleep);result.putInt("screenOffFrames",frames.get()-beforeOff);
   result.putBoolean("screenInteractiveDuringSleep",((android.os.PowerManager)target.getSystemService(Context.POWER_SERVICE)).isInteractive());
   try(android.os.ParcelFileDescriptor command=getUiAutomation().executeShellCommand("input keyevent 224")){}
   if(asleep<=after+1000||frames.get()-beforeOff<10)throw new IllegalStateException("Car video did not continue with phone screen off");
   onMain(()->{invoke(finalOwner,"toggle");if((Boolean)invoke(engine,"playing"))throw new IllegalStateException("Pause failed");return null;});
   long seekStart=(Long)onMain(()->invoke(engine,"position"));onMain(()->{invoke(finalOwner,"seekBy",-2000L);return null;});
   long seekResult=(Long)onMain(()->invoke(engine,"position"));result.putLong("seekStartMs",seekStart);result.putLong("seekResultMs",seekResult);
   if(seekResult>seekStart-1500)throw new IllegalStateException("Native seek did not move backwards");
   Thread.sleep(700);long still=(Long)onMain(()->invoke(engine,"position"));if(Math.abs(still-seekResult)>250)throw new IllegalStateException("Paused player clock advanced");
   onMain(()->{invoke(finalOwner,"toggle");if(!(Boolean)invoke(engine,"playing"))throw new IllegalStateException("Resume flag failed");return null;});
   Thread.sleep(1800);long resumed=(Long)onMain(()->invoke(engine,"position"));result.putLong("resumeResultMs",resumed);
   if(resumed<seekResult+500)throw new IllegalStateException("Native playback did not resume after seek");
   result.putString("playback","native video compositor, surface replacement, background continuity, seek and pause/resume passed");
   outcome=Activity.RESULT_OK;
  }catch(Throwable e){java.io.StringWriter s=new java.io.StringWriter();e.printStackTrace(new java.io.PrintWriter(s));result.putString("failure",s.toString());}
  finally{Object o=owner,v=renderer;try{onMain(()->{if(v!=null)invoke(v,"close");if(o!=null)invoke(o,"close");return null;});}catch(Exception ignored){}
   if(reader!=null)reader.close();if(second!=null)second.close();try{if(data!=null)invoke(data,"close");if(car!=null)request(car,"onAppStop");if(connection!=null)target.unbindService(connection);}catch(Exception ignored){}
   finish(outcome,result);
  }
 }
}
