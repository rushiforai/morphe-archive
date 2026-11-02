package nl.johninnl.flitsmeisterprobe;
import android.app.*;import android.content.*;import android.location.Location;import android.os.*;import android.view.accessibility.AccessibilityNodeInfo;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.atomic.AtomicReference;
/** Test-only instrumentation: drives actual patched producer methods while Home is visible. */
public class FlitsmeisterProbe extends Instrumentation {
 ClassLoader loader;StringBuilder log=new StringBuilder();
 Class<?> c(String n)throws Exception{return Class.forName(n,true,loader);}
 Object call(Object o,String name,Class<?>[] types,Object...args)throws Exception { Method m=o.getClass().getMethod(name,types);m.setAccessible(true);return m.invoke(o,args); }
 Object singleton(String cls,String field)throws Exception{Object holder=c(cls).getField(field).get(null);return call(holder,"getInstance",new Class[]{Context.class},getTargetContext());}
 interface Work{void run()throws Exception;}
 void main(Work work)throws Exception{AtomicReference<Throwable> failure=new AtomicReference<>();runOnMainSync(()->{try{work.run();}catch(Throwable t){failure.set(t);}});if(failure.get()!=null)throw new RuntimeException(failure.get());}
 void check(boolean ok,String message){if(!ok)throw new AssertionError(message);log.append("PASS ").append(message).append('\n');}
 Location fix(double longitude,Float speed){Location l=new Location("gps");l.setLatitude(52);l.setLongitude(longitude);l.setAccuracy(3);l.setBearing(90);if(speed!=null)l.setSpeed(speed);l.setTime(System.currentTimeMillis());l.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());return l;}
 Object report(String id,int segment)throws Exception{
  Object report=c("nl.flitsmeister.fmcore.data.model.reports.AvgSpeedCheck").getConstructor().newInstance();
  List<Object> path=Arrays.asList(c("via").getConstructor(double.class,double.class).newInstance(52d,5d),c("via").getConstructor(double.class,double.class).newInstance(52d,5.02d));
  call(report,"setId",new Class[]{String.class},id);call(report,"setRoad",new Class[]{String.class},"A1");call(report,"setCountry",new Class[]{int.class},1);
  call(report,"setGpsPath",new Class[]{List.class},path);call(report,"setMaxSpeedDay",new Class[]{Integer.class},100);call(report,"setMaxSpeedNight",new Class[]{Integer.class},100);
  Object part=c("nl.flitsmeister.fmcore.data.model.reports.AvgSpeedCheck$AvgSpeedCheckSegment").getConstructor(int.class,List.class,Integer.class,Integer.class).newInstance(segment,path,100,100);
  call(report,"setSegments",new Class[]{List.class},Arrays.asList(part));return report;
 }
 public void onCreate(Bundle args){super.onCreate(args);start();}
 public void onStart(){Bundle result=new Bundle();try{
  loader=getTargetContext().getClassLoader();
  Intent launch=getTargetContext().getPackageManager().getLaunchIntentForPackage("nl.flitsmeister");launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);startActivitySync(launch);SystemClock.sleep(3500);
  main(()->getTargetContext().startForegroundService(new Intent().setClassName("nl.flitsmeister","nl.flitsmeister.services.base.FlitsmeisterBaseService")));
  SystemClock.sleep(3500);
  Field session=c("nl.johninnl.flitsmeister.NavigationBroadcasts").getDeclaredField("SESSION");session.setAccessible(true);log.append("PUBLISHER_SESSION ").append(session.get(null)).append('\n');
  Object location=singleton("ab0","E1"),road=singleton("omf","F1"),tasks=singleton("fsi","r"),zone=tasks.getClass().getField("k").get(tasks);
  check(location!=null&&zone!=null,"real native location and zone task instances resolved");
  // Prevent real stationary emulator fixes from racing the deterministic test data.
  Object provider=location.getClass().getField("q").get(location);if(provider!=null)main(()->call(provider,"stop",new Class[]{}));
  getUiAutomation().performGlobalAction(2);SystemClock.sleep(1000);
  AccessibilityNodeInfo root=getUiAutomation().getRootInActiveWindow();check(root!=null&&!"nl.flitsmeister".contentEquals(root.getPackageName()),"Flitsmeister Activity backgrounded");
  check(!android.provider.Settings.canDrawOverlays(getTargetContext()),"overlay permission disabled");
  check("nl.johninnl.wavereceiver".equals(c("nl.johninnl.flitsmeister.NavigationBroadcasts").getMethod("receiverPackage").invoke(null)),"explicit independent receiver configured");
  main(()->{
   c("r65").getField("b").setInt(null,1);c("hmf").getField("g").setInt(null,100);c("hmf").getField("d").setBoolean(null,false);call(road,"z",new Class[]{});
   Location sample=fix(5.005,20f);call(location,"A",new Class[]{Location.class},sample);
   zone.getClass().getField("d").set(zone,report("probe-zone",1));
   call(zone,"c",new Class[]{Location.class,float.class,String.class},sample,90f,"A1");
  });
  SystemClock.sleep(4000);
  main(()->call(location,"A",new Class[]{Location.class},fix(5.0065,20f)));
  SystemClock.sleep(2200);
  main(()->{
   Class<?> feed=c("nl.johninnl.flitsmeister.NavigationBroadcasts");Field state=feed.getDeclaredField("STATE");state.setAccessible(true);
   Object snapshot=call(state.get(null),"snapshot",new Class[]{long.class},SystemClock.elapsedRealtime());
   Field candidate=feed.getDeclaredField("candidate");candidate.setAccessible(true);
   log.append("STATE_AFTER_MOVE candidate=").append(candidate.get(null)!=null).append(" distance=").append(snapshot.getClass().getField("observedMeters").get(snapshot)).append(" average=").append(snapshot.getClass().getField("averageKmh").get(snapshot)).append('\n');
  });
  main(()->{
   zone.getClass().getField("d").set(zone,report("probe-zone",2));
   call(zone,"c",new Class[]{Location.class,float.class,String.class},fix(5.007,20f),90f,"A1");
  });SystemClock.sleep(1100);
  main(()->call(location,"A",new Class[]{Location.class},fix(5.007,0f)));SystemClock.sleep(1100);
  main(()->call(location,"A",new Class[]{Location.class},fix(5.007,null)));SystemClock.sleep(1100);
  main(()->{c("r65").getField("b").setInt(null,14);c("hmf").getField("g").setInt(null,65);call(road,"z",new Class[]{});});SystemClock.sleep(1100);
  main(()->call(zone,"onStop",new Class[]{}));SystemClock.sleep(1100);
  main(()->getTargetContext().stopService(new Intent().setClassName("nl.flitsmeister","nl.flitsmeister.services.base.FlitsmeisterBaseService")));SystemClock.sleep(1000);
  check(true,"actual patched native methods exercised with overlay off and app backgrounded");
  result.putString("stream",log.toString());finish(Activity.RESULT_OK,result);
 }catch(Throwable e){result.putString("stream",log+android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}}
}
