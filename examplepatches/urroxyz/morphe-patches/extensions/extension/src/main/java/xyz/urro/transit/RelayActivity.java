package xyz.urro.transit;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.service.notification.NotificationListenerService;
public final class RelayActivity extends Activity {
 static final long MAX_WAIT_MS=20000;
 final Handler handler=new Handler(Looper.getMainLooper());
 final Runnable changed=()->checkState();
 final Runnable expire=()->checkState();
 String prevPkg; boolean launchedPrev; android.app.ActivityManager.AppTask previousOwnTask;
 boolean begun,warming,loaded,issued,done,wanted,back;
 long flowStarted,issuedAt; long generation; boolean automatic; long commandToken;
 static long latestGeneration;
 StateWaiter waiter;
 @Override public void onCreate(Bundle b){
  super.onCreate(b);
  generation=++latestGeneration;
  automatic=getIntent().getBooleanExtra("automatic",false);commandToken=getIntent().getLongExtra("generation",-1);
  if(b!=null){warming=b.getBoolean("warming");loaded=b.getBoolean("loaded");issued=b.getBoolean("issued");issuedAt=b.getLong("issuedAt");flowStarted=b.getLong("flowStarted");}
 }
 @Override public void onSaveInstanceState(Bundle b){
  b.putBoolean("warming",warming);b.putBoolean("loaded",loaded);b.putBoolean("issued",issued);b.putLong("issuedAt",issuedAt);b.putLong("flowStarted",flowStarted);super.onSaveInstanceState(b);
 }
 @Override public void onPostResume(){
  super.onPostResume();if(begun)return;begun=true;Events.add(this,"Relay resumed; command="+getIntent().getStringExtra("command")+"; "+"controller"+"; "+"screen state not logged"+"; overlay="+android.provider.Settings.canDrawOverlays(this));
  prevPkg=MotionStateListener.previousApp(this);
  if(getPackageName().equals(prevPkg))try{
   for(android.app.ActivityManager.AppTask task:getSystemService(android.app.ActivityManager.class).getAppTasks()){
    android.app.ActivityManager.RecentTaskInfo info=task.getTaskInfo();
    if(info.topActivity!=null&&!info.topActivity.getClassName().equals(RelayActivity.class.getName())){previousOwnTask=task;break;}
   }
  }catch(RuntimeException ignored){}
  if(automatic)MotionController.get(this).acknowledge(commandToken);
  String command=getIntent().getStringExtra("command");
  if(!"START_OVERLAY".equals(command)&&!"STOP_OVERLAY".equals(command)){finish();return;}
  wanted="START_OVERLAY".equals(command);
  if(automatic&&!MotionController.get(this).permitted(commandToken,wanted)){finish();return;}
  back=getIntent().getBooleanExtra("return",true);
  if(!back){launch(command,true);finish();return;}
  if(!MotionStateListener.usageEnabled(this)&&!MotionStateListener.enabled(this)){
   if(issued||warming){timeout("Notification access unavailable; leaving Motion Cues open");return;}
   Events.add(this,"No command sent: Usage Access or notification access required for confirmation");done=true;
   // No forced settings launch on permission failure; GO must remain operational.
   finishAndRemoveTask();return;
  }
  if(flowStarted==0)flowStarted=SystemClock.elapsedRealtime();
  waiter=new StateWaiter(wanted,flowStarted,MAX_WAIT_MS);
  MotionStateListener.watch(changed);
  handler.postDelayed(expire,Math.max(0,MAX_WAIT_MS-(SystemClock.elapsedRealtime()-flowStarted)));
  if(MotionStateListener.instance==null)NotificationListenerService.requestRebind(new ComponentName(this,MotionStateListener.class));
  MotionStateListener.refresh();checkState();
 }
 void checkState(){
  Events.add(this,"DBG checkState done="+done+" waiterNull="+(waiter==null)+" warming="+warming+" loaded="+loaded+" issued="+issued);
  if(done||waiter==null)return;
  if(generation!=latestGeneration){done=true;cleanup();finish();return;}
  int state=MotionStateListener.usageState(this);
  if(state==MotionStateListener.UNKNOWN)state=MotionStateListener.state();
  StateWaiter.Result result=waiter.observe(state!=MotionStateListener.UNKNOWN,state==MotionStateListener.ON,SystemClock.elapsedRealtime());
  if(result==StateWaiter.Result.CONFIRMED){
   long elapsed=SystemClock.elapsedRealtime()-flowStarted;
   confirmed((issued?"Requested service/notification state observed (overlay not verified)":"Already in requested notification state; no command needed")+"; total "+elapsed+"ms"+(issued?", command-to-state "+(SystemClock.elapsedRealtime()-issuedAt)+"ms":""));return;
  }
  if(result==StateWaiter.Result.TIMED_OUT){timeout("State not confirmed within 20s; leaving Motion Cues open if launched");return;}
  if(state==MotionStateListener.UNKNOWN)return;
  if(!warming&&!issued){
   warming=true;Events.add(this,"Phase 1: open Motion Cues without START/STOP; await lifecycle handoff");
   launch(Intent.ACTION_MAIN,true);
  }else if(loaded&&!issued){issueCommand();}
 }
 @Override public void onStop(){
  super.onStop();
  Events.add(this,"DBG onStop begun="+begun+" warming="+warming+" issued="+issued+" done="+done);
  if(begun&&warming&&!issued&&!done){
   loaded=true;
   Events.add(this,"Relay covered: Motion Cues screen handoff observed; internal readiness not directly exposed");
   handler.post(changed);
  }
 }
 void issueCommand(){
  if(done||issued||!loaded)return;
  if(automatic&&!MotionController.get(this).permitted(commandToken,wanted)){done=true;cleanup();finish();return;}
  if(generation!=latestGeneration){done=true;cleanup();finish();return;}
  // This event follows the new opaque activity's lifecycle handoff, not an assumed startup delay.
  if(automatic&&!MotionController.get(this).dispatched(commandToken,wanted)){done=true;cleanup();finish();return;}
  issued=true;issuedAt=SystemClock.elapsedRealtime();
  Events.add(this,"Phase 2: send "+(wanted?"START":"STOP")+" to loaded activity, then verify service state asynchronously");
  // Install the observation fence BEFORE dispatch so fast service transitions cannot be missed.
  MotionStateListener.expect(this,wanted,SystemClock.elapsedRealtime(),automatic?commandToken:-1);
  launch(wanted?"START_OVERLAY":"STOP_OVERLAY",true);
  handler.post(changed);
  // Fast-return budget, not a startup sleep: a service event returns earlier.
  // If events are inconclusive, return UNCONFIRMED and keep bounded passive verification.
  handler.postDelayed(dispatched,600);
 }
 final Runnable dispatched=()->returnAfterDispatch();
 void returnAfterDispatch(){
  if(done)return;done=true;cleanup();
  if(generation!=latestGeneration){finish();return;}
  Events.add(this,"Command dispatched ("+(wanted?"START":"STOP")+"); returning now; eventual confirmation is async; elapsed "+(SystemClock.elapsedRealtime()-flowStarted)+"ms");
  String latest=MotionStateListener.previousApp(this);
  if(latest!=null&&!latest.equals(prevPkg)&&!latest.equals(getPackageName())){Events.add(this,"Foreground changed independently; not stealing it back");finish();return;}
  if(previousOwnTask!=null)try{previousOwnTask.moveToFront();launchedPrev=true;Events.add(this,"Restored existing Transit task");}catch(RuntimeException error){Events.add(this,"Existing-task restoration unavailable");}
  if(!launchedPrev&&prevPkg!=null){Intent li=getPackageManager().getLaunchIntentForPackage(prevPkg);if(li!=null){li.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);try{startActivity(li);launchedPrev=true;Events.add(this,"Returned to previous app: "+prevPkg);}catch(RuntimeException e){Events.add(this,"Previous-app return failed");}}}
  if(launchedPrev)finish();else finishAndRemoveTask();overridePendingTransition(0,0);
 }
 void launch(String action,boolean separate){
  String actual=Intent.ACTION_MAIN.equals(action)?action:"com.stormtech.motionsense.action."+action;
  Intent target=new Intent(actual).setComponent(new ComponentName("com.stormtech.motionsense","com.stormtech.motionsense.MainActivity"));
  if(Intent.ACTION_MAIN.equals(action))target.addCategory(Intent.CATEGORY_LAUNCHER);
  // Same disposable task; reuse its loaded Motion Cues activity for the second phase.
  target.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP|Intent.FLAG_ACTIVITY_NO_ANIMATION);
  if(!Intent.ACTION_MAIN.equals(action))target.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
  if(separate)target.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
  try{startActivity(target);if(!Intent.ACTION_MAIN.equals(action))GoModelDiagnostics.trace("motion_command_sent",(wanted?"START":"STOP")+" generation="+commandToken+" overlay_unverified");overridePendingTransition(0,0);}
  catch(RuntimeException e){timeout("Activity launch failed: "+e.getClass().getSimpleName());}
 }
 void cleanup(){MotionStateListener.unwatch(changed);handler.removeCallbacks(expire);handler.removeCallbacks(changed);handler.removeCallbacks(dispatched);}
 void confirmed(String message){if(done)return;Events.add(this,message);
  if(!issued&&automatic)MotionController.get(this).uncertain(commandToken,"external_state_changed_before_dispatch");
  if(issued){returnAfterDispatch();return;}
  done=true;cleanup();finish();overridePendingTransition(0,0);
 }
 void timeout(String message){if(done)return;done=true;cleanup();if(automatic)MotionController.get(this).uncertain(commandToken,"relay_timeout");Events.add(this,message);finish();}
 @Override public void onDestroy(){if(automatic&&!done&&!isChangingConfigurations())MotionController.get(this).uncertain(commandToken,"relay_destroyed_before_completion");Events.add(this,"DBG onDestroy done="+done+" issued="+issued+" warming="+warming+" loaded="+loaded+" finishing="+isFinishing());cleanup();super.onDestroy();}
}
