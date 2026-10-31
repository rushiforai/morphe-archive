package xyz.urro.transit;

import android.content.Context;
import android.content.Intent;
import android.app.usage.UsageStatsManager;
import android.app.usage.UsageEvents;
import android.os.SystemClock;
import android.os.Looper;

/** Process-local conditional ownership, confined to Transit main looper. No exported control IPC. */
public final class MotionController {
 private static MotionController instance;
 private final Context context;
 private final MotionSession ledger=new MotionSession();
 private long launchGeneration=-1, lastServiceWall=-1, acknowledgedGeneration=-1;
 private final android.os.Handler main=new android.os.Handler(Looper.getMainLooper());
 private MotionSession.Action launched=MotionSession.Action.NONE;
 private MotionController(Context context){this.context=context.getApplicationContext();}
 public static MotionController get(Context c){
  if(Looper.myLooper()!=Looper.getMainLooper())throw new IllegalStateException("main looper required");
  if(instance==null)instance=new MotionController(c);return instance;
 }
 public void desire(String owner,boolean active){
  GoModelDiagnostics.trace("motion_request",active?"START":"STOP");
  if(!active&&!ledger.matchesOwner(owner)){GoModelDiagnostics.trace("motion_gate","stale_owner_stop "+ledger.diagnostic());return;} // stale trip cleanup cannot cancel a new owner
  observeLatest();
  long token=ledger.desire(owner,active);
  MotionSession.Action action=ledger.next(token);
  GoModelDiagnostics.trace("motion_decision",ledger.decision(token)+" "+ledger.diagnostic());
  if(action==MotionSession.Action.NONE){GoModelDiagnostics.trace("motion_gate",ledger.decision(token)+" "+ledger.diagnostic());return;}
  if(launchGeneration==token&&launched==action){GoModelDiagnostics.trace("motion_gate","relay_already_requested "+ledger.diagnostic());return;}
  if(!android.provider.Settings.canDrawOverlays(context)||!MotionStateListener.usageEnabled(context)){
   GoModelDiagnostics.trace("motion_gate","missing_special_access");
   Events.add(context,"Automatic control unavailable: special access missing; GO remains operational");return;
  }
  launchGeneration=token;launched=action;
  Intent i=new Intent(context,RelayActivity.class).putExtra("automatic",true).putExtra("generation",token)
   .putExtra("command",action==MotionSession.Action.START?"START_OVERLAY":"STOP_OVERLAY")
   .putExtra("return",true).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  try{GoModelDiagnostics.trace("motion_relay","launch_requested");context.startActivity(i);
   main.postDelayed(()->{if(ledger.isCurrent(token)&&acknowledgedGeneration!=token){uncertain(token,"relay_receipt_timeout");Events.add(context,"Relay launch UNRESOLVED: no ordinary activity callback within 20s");}},20000);
  }catch(RuntimeException ex){uncertain(token,"activity_launch_failed_"+ex.getClass().getSimpleName());Events.add(context,"Automatic activity launch failed: "+ex.getClass().getSimpleName());}
 }
 public void acknowledge(long token){GoModelDiagnostics.trace("motion_relay_receipt","current="+ledger.isCurrent(token)+" "+ledger.diagnostic());if(ledger.isCurrent(token))acknowledgedGeneration=token;}
 public boolean permitted(long token,boolean start){
  return ledger.isCurrent(token)&&ledger.next(token)==(start?MotionSession.Action.START:MotionSession.Action.STOP);
 }
 public boolean dispatched(long token,boolean start){
  boolean accepted=ledger.dispatched(token,start?MotionSession.Action.START:MotionSession.Action.STOP,SystemClock.elapsedRealtime());
  GoModelDiagnostics.trace("motion_dispatch",(start?"START":"STOP")+" ledger_accepted="+accepted+" "+ledger.diagnostic());
  return accepted;
 }
 public void uncertain(long token,String reason){GoModelDiagnostics.trace("motion_uncertain",reason+" current="+ledger.isCurrent(token)+" "+ledger.diagnostic());ledger.uncertain(token);}
 public void freshServiceEvent(long token,boolean on,long observedElapsed){
  if(!ledger.isCurrent(token)){GoModelDiagnostics.trace("motion_gate","stale_confirmation "+ledger.diagnostic());return;}
  GoModelDiagnostics.trace("motion_confirmation",on?"service_on_overlay_unverified":"service_off_overlay_unverified");
  // Newly observed after a pre-dispatch cursor fence: conditional attribution, not an owner token.
  ledger.observe(on?MotionSession.State.ON:MotionSession.State.OFF,observedElapsed);
  GoModelDiagnostics.trace("motion_ownership","owned="+ledger.ownsActivation()+" observed="+ledger.observed());
 }
 public void serviceEvent(boolean on,long wallTime){
  if(wallTime<=lastServiceWall)return;
  long age=System.currentTimeMillis()-wallTime;
  if(age<0||age>SystemClock.elapsedRealtime())return; // boot boundary or clock discontinuity: can't attribute
  GoModelDiagnostics.trace("motion_service_observation","on="+on+" age_ms="+age+" timestamp_ms="+wallTime);
  lastServiceWall=wallTime;
  ledger.observe(on?MotionSession.State.ON:MotionSession.State.OFF,SystemClock.elapsedRealtime()-age);
  GoModelDiagnostics.trace("motion_ownership","owned="+ledger.ownsActivation()+" observed="+ledger.observed());
 }
 private void observeLatest(){
  if(!MotionStateListener.usageEnabled(context))return;
  try{
   long now=System.currentTimeMillis();UsageEvents events=context.getSystemService(UsageStatsManager.class).queryEvents(now-86400000L,now);
   UsageEvents.Event e=new UsageEvents.Event();long timestamp=-1;boolean on=false;
   while(events.hasNextEvent()){events.getNextEvent(e);
    if(!"com.stormtech.motionsense".equals(e.getPackageName()))continue;
    if(e.getEventType()==UsageEvents.Event.FOREGROUND_SERVICE_START||e.getEventType()==UsageEvents.Event.FOREGROUND_SERVICE_STOP){
     timestamp=e.getTimeStamp();on=e.getEventType()==UsageEvents.Event.FOREGROUND_SERVICE_START;
    }
   }
   if(timestamp>=0)serviceEvent(on,timestamp);
  }catch(RuntimeException e){uncertain(ledger.generation(),"usage_query_failed_"+e.getClass().getSimpleName());}
 }
}
