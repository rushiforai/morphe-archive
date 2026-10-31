package xyz.urro.transit;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import org.json.JSONArray;
import org.json.JSONObject;
import java.lang.reflect.Method;
import java.util.IdentityHashMap;
import java.util.TreeSet;
import java.util.HashMap;
import java.util.UUID;
import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;

/** Diagnostic alpha only. No diagnostic observation is used to activate motion cues. */
public final class GoModelDiagnostics {
 private static final Handler main=new Handler(Looper.getMainLooper());
 private static long sequence;
 private static final String RUN=UUID.randomUUID().toString();
 private static final HashMap<String,String> previous=new HashMap<>();
 private static final String[] CHILDREN={"getGoSummaryCard","getItems","getSegments","getHeader","getFooter","getCollapsedItems","getRouteServiceName","getRouteName","getFloatingServiceName","getImage","getMinimized","getAndroidWidget","getInstruction"};
 private static final String[] VALUES={"getPathType","getType","getTransportMode","getVehicleType","getUid","getSegmentId","getItemId","getSourceLegIndex","getSessionId","getItineraryId","getShouldNotifyWithLiveActivity"};
 private static boolean enabled(){Context c=TransitHooks.appContext();return c!=null&&c.getSharedPreferences("xyz.urro.transit.go.v1",0).getBoolean("diagnostics",false);}
 public static void onModel(Object model){
  if(model==null)return;String type=model.getClass().getName();
  // Only GO and end-of-ride models: the full model stream evicted useful events from the buffer.
  GoActivityTransmitter.onModel(model);
  if(type.startsWith("djinni.java.src.GO")||type.endsWith(".EndOfRide"))trace("go_model_callback",type);
  if(type.equals("djinni.java.src.TripDetails"))capture("trip_details",model);
  else if(enabled())capture("model_"+model.getClass().getSimpleName(),model);
 }
 public static void onLiveModel(Object model){if(model!=null)capture("go_live_model",model);}
 private static void capture(String source,Object model){
  if(!enabled())return;long received=SystemClock.elapsedRealtime();
  main.post(()->{if(!enabled())return;try{
   JSONObject state=new JSONObject(),schema=new JSONObject();TreeSet<String> paths=new TreeSet<>();
   if(source.equals("trip_details"))state.put("go_summary_present",model.getClass().getMethod("getGoSummaryCard").invoke(model)!=null);
   walk(model,"root",0,new IdentityHashMap<>(),state,schema,paths);
   state.put("path_types",new JSONArray(paths));state.put("schema",schema);
   append(source,received,state);
  }catch(ReflectiveOperationException|org.json.JSONException|RuntimeException e){android.util.Log.w("TransitMorphe","GO diagnostic snapshot unavailable");}});
 }
 private static void walk(Object node,String path,int depth,IdentityHashMap<Object,Boolean> visited,JSONObject state,JSONObject schema,TreeSet<String> paths)throws ReflectiveOperationException,org.json.JSONException{
  if(node==null||depth>7||visited.size()>=128||visited.put(node,true)!=null)return;
  if(node instanceof Iterable){int index=0;for(Object child:(Iterable<?>)node){if(index>=32)break;walk(child,path+"["+index+++"]",depth+1,visited,state,schema,paths);}return;}
  String name=node.getClass().getName();
  if(!name.startsWith("djinni.java.src.")&&!name.startsWith("com.thetransitapp.droid.shared.model.cpp."))return;
  TreeSet<String> members=new TreeSet<>();
  for(Method m:node.getClass().getMethods())if(m.getParameterTypes().length==0&&m.getName().matches("get(GoSummaryCard|Items|Segments|Header|Footer|PathType|Type|Uid|SegmentId|ItemId|SourceLegIndex|SessionId|ItineraryId|TransportMode|VehicleType)"))members.add(m.getName()+":"+m.getReturnType().getSimpleName());
  schema.put(node.getClass().getSimpleName(),new JSONArray(members));
  for(String getter:VALUES)try{
   Object value=node.getClass().getMethod(getter).invoke(node);String key=path+"."+getter;
   if(value instanceof Enum){String v=((Enum<?>)value).name();state.put(key,v);if(getter.equals("getPathType"))paths.add(v);}
   else if(value instanceof Boolean)state.put(key,value);
   else if(getter.equals("getSourceLegIndex")&&value instanceof Number)state.put(key,value);
   else if((getter.endsWith("Id")||getter.equals("getUid"))&&(value instanceof String||value instanceof Number))state.put(key+"_run_hash",opaque(value.toString()));
  }catch(NoSuchMethodException ignored){}
  for(String getter:CHILDREN)try{walk(node.getClass().getMethod(getter).invoke(node),path+"."+getter,depth+1,visited,state,schema,paths);}catch(NoSuchMethodException ignored){}
 }
 private static String opaque(String value){try{
  byte[] bytes=MessageDigest.getInstance("SHA-256").digest((RUN+":"+value).getBytes(StandardCharsets.UTF_8));
  StringBuilder out=new StringBuilder();for(int i=0;i<12;i++)out.append(String.format(java.util.Locale.ROOT,"%02x",bytes[i]&255));return out.toString();
 }catch(java.security.NoSuchAlgorithmException impossible){return "unavailable";}}
 /** The reminder candidate comes from an already-marked native model, never notification scraping. */
 public static void reminder(ReminderFormatter.Event event,int stops){
  if(!enabled())return;long received=SystemClock.elapsedRealtime();main.post(()->{if(!enabled())return;try{
   append("reminder_candidate",received,new JSONObject().put("event",event.name()).put("remaining_stops",stops).put("authoritative_boarding",false));
  }catch(org.json.JSONException ignored){}});
 }
 private static void append(String source,long received,JSONObject state)throws org.json.JSONException{
  Context c=TransitHooks.appContext();if(c==null)return;
  JSONObject event=new JSONObject().put("run",RUN).put("sequence",++sequence).put("pid",android.os.Process.myPid()).put("elapsed_ms",received).put("wall_time_ms",System.currentTimeMillis()).put("source",source).put("state",state);
  event.put("interactive",c.getSystemService(android.os.PowerManager.class).isInteractive());
  event.put("device_locked",c.getSystemService(android.app.KeyguardManager.class).isDeviceLocked());
  // File history keeps repeats. Only the small on-screen/clipboard preview is deduplicated.
  DiagnosticFiles.append(c,RUN,event.toString());
  String signature=state.toString();if(signature.equals(previous.get(source)))return;previous.put(source,signature);
  android.content.SharedPreferences p=c.getSharedPreferences("xyz.urro.transit.go.diagnostics",0);
  JSONArray old;try{old=new JSONArray(p.getString("events","[]"));}catch(org.json.JSONException e){old=new JSONArray();}
  JSONArray next=new JSONArray();int start=Math.max(0,old.length()-399);for(int i=start;i<old.length();i++)next.put(old.get(i));
  next.put(event);
  // Bounded durable buffer; preference writes are asynchronous and contain no raw IDs/text/locations.
  while(next.toString().length()>180000&&next.length()>1){JSONArray smaller=new JSONArray();for(int i=1;i<next.length();i++)smaller.put(next.get(i));next=smaller;}
  p.edit().putString("events",next.toString()).apply();
 }
 public static void snapshot(String trip,String leg,boolean active,boolean bus,boolean onboard,boolean enabled){
  if(!enabled())return;try{trace("boarding_snapshot",new JSONObject().put("trip",trip==null?"missing":opaque(trip)).put("leg",leg==null?"missing":opaque(leg)).put("active",active).put("bus",bus).put("onboard",onboard).put("enabled",enabled));}catch(org.json.JSONException ignored){}
 }
 public static void trace(String source,JSONObject state){
  if(!enabled())return;long received=SystemClock.elapsedRealtime();
  main.post(()->{if(!enabled())return;try{append(source,received,state);}catch(org.json.JSONException ignored){}});
 }
 private static JSONObject details(String result){JSONObject o=new JSONObject();try{o.put("result",result);}catch(org.json.JSONException ignored){}return o;}
 public static void trace(String source,String result){trace(source,details(result));}
 public static String report(){
  Context c=TransitHooks.appContext();if(c==null)return "[]";
  try{JSONArray all=new JSONArray(c.getSharedPreferences("xyz.urro.transit.go.diagnostics",0).getString("events","[]"));
   all.put(new JSONObject().put("run",RUN).put("elapsed_ms",SystemClock.elapsedRealtime()).put("source","relay_history").put("state",new JSONObject().put("history",Events.get(c))));
   return all.toString();
  }catch(org.json.JSONException e){return "[]";}
 }
 public static boolean isEnabled(Context c){return c!=null&&c.getSharedPreferences("xyz.urro.transit.go.v1",0).getBoolean("diagnostics",false);}
 public static void clear(Context c){if(c!=null){previous.clear();c.getSharedPreferences("xyz.urro.transit.go.diagnostics",0).edit().remove("events").apply();}}
 public static boolean toggle(Context c){boolean next=!c.getSharedPreferences("xyz.urro.transit.go.v1",0).getBoolean("diagnostics",false);c.getSharedPreferences("xyz.urro.transit.go.v1",0).edit().putBoolean("diagnostics",next).apply();previous.clear();return next;}
}
