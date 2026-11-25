import dalvik.system.PathClassLoader;
import android.app.Application;
import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

/** Isolated actual-DEX fixtures. No player, application lifecycle or network is opened. */
public class KijkMobileProbe {
 static ClassLoader apk, helpers; static Object unsafe; static Method allocate; static int cases;
 static final String APP="com.nakko.android.radio10gold.";
 static Class<?> type(String name) throws Exception {
  switch(name){case "int":return int.class;case "long":return long.class;case "boolean":return boolean.class;case "double":return double.class;default:return Class.forName(name,false,apk);}
 }
 static Object object(String name) throws Exception {return allocate.invoke(unsafe,type(name));}
 static Field field(Class<?> type,String name) throws Exception {
  for(Class<?> c=type;c!=null;c=c.getSuperclass())try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}
  throw new NoSuchFieldException(type.getName()+"."+name);
 }
 static void set(Object target,String name,Object value) throws Exception {field(target.getClass(),name).set(target,value);}
 static Object get(Object target,String name) throws Exception {return field(target.getClass(),name).get(target);}
 static Method method(String owner,String name,String... names) throws Exception {
  Class<?>[] params=new Class<?>[names.length];for(int i=0;i<params.length;i++)params[i]=type(names[i]);
  Method m=type(owner).getDeclaredMethod(name,params);m.setAccessible(true);return m;
 }
 static Object call(Object receiver,String owner,String name,String[] names,Object... args) throws Exception {
  try{return method(owner,name,names).invoke(receiver,args);}catch(InvocationTargetException e){Throwable x=e.getCause();if(x instanceof Exception)throw(Exception)x;if(x instanceof Error)throw(Error)x;throw e;}
 }
 static Object invoke(Object receiver,String name,String[] names,Object... args) throws Exception {return call(receiver,receiver.getClass().getName(),name,names,args);}
 static Object construct(String owner,String[] names,Object... args) throws Exception {
  Class<?>[] params=new Class<?>[names.length];for(int i=0;i<params.length;i++)params[i]=type(names[i]);
  Constructor<?> c=type(owner).getDeclaredConstructor(params);c.setAccessible(true);return c.newInstance(args);
 }
 static Object proxy(String owner,InvocationHandler handler) throws Exception {return Proxy.newProxyInstance(apk,new Class<?>[]{type(owner)},handler);}
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 static void pass(String message){cases++;System.out.println("PASS "+message);}
 static void monitorReleased(Object lock) throws Exception {
  AtomicBoolean entered=new AtomicBoolean();Thread t=new Thread(()->{synchronized(lock){entered.set(true);}});t.setDaemon(true);t.start();t.join(1000);check(entered.get(),"SDK monitor remained held");
 }
 static Object defaultValue(Class<?> t){if(!t.isPrimitive()||t==void.class)return null;if(t==boolean.class)return false;if(t==long.class)return 0L;if(t==double.class)return 0D;if(t==float.class)return 0F;return 0;}
 static class Preferences implements InvocationHandler {
  final Map<String,Object> values=new HashMap<>(); Object preferences,editor;
  Preferences(){preferences=Proxy.newProxyInstance(KijkMobileProbe.class.getClassLoader(),new Class<?>[]{SharedPreferences.class},this);
   editor=Proxy.newProxyInstance(KijkMobileProbe.class.getClassLoader(),new Class<?>[]{SharedPreferences.Editor.class},this);}
  public Object invoke(Object p,Method m,Object[] a){String n=m.getName();
   if(n.equals("edit"))return editor;if(n.startsWith("put")){values.put((String)a[0],a[1]);return editor;}
   if(n.equals("remove")){values.remove(a[0]);return editor;}if(n.equals("clear")){values.clear();return editor;}
   if(n.equals("commit"))return true;if(n.equals("apply"))return null;if(n.equals("getAll"))return new HashMap<>(values);
   if(n.equals("contains"))return values.containsKey(a[0]);if(n.startsWith("get"))return values.containsKey(a[0])?values.get(a[0]):a[1];
   return defaultValue(m.getReturnType());
  }
 }
 public static class RecordingApplication extends Application {
  int registrations; @Override public void registerActivityLifecycleCallbacks(ActivityLifecycleCallbacks c){registrations++;}
 }
 static void ads() throws Exception {
  String owner=APP+"view.videoplayer.a0";
  Method m=method(owner,"g0","com.jwplayer.pub.api.JWPlayer","java.lang.String","java.lang.String","java.lang.String","double");
  check(m.getReturnType()==type("com.jwplayer.pub.api.configuration.ads.AdvertisingConfig"),"fullscreen return contract");
  check(m.invoke(object(owner),null,"fixture-tag","fixture-video","fixture-program",12D)==null,"fullscreen advertising config");pass("fullscreen typed nullable advertising config");
  Object inline=construct(APP+"view.inline.Y",new String[]{"boolean","boolean","java.lang.String","boolean"},true,true,"https://fixture.invalid/adtag",true);
  check(invoke(inline,"j",new String[]{})==null,"inline advertising tag");check(get(inline,"c").equals("https://fixture.invalid/adtag"),"inline config mutated");pass("inline nullable tag preserves initialized config");
 }
 static void identifiers() throws Exception {
  Object info=construct("com.google.android.gms.ads.identifier.AdvertisingIdClient$Info",new String[]{"java.lang.String","boolean"},"fixture-advertising-id",false);
  check("".equals(invoke(info,"getId",new String[]{})),"advertising ID not redacted");check(Boolean.TRUE.equals(invoke(info,"isLimitAdTrackingEnabled",new String[]{})),"ad tracking not limited");
  Object tracker=object(APP+"tracking.e");for(int i=0;i<100;i++){invoke(tracker,"x",new String[]{});invoke(tracker,"Q",new String[]{"java.lang.String","[Lkotlin.U;"},"fixture-event",Array.newInstance(type("kotlin.U"),0));}
  pass("limited advertising identity and app telemetry ingress");
 }
 static void firebase() throws Exception {
  Object engine=object("com.google.android.gms.internal.measurement.Z0");AtomicInteger calls=new AtomicInteger();
  set(engine,"b",proxy("com.google.android.gms.common.util.Clock",(p,m,a)->0L));
  set(engine,"c",Proxy.newProxyInstance(apk,new Class<?>[]{ExecutorService.class},(p,m,a)->{if(m.getName().equals("execute")){((Runnable)a[0]).run();return null;}return defaultValue(m.getReturnType());}));
  set(engine,"i",proxy("com.google.android.gms.internal.measurement.P0",(p,m,a)->{if(m.getName().equals("setMeasurementEnabled")){check(Boolean.FALSE.equals(a[0]),"Firebase re-enabled");calls.incrementAndGet();}return defaultValue(m.getReturnType());}));
  Object analytics=object("com.google.firebase.analytics.FirebaseAnalytics");set(analytics,"a",engine);
  for(int i=0;i<100;i++)invoke(analytics,"e",new String[]{"boolean"},true);
  check(calls.get()==100,"Firebase executor/Binder callback count");pass("Firebase analytics real task dispatch always forwards false");
  Preferences prefs=new Preferences();prefs.values.put("firebase_crashlytics_collection_enabled",true);
  Object arbiter=object("com.google.firebase.crashlytics.internal.common.z");set(arbiter,"a",prefs.preferences);set(arbiter,"c",new Object());set(arbiter,"g",Boolean.TRUE);set(arbiter,"e",true);
  set(arbiter,"d",construct("com.google.android.gms.tasks.k",new String[]{}));
  Object core=object("com.google.firebase.crashlytics.internal.common.s");set(core,"c",arbiter);
  Object crash=object("com.google.firebase.crashlytics.i");set(crash,"a",core);
  for(int i=0;i<100;i++)invoke(crash,"k",new String[]{"boolean"},true);
  check(Boolean.FALSE.equals(get(arbiter,"g"))&&Boolean.FALSE.equals(prefs.values.get("firebase_crashlytics_collection_enabled")),"saved Crashlytics enabled state");
  check(Boolean.FALSE.equals(get(arbiter,"e")),"Crashlytics enabled completion state");monitorReleased(arbiter);monitorReleased(get(arbiter,"c"));pass("Crashlytics saved/API enable blocked with real nested monitors");
  Class<?> sink=Class.forName("fixture.PerfSink",true,helpers);Object perf=allocate.invoke(unsafe,sink);
  for(int i=0;i<100;i++)call(perf,"com.google.firebase.perf.e","j",new String[]{"boolean"},true);
  check(sink.getField("calls").getInt(perf)==100&&Boolean.FALSE.equals(sink.getField("value").get(perf)),"performance flag forwarding");monitorReleased(perf);pass("Firebase performance inherited setter forwards false");
 }
 static void tealium() throws Exception {
  AtomicInteger dispatched=new AtomicInteger();Object dispatcher=proxy("com.tealium.internal.d",(p,m,a)->{dispatched.incrementAndGet();return defaultValue(m.getReturnType());});
  Object settings=construct("com.tealium.internal.data.PublishSettings",new String[]{});
  Object config=object("com.tealium.library.Tealium$Config$a");set(config,"e",settings);set(config,"v","https://fixture.invalid/publish-settings");
  Object connected=Class.forName("fixture.Connected",true,helpers).getConstructor().newInstance();
  Object retriever=construct("com.tealium.library.g",new String[]{"java.lang.String","com.tealium.library.Tealium$Config","com.tealium.internal.d","com.tealium.internal.a"},"fixture",config,dispatcher,connected);
  check(get(retriever,"h")==settings&&get(retriever,"c")==dispatcher&&get(retriever,"d")==connected,"Tealium dependencies lost");
  for(int i=0;i<100;i++){invoke(retriever,"i",new String[]{"boolean"},i%2==0);invoke(retriever,"c",new String[]{});}
  check(dispatched.get()==0&&((AtomicInteger)get(retriever,"e")).get()==0,"native settings work or in-flight state changed");pass("initialized connected Tealium retriever schedules no GET/HEAD work");
  Object tealium=object("com.tealium.library.Tealium");set(tealium,"a",dispatcher);set(tealium,"e","fixture-account");set(tealium,"f","fixture-profile");set(tealium,"g","fixture-environment");
  Map<String,Object> payload=new HashMap<>();payload.put("fixture","marker");Object dispatch=construct("com.tealium.internal.data.Dispatch",new String[]{"java.util.Map"},payload);
  for(int i=0;i<100;i++){
   invoke(tealium,"e",new String[]{"com.tealium.internal.data.Dispatch"},dispatch);
   invoke(tealium,"trackView",new String[]{"java.lang.String","java.util.Map"},"fixture-view",payload);
   invoke(tealium,"trackEvent",new String[]{"java.lang.String","java.util.Map"},"fixture-event",payload);
  }
  check(dispatched.get()==0,"Tealium enrichment/persistence message escaped ingress");check(Boolean.FALSE.equals(invoke(dispatch,"containsKey",new String[]{"java.lang.String"},"tealium_vid")),"persistent visitor ID attached");check(payload.size()==1,"input payload mutated");pass("Tealium event/view ingress neither enriches nor dispatches persistence work");
 }
 static void salesforce() throws Exception {
  String sdk="com.salesforce.marketingcloud.sfmcsdk.SFMCSdk";List pending=(List)field(type(sdk),"UNIFIED_SDK_INSTANCE_REQUESTS").get(null);int before=pending.size();
  Object producer=construct(APP+"tracking.h",new String[]{});Object event=type(APP+"tracking.event.b").getEnumConstants()[0];Map data=new HashMap();
  for(int i=0;i<1000;i++)invoke(producer,"d",new String[]{"java.lang.String",APP+"tracking.event.b","java.util.Map","java.util.Map",APP+"tracking.j"},"fixture-event",event,data,data,null);
  check(pending.size()==before,"marketing pending SDK queue grew");
  Object companion=field(type(sdk),"Companion").get(null);Object ready=proxy(sdk+"ReadyListener",(p,m,a)->null);
  invoke(companion,"requestSdk",new String[]{sdk+"ReadyListener"},ready);check(pending.size()==before+1,"generic push SDK ready API suppressed");pending.remove(pending.size()-1);pass("marketing producer cannot grow pending list; generic ready callback API retained");
  Object builder=construct("com.salesforce.marketingcloud.MarketingCloudConfig$Builder",new String[]{});
  for(String name:new String[]{"setAnalyticsEnabled","setPiAnalyticsEnabled"})invoke(builder,name,new String[]{"boolean"},true);
  check(Boolean.FALSE.equals(get(builder,"analyticsEnabled"))&&Boolean.FALSE.equals(get(builder,"piAnalyticsEnabled")),"Salesforce config enabled");
  Object analytics=object("com.salesforce.marketingcloud.analytics.h");
  Object savedEnabled=field(type("com.salesforce.marketingcloud.toggles.a"),"b").get(null);
  set(analytics,"q",savedEnabled);set(analytics,"r",savedEnabled);
  for(int i=0;i<100;i++){
   invoke(analytics,"init",new String[]{"com.salesforce.marketingcloud.InitializationStatus$a","int"},null,0);
   invoke(analytics,"controlChannelInit",new String[]{"int"},0);invoke(analytics,"enableAnalytics",new String[]{});invoke(analytics,"enablePiAnalytics",new String[]{});
   check(Boolean.FALSE.equals(invoke(analytics,"areAnalyticsEnabled",new String[]{})),"ET re-enabled");check(Boolean.FALSE.equals(invoke(analytics,"arePiAnalyticsEnabled",new String[]{})),"PI re-enabled");
  }
  for(String name:new String[]{"k","l","m","n","o"})check(get(analytics,name)==null,"analytics collector initialized: "+name);
  monitorReleased(analytics);pass("Salesforce config/lifecycle/runtime toggles leave analytics collectors absent");
 }
 static void adjust() throws Exception {
  RecordingApplication application=new RecordingApplication();Object prefs=object(APP+"businesslogic.manager.H");
  Object manager=construct(APP+"businesslogic.manager.e",new String[]{"android.app.Application",APP+"businesslogic.manager.H"},application,prefs);
  check(get(manager,"a")==application&&get(manager,"b")==prefs,"Adjust wrapper dependencies lost");
  String owner="com.adjust.sdk.Adjust";check(field(type(owner),"defaultInstance").get(null)==null,"fixture starts with initialized Adjust");
  Object event=construct("com.adjust.sdk.AdjustEvent",new String[]{"java.lang.String"},"abc123");
  for(int i=0;i<100;i++){
   invoke(manager,"d",new String[]{});invoke(manager,"g",new String[]{"boolean"},true);invoke(manager,"h",new String[]{"java.lang.String"},"fixture-token");
   call(null,owner,"trackEvent",new String[]{"com.adjust.sdk.AdjustEvent"},event);
  }
  check(application.registrations==0&&field(type(owner),"defaultInstance").get(null)==null,"Adjust SDK/lifecycle initialized");pass("Adjust initialization, enable, identifier and event ingress stay dormant");
  AtomicInteger scheduled=new AtomicInteger();Object scheduler=proxy("com.adjust.sdk.scheduler.ThreadScheduler",(p,m,a)->{scheduled.incrementAndGet();return defaultValue(m.getReturnType());});
  Object packet=object("com.adjust.sdk.ActivityPackage");
  for(String handler:new String[]{"com.adjust.sdk.PackageHandler","com.adjust.sdk.SdkClickHandler"}){
   Object object=object(handler);List queue=new ArrayList();queue.add(packet);set(object,"packageQueue",queue);set(object,"scheduler",scheduler);set(object,"paused",false);
   AtomicBoolean sending=new AtomicBoolean();if(handler.endsWith("PackageHandler"))set(object,"isSending",sending);
   for(int i=0;i<100;i++){
    invoke(object,handler.endsWith("PackageHandler")?"addPackage":"sendSdkClick",new String[]{"com.adjust.sdk.ActivityPackage"},packet);
    invoke(object,handler.endsWith("PackageHandler")?"sendFirstI":"sendNextSdkClickI",new String[]{});
   }
   check(queue.size()==1&&queue.get(0)==packet&&scheduled.get()==0&&!sending.get(),"Adjust queue/retry/in-flight state changed");pass(handler+" preserves existing queue without adding/scheduling/sending");
  }
 }
 static void conviva() throws Exception {
  Object task=construct("com.conviva.platforms.android.HTTPTask",new String[]{});AtomicInteger callbacks=new AtomicInteger();
  Object callback=proxy("com.conviva.api.system.ICallbackInterface",(p,m,a)->{if(m.getName().equals("done")){callbacks.incrementAndGet();check(Boolean.TRUE.equals(a[0])&&"{}".equals(a[1]),"Conviva completion payload");}return null;});
  set(task,"_callback",callback);invoke(task,"run",new String[]{});invoke(task,"run",new String[]{});
  check(callbacks.get()==1&&get(task,"_callback")==null,"Conviva callback not exactly once/cleared");pass("Conviva original callback exactly once with safe {} and cleared reference");
 }
 public static class CaptureQueue extends PriorityBlockingQueue<Object> {
  int submitted;public boolean add(Object task){submitted++;check(task instanceof FutureTask,"measurement scheduler task type");((FutureTask)task).run();try{((FutureTask)task).get();}catch(Exception e){throw new AssertionError(e);}return true;}
 }
 static void transport() throws Exception {
  Object cct=object("com.google.android.datatransport.cct.d");Object response=invoke(cct,"b",new String[]{"com.google.android.datatransport.runtime.backends.g"},(Object)null);
  check(response!=null&&type("com.google.android.datatransport.runtime.backends.h").isInstance(response),"CCT response type");
  check("OK".equals(((Enum)invoke(response,"c",new String[]{})).name())&&Long.valueOf(0).equals(invoke(response,"b",new String[]{})),"CCT response must retire queue without retry wait");pass("CCT typed successful zero-wait queue acknowledgement");
  String base="com.google.android.gms.measurement.internal.";Object core=object(base+"b3"),scheduler=object(base+"U2");CaptureQueue queue=new CaptureQueue();Object lock=new Object();
  set(core,"j",scheduler);set(scheduler,"a",core);set(scheduler,"b",true);set(scheduler,"i",lock);set(scheduler,"e",queue);
  Object worker=construct(base+"Y2",new String[]{base+"U2","java.lang.String","java.util.concurrent.BlockingQueue"},scheduler,"fixture-worker",queue);set(scheduler,"c",worker);
  Object client=object(base+"t2");set(client,"a",core);AtomicInteger callbacks=new AtomicInteger();
  Object callback=proxy(base+"s2",(p,m,a)->{if(m.getName().equals("a")){callbacks.incrementAndGet();check("fixture-upload".equals(a[0])&&Integer.valueOf(204).equals(a[1]),"measurement identity/status");check(a[2]==null&&a[3]==null&&a[4]==null,"measurement completion contains network/error data");}return null;});
  Object request=object(base+"x2");set(request,"i",client);set(request,"g","fixture-upload");set(request,"f",callback);
  for(int i=0;i<100;i++)invoke(request,"run",new String[]{});
  check(callbacks.get()==100&&queue.submitted==100&&queue.isEmpty(),"measurement callback/task count");monitorReleased(lock);monitorReleased(get(worker,"d"));pass("measurement original scheduler/FutureTask/callback chain completes 204 with released monitors");
  Object job=object("com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService");
  check(Boolean.FALSE.equals(invoke(job,"onStartJob",new String[]{"android.app.job.JobParameters"},(Object)null)),"CCT job requests retry");
  invoke(object("com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver"),"onReceive",new String[]{"android.content.Context","android.content.Intent"},null,null);pass("persisted DataTransport job/alarm entry points do not schedule uploads");
 }
 public static void main(String[] args) {
  try{
   if (android.os.Looper.getMainLooper() == null) android.os.Looper.prepareMainLooper();
   apk=new PathClassLoader(args[0],ClassLoader.getSystemClassLoader());helpers=new PathClassLoader(args[3],apk);
   Class<?> u=Class.forName("sun.misc.Unsafe");for(String name:new String[]{"theUnsafe","THE_ONE"})try{Field f=u.getDeclaredField(name);f.setAccessible(true);unsafe=f.get(null);break;}catch(NoSuchFieldException ignored){}
   check(unsafe!=null,"Unsafe unavailable");allocate=u.getMethod("allocateInstance",Class.class);
   boolean ads=Boolean.parseBoolean(args[1]),tracking=Boolean.parseBoolean(args[2]);if(ads)ads();
   if(tracking){identifiers();firebase();tealium();salesforce();adjust();conviva();transport();}
   check(cases==(ads?2:0)+(tracking?15:0),"missing fixture groups: "+cases);
   System.out.println("PASS: "+cases+" actual KIJK APK ART fixture groups; no playback assertion");
  }catch(Throwable failure){System.err.println("FAIL KIJK ART fixture");failure.printStackTrace();System.exit(1);}
 }
}
