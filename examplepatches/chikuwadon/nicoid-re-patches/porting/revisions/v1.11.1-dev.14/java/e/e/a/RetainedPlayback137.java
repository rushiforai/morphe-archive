package e.e.a;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * A single ORIGINAL VideoView owns playback through an external app switch.
 * Unlike PlaybackTransfer221 this never creates an HLS player or seeks.
 * NicoidPopupViewService is a notification/process keeper, not a decoder.
 */
public final class RetainedPlayback137 {
 private static final String TAG="nicoid-retained";
 private static final String EXTRA="nicoid_retained_player_137";
 private static final String CHANNEL="nicoid_retained_audio";
 private static final int NOTIFICATION=13724;
 private static final Handler MAIN=new Handler(Looper.getMainLooper());
 private static Session current;
 private static long serial;

 private static final class Session {
  final long token;
  final Activity source;
  final Object fragment,player;
  final String id;
  final int taskId;
  final long initialPosition;
  boolean committed,closing,foreground,returnSettling;
  Service service;
  MediaSession media;
  Dev139.Retention retainedSurface;
  Session(Activity a,Object fragment,Object player,String id) {
   token=++serial;source=a;this.fragment=fragment;this.player=player;this.id=id;
   taskId=a.getTaskId();initialPosition=position(player);
  }
 }
 private RetainedPlayback137(){}
 private static Object get(Object o,String name)throws Exception {
  for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try {
   Field f=c.getDeclaredField(name);f.setAccessible(true);return f.get(o);
  }catch(NoSuchFieldException ignored){}
  throw new NoSuchFieldException(name);
 }
 private static Object call(Object o,String method)throws Exception {
  return o.getClass().getMethod(method).invoke(o);
 }
 private static boolean playing(Object p){
  try{return Boolean.TRUE.equals(call(p,"isPlaying"));}catch(Exception e){return false;}
 }
 private static long position(Object p){
  try{return ((Number)call(p,"getCurrentPosition")).longValue();}
  catch(Exception e){return -1;}
 }
 private static boolean usable(Session s) {
  return s!=null&&!s.closing&&current==s&&!s.source.isDestroyed()&&!s.source.isFinishing();
 }
 private static boolean enabled(Activity a) {
  SharedPreferences p=PreferenceManager.getDefaultSharedPreferences(a);
  return "background".equals(p.getString("app_switch_playback","none"));
 }
 private static boolean returnNormal(Activity a) {
  return "normal".equals(PreferenceManager.getDefaultSharedPreferences(a)
    .getString("nicoid_app_resume_playback","background"));
 }
 private static void log(Session s,String message){
  Log.i(TAG,message+" token="+s.token+" video="+s.id
     +" currentPosition="+position(s.player)+" initialPosition="+s.initialPosition
     +" isPlaying="+playing(s.player)+" task="+s.taskId);
 }
 /** Capture while Activity is foreground; start the FGS before onStop. */
 public static synchronized Runnable capture(Activity a) {
  if(a==null||a.isDestroyed()||a.isFinishing()||!enabled(a))return null;
  if(!"com.sauzask.nicoid.NicoidVideoActivity".equals(a.getClass().getName()))return null;
  try {
   Object f=get(a,"v"),p=f==null?null:get(f,"a0");
   if(p==null||!playing(p)||((Number)call(p,"getDuration")).longValue()<=0)return null;
   String id=String.valueOf(get(f,"b0"));
   if(!id.matches("(?:sm|nm|so|ss)?[0-9]+"))return null;
   if(usable(current))return current.source==a?()->{}:null;
   Session s=new Session(a,f,p,id);current=s;
   try {p.getClass().getMethod("setReleaseOnDetachFromWindow",boolean.class).invoke(p,false);}
   catch(Exception ignored){}
   Intent keeper=new Intent().setClassName(a,"com.sauzask.nicoid.NicoidPopupViewService")
       .putExtra(EXTRA,"begin").putExtra("nicoid_retained_token_137",s.token);
   try {
    if(Build.VERSION.SDK_INT>=26)a.startForegroundService(keeper);
    else a.startService(keeper);
   }catch(RuntimeException e){
    current=null;Log.w(TAG,"Cannot start foreground keeper; no player transfer",e);return null;
   }
   s.retainedSurface=Dev139.hold(p);
   log(s,"Original VideoView retained; no player transfer or seek");
   return ()->{
    synchronized(RetainedPlayback137.class){if(!usable(s))return;s.committed=true;}
    log(s,"External switch confirmed; same player continues");
   };
  }catch(Exception e){Log.w(TAG,"Original player retention unavailable",e);return null;}
 }
 /** Skip native PlaybackLifecycle219.retain() pause for our VideoView. */
 public static synchronized boolean retains(Object fragment){
  Session s=current;return usable(s)&&fragment==s.fragment;
 }
 public static synchronized void left(){if(current==null)Dev111.left();}
 public static synchronized void started(Activity a){}
 public static synchronized void stopped(Activity a){
  Session s=current;
  if(usable(s)&&s.source==a) {
   s.returnSettling=false; // Cancel pending foreground cleanup if leaving again.
   log(s,"Original player Activity stopped");
  }
 }
 public static synchronized void destroyed(Activity a){
  Session s=current;if(s!=null&&s.source==a)finish(s,false);
 }
 /** Reorder the ORIGINAL task/player rather than reopening a watch URL. */
 public static void resumed(Activity a) {
  Session s;
  synchronized(RetainedPlayback137.class){s=current;}
  if(s==null){Dev111.singleReturnOwner(a);Dev111.resumed(a);return;}
  Dev111.suppressAutoReturn();
  if(!usable(s)){finish(s,false);return;}
  if(a==s.source) {
   if(s.retainedSurface!=null)s.retainedSurface.restore();
   log(s,"Normal player Activity resumed; keep keeper until focused/audio stable");
   if(!s.returnSettling) {
    s.returnSettling=true;
    settleNormalReturn(s,position(s.player),0);
   }
   return;
  }
  if(!s.committed){finish(s,false);return;}
  if(!returnNormal(s.source))return;
  MAIN.postDelayed(()->{
   if(!usable(s)||!s.committed||!returnNormal(s.source))return;
   try {
    ActivityManager am=(ActivityManager)a.getSystemService(Context.ACTIVITY_SERVICE);
    if(am!=null)for(ActivityManager.AppTask task:am.getAppTasks()) {
     if(task.getTaskInfo().id==s.taskId){task.moveToFront();break;}
    }
    if(s.source!=a&&!s.source.isDestroyed()) {
     Intent toExisting=new Intent(a,s.source.getClass())
       .addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT|Intent.FLAG_ACTIVITY_NO_ANIMATION);
     a.startActivity(toExisting);
     a.overridePendingTransition(0,0);
    }
    log(s,"Existing player Activity reordered; no HLS reload");
   }catch(Exception e){Log.w(TAG,"Existing player Activity unavailable",e);}
  },90);
 }
 /**
  * Keep the decoder and MediaSession through the initial Surface reattachment.
  * Retire the notification keeper only after the original Activity has focus
  * and the original playback clock is advancing. Never pause, seek or release
  * the player's decoder during return.
  */
 private static void settleNormalReturn(final Session s,final long initial,final int attempt) {
  MAIN.postDelayed(()->{
   if(!usable(s)||!s.returnSettling)return;
   boolean focused=false;
   try{
    android.view.View decor=s.source.getWindow().getDecorView();
    focused=s.source.hasWindowFocus()&&decor!=null&&decor.getWindowToken()!=null&&decor.isShown();
   }catch(Exception ignored){}
   long now=position(s.player);
   boolean stable=focused&&(!playing(s.player)||initial>=0&&now>=initial+120);
   if(stable){
    s.returnSettling=false;
    log(s,"Original screen focused and playback advancing; retiring notification keeper");
    finish(s,false);
   }else if(attempt<30){
    settleNormalReturn(s,initial,attempt+1);
   }else{
    s.returnSettling=false;
    log(s,"Normal screen not yet stable; preserving keeper and decoder");
   }
  },70L);
 }
 private static String nonempty(String str,String fallback){
  return str==null||str.trim().isEmpty()||"null".equals(str)?fallback:str;
 }
 private static final class VideoMetadata {
  final String title,artist;
  VideoMetadata(String title,String artist){this.title=title;this.artist=artist;}
 }
 private static Object legacy(String className,String name,Class<?>[] types,Object... values)throws Exception {
  Class<?> c=Class.forName("e.e.a."+className);
  Method m=c.getDeclaredMethod(name,types);
  m.setAccessible(true);
  return m.invoke(null,values);
 }
 private static VideoMetadata syncMetadata(Session s){
  String title=s.id,artist="";
  Bundle info=null;
  try{info=(Bundle)legacy("FeedbackMedia","bundle",new Class<?>[]{Object.class},s.fragment);}
  catch(Exception e){Log.w(TAG,"No video metadata bundle",e);}
  if(info!=null){
   try{title=nonempty((String)legacy("FeedbackFixes","bundleTitle",new Class<?>[]{Bundle.class},info),title);}catch(Exception ignored){}
   artist=nonempty(info.getString("author"),nonempty(info.getString("uploaderName"),""));
  }
  try{
   Object media=legacy("PlaybackBar221","media",new Class<?>[0]);
   if(media!=null&&get(media,"owner")==s.fragment)
    title=nonempty(String.valueOf(get(media,"title")),title);
  }catch(Exception ignored){}
  if(s.media!=null)try{
   MediaMetadata.Builder builder=new MediaMetadata.Builder()
    .putString(MediaMetadata.METADATA_KEY_MEDIA_ID,s.id)
    .putString(MediaMetadata.METADATA_KEY_TITLE,title)
    .putString(MediaMetadata.METADATA_KEY_DISPLAY_TITLE,title)
    .putString(MediaMetadata.METADATA_KEY_ARTIST,artist)
    .putString(MediaMetadata.METADATA_KEY_DISPLAY_SUBTITLE,artist);
   long duration=((Number)call(s.player,"getDuration")).longValue();
   if(duration>0)builder.putLong(MediaMetadata.METADATA_KEY_DURATION,duration);
   MediaMetadata base=builder.build();
   s.media.setMetadata(base);
   // Reuse the existing Nicoid artwork cache and asynchronous thumbnail loader.
   legacy("FeedbackMedia","apply",new Class<?>[]{MediaSession.class,MediaMetadata.class,Object.class},s.media,base,s.fragment);
  }catch(Exception e){Log.w(TAG,"Metadata publish failed",e);}
  return new VideoMetadata(title,artist);
 }
 /** Existing Service must bypass its native decoder initialization. */
 public static boolean serviceStart(Service service,Intent intent) {
  if(intent==null||!intent.hasExtra(EXTRA))return false;
  String operation=intent.getStringExtra(EXTRA);
  Session s;
  synchronized(RetainedPlayback137.class){s=current;}
  if(!usable(s)||intent.getLongExtra("nicoid_retained_token_137",-1)!=s.token){
   service.stopSelf();return true;
  }
  s.service=service;
  try {
   if("stop".equals(operation)){
    try{s.player.getClass().getMethod("pause").invoke(s.player);}catch(Exception ignored){}
    finish(s,true);return true;
   }
   if("pause".equals(operation)||"resume".equals(operation)) {
    s.player.getClass().getMethod("pause".equals(operation)?"pause":"start").invoke(s.player);
   }
   if("show".equals(operation)){
    ActivityManager am=(ActivityManager)service.getSystemService(Context.ACTIVITY_SERVICE);
    if(am!=null)for(ActivityManager.AppTask task:am.getAppTasks())
     if(task.getTaskInfo().id==s.taskId){task.moveToFront();break;}
   }
   notifyPlayback(service,s);return true;
  }catch(Exception e){
   Log.w(TAG,"Notification keeper failed; do not replace decoder",e);
   finish(s,false);return true;
  }
 }
 public static synchronized void serviceDestroyed(Service service){
  Session s=current;
  if(s!=null&&s.service==service){
   s.service=null;
   if(s.media!=null){s.media.setActive(false);s.media.release();s.media=null;}
   Log.i(TAG,"Keeper destroyed; no decoder released");
  }
 }
 private static PendingIntent action(Service service,Session s,String name,int request){
  Intent i=new Intent().setClassName(service,"com.sauzask.nicoid.NicoidPopupViewService")
     .putExtra(EXTRA,name).putExtra("nicoid_retained_token_137",s.token);
  return PendingIntent.getService(service,request,i,
     PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
 }
 private static void send(Session s,String operation){
  Service service=s.service;if(service==null)return;
  Intent i=new Intent().setClassName(service,"com.sauzask.nicoid.NicoidPopupViewService")
     .putExtra(EXTRA,operation).putExtra("nicoid_retained_token_137",s.token);
  service.startService(i);
 }
 private static void notifyPlayback(Service service,Session s){
  NotificationManager nm=(NotificationManager)service.getSystemService(Context.NOTIFICATION_SERVICE);
  if(nm==null)throw new IllegalStateException("No notification manager");
  if(Build.VERSION.SDK_INT>=26){
   NotificationChannel ch=new NotificationChannel(CHANNEL,"nicoid Re playback",NotificationManager.IMPORTANCE_LOW);
   ch.setSound(null,null);nm.createNotificationChannel(ch);
  }
  if(s.media==null){
   s.media=new MediaSession(service,"nicoid-retained-137");
   final Session target=s;
   s.media.setCallback(new MediaSession.Callback(){
    @Override public void onPlay(){send(target,"resume");}
    @Override public void onPause(){send(target,"pause");}
    @Override public void onStop(){send(target,"stop");}
   });
   s.media.setActive(true);
  }
  VideoMetadata info=syncMetadata(s);
  boolean running=playing(s.player);
  s.media.setPlaybackState(new PlaybackState.Builder()
    .setActions(PlaybackState.ACTION_PLAY|PlaybackState.ACTION_PAUSE|PlaybackState.ACTION_STOP)
    .setState(running?PlaybackState.STATE_PLAYING:PlaybackState.STATE_PAUSED,
       Math.max(0,position(s.player)),running?1f:0f,SystemClock.elapsedRealtime()).build());
  Notification.Builder n=Build.VERSION.SDK_INT>=26?
     new Notification.Builder(service,CHANNEL):new Notification.Builder(service);
  n.setContentTitle(info.title).setContentText(info.artist)
   .setSmallIcon(android.R.drawable.ic_media_play).setOnlyAlertOnce(true).setOngoing(true)
   .setContentIntent(action(service,s,"show",4))
   .addAction(new Notification.Action.Builder(running?android.R.drawable.ic_media_pause:
       android.R.drawable.ic_media_play,running?"Pause":"Play",
       action(service,s,running?"pause":"resume",2)).build())
   .addAction(new Notification.Action.Builder(android.R.drawable.ic_menu_close_clear_cancel,
       "Stop",action(service,s,"stop",3)).build())
   .setStyle(new Notification.MediaStyle().setMediaSession(s.media.getSessionToken())
       .setShowActionsInCompactView(0,1));
  if(!s.foreground){service.startForeground(NOTIFICATION,n.build());s.foreground=true;}
  else nm.notify(NOTIFICATION,n.build());
  log(s,"Notification metadata title="+info.title+" artist="+info.artist+" (original decoder)");
 }
 private static synchronized void finish(Session s,boolean stop) {
  if(s==null||s.closing)return;
  s.closing=true;if(current==s)current=null;
  if(s.retainedSurface!=null){s.retainedSurface.close();s.retainedSurface=null;}
  if(s.media!=null){s.media.setActive(false);s.media.release();s.media=null;}
  Service keeper=s.service;s.service=null;
  if(keeper!=null){keeper.stopForeground(true);keeper.stopSelf();}
  if(stop&&!s.source.isFinishing()&&!s.source.isDestroyed())s.source.finish();
  log(s,stop?"Notification stopped playback":"Normal video resumed; keeper removed");
  Dev111.suppressAutoReturn();
 }
}
