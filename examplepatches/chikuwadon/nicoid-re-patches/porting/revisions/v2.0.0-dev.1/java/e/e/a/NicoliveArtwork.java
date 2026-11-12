package e.e.a;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.*;
import java.net.*;
import java.util.*;

/** Small bounded artwork fetch for Android media controls. Never requests arbitrary hosts. */
final class NicoliveArtwork {
 private static final int LIMIT=2*1024*1024;
 private NicoliveArtwork(){}
 static boolean isTrusted(String raw){
  if(raw==null||raw.length()>2048)return false;
  try {
   URI uri=URI.create(raw);
   String host=uri.getHost();
   if(!"https".equalsIgnoreCase(uri.getScheme())||host==null||uri.getUserInfo()!=null)return false;
   host=host.toLowerCase(Locale.ROOT);
   return host.equals("nimg.jp")||host.endsWith(".nimg.jp")||
          host.equals("nicovideo.jp")||host.endsWith(".nicovideo.jp");
  }catch(IllegalArgumentException invalid){return false;}
 }
 static Bitmap fetch(String original){
  String url=original;
  for(int redirects=0;redirects<3;redirects++){
   if(Thread.currentThread().isInterrupted()||!isTrusted(url))return null;
   HttpURLConnection connection=null;
   try{
    URI uri=URI.create(url);
    connection=(HttpURLConnection)uri.toURL().openConnection();
    connection.setInstanceFollowRedirects(false);
    connection.setConnectTimeout(8000);connection.setReadTimeout(8000);
    connection.setRequestProperty("User-Agent",NicoliveData.UA);
    connection.setRequestProperty("Referer","https://live.nicovideo.jp/");
    int code=connection.getResponseCode();
    if(code>=300&&code<400){
     String next=connection.getHeaderField("Location");
     if(next==null)return null;
     url=uri.resolve(next).toString();
     continue;
    }
    if(code!=200||connection.getContentLengthLong()>LIMIT)return null;
    String type=connection.getContentType();
    if(type!=null&&!type.toLowerCase(Locale.ROOT).startsWith("image/"))return null;
    ByteArrayOutputStream out=new ByteArrayOutputStream();
    try(InputStream in=connection.getInputStream()){
     byte[] buffer=new byte[8192];
     for(int n;(n=in.read(buffer))!=-1;){
      if(Thread.currentThread().isInterrupted()||out.size()+n>LIMIT)return null;
      out.write(buffer,0,n);
     }
    }
    byte[] bytes=out.toByteArray();
    BitmapFactory.Options options=new BitmapFactory.Options();
    options.inJustDecodeBounds=true;
    BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);
    if(options.outWidth<1||options.outHeight<1)return null;
    options.inSampleSize=1;
    while(options.outWidth/options.inSampleSize>512||options.outHeight/options.inSampleSize>288){
     options.inSampleSize*=2;
    }
    options.inJustDecodeBounds=false;
    return BitmapFactory.decodeByteArray(bytes,0,bytes.length,options);
   }catch(Exception failure){return null;}
   finally{if(connection!=null)connection.disconnect();}
  }
  return null;
 }
}
