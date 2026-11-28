package com.waze.gw;

import java.net.URI;
import java.security.MessageDigest;
import java.util.*;

/** Exact unsigned metadata and downloaded-image gates. Hashes are not authenticity. */
final class HudOtaRelease {
 static final int META_MAX=4096, IMAGE_MAX=8388608;
 static final class Profile {
  final String fw,board,variant,layout,source,repo,manifest;
  final Map<String,Object> declaration;
  Profile(Map<String,Object> o) {
   HudOtaJson.keys(o,"fw,conn,board,variant,layout,update","");
   fw=HudOtaJson.string(o,"fw",1,64); board=identifier(o,"board");variant=identifier(o,"variant");layout=identifier(o,"layout");
   String conn=HudOtaJson.string(o,"conn",1,4);if(!Arrays.asList("usb","ble","wifi").contains(conn))throw HudOtaJson.bad();
   Map<String,Object> u=HudOtaJson.object(o.get("update"));HudOtaJson.keys(u,"ota","repo,manifest_url");HudOtaJson.number(u,"ota",1,1);
   repo=u.containsKey("repo")?HudOtaJson.string(u,"repo",3,129):"";
   if(!repo.isEmpty()&&!repo.matches("[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+"))throw HudOtaJson.bad();
   manifest=u.containsKey("manifest_url")?HudOtaJson.string(u,"manifest_url",1,256):"";
   if(!manifest.isEmpty())https(manifest);if(repo.isEmpty()&&manifest.isEmpty())throw HudOtaJson.bad();
   source=manifest.isEmpty()?repo:manifest;
   declaration=Collections.unmodifiableMap(new LinkedHashMap<>(o));
  }
 }
 final byte[] metadata;
 final Profile profile;
 final long version,issued,expires;
 final int size;
 final String fw,url,sha256;
 HudOtaRelease(byte[] raw,Profile p,long wallNow,long floor) {
  if(raw==null||raw.length<1||raw.length>META_MAX||p==null||floor<0)throw HudOtaJson.bad();
  metadata=raw.clone();profile=p;Map<String,Object> o=HudOtaJson.bytes(metadata);
  HudOtaJson.keys(o,"schema,board,variant,layout,ota,version,fw,issued_at,expires_at,image","");
  if(!"hud-ota/v1".equals(o.get("schema"))||!p.board.equals(identifier(o,"board"))||!p.variant.equals(identifier(o,"variant"))||!p.layout.equals(identifier(o,"layout")))throw new IllegalArgumentException("OTA target mismatch");
  HudOtaJson.number(o,"ota",1,1);version=HudOtaJson.number(o,"version",1,4294967295L);
  if(version<=floor)throw new IllegalArgumentException("OTA rollback/version floor");
  fw=HudOtaJson.string(o,"fw",1,64);issued=HudOtaJson.number(o,"issued_at",0,4294967295L);expires=HudOtaJson.number(o,"expires_at",0,4294967295L);
  checkTime(wallNow);
  Map<String,Object> image=HudOtaJson.object(o.get("image"));HudOtaJson.keys(image,"kind,url,size,sha256","");
  if(!"app".equals(image.get("kind")))throw HudOtaJson.bad();url=HudOtaJson.string(image,"url",1,256);https(url);
  size=(int)HudOtaJson.number(image,"size",1,IMAGE_MAX);sha256=HudOtaJson.string(image,"sha256",64,64);
  if(!sha256.matches("[0-9a-f]{64}"))throw HudOtaJson.bad();
 }
 void checkTime(long wallNow) {if(wallNow<0||issued>wallNow||wallNow>=expires||expires<=issued||expires-issued>604800)throw new IllegalArgumentException("Phone wall clock invalid or OTA metadata expired/not yet valid");}
 void checkImage(byte[] bytes) {if(bytes==null||bytes.length!=size||!sha256.equals(hash(bytes)))throw new IllegalArgumentException("OTA image size/SHA-256 mismatch");}
 static String hash(byte[] b) {try {byte[] d=MessageDigest.getInstance("SHA-256").digest(b);StringBuilder s=new StringBuilder();for(byte v:d)s.append(String.format(java.util.Locale.ROOT,"%02x",v&255));return s.toString();}catch(java.security.NoSuchAlgorithmException e){throw new AssertionError(e);}}
 private static String identifier(Map<String,Object> o,String key) {String s=HudOtaJson.string(o,key,1,32);if(!s.matches("[a-zA-Z0-9._-]{1,32}"))throw HudOtaJson.bad();return s;}
 static URI https(String text) {
  try {URI u=new URI(text);if(!"https".equals(u.getScheme())||u.getHost()==null||u.getRawUserInfo()!=null||u.getRawQuery()!=null||u.getRawFragment()!=null||u.getPort()==0||u.getPort() < -1||u.getPort()>65535||text.matches(".*[\\s\\p{Cntrl}].*"))throw HudOtaJson.bad();return u;}
  catch(java.net.URISyntaxException e){throw HudOtaJson.bad();}
 }
}
