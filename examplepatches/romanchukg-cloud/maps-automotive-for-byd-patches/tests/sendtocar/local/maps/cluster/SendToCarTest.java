// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;
import android.app.Activity;import android.content.pm.PackageManager;import android.os.*;import java.util.concurrent.TimeUnit;
/** Host checks for 55E: ChimeIdentity package substitution and SendToCarSetup local ADB commands. */
public class SendToCarTest{
 static int pass,fail;static void check(boolean ok,String w){if(ok)pass++;else{fail++;System.out.println("FAIL "+w);}}
 static void await()throws Exception{Runnable r=Handler.posted.poll(5,TimeUnit.SECONDS);check(r!=null,"finished posted");if(r!=null)r.run();}
 public static void main(String[] a)throws Exception{
  String AUTO="com.google.android.apps.maps.automotive",PHONE="com.google.android.apps.maps",MICROG="app.revanced.android.gms";
  // ChimeIdentity
  check(AUTO.equals(ChimeIdentity.chimePackage(AUTO)),"no context keeps real");
  MicrogProvider.ctx=new Activity();
  check(ChimeIdentity.chimePackage(null)==null,"null");
  check("com.other".equals(ChimeIdentity.chimePackage("com.other")),"other package unchanged");
  Bundle meta=new Bundle();meta.m.put(ChimeIdentity.SPOOFED_PACKAGE_NAME,PHONE);PackageManager.meta=meta;
  check(PHONE.equals(ChimeIdentity.chimePackage(AUTO))&&PHONE.equals(ChimeIdentity.chimePackage(AUTO)),"own package -> sign-in identity");
  check(PackageManager.metaCalls==1,"metadata read once");
  check(android.util.Log.lines.size()==1&&android.util.Log.lines.get(0).contains("sign-in package "+PHONE),"announced once "+android.util.Log.lines);
  // SendToCarSetup
  Activity act=new Activity();
  check(SendToCarSetup.ALLOW.equals("dumpsys deviceidle whitelist +"+MICROG)&&SendToCarSetup.REMOVE.equals("dumpsys deviceidle whitelist -"+MICROG),"exemption commands");
  check(SendToCarSetup.RECONNECT.equals("am broadcast -n "+MICROG+"/org.microg.gms.gcm.TriggerReceiver -a org.microg.gms.gcm.FORCE_TRY_RECONNECT"),"reconnect command");
  check(SendToCarSetup.summary(act).equals("MicroG-RE is not installed"),"summary not installed");
  SendToCarSetup.configure(act,true,null);check(VehicleLocalAdb.commands.isEmpty()&&SendToCarSetup.status().equals("MicroG-RE is not installed."),"no ADB without MicroG-RE");
  Handler.posted.clear();
  PackageManager.installed.add(MICROG);
  check(SendToCarSetup.summary(act).startsWith("Turn on"),"summary off");
  SendToCarSetup.configure(act,true,()->{});await();
  check(VehicleLocalAdb.commands.equals(java.util.List.of(SendToCarSetup.ALLOW,SendToCarSetup.RECONNECT)),"on: exempt then reconnect "+VehicleLocalAdb.commands);
  check(VehicleLocalAdb.allowKey,"explicit tap may request key approval");
  check(SendToCarSetup.exempt(act)&&SendToCarSetup.status().startsWith("On."),"on status "+SendToCarSetup.status());
  check(SendToCarSetup.summary(act).startsWith("Routes keep arriving"),"summary on");
  VehicleLocalAdb.commands.clear();SendToCarSetup.reconnect(act,()->{});await();
  check(VehicleLocalAdb.commands.equals(java.util.List.of(SendToCarSetup.RECONNECT))&&SendToCarSetup.status().equals("MicroG-RE was asked to reconnect."),"reconnect only "+VehicleLocalAdb.commands);
  VehicleLocalAdb.commands.clear();SendToCarSetup.configure(act,false,()->{});await();
  check(VehicleLocalAdb.commands.equals(java.util.List.of(SendToCarSetup.REMOVE))&&!SendToCarSetup.exempt(act)&&SendToCarSetup.status().startsWith("Off."),"off: remove only "+VehicleLocalAdb.commands);
  VehicleLocalAdb.mode="ignored";SendToCarSetup.configure(act,true,()->{});await();
  check(SendToCarSetup.status().startsWith("Android did not apply"),"change not applied reported");
  VehicleLocalAdb.mode="approval";SendToCarSetup.configure(act,true,()->{});await();
  check(SendToCarSetup.status().startsWith("Approve the Maps ADB key"),"approval message");
  VehicleLocalAdb.mode="down";SendToCarSetup.configure(act,true,()->{});await();
  check(SendToCarSetup.status().startsWith("Local ADB is not available"),"ADB unavailable message");
  check(SendToCarSetup.result(true,true).startsWith("On.")&&SendToCarSetup.result(false,false).startsWith("Off.")&&SendToCarSetup.result(true,false).startsWith("Android did not")&&SendToCarSetup.result(false,true).startsWith("Android did not"),"result mapping");
  System.out.println((fail==0?"PASS":"FAIL")+" sendtocar: "+pass+" passed, "+fail+" failed");System.exit(fail==0?0:1);
 }
}
