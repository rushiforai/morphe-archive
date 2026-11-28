package com.waze.gw;

import java.security.SecureRandom;
import java.util.*;
import java.util.function.LongSupplier;

/** Session-owned stop-and-wait sender. Sink success means actual existing-writer send completed. */
final class HudOtaTransfer {
 interface Sink { boolean send(String packet); }
 private final HudOtaRelease release; private final byte[] image; private final Sink sink;
 private final LongSupplier clock;
 final String sid,id;
 String phase="meta",operation="",result="Ready";
 int expected,offset,retries;
 boolean terminal,commitSent;
 private String outstanding; private long sentAt;
 HudOtaTransfer(HudOtaRelease release,byte[] image,String sid,Sink sink) {this(release,image,sid,sink,null);}
 HudOtaTransfer(HudOtaRelease release,byte[] image,String sid,Sink sink,LongSupplier clock) {
  if(!sid.matches("[0-9a-f]{16}")||sink==null)throw HudOtaJson.bad();release.checkImage(image);
  this.release=release;this.image=image.clone();this.sid=sid;this.id=randomId();this.sink=sink;this.clock=clock;
 }
 static String randomId() {byte[] b=new byte[8];new SecureRandom().nextBytes(b);StringBuilder s=new StringBuilder();for(byte v:b)s.append(String.format(Locale.ROOT,"%02x",v&255));return s.toString();}
 synchronized void start(long now) {if(!operation.isEmpty()||terminal)throw new IllegalStateException("OTA already started");request("ota_begin",",\"meta_size\":"+release.metadata.length,0,now);}
 private String packet(String t,String extra) {return "{\"v\":1,\"t\":\""+t+"\",\"sid\":\""+sid+"\",\"id\":\""+id+"\""+extra+"}";}
 private void request(String op,String extra,int next,long now) {
  operation=op;expected=next;retries=0;outstanding=packet(op,extra);
  if(op.equals("ota_commit"))commitSent=true;
  transmit(now);
 }
 private void transmit(long now) {
  if(!sink.send(outstanding)){fail("writer failed; outcome "+(commitSent?"unknown":"failed"));return;}
  sentAt=clock==null?now:clock.getAsLong();result=operation+" "+phase+" "+offset+"/"+(phase.equals("meta")?release.metadata.length:image.length);
 }
 synchronized void tick(long now) {
  if(terminal||outstanding==null)return;
  if(now-sentAt<(operation.equals("ota_verify")?30000:2000))return;
  if(retries++<3){transmit(now);return;}
  fail(commitSent?"COMMIT timeout: outcome unknown; reconnect verification required":"OTA ACK timeout");
 }
 synchronized void ack(Map<String,Object> a,long now) {
  if(terminal||outstanding==null)return;
  try {
   HudOtaJson.keys(a,"v,t,sid,id,for,phase,off,status,code","");HudOtaJson.number(a,"v",1,1);
   if(!"ota_ack".equals(a.get("t"))||!sid.equals(a.get("sid"))||!id.equals(a.get("id"))||!operation.equals(a.get("for"))||!phase.equals(a.get("phase")))return;
   long off=HudOtaJson.number(a,"off",0,4294967295L);String status=HudOtaJson.string(a,"status",2,5),code=HudOtaJson.string(a,"code",1,32);
   if(!Arrays.asList("none","busy","unsupported","session","offset","duplicate","metadata","time","rollback","compatibility","size","hash","storage","state","cancelled","timeout").contains(code))return;
   if("error".equals(status)&&!"none".equals(code)) {if(off==offset)fail("HUD rejected OTA: "+code);return;}
   if(!"ok".equals(status)||!"none".equals(code)||off!=expected)return;
   offset=expected;
   if(operation.equals("ota_commit")){terminal=true;outstanding=null;result="COMMIT acknowledged; reconnect verification required";return;}
   if(operation.equals("ota_verify")){request("ota_commit","",image.length,now);return;}
   byte[] data=phase.equals("meta")?release.metadata:image;
   if(offset==data.length){if(phase.equals("meta")){phase="image";offset=0;data=image;}else{request("ota_verify","",image.length,now);return;}}
   int length=Math.min(192,data.length-offset);String b64=Base64.getEncoder().encodeToString(Arrays.copyOfRange(data,offset,offset+length));
   request("ota_data",",\"phase\":\""+phase+"\",\"off\":"+offset+",\"data\":\""+b64+"\"",offset+length,now);
  }catch(IllegalArgumentException ignored){/* Invalid/unrelated traffic never consumes a retry. */}
 }
 synchronized void cancel() {fail(commitSent?"Cancellation after COMMIT: outcome unknown; cannot undo activation":"OTA cancelled");}
 synchronized void disconnected() {terminal=true;outstanding=null;result=commitSent?"Disconnected after COMMIT: outcome unknown; reconnect verification required":"Session changed: OTA discarded";}
 private void fail(String detail) {
  if(terminal)return;terminal=true;outstanding=null;result=detail;
  if(!commitSent)sink.send(packet("ota_abort",""));
 }
}
