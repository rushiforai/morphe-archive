package xyz.urro.transit;
import android.content.Context;
import android.content.Intent;
import android.os.*;

/** Publishes the active GO model's vehicle state independently of alerts and translations. */
public final class GoActivityTransmitter {
 private static final Handler main=new Handler(Looper.getMainLooper());
 private static Context context;
 private static boolean aboard,published,queued,serviceStopped;
 private static String previous="";
 private static final GoLiveRide live=new GoLiveRide();
 /** Set by a background live edge; held until GoService publishes a different (fresh) TripDetails. */
 private static Boolean liveAboard;private static Object liveBasis;
 private static final Runnable read=()->{queued=false;readActiveTrip();};
 private GoActivityTransmitter(){}
 public static void init(Context c){context=c.getApplicationContext();}
 static void onLive(Context c,Object data){
  if(c==null||!TransitHooks.activityFeature()||GoSimulation.delivering)return;
  init(c);
  GoLiveRide.Snapshot snapshot=GoLiveRide.read(data);
  if(snapshot!=null){long now=SystemClock.elapsedRealtime();main.post(()->applyLive(snapshot,now));}
  schedule();
 }
 /** The trip screen's model pauses in the background; the live notification keeps updating. */
 private static void applyLive(GoLiveRide.Snapshot snapshot,long now){
  if(context==null||serviceStopped)return;
  Boolean edge=live.next(snapshot,now);
  if(edge==null||edge==aboard)return;
  liveAboard=edge;liveBasis=activeModel();aboard=edge;note("live_ride="+(edge?"ABOARD":"NOT_ABOARD"));evaluate();
 }
 private static Object activeModel(){
  try{
   Object vm=Class.forName("com.thetransitapp.droid.shared.service.GoService",true,context.getClassLoader()).getField("e").get(null);if(vm==null)return null;
   Object state=vm.getClass().getField("e").get(vm);return state==null?null:state.getClass().getMethod("getValue").invoke(state);
  }catch(ReflectiveOperationException|RuntimeException e){return null;}
 }
 static void onModel(Object model){
  if(model!=null&&model.getClass().getName().equals("djinni.java.src.TripDetails"))schedule();
 }
 private static void schedule(){
  if(!TransitHooks.activityFeature())return;
  main.post(()->{if(!queued){queued=true;main.postDelayed(read,16);}});
 }
 /** Read GoService's own model; an unrelated itinerary preview mustn't change activity. */
 private static void readActiveTrip(){
  if(context==null)return;
  if(serviceStopped){aboard=false;evaluate();return;}
  try{
   Class<?> service=Class.forName("com.thetransitapp.droid.shared.service.GoService",true,context.getClassLoader());
   Object vm=service.getField("e").get(null);
   if(vm==null){aboard=false;note("go_service_absent");evaluate();return;}
   Object state=vm.getClass().getField("e").get(vm);
   if(state==null){note("model_unavailable_hold");return;}
   Object trip=state.getClass().getMethod("getValue").invoke(state);
   if(liveAboard!=null){if(trip==liveBasis){note("model_stale_hold");return;}liveAboard=null;liveBasis=null;}
   GoVehicleState.State next=GoVehicleState.fromTrip(trip);note("native_trip="+next);
   if(next==GoVehicleState.State.UNKNOWN)return;
   aboard=next==GoVehicleState.State.ABOARD;evaluate();
  }catch(ReflectiveOperationException|RuntimeException e){note("model_unavailable_hold="+e.getClass().getSimpleName());}
 }
 static void onMap(Object model){
  if(model==null||!TransitHooks.activityFeature())return;
  try{
   Object list=model.getClass().getMethod("getPlacemarks").invoke(model);
   if(list instanceof Iterable)for(Object vehicle:(Iterable<?>)list){
    if(Boolean.TRUE.equals(GoVehicleState.vehicleMembership(vehicle))){GoModelDiagnostics.trace("native_vehicle_membership","containsCurrentUser=true");return;}
   }
  }catch(ReflectiveOperationException|RuntimeException ignored){}
 }
 /** Explicit service cancellation, never a missing or temporary notification model. */
 public static void serviceCommand(Intent intent){
  if(intent==null)return;
  if("start-go".equals(intent.getAction()))main.post(()->{serviceStopped=false;resetLive();schedule();});
  else if("com.thetransitapp.droid.shared.service.GoService.ACTION_CLEANUP_AND_STOP".equals(intent.getAction()))stop();
 }
 public static void serviceDestroyed(Object owner){
  if(owner!=null&&owner.getClass().getName().equals("com.thetransitapp.droid.shared.service.GoService"))stop();
 }
 private static void resetLive(){live.reset();liveAboard=null;liveBasis=null;}
 static void preferenceChanged(){main.post(GoActivityTransmitter::evaluate);schedule();}
 static void stop(){main.post(()->{main.removeCallbacks(read);queued=false;serviceStopped=true;resetLive();aboard=false;note("go_service_stopped");evaluate();});}
 private static void note(String reason){
  if(reason.equals(previous))return;previous=reason;
  GoModelDiagnostics.trace("activity_onboard_state",reason);
  if(context==null)return;
  try{
   Class<?> trace=Class.forName("xyz.urro.activityspoof.Trace",true,context.getClassLoader());
   java.lang.reflect.Method write=trace.getDeclaredMethod("write",Context.class,String.class,String.class);write.setAccessible(true);
   write.invoke(null,context,"onboard_state",reason);
  }catch(ReflectiveOperationException|RuntimeException ignored){}
 }
 private static void evaluate(){
  if(context==null)return;
  boolean enabled=TransitHooks.activityFeature()&&context.getSharedPreferences("xyz.urro.transit.go.v1",0).getBoolean("activity_spoof",false);
  boolean desired=enabled&&aboard;if(desired==published)return;
  try{
   Class<?> transmitter=Class.forName("xyz.urro.activityspoof.Transmitter",true,context.getClassLoader());
   if(desired)transmitter.getMethod("set",Context.class,int.class,int.class).invoke(null,context,0,100);
   else transmitter.getMethod("clear",Context.class).invoke(null,context);
   published=desired;GoModelDiagnostics.trace("activity_transmitter","active="+desired+" source=native_trip_model");
  }catch(ReflectiveOperationException|RuntimeException e){GoModelDiagnostics.trace("activity_transmitter_error",e.getClass().getSimpleName());}
 }
}
