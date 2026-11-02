package nl.johninnl.mapsreplay;
import android.app.BroadcastOptions;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.util.UUID;
/** Controlled consumer replay only. This app is NOT Waze/Flitsmeister and never models their native exporters. */
public final class ReplayService extends Service {
 private final Handler main=new Handler(Looper.getMainLooper());
 private String scenario="zone",target="org.ungoogled.android.apps.maps",claimed;
 private final String session="controlled-"+UUID.randomUUID();
 private long sequence,until,started;
 private double speed=82,limit=90;
 @Override public IBinder onBind(Intent i){return null;}
 @Override public void onCreate(){super.onCreate();NotificationManager nm=getSystemService(NotificationManager.class);nm.createNotificationChannel(new NotificationChannel("replay","Controlled Maps consumer replay",NotificationManager.IMPORTANCE_LOW));startForeground(1,new Notification.Builder(this,"replay").setSmallIcon(android.R.drawable.ic_dialog_info).setContentTitle("Maps controlled replay test").setContentText("Synthetic local navigation observations").build());}
 @Override public int onStartCommand(Intent intent,int flags,int id){
  main.removeCallbacks(tick);scenario=intent.getStringExtra("scenario");if(scenario==null)scenario="zone";
  if("stop".equals(scenario)){stopSelf();return START_NOT_STICKY;}
  target=intent.getStringExtra("target");if(target==null)target="org.ungoogled.android.apps.maps";
  claimed=intent.getStringExtra("claimed_source");if(claimed==null)claimed=getPackageName();
  speed=intent.getDoubleExtra("speed_kmh",82);limit=intent.getDoubleExtra("limit_kmh",90);
  started=SystemClock.elapsedRealtime();until=started+Math.max(1000,Math.min(180000,intent.getLongExtra("duration_ms",30000)));main.post(tick);return START_NOT_STICKY;
 }
 private final Runnable tick=new Runnable(){public void run(){long now=SystemClock.elapsedRealtime();if(now>until){stopSelf();return;}publish(now);main.postDelayed(this,1000);}};
 private void publish(long now){
  if("legacy".equals(scenario)){
   Intent i=new Intent("org.ungoogled.waze.ALERTS").setPackage(target).putExtra("from",getPackageName()).putExtra("type",new int[]{1,10}).putExtra("lat",new int[]{38544900,38545900}).putExtra("lng",new int[]{-121753000,-121751000}).putExtra("id",new String[]{"replay-police","replay-camera"}).putExtra("title",new String[]{"Controlled police fixture","Controlled camera fixture"}).putExtra("description",new String[]{"Consumer replay test","Consumer replay test"}).putExtra("trigger",new int[]{500,600});sendBroadcast(i);Log.i("MAPS_REPLAY","legacy from="+getPackageName()+" target="+target);return;
  }
  long observed="stale".equals(scenario)?started:now;
  Intent i=new Intent("nl.johninnl.navigation.NAVIGATION_STATE").setPackage(target).putExtra("schema_version",1).putExtra("source_package",claimed).putExtra("publisher_session_id",session).putExtra("sequence",++sequence).putExtra("sent_elapsed_ms","future".equals(scenario)?now+60000:now);
  boolean clear="clear".equals(scenario),unknown="unknown".equals(scenario);
  i.putExtra("current_speed_status",clear?"disabled":unknown?"unknown":"valid").putExtra("current_speed_updated_elapsed_ms",observed).putExtra("current_speed_max_age_ms",5000L);
  i.putExtra("road_speed_limit_status",clear?"disabled":unknown?"unknown":"valid").putExtra("road_updated_elapsed_ms",observed).putExtra("road_max_age_ms",30000L);
  if(!clear&&!unknown){i.putExtra("current_speed_kmh","zero".equals(scenario)?0d:speed);i.putExtra("road_speed_limit_kmh",limit);}
  boolean zone="zone".equals(scenario),approach="approach".equals(scenario);
  i.putExtra("zone_status",zone?"active":"inactive").putExtra("zone_updated_elapsed_ms",observed).putExtra("zone_max_age_ms",90000L);
  if(zone)i.putExtra("zone_session",1L).putExtra("zone_segment_id","controlled-segment").putExtra("zone_remaining_m",1200).putExtra("zone_progress_percent",35d).putExtra("zone_progress_estimated",true).putExtra("zone_observation_start_elapsed_ms",now-4000).putExtra("zone_observed_distance_m",100).putExtra("zone_average_partial",true).putExtra("zone_average_method","observed_distance_over_elapsed_time").putExtra("zone_average_speed_kmh",90d);
  i.putExtra("zone_approach_status",approach?"ahead":"inactive").putExtra("zone_approach_updated_elapsed_ms",observed).putExtra("zone_approach_max_age_ms",30000L);
  if(approach)i.putExtra("zone_approach_id","controlled-entry").putExtra("zone_approach_distance_m",120).putExtra("zone_approach_distance_estimated",true);
  boolean reports=zone||approach||"alerts".equals(scenario)||"malformed".equals(scenario);
  i.putExtra("alerts_status","valid").putExtra("alerts_updated_elapsed_ms",observed).putExtra("alerts_max_age_ms",30000L);
  i.putExtra("alert_ids",reports?new String[]{"replay-police","replay-camera"}:new String[0]).putExtra("alert_kinds",reports?new String[]{"police","camera"}:new String[0]).putExtra("alert_titles",reports?new String[]{"Controlled police fixture","Controlled camera fixture"}:new String[0]).putExtra("alert_distance_m",reports?new int[]{250,500}:new int[0]).putExtra("alert_trigger_m",reports?new int[]{500,600}:new int[0]).putExtra("alert_latitude",reports?new double[]{38.5449,38.5459}:new double[0]).putExtra("alert_longitude",reports?new double[]{-121.753,-121.751}:new double[0]).putExtra("alert_updated_elapsed_ms",reports?new long[]{observed,observed}:new long[0]);
  if("malformed".equals(scenario))i.putExtra("alert_kinds",new String[]{"police"});
  Bundle options=BroadcastOptions.makeBasic().setShareIdentityEnabled(true).toBundle();sendBroadcast(i,null,options);
  Log.i("MAPS_REPLAY","controlled source="+getPackageName()+" uid="+android.os.Process.myUid()+" claimed="+claimed+" scenario="+scenario+" seq="+sequence+" target="+target);
 }
 @Override public void onDestroy(){main.removeCallbacks(tick);super.onDestroy();}
}
