package com.waze.gw;

import javax.net.ssl.HttpsURLConnection;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.function.BooleanSupplier;

/** Anonymous HTTPS only; normal platform TLS, manually validated bounded redirects. */
final class HudOtaDownload {
 static final class Result {final byte[] bytes;final String url;Result(byte[] b,String u){bytes=b;url=u;}}
 static final class Prepared {
  final HudOtaRelease release;final byte[] image;final String manifestUrl,imageUrl;
  Prepared(HudOtaRelease r,byte[] b,String m,String i){release=r;image=b;manifestUrl=m;imageUrl=i;}
 }
 static Prepared discover(HudOtaRelease.Profile p,long now,long floor,BooleanSupplier cancelled) throws IOException {
  String manifest=p.manifest;
  if(manifest.isEmpty()) manifest=releaseAsset(get("https://api.github.com/repos/"+p.repo+"/releases/latest",1048576,cancelled).bytes);
  Result meta=get(manifest,HudOtaRelease.META_MAX,cancelled);
  HudOtaRelease r=new HudOtaRelease(meta.bytes,p,now,floor);
  Result image=get(r.url,r.size,cancelled);r.checkImage(image.bytes);
  return new Prepared(r,image.bytes,meta.url,image.url);
 }
 static String releaseAsset(byte[] raw) {
  Map<String,Object> o=HudOtaJson.bytes(raw);
  if(!Boolean.FALSE.equals(o.get("draft"))||!Boolean.FALSE.equals(o.get("prerelease"))||!(o.get("assets") instanceof List))throw new IllegalArgumentException("Not a stable GitHub release");
  String found=null;
  for(Object v:(List<?>)o.get("assets")) {Map<String,Object> a=HudOtaJson.object(v);if(!"hud-ota-v1.json".equals(a.get("name")))continue;
   if(found!=null)throw new IllegalArgumentException("Ambiguous hud-ota-v1.json release assets");
   found=HudOtaJson.string(a,"browser_download_url",1,256);HudOtaRelease.https(found);
  }
  if(found==null)throw new IllegalArgumentException("No hud-ota-v1.json release asset");return found;
 }
 static Result get(String initial,int max,BooleanSupplier cancelled) throws IOException {
  String url=initial;long started=System.nanoTime();
  for(int redirects=0;;redirects++) {
   check(cancelled,started);URI uri=HudOtaRelease.https(url);
   HttpsURLConnection c=(HttpsURLConnection)uri.toURL().openConnection();
   c.setInstanceFollowRedirects(false);c.setConnectTimeout(10000);c.setReadTimeout(15000);c.setRequestMethod("GET");
   c.setRequestProperty("Accept","application/json, application/octet-stream");c.setRequestProperty("Accept-Encoding","identity");c.setRequestProperty("User-Agent","WazeHUD-OTA-v1");
   // Never forward caller credentials or cookies between endpoints.
   c.setRequestProperty("Cookie","");c.setRequestProperty("Authorization","");c.setUseCaches(false);
   try {
    int status=c.getResponseCode();check(cancelled,started);
    if(status==301||status==302||status==303||status==307||status==308) {
     String location=c.getHeaderField("Location");if(redirects>=5||location==null)throw new IOException("OTA redirect limit/missing Location");
     url=uri.resolve(location).toString();HudOtaRelease.https(url);continue;
    }
    if(status!=200)throw new IOException("OTA HTTPS status "+status);
    String encoding=c.getHeaderField("Content-Encoding");if(encoding!=null&&!encoding.equalsIgnoreCase("identity"))throw new IOException("OTA content encoding rejected");
    long length=c.getContentLengthLong();if(length>max)throw new IOException("OTA download too large");
    try(InputStream in=c.getInputStream()) {byte[] bytes=bounded(in,max,cancelled,started);if(length>=0&&length!=bytes.length)throw new IOException("Truncated OTA download");return new Result(bytes,url);}
   }finally {c.disconnect();}
  }
 }
 static byte[] bounded(InputStream in,int max,BooleanSupplier cancelled,long started) throws IOException {
  if(max<1||max>1048576&&max>HudOtaRelease.IMAGE_MAX)throw new IOException("Invalid OTA limit");
  ByteArrayOutputStream out=new ByteArrayOutputStream(Math.min(max,8192));byte[] buffer=new byte[8192];
  while(true){check(cancelled,started);int n=in.read(buffer,0,Math.min(buffer.length,max-out.size()+1));check(cancelled,started);if(n<0)return out.toByteArray();if(n==0)continue;if(out.size()+n>max)throw new IOException("OTA download exceeds bound");out.write(buffer,0,n);}
 }
 private static void check(BooleanSupplier cancelled,long start)throws IOException {if(cancelled.getAsBoolean()||Thread.currentThread().isInterrupted())throw new IOException("OTA download cancelled");if(System.nanoTime()-start>=300000000000L)throw new IOException("OTA total download timeout");}
}
