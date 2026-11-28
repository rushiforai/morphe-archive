package com.waze.gw;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.SystemClock;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.util.*;
import java.util.concurrent.*;

/** OTA independent of cfg; one controller per attached common HLP session. */
final class HudOta {
 private static volatile HudOta current;
 private static volatile PendingBoot pendingBoot;
 private static final class PendingBoot {
  final HudOtaRelease release;PendingBoot(HudOtaRelease r){release=r;}
 }
 private final HlpProtocol.Session session;
 private final String sid=HudOtaTransfer.randomId();
 private final ScheduledExecutorService worker=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"hud-ota");t.setDaemon(true);return t;});
 private volatile String firmware="";
 private volatile boolean invalidProfile;
 private volatile HudOtaRelease.Profile profile;
 private volatile HudOtaDownload.Prepared prepared;
 private volatile HudOtaTransfer transfer;
 private volatile boolean cancelled,closed;
 private volatile long declarationGeneration;
 private volatile String status="OTA: waiting for a duplex dev profile";
 HudOta(HlpProtocol.Session session){this.session=session;}
 void attached(){if(!closed)current=this;}
 void declared(String raw) {
  if(closed||current!=this)return;
  firmware="";invalidProfile=false;
  try {
   Map<String,Object> dev=HudOtaJson.parse(raw);
   Object fw=dev.get("fw");
   if(fw instanceof String&&((String)fw).length()<=64&&!((String)fw).trim().isEmpty())firmware=(String)fw;
   Object rawProfile=dev.get("profile");
   if(rawProfile instanceof Map) {Object update=((Map<?,?>)rawProfile).get("update");invalidProfile=update instanceof Map&&((Map<?,?>)update).containsKey("ota");}
   else invalidProfile=rawProfile!=null;
   Map<String,Object> declared=HudOtaJson.object(rawProfile);
   if(firmware.isEmpty()) {Object value=declared.get("fw");if(value instanceof String&&((String)value).length()<=64&&!((String)value).trim().isEmpty())firmware=(String)value;}
   HudOtaRelease.Profile next=new HudOtaRelease.Profile(declared);invalidProfile=false;
   if(profile!=null&&profile.declaration.equals(next.declaration))return;
   invalidate();profile=next;current=this;status="OTA source: "+next.source+"\nCurrent: "+next.fw;
   PendingBoot pending=pendingBoot;
   if(pending!=null) {
    // Contract profile has fw but no numeric accepted version. Never substitute fw for that gate.
    status+="\nReconnected: "+next.fw+". Outcome unknown: numeric version is absent from v1 profile.";
   }
  }catch(IllegalArgumentException e){invalidate();profile=null;status="OTA unavailable: missing/invalid v1 profile";}
 }
 private void invalidate(){declarationGeneration++;cancelled=true;prepared=null;HudOtaTransfer old=transfer;if(old!=null)old.disconnected();}
 void disconnected(){closed=true;invalidate();firmware="";profile=null;if(current==this)current=null;worker.shutdownNow();}
 void ack(String raw){
  if(closed)return;
  try{Map<String,Object> a=HudOtaJson.parse(raw);worker.execute(()->{HudOtaTransfer t=transfer;if(t!=null){t.ack(a,SystemClock.elapsedRealtime());status=t.result;}});}catch(IllegalArgumentException|RejectedExecutionException ignored){}
 }
 // User-approved adjustable phone clock; not authenticated time. Session timers remain monotonic.
 private static long wallClockSeconds(){return System.currentTimeMillis()/1000L;}
 private long acceptedVersion(){return -1L;}
 private void discover(Activity activity,TextView label){
  if(closed||!session.otaReady()||profile==null){label.setText("OTA: connect a duplex OTA HUD first");return;}
  if(transfer!=null&&!transfer.terminal){label.setText("OTA transfer already active");return;}
  final HudOtaRelease.Profile pinned=profile;final long generation=declarationGeneration;cancelled=false;
  status=I18n.tr("hud_link.checking_for_updates");label.setText(status);
  worker.execute(()->{
   try{
    long now=wallClockSeconds();
    // v1 profile does not expose the HUD persistent accepted version; never invent a zero floor.
    long floor=acceptedVersion();if(floor<0)throw new IllegalArgumentException("Blocked: contract profile lacks numeric persistent accepted version/release_seq");
    HudOtaDownload.Prepared found=HudOtaDownload.discover(pinned,now,floor,()->cancelled||closed||declarationGeneration!=generation);
    if(cancelled||closed||declarationGeneration!=generation||!session.otaReady())return;
    prepared=found;
    activity.runOnUiThread(()->{
     if(activity.isFinishing()||closed||cancelled||generation!=declarationGeneration)return;
     HudOtaRelease r=found.release;
     String description="UNSIGNED: SHA-256 detects corruption, not publisher authenticity. A compromised source can replace metadata and image.\n\nCurrent firmware: "+pinned.fw
      +"\nSource: "+pinned.source+"\nManifest asset: "+found.manifestUrl+"\nManifest image URL: "+r.url+"\nResolved image: "+found.imageUrl
      +"\nTarget: "+pinned.board+" / "+pinned.variant+" / "+pinned.layout+"\nVersion: "+r.version+" ("+r.fw+")\nBytes: "+r.size+"\nSHA-256: "+r.sha256;
     new AlertDialog.Builder(activity).setTitle("Confirm unsigned HUD OTA").setMessage(description)
      .setNegativeButton("Cancel",(dialog,which)->{cancelled=true;prepared=null;label.setText("OTA cancelled");})
      .setOnCancelListener(dialog->{cancelled=true;prepared=null;})
      .setPositiveButton("Approve update",(dialog,which)->worker.execute(()->{
       if(closed||cancelled||generation!=declarationGeneration||prepared!=found||!session.otaReady())return;
       try {r.checkTime(wallClockSeconds());transfer=new HudOtaTransfer(r,found.image,sid,session::sendOta,SystemClock::elapsedRealtime);
        pendingBoot=new PendingBoot(r);transfer.start(SystemClock.elapsedRealtime());prepared=null;
        worker.scheduleWithFixedDelay(()->{HudOtaTransfer t=transfer;if(t==null||t.terminal)return;t.tick(SystemClock.elapsedRealtime());status=t.result;activity.runOnUiThread(()->{if(!activity.isFinishing())label.setText(status);});},100,100,TimeUnit.MILLISECONDS);
       }catch(IllegalArgumentException e){status=e.getMessage();activity.runOnUiThread(()->label.setText(status));}
      })).show();
    });
   }catch(Exception e){status=e.getMessage()==null?"OTA failed":e.getMessage();activity.runOnUiThread(()->{if(!activity.isFinishing()&&!closed&&current==this&&generation==declarationGeneration)label.setText(status.startsWith("Blocked: contract profile lacks numeric")?I18n.tr("hud_link.cant_update_yet_the_hud_hasnt"):I18n.tr("hud_link.couldnt_check_for_hud_updates"));});}
  });
 }
 static Runnable addUi(Activity activity,LinearLayout root,TextView check,TextView cancel){
  TextView firmware=new TextView(activity);firmware.setTextColor(0xFFE9EDF5);firmware.setTextSize(15);root.addView(firmware);
  root.addView(check);
  root.addView(cancel);
  TextView label=new TextView(activity);label.setTextColor(0xFF9AA3B5);label.setTextSize(13);root.addView(label);
  HudOta[] displayed={null};long[] generation={-1};boolean[] wasConnected={false},wasReady={false};
  Runnable refresh=()->{
   HudOta c=current;boolean connected=HudLinkService.isConnected();
   boolean ready=connected&&c!=null&&!c.closed&&c.session.otaReady();
   firmware.setText(I18n.f("hud_link.current_firmware_0", (connected&&c!=null&&!c.closed&&!c.firmware.isEmpty()?c.firmware:I18n.tr("hud_link.not_declared"))));
   firmware.setVisibility(connected&&c!=null&&!c.closed&&!c.firmware.isEmpty()?android.view.View.VISIBLE:android.view.View.GONE);
   boolean active=ready&&c.transfer!=null&&!c.transfer.terminal;
   check.setEnabled(ready&&c.profile!=null&&!active);check.setAlpha(check.isEnabled()?1f:0.45f);
   cancel.setVisibility(active?android.view.View.VISIBLE:android.view.View.GONE);
   cancel.setEnabled(active);
   if(displayed[0]!=c||!connected||generation[0]!=(c==null?-1:c.declarationGeneration)||wasConnected[0]!=connected||wasReady[0]!=ready||!ready){label.setText(!connected?I18n.tr("hud_link.connect_the_hud_to_check_for"):c!=null&&c.invalidProfile?I18n.tr("hud_link.the_huds_ota_declaration_is_invalid"):c==null||c.profile==null?I18n.tr("hud_link.the_hud_hasnt_declared_ota_update"):I18n.tr("hud_link.update_the_firmware_from_the_source"));displayed[0]=c;generation[0]=c==null?-1:c.declarationGeneration;wasConnected[0]=connected;wasReady[0]=ready;}
  };
  check.setOnClickListener(v->{HudOta c=current;if(c!=null&&!c.closed&&c.session.otaReady()&&c.profile!=null)c.discover(activity,label);refresh.run();});
  cancel.setOnClickListener(v->{HudOta c=current;if(c==null||c.closed||c.transfer==null||c.transfer.terminal)return;c.cancelled=true;c.prepared=null;c.worker.execute(()->{c.transfer.cancel();c.status=c.transfer.result;activity.runOnUiThread(()->{label.setText(I18n.tr("hud_link.hud_update_cancelled"));refresh.run();});});});
  refresh.run();return refresh;
 }
}
