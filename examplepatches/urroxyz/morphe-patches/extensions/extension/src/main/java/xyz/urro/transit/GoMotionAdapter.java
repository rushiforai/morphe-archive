package xyz.urro.transit;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

/**
 * Event-driven Motion Cues automation. Each GO live update (the model Transit hands to its GO
 * notification builder) is classified; 45 continuous seconds aboard turns Motion Cues on through
 * BoardingDetector, and leaving the vehicle or ending GO releases it.
 *
 * Replaces the dev.6 poller, which read a native debug string that was never JSON on 6.3.5 and
 * stopped itself after 60 idle polls without ever restarting. Not yet verified on a live ride.
 */
public final class GoMotionAdapter {
 private static final String TRIP="go",LEG="aboard";
 private static GoMotionAdapter current, simulated;
 private boolean simulation;
 private static int sessions;
 private final Handler main=new Handler(Looper.getMainLooper());
 private final Context context;
 private final String session;
 private boolean aboard,enabled;
 private final GoDataContinuity continuity=new GoDataContinuity();
 private final Runnable missingTimeout=()->{if(current==this&&continuity.expired(now())){GoModelDiagnostics.trace("go_adapter","missing_data_expired");stop();}};
 private String lastShape;
 private final Runnable tick=this::evaluate;
 private final BoardingDetector detector=new BoardingDetector(new BoardingDetector.Control(){
  public boolean acquire(String owner){
   GoModelDiagnostics.trace("boarding_timer","completed_start_requested");
   if(simulation)GoSimulation.control(owner,true);else MotionController.get(context).desire(owner,true);
   return true;
  }
  public void release(String owner){if(simulation)GoSimulation.control(owner,false);else MotionController.get(context).desire(owner,false);}
 });
 private GoMotionAdapter(Context context,String session){this.context=context.getApplicationContext();this.session=session;}

 static boolean prefEnabled(Context c){
  return c!=null&&TransitHooks.motionFeature()&&c.getSharedPreferences("xyz.urro.transit.go.v1",0).getBoolean("automatic",true);
 }

 /** Null presentation data suspends activation until a replacement or bounded expiry. */
 public static void onLive(Context context,Object data){
  if(!TransitHooks.motionFeature()||context==null)return;
  if(GoSimulation.delivering){
   if(simulated==null){simulated=new GoMotionAdapter(context,"simulation:"+GoSimulation.state.generation);simulated.simulation=true;}
   simulated.update(GoStateExtractor.fromLive(data));return;
  }
  if(GoSimulation.state.active)return;
  Runnable apply=()->{
   GoStateExtractor.Snapshot s=GoStateExtractor.fromLive(data);
   if(!s.active){
    if(current!=null){GoMotionAdapter a=current;a.continuity.missing(a.now());a.main.removeCallbacks(a.tick);a.main.removeCallbacks(a.missingTimeout);a.main.postDelayed(a.missingTimeout,a.continuity.remaining(a.now()));GoModelDiagnostics.trace("go_adapter","presentation_missing_timer_suspended");}
    return;
   }
   if(current!=null){GoMotionAdapter a=current;a.main.removeCallbacks(a.missingTimeout);if(!a.continuity.resume(a.now()))stop();}
   if(current==null){
    current=new GoMotionAdapter(context,TRIP+":"+(++sessions));
    GoModelDiagnostics.trace("go_adapter","session_started");
   }
   current.update(s);
  };
  if(Looper.myLooper()==Looper.getMainLooper())apply.run();else new Handler(Looper.getMainLooper()).post(apply);
 }

 private long now(){return simulation?GoSimulation.clock():SystemClock.elapsedRealtime();}
 public static void simulationTick(){if(simulated!=null)simulated.evaluate();}
 public static String simulationStatus(){return simulated==null?"Timer inactive":simulated.detector.state()+" · remaining "+simulated.detector.remaining(simulated.now())+" ms";}
 public static void stopSimulation(){if(simulated!=null){simulated.main.removeCallbacks(simulated.tick);simulated.detector.close();simulated=null;}}
 private void update(GoStateExtractor.Snapshot s){
  aboard=s.active&&s.aboard;enabled=prefEnabled(context);
  if(!s.shape.equals(lastShape)){lastShape=s.shape;GoModelDiagnostics.trace("boarding_live","instruction="+s.shape+" aboard="+aboard+" enabled="+enabled);}
  evaluate();
 }

 private void evaluate(){
  main.removeCallbacks(tick);
  if(continuity.missing())return;
  GoModelDiagnostics.trace("boarding_evaluation","session="+session+" aboard="+aboard+" enabled="+enabled+" state="+detector.state()+" remaining_ms="+detector.remaining(now()));
  BoardingDetector.State before=detector.state();
  // The detector's "bus" gate is satisfied by any vehicle: GO only shows these instructions aboard.
  detector.update(now(),session,LEG,true,aboard,aboard,enabled);
  if(before!=detector.state())GoModelDiagnostics.trace("boarding_timer",before+" -> "+detector.state()+" enabled="+enabled);
  if(detector.state()==BoardingDetector.State.GO_BUS_PENDING_45S)
   main.postAtTime(tick,SystemClock.uptimeMillis()+Math.max(1,detector.remaining(now())));
 }

 /** Ends the GO session and releases any Motion Cues request this adapter owns. */
 public static void stop(){
  Runnable r=()->{GoMotionAdapter a=current;if(a==null)return;current=null;a.main.removeCallbacks(a.tick);a.main.removeCallbacks(a.missingTimeout);a.detector.close();GoModelDiagnostics.trace("go_adapter","session_ended");};
  if(Looper.myLooper()==Looper.getMainLooper())r.run();else new Handler(Looper.getMainLooper()).post(r);
 }

 public static void preferenceChanged(boolean value){
  new Handler(Looper.getMainLooper()).post(()->{if(simulated!=null){simulated.enabled=prefEnabled(simulated.context);simulated.evaluate();}GoMotionAdapter a=current;if(a==null)return;a.enabled=prefEnabled(a.context);if(!a.enabled)stop();else a.evaluate();});
 }
}
