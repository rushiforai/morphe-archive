package e.e.a;

import android.content.Context;
import android.net.Uri;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.*;

/**
 * Bounded private trace for NicoLive player/manifest/HTTP events.
 * No URLs, signed query strings, cookies, user IDs, programs or key bytes.
 * Snapshots are written off the playback thread and included in ModernDebug.share.
 */
public final class NicoliveDiagnostics {
 // Preserve at least ~2 minutes of high-frequency HLS HTTP events, so a
 // previous 60-second failure is retained after automatic reconnection.
 private static final int MAX_EVENTS=4000,MAX_TEXT=262144;
 private static final Object LOCK=new Object();
 private static final ArrayDeque<String> events=new ArrayDeque<>();
 private static final ScheduledExecutorService writer=Executors.newSingleThreadScheduledExecutor(r->{
  Thread t=new Thread(r,"nicoid-live-diagnostic");t.setDaemon(true);return t;
 });
 private static volatile File destination;
 private static volatile boolean started,dirty;
 private NicoliveDiagnostics(){}

 public static synchronized void init(Context context){
  if(started)return;
  destination=new File(context.getApplicationContext().getFilesDir(),"nicoid-live-events.log");
  started=true;record("TRACE","NicoLive diagnostic capture enabled");
  writer.scheduleWithFixedDelay(()->persist(),5,5,TimeUnit.SECONDS);
 }
 public static void record(String type,String detail){
  // Only fixed, authored categories and numeric/state fields are passed by callers.
  String category=sanitize(type,32),state=sanitize(detail,190);
  String now=new SimpleDateFormat("HH:mm:ss.SSS",Locale.ROOT).format(new Date());
  synchronized(LOCK){
   events.addLast(now+" "+category+" "+state);
   while(events.size()>MAX_EVENTS)events.removeFirst();
   dirty=true;
  }
 }
 private static String sanitize(String s,int max){
  if(s==null)return "?";
  // URI, cookies, authentication tokens, and arbitrary strings are not stored.
  s=s.replaceAll("(?i)(?:https?|wss?)://[^\\s]+","[URL]");
  s=s.replaceAll("(?i)(?:cookie|token|signature|key)=\\S+","[REDACTED]");
  s=s.replaceAll("[^a-zA-Z0-9_.,=;:() /\\[\\]{}+-]","?");
  return s.length()>max?s.substring(0,max):s;
 }
 private static String snapshot(){
  StringBuilder out=new StringBuilder();
  synchronized(LOCK){for(String row:events)out.append(row).append('\n');}
  if(out.length()>MAX_TEXT)return out.substring(out.length()-MAX_TEXT);
  return out.toString();
 }
 private static void persist(){
  if(!dirty||destination==null)return;
  String contents=snapshot();
  try{
   File file=destination;
   File temp=new File(file.getParentFile(),file.getName()+".tmp");
   try(FileOutputStream out=new FileOutputStream(temp)){
    out.write(contents.getBytes("UTF-8"));
   }
   if(!temp.renameTo(file)){
    try(FileOutputStream out=new FileOutputStream(file)){
     out.write(contents.getBytes("UTF-8"));
    }
    temp.delete();
   }
   dirty=false;
  }catch(IOException ignored){}
 }
 public static String append(Context context,String existing){
  String current=snapshot();
  if(current.isEmpty()){
   File file=new File(context.getFilesDir(),"nicoid-live-events.log");
   if(file.isFile()&&file.length()<=MAX_TEXT){
    try(InputStream in=new FileInputStream(file);ByteArrayOutputStream out=new ByteArrayOutputStream()){
     byte[] buf=new byte[4096];int n;
     while((n=in.read(buf))!=-1)out.write(buf,0,n);
     current=out.toString("UTF-8");
    }catch(IOException ignored){}
   }
  }
  return existing+"\n\nNicoLive playback diagnostics (no URLs or credentials):\n"
      +(current.isEmpty()?"No NicoLive playback events recorded.\n":current);
 }
 public static String kind(Uri uri){
  if(uri==null)return "unknown";
  String path=uri.getPath();
  if(path==null)return "unknown";
  if(path.contains("/keys/")||path.endsWith(".key"))return "key";
  if(path.endsWith(".m3u8")||path.contains("/playlists/"))return "playlist";
  if(path.contains("/segments/")||path.endsWith(".cmfv")||path.endsWith(".cmfa")||path.endsWith(".m4s"))return "segment";
  if(path.contains("/blank/"))return "blank";
  if(path.contains("/init"))return "init";
  return "other";
 }
}
