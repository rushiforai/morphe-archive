// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsa;

import android.content.*;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.*;

/** Narrow user-triggered mode command; never exposes Google account or conversation data. */
public final class AssistantModeProvider extends ContentProvider {
 private static final String MAPS="com.google.android.apps.maps.automotive";
 private static final byte[] PROJECT=hex("a8401545b03562933c095667ae0eb54bab189d8571010e4eb3384753ad6508d5");
 private static final byte[] LAB=hex("5078471eaa3731bef67b5451c12c33b6b48a0f1d4264c97732a843966691e2bd");
 private static byte[] hex(String s){byte[] b=new byte[s.length()/2];for(int i=0;i<b.length;i++)b[i]=(byte)Integer.parseInt(s.substring(i*2,i*2+2),16);return b;}
 private void enforceCaller(){
  PackageManager pm=getContext().getPackageManager();int uid=Binder.getCallingUid();
  String[] packages=pm.getPackagesForUid(uid);
  if(packages!=null)for(String p:packages){
   if(MAPS.equals(p)&&(pm.checkSignatures(android.os.Process.myUid(),uid)==PackageManager.SIGNATURE_MATCH||pm.hasSigningCertificate(p,PROJECT,PackageManager.CERT_INPUT_SHA256)))return;
   // This test entry point exists only when the GSA APK itself has the established lab signer.
   if("local.maps.assistprobe".equals(p)&&pm.hasSigningCertificate(getContext().getPackageName(),LAB,PackageManager.CERT_INPUT_SHA256)&&pm.checkSignatures(android.os.Process.myUid(),uid)==PackageManager.SIGNATURE_MATCH)return;
  }
  throw new SecurityException("Maps mode caller is not authorized");
 }
 private void enforceLab(){PackageManager pm=getContext().getPackageManager();int uid=Binder.getCallingUid();String[] ps=pm.getPackagesForUid(uid);if(ps!=null)for(String p:ps)if("local.maps.assistprobe".equals(p)&&pm.hasSigningCertificate(getContext().getPackageName(),LAB,PackageManager.CERT_INPUT_SHA256)&&pm.checkSignatures(android.os.Process.myUid(),uid)==PackageManager.SIGNATURE_MATCH)return;throw new SecurityException("Private lab caller required");}
 private String pending,lastMode="none";private long until,lastAt;private boolean lastApplied;private int consumerPid;
 public boolean onCreate(){return true;}
 private boolean internal(){return Binder.getCallingUid()==android.os.Process.myUid();}
 private static boolean valid(String mode){return "microphone".equals(mode)||"conversation".equals(mode);}

 @Override public synchronized Bundle call(String method,String arg,Bundle extras){
  boolean self=internal();
  if("lab_prompt".equals(method)||"lab_control".equals(method)){enforceLab();Bundle b=new Bundle();b.putBoolean("accepted","lab_prompt".equals(method)?CarLivePanel.labPrompt(arg):"voice_end".equals(arg)?CarVoiceStrip.labEnd():CarLivePanel.labControl(arg));return b;}

  if("consume".equals(method)||"complete".equals(method)){if(!self)throw new SecurityException("Internal mode operation");}
  else enforceCaller();
  Bundle result=new Bundle();result.putInt("api",1);
  if("car_panel".equals(method)){if(!"on".equals(arg)&&!"off".equals(arg))throw new IllegalArgumentException("Invalid panel mode");CarLivePanel.setEnabled("on".equals(arg));return CarLivePanel.status();}
  if("prepare".equals(method)){
   boolean valid=valid(arg);if(valid){pending=arg;until=SystemClock.elapsedRealtime()+4000;lastMode=arg;lastApplied=false;lastAt=0;}
   result.putBoolean("armed",valid);
  }else if("consume".equals(method)){
   long now=SystemClock.elapsedRealtime();String mode=pending;pending=null;
   if(now<=until&&now>=until-4000)result.putString("mode",mode);
  }else if("complete".equals(method)){
   if(!valid(arg)||extras==null)throw new IllegalArgumentException("Invalid mode result");
   lastMode=arg;lastApplied=extras.getBoolean("applied",false);lastAt=SystemClock.elapsedRealtime();consumerPid=extras.getInt("pid",0);
  }else if("cancel".equals(method)){pending=null;until=0;result.putBoolean("cancelled",true);}
  else if("status".equals(method)){result.putAll(CarLivePanel.status());result.putAll(CarVoiceStrip.status());result.putString("mode",lastMode);result.putBoolean("applied",lastApplied);result.putLong("at",lastAt);result.putInt("provider_pid",android.os.Process.myPid());result.putInt("consumer_pid",consumerPid);}
  else throw new IllegalArgumentException("Unsupported mode operation");
  return result;
 }
 public Cursor query(Uri u,String[] p,String s,String[] a,String o){throw new UnsupportedOperationException();}
 public String getType(Uri u){return null;}
 public Uri insert(Uri u,ContentValues v){throw new UnsupportedOperationException();}
 public int delete(Uri u,String s,String[] a){throw new UnsupportedOperationException();}
 public int update(Uri u,ContentValues v,String s,String[] a){throw new UnsupportedOperationException();}
}
