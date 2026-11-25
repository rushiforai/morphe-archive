package nl.johninnl.mapsconsumerprobe;
import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Read-only snapshot of the actual patched Maps process. It never fabricates observations or changes consumer fields. */
public final class MapsConsumerProbe extends Instrumentation {
 private ClassLoader loader;
 private Bundle args;
 private Class<?> type(String name)throws Exception{return Class.forName("org.ungoogled.ui."+name,false,loader);}
 private Object field(Object owner,String name)throws Exception{Class<?> c=owner instanceof Class?(Class<?>)owner:owner.getClass();while(c!=null){try{Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(owner instanceof Class?null:owner);}catch(NoSuchFieldException e){c=c.getSuperclass();}}throw new NoSuchFieldException(name);}
 private Object call(Object owner,String name)throws Exception{Class<?> c=owner instanceof Class?(Class<?>)owner:owner.getClass();Method m=c.getDeclaredMethod(name);m.setAccessible(true);return m.invoke(owner instanceof Class?null:owner);}
 private void put(JSONObject row,String key,Object value)throws Exception{if(value instanceof Number&&!Double.isFinite(((Number)value).doubleValue()))value=null;row.put(key,value==null?JSONObject.NULL:value);}
 private JSONObject units()throws Exception{
  Class<?> enumeration=Class.forName("ciqt",false,loader);Object kilometers=null,miles=null;
  for(Object value:enumeration.getEnumConstants()){String name=((Enum<?>)value).name();if(name.equals("KILOMETERS"))kilometers=value;else if(name.equals("MILES"))miles=value;}
  if(kilometers==null||miles==null)throw new AssertionError("native unit enumeration");
  Method bridge=type("SpeedAlerts").getDeclaredMethod("nativeUnits",Object.class,Object.class);bridge.setAccessible(true);
  int metric=(Integer)bridge.invoke(null,null,kilometers),imperial=(Integer)bridge.invoke(null,null,miles);
  if(metric!=1||imperial!=0)throw new AssertionError("emitted native unit bridge");
  JSONObject row=new JSONObject();row.put("kilometers",metric);row.put("miles",imperial);return row;
 }
 private JSONObject sample()throws Exception{AtomicReference<JSONObject> result=new AtomicReference<>();AtomicReference<Throwable> error=new AtomicReference<>();runOnMainSync(()->{try{result.set(read());}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new IllegalStateException(error.get());return result.get();}
 private JSONObject read()throws Exception{
  Class<?> runtime=type("ExternalTelemetry");Object view=call(runtime,"view");JSONObject row=new JSONObject();
  put(row,"elapsed_ms",SystemClock.elapsedRealtime());put(row,"native_units_explicit",units());put(row,"selected",field(runtime,"source"));put(row,"registered",field(runtime,"registered"));put(row,"publisher_session",field(runtime,"publisherSession"));
  for(String key:new String[]{"external","currentKmh","limitKmh","zoneActive","zoneSession","remainingMeters","progressPercent","averageKmh","partialAverage","progressEstimated","approachDistanceMeters","approachEstimated"})put(row,key,field(view,key));
  put(row,"display_speed_mps",call(runtime,"speedMps"));put(row,"display_limit_kmh",call(runtime,"limitKmh"));put(row,"status",call(runtime,"status"));put(row,"warning",call(runtime,"compactWarning"));put(row,"flock_suppressed",call(runtime,"suppressNativeFlock"));
  List<?> alerts=(List<?>)field(view,"alerts");JSONArray kinds=new JSONArray();for(Object a:alerts)kinds.put(field(a,"kind"));put(row,"alerts_count",alerts.size());put(row,"alert_kinds",kinds);
  Object widget=field(runtime,"widget");put(row,"compact_attached",widget instanceof View&&((View)widget).isAttachedToWindow());put(row,"compact_description",widget instanceof View?((View)widget).getContentDescription():null);
  Object warnings=field(runtime,"warnings");put(row,"warning_announced_count",((Map<?,?>)field(warnings,"announced")).size());
  put(row,"native_badge_hidden",field(runtime,"hiddenBadge")!=null);put(row,"legacy_count",((List<?>)field(type("WazeAlerts"),"alerts")).size());
  put(row,"map_adapter_items",((List<?>)call(type("WazeAlerts"),"mapItems")).size());
  put(row,"native_injected_items",((java.util.Set<?>)field(type("SavedOnMap"),"ours")).size());
  Object generator=((java.lang.ref.WeakReference<?>)field(type("SavedOnMap"),"generator")).get();
  put(row,"map_generator_bound",generator!=null);
  if(generator!=null){JSONObject state=new JSONObject();for(String flag:new String[]{"b","f","g","i"})put(state,flag,field(generator,flag));for(String key:new String[]{"d","e","j"}){Object value=field(generator,key);put(state,key+"_size",value instanceof java.util.Collection?((java.util.Collection<?>)value).size():value instanceof java.util.Map?((java.util.Map<?,?>)value).size():null);}put(row,"native_generator_state",state);}

  Map<?,?> peers=(Map<?,?>)field(field(runtime,"store"),"peers");JSONObject accepted=new JSONObject();for(Object source:peers.keySet()){Object peer=peers.get(source);JSONObject item=new JSONObject();put(item,"session",field(peer,"session"));put(item,"sequence",field(peer,"sequence"));put(item,"sent_age_ms",SystemClock.elapsedRealtime()-((Number)field(peer,"sent")).longValue());accepted.put(source.toString(),item);}put(row,"accepted_peers",accepted);
  return row;
 }
 private boolean matches(JSONObject row)throws Exception{
  String source=args.getString("expected_source");if(source!=null&&!source.equals(row.getString("selected")))return false;
  for(String key:new String[]{"external","zoneActive","compact_attached"}){String expected=args.getString("expected_"+key);if(expected!=null&&row.getBoolean(key)!=Boolean.parseBoolean(expected))return false;}
  String minimum=args.getString("minimum_pins");if(minimum!=null&&row.getInt("map_adapter_items")<Integer.parseInt(minimum))return false;
  return true;
 }
 @Override public void onCreate(Bundle options){super.onCreate(options);args=options==null?new Bundle():options;start();}
 @Override public void onStart(){Bundle result=new Bundle();try{
  loader=getTargetContext().getClassLoader();
  Intent launch=getTargetContext().getPackageManager().getLaunchIntentForPackage(getTargetContext().getPackageName());if(launch==null)throw new IllegalStateException("no launcher");launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);startActivitySync(launch);SystemClock.sleep(1200);
  long hold=Math.max(1000,Math.min(180000,Long.parseLong(args.getString("hold_ms","15000")))),end=SystemClock.elapsedRealtime()+hold;JSONObject latest=null;boolean ever=false;
  do{latest=sample();boolean good=matches(latest);ever|=good;put(latest,"assertion_match",good);Bundle status=new Bundle();status.putString("stream","MAPS_CONSUMER_SAMPLE "+latest+"\n");sendStatus(0,status);SystemClock.sleep(1000);}while(SystemClock.elapsedRealtime()<end);
  boolean good=matches(latest);result.putString("stream","MAPS_CONSUMER_RESULT "+(good?"PASS":"FAIL")+" ever="+ever+" final="+latest+"\n");finish(good?Activity.RESULT_OK:Activity.RESULT_CANCELED,result);
 }catch(Throwable error){result.putString("stream","MAPS_CONSUMER_RESULT ERROR "+android.util.Log.getStackTraceString(error)+"\n");finish(Activity.RESULT_CANCELED,result);}}
}
