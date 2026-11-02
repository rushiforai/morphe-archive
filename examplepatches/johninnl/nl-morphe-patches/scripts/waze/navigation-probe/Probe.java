package nl.johninnl.wazenavprobe;
import android.app.*;import android.content.*;import android.os.*;import android.view.accessibility.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.atomic.*;
public class Probe extends Instrumentation {
 ClassLoader loader;int passed;StringBuilder log=new StringBuilder();
 Class<?> c(String n)throws Exception{return Class.forName(n,true,loader);}
 Object invoke(Object o,Class<?> type,String name,Class<?>[] p,Object...a)throws Exception{Method m=type.getDeclaredMethod(name,p);m.setAccessible(true);return m.invoke(o,a);}
 interface Work{void run()throws Exception;}
 void main(Work w)throws Exception{AtomicReference<Throwable> e=new AtomicReference<>();runOnMainSync(()->{try{w.run();}catch(Throwable t){e.set(t);}});if(e.get()!=null)throw new RuntimeException(e.get());}
 void check(boolean b,String n){if(!b)throw new AssertionError(n);passed++;log.append("PASS ").append(n).append('\n');}
 void feature(String n,boolean b)throws Exception{invoke(null,c("org.ungoogled.waze.Customization"),"setForTest",new Class[]{String.class,boolean.class},n,b);}
 Object legacy(int percent,int remaining)throws Exception{Class<?> p=c("com.waze.jni.protos.navigate.AverageSpeedCameraZoneUpdate");Object b=p.getMethod("newBuilder").invoke(null);b.getClass().getMethod("setPercent",int.class).invoke(b,percent);b.getClass().getMethod("setLeftDistance",int.class).invoke(b,remaining);return b.getClass().getMethod("build").invoke(b);}
 Object insights(String name,int remaining)throws Exception{
  Class<?> u=c("com.waze.jni.protos.insights_infra.SegmentInsightUpdate"),i=c("com.waze.jni.protos.insights_infra.SegmentInsightInfo"),id=c("com.waze.jni.protos.insights_infra.SegmentInsightInfo$Id");
  Object ub=u.getMethod("newBuilder").invoke(null),ib=i.getMethod("newBuilder").invoke(null),db=id.getMethod("newBuilder").invoke(null);
  db.getClass().getMethod("setSegmentTypeValue",int.class).invoke(db,7);db.getClass().getMethod("setSegmentId",String.class).invoke(db,name);
  ib.getClass().getMethod("setId",id).invoke(ib,db.getClass().getMethod("build").invoke(db));ib.getClass().getMethod("setPositionRelativeToSegmentValue",int.class).invoke(ib,1);ib.getClass().getMethod("setRemainingDistanceMeters",int.class).invoke(ib,remaining);
  ub.getClass().getMethod("addInfo",i).invoke(ub,ib.getClass().getMethod("build").invoke(ib));return ub.getClass().getMethod("build").invoke(ub);
 }
 public void onCreate(Bundle b){super.onCreate(b);start();}
 public void onStart(){Bundle result=new Bundle();try{
  loader=getTargetContext().getClassLoader();startActivitySync(new Intent().setClassName("com.waze","com.waze.FreeMapAppActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
  Field session=c("org.ungoogled.waze.NavigationBroadcasts").getDeclaredField("SESSION");session.setAccessible(true);log.append("PUBLISHER_SESSION ").append(session.get(null)).append('\n');
  Class<?> nm=c("com.waze.NativeManager");long until=SystemClock.elapsedRealtime()+60000;
  while(!(Boolean)nm.getMethod("isAppStarted").invoke(null)){if(SystemClock.elapsedRealtime()>until)throw new AssertionError("native startup timeout");SystemClock.sleep(100);}
  Class<?> location=c("com.waze.location.LocationSensorListener");Field lf=location.getDeclaredField("mInstance");lf.setAccessible(true);Object loc=lf.get(null);
  if(loc==null){for(String key:new String[]{"com.waze.location.x","com.waze.location.bp","com.waze.location.LocationSensorListener"}){try{loc=c("kotlinx.coroutines.a.ab").getMethod("l",Class.class).invoke(null,c(key));log.append("LOCATION ").append(key).append(" -> ").append(loc.getClass().getName()).append('\n');break;}catch(Exception ignored){}}}
  check(loc!=null&&location.isInstance(loc),"native location producer exists");final Object nativeLoc=loc;
  Class<?> navigation=c("com.waze.navigate.NavigationInfoNativeManager"),insight=c("com.waze.insights_infra.InsightsInfraNativeManager");Object nav=navigation.getMethod("a").invoke(null),ins=c("kotlinx.coroutines.a.ab").getMethod("l",Class.class).invoke(null,insight);
  Object config=c("com.waze.ConfigManager").getMethod("getInstance").invoke(null);Class<?> values=c("com.waze.config.ConfigValues"),flag=c("com.waze.config.b"),string=c("com.waze.config.d");
  Object validate=values.getField("CONFIG_VALUE_CAR_LIB_VALIDATE_HOST_CONNECTIONS").get(null);Method sb=config.getClass().getMethod("setConfigValueBool",flag,boolean.class);boolean previous=(Boolean)config.getClass().getMethod("getConfigValueBool",flag).invoke(config,validate);
  main(()->sb.invoke(config,validate,true));SystemClock.sleep(500);
  main(()->{
   Class<?> serviceType=c("com.waze.car_lib.WazeCarAppService");Object service=serviceType.getConstructor().newInstance();Method attach=ContextWrapper.class.getDeclaredMethod("attachBaseContext",Context.class);attach.setAccessible(true);attach.invoke(service,getTargetContext());
   Object validator=serviceType.getMethod("createHostValidator").invoke(service);Field allow=validator.getClass().getDeclaredField("mAllowAllHosts");allow.setAccessible(true);check(!allow.getBoolean(validator),"host validation remains enabled");
   Class<?> info=c("androidx.car.app.HostInfo");String gear="app.seb3thehacker.gearslip";int gu=getTargetContext().getPackageManager().getApplicationInfo(gear,0).uid;
   Object g=info.getConstructor(String.class,int.class).newInstance(gear,gu);Method isValid=validator.getClass().getMethod("isValidHost",info);check((Boolean)isValid.invoke(validator,g),"actual Gearslip package admitted");
   String other="com.google.android.gms";Object bad=info.getConstructor(String.class,int.class).newInstance(other,getTargetContext().getPackageManager().getApplicationInfo(other,0).uid);check(!(Boolean)isValid.invoke(validator,bad),"unlisted host package rejected");
   boolean wrongUidRejected=false;
   try{isValid.invoke(validator,info.getConstructor(String.class,int.class).newInstance(gear,0));}catch(InvocationTargetException denied){wrongUidRejected=denied.getCause() instanceof IllegalStateException;}
   check(wrongUidRejected,"trusted package with a forged UID rejected");
   int id=getTargetContext().getResources().getIdentifier("hosts_allowlist","array","com.waze");String[] hosts=getTargetContext().getResources().getStringArray(id);check(hosts.length==3,"three original Android Auto certificates preserved");
   sb.invoke(config,validate,previous);feature("zoneBar",false);feature("stayAwake",false);feature("navigationBroadcasts",true);
   check((Boolean)invoke(null,c("org.ungoogled.waze.Customization"),"on",new Class[]{String.class},"stayAwake"),"background keep-alive is effective while exporting");
   check("nl.johninnl.wavereceiver".equals(c("org.ungoogled.waze.NavigationBroadcasts").getMethod("receiverPackage").invoke(null)),"target package option bound");
  });
  getUiAutomation().performGlobalAction(2);SystemClock.sleep(1500);AccessibilityNodeInfo root=getUiAutomation().getRootInActiveWindow();check(root!=null&&!"com.waze".contentEquals(root.getPackageName()),"Waze Activity is backgrounded");
  main(()->{
   Object timeout=values.getField("CONFIG_VALUE_POWER_BACKGROUND_TIMEOUT_MS").get(null);
   check(((Integer)config.getClass().getMethod("getConfigValueInt",c("com.waze.config.c")).invoke(config,timeout))>=10800000,"native background idle timeout extended to at least three hours");
   invoke(nativeLoc,location,"updateSpeedometer",new Class[]{int.class,String.class,int.class,double.class},0,"km/h",120,42.5d);
   invoke(nav,navigation,"i",new Class[]{c("com.waze.jni.protos.navigate.AverageSpeedCameraZoneUpdate")},legacy(25,3000));
  });
  SystemClock.sleep(4000);
  main(()->invoke(nav,navigation,"i",new Class[]{c("com.waze.jni.protos.navigate.AverageSpeedCameraZoneUpdate")},legacy(28,2880)));
  SystemClock.sleep(2200);
  main(()->invoke(nav,navigation,"h",new Class[]{}));
  main(()->{
   invoke(ins,insight,"c",new Class[]{c("com.waze.jni.protos.insights_infra.SegmentInsightUpdate")},insights("probe-a",1000));
   invoke(ins,insight,"c",new Class[]{c("com.waze.jni.protos.insights_infra.SegmentInsightUpdate")},insights("probe-b",700));
  });
  main(()->invoke(nativeLoc,location,"updateSpeedometer",new Class[]{int.class,String.class,int.class,double.class},0,"mph",65,0d));
  // Localized display unit: resolve the native nonlocalized metric setting, including auto/default.
  Object setting=values.getField("CONFIG_VALUE_GENERAL_UNITS").get(null);Method gs=config.getClass().getMethod("getConfigValueString",string),ss=config.getClass().getMethod("setConfigValueString",string,String.class);String previousUnits=(String)gs.invoke(config,setting);
  main(()->ss.invoke(config,setting,"metric"));SystemClock.sleep(500);
  main(()->invoke(nativeLoc,location,"updateSpeedometer",new Class[]{int.class,String.class,int.class,double.class},0,"קמ\"ש",100,0d));
  main(()->ss.invoke(config,setting,previousUnits));SystemClock.sleep(500);
  main(()->feature("navigationBroadcasts",false));
  main(()->{invoke(nativeLoc,location,"updateSpeedometer",new Class[]{int.class,String.class,int.class,double.class},0,"km/h",130,0d);getTargetContext().sendBroadcast(new Intent("nl.johninnl.waze.NAVIGATION_STATE_REQUEST"));});
  SystemClock.sleep(2500);check(true,"native callbacks exercised with Waze backgrounded and overlay disabled");
  result.putString("stream",log.toString());finish(Activity.RESULT_OK,result);
 }catch(Throwable e){result.putString("stream",log+android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}}
}
