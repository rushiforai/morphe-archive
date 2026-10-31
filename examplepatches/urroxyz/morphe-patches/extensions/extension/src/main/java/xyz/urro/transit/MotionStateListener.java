package xyz.urro.transit;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.os.Handler;
import android.content.Intent;
import android.os.SystemClock;
import android.app.usage.UsageEvents;
import android.app.usage.UsageStatsManager;
import android.os.Looper;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;
import java.util.concurrent.CopyOnWriteArrayList;
/** Does not read notification extras, titles, text, people, actions or media. */
public final class MotionStateListener extends NotificationListenerService {
 static final String TARGET="com.stormtech.motionsense";
 static final int UNKNOWN=-1, OFF=0, ON=1;
 static volatile MotionStateListener instance;
 static volatile int current=UNKNOWN;
 private static final CopyOnWriteArrayList<Runnable> observers=new CopyOnWriteArrayList<>();
 private static final Handler main=new Handler(Looper.getMainLooper());
 static boolean usageEnabled(Context c){
  android.app.AppOpsManager ops=c.getSystemService(android.app.AppOpsManager.class);
  return ops.unsafeCheckOpNoThrow(android.app.AppOpsManager.OPSTR_GET_USAGE_STATS,android.os.Process.myUid(),c.getPackageName())==android.app.AppOpsManager.MODE_ALLOWED;
 }
 static boolean enabled(Context c){return c.getSystemService(NotificationManager.class).isNotificationListenerAccessGranted(new ComponentName(c,MotionStateListener.class));}
 static void watch(Runnable r){observers.addIfAbsent(r);}
 static void unwatch(Runnable r){observers.remove(r);}
 static int state(){return current;}
 static void refresh(){MotionStateListener x=instance;if(x==null){publish(UNKNOWN);return;}x.scan();}
  static volatile Context appCtx; static volatile boolean pendingWanted; static volatile long pendingAt=-1; static volatile boolean pendingUnconfirmed, secondaryConfirmed;
 static long controllerToken=-1;
 static final long VERIFY_TIMEOUT_MS=20000;
 static final Runnable verifyTimeout=()->onVerifyTimeout();
 static volatile long pendingWall, usageFrom;
 static long observationGeneration;
 static ObservationFence fence;
 static String eventKey(UsageEvents.Event e){return e.getTimeStamp()+":"+e.getEventType()+":"+e.getClassName();}
 static java.util.HashSet<String> baselineEvents(Context c,long from,long end){
  java.util.HashSet<String> seen=new java.util.HashSet<>();
  UsageEvents events=c.getSystemService(UsageStatsManager.class).queryEvents(from,end);
  UsageEvents.Event e=new UsageEvents.Event();
  while(events.hasNextEvent()){events.getNextEvent(e);if(TARGET.equals(e.getPackageName())&&seen.size()<2048)seen.add(eventKey(e));}
  return seen;
 }
 static final Runnable usagePoll=()->pollUsage();
 static void expect(Context c,boolean wanted,long at,long token){controllerToken=token;pendingUnconfirmed=false;secondaryConfirmed=false;appCtx=c.getApplicationContext();pendingWanted=wanted;pendingAt=at;pendingWall=System.currentTimeMillis();usageFrom=pendingWall-5000;
  java.util.HashSet<String> baseline;
  try{baseline=baselineEvents(c,usageFrom,pendingWall+5000);}catch(RuntimeException error){baseline=null;GoModelDiagnostics.trace("motion_observer","baseline_unavailable_"+error.getClass().getSimpleName());}
  fence=baseline==null?null:new ObservationFence(++observationGeneration,at,VERIFY_TIMEOUT_MS,baseline);
  main.removeCallbacks(verifyTimeout);main.postDelayed(verifyTimeout,VERIFY_TIMEOUT_MS);main.removeCallbacks(usagePoll);main.postDelayed(usagePoll,100);}
 static int usageState(Context c){
  try{
   UsageStatsManager usm=(UsageStatsManager)c.getApplicationContext().getSystemService(Context.USAGE_STATS_SERVICE);
   long now=System.currentTimeMillis();
   UsageEvents ev=usm.queryEvents(now-86400000L,now);
   UsageEvents.Event e=new UsageEvents.Event();
   int last=UNKNOWN;
   while(ev.hasNextEvent()){ev.getNextEvent(e);if(!"com.stormtech.motionsense".equals(e.getPackageName()))continue;
    if(e.getEventType()==UsageEvents.Event.FOREGROUND_SERVICE_START)last=ON;else if(e.getEventType()==UsageEvents.Event.FOREGROUND_SERVICE_STOP)last=OFF;}
   return last;
  }catch(RuntimeException ex){return UNKNOWN;}
 }
 static String previousApp(Context c){
  try{
   UsageStatsManager usm=(UsageStatsManager)c.getApplicationContext().getSystemService(Context.USAGE_STATS_SERVICE);
   long now=System.currentTimeMillis();
   UsageEvents ev=usm.queryEvents(now-86400000L,now);
   UsageEvents.Event e=new UsageEvents.Event();
   String last=null;
   while(ev.hasNextEvent()){ev.getNextEvent(e);
    if(e.getEventType()!=UsageEvents.Event.MOVE_TO_FOREGROUND)continue;
    if(TARGET.equals(e.getPackageName())||"xyz.urro.transit.RelayActivity".equals(e.getClassName()))continue;
    last=e.getPackageName();}
   return last;
  }catch(RuntimeException ex){return null;}
 }
 static void pollUsage(){
  if(pendingAt<0||appCtx==null)return;
  try{
   UsageStatsManager usm=(UsageStatsManager)appCtx.getSystemService(Context.USAGE_STATS_SERVICE);
   long now=System.currentTimeMillis();
   UsageEvents ev=usm.queryEvents(usageFrom,now+5000);
   UsageEvents.Event e=new UsageEvents.Event();
   int want=pendingWanted?UsageEvents.Event.FOREGROUND_SERVICE_START:UsageEvents.Event.FOREGROUND_SERVICE_STOP;
   while(ev.hasNextEvent()){
    ev.getNextEvent(e);
    boolean transition=TARGET.equals(e.getPackageName())&&
      (e.getEventType()==UsageEvents.Event.FOREGROUND_SERVICE_START||e.getEventType()==UsageEvents.Event.FOREGROUND_SERVICE_STOP);
    boolean fresh=transition&&fence!=null&&fence.accept(observationGeneration,SystemClock.elapsedRealtime(),eventKey(e));
    if(fresh)MotionController.get(appCtx).freshServiceEvent(controllerToken,e.getEventType()==UsageEvents.Event.FOREGROUND_SERVICE_START,SystemClock.elapsedRealtime());
    if(fresh&&e.getEventType()==want){
     Events.add(appCtx,"Usage verify: "+(pendingWanted?"START":"STOP")+" service event "+(e.getTimeStamp()-pendingWall)+"ms after dispatch (usage-stats)");
     publish(pendingWanted?ON:OFF);for(Runnable observer:observers)main.post(observer);pendingAt=-1;main.removeCallbacks(verifyTimeout);main.removeCallbacks(usagePoll);return;
    }
   }
   long age=SystemClock.elapsedRealtime()-pendingAt;
   main.postDelayed(usagePoll,age<1000?100:age<5000?250:1000);
  }catch(RuntimeException ex){
   GoModelDiagnostics.trace("motion_observer","query_failed_"+ex.getClass().getSimpleName());
   Events.add(appCtx,"Usage verify error: "+ex.getClass().getSimpleName());
   // A transient query failure mustn't silently kill the bounded confirmation loop.
   if(pendingAt>=0&&SystemClock.elapsedRealtime()-pendingAt<VERIFY_TIMEOUT_MS)main.postDelayed(usagePoll,1000);
  }
 }
 static void onVerifyTimeout(){
  if(pendingAt<0||appCtx==null)return;
  Events.add(appCtx,"Async verify: "+(pendingWanted?"START":"STOP")+" UNCONFIRMED after "+VERIFY_TIMEOUT_MS+"ms of dispatch; not treated as failure; still monitoring");
  pendingUnconfirmed=true;pendingAt=-1;main.removeCallbacks(usagePoll);if(controllerToken>=0)MotionController.get(appCtx).uncertain(controllerToken,"service_confirmation_timeout");
 }
 static void confirmAsync(boolean value){
  if(appCtx==null)return;
  if(pendingUnconfirmed&&value==pendingWanted){Events.add(appCtx,"Late confirmation of unconfirmed "+(pendingWanted?"START":"STOP")+"; no retry needed");pendingUnconfirmed=false;return;}
  if(pendingAt<0)return;
  if(value==pendingWanted&&!secondaryConfirmed){secondaryConfirmed=true;Events.add(appCtx,"Secondary notification observed for "+(pendingWanted?"START":"STOP")+"; primary service-event verification continues");}
 }
 private static void publish(int value){if(value==current)return;current=value;if(value!=UNKNOWN)confirmAsync(value==ON);for(Runnable r:observers)main.post(r);}
 private boolean matches(StatusBarNotification n){
  // Filter package/id BEFORE accessing the Notification object; never inspect contents.
  return n!=null&&TARGET.equals(n.getPackageName())&&n.getId()==1&&n.getNotification()!=null&&"overlay_channel".equals(n.getNotification().getChannelId());
 }
 private void scan(){
  try{
   StatusBarNotification[] all=getActiveNotifications();
   if(all==null){publish(UNKNOWN);return;}
   boolean found=false;for(StatusBarNotification n:all){if(matches(n)){found=true;break;}}
   int value=found?ON:OFF;
   if(value!=current)Events.add(this,"Motion Cues running notification "+(found?"present":"absent"));
   publish(value);
  }catch(SecurityException|IllegalStateException e){publish(UNKNOWN);}
 }
 @Override public void onListenerConnected(){instance=this;Events.add(this,"State listener connected");scan();}
 @Override public void onListenerDisconnected(){if(instance==this){instance=null;publish(UNKNOWN);}Events.add(this,"State listener disconnected");}
 @Override public void onNotificationPosted(StatusBarNotification n){if(n!=null&&TARGET.equals(n.getPackageName())&&n.getId()==1)scan();}
 @Override public void onNotificationRemoved(StatusBarNotification n){if(n!=null&&TARGET.equals(n.getPackageName())&&n.getId()==1)scan();}
 @Override public void onDestroy(){if(instance==this){instance=null;publish(UNKNOWN);}super.onDestroy();}
}
