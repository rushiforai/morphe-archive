package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;

/** Bounded private append journal. Disk I/O is serialized off the playback thread. */
final class CaptionDiagnosticArchive {
  static final int SEGMENT_BYTES=256*1024, SEGMENTS=32;
  static final long RETENTION_MS=24*60*60*1000L;
  private static final ThreadPoolExecutor IO=new ThreadPoolExecutor(1,1,30,TimeUnit.SECONDS,
      new ArrayBlockingQueue<>(256),r->{Thread t=new Thread(r,"caption-diagnostics");t.setDaemon(true);return t;});
  private static final java.util.concurrent.atomic.AtomicLong dropped=new java.util.concurrent.atomic.AtomicLong();
  static { IO.allowCoreThreadTimeOut(true); }
  static void append(Context c,String channel,String value) {
    File dir=new File(c.getFilesDir(),"caption-diagnostics-r25/"+channel);
    String entry=value.length()>60000?value.substring(0,60000)+" [record truncated at 60000 chars]":value;
    try { IO.execute(()->{try { appendNow(dir,entry); }catch(IOException e){dropped.incrementAndGet();}}); }
    catch(RejectedExecutionException e){dropped.incrementAndGet();}
  }
  private static File[] files(File dir) {
    File[] files=dir.listFiles((d,n)->n.endsWith(".log"));
    if(files==null)return new File[0];
    Arrays.sort(files,Comparator.comparing(File::getName));return files;
  }
  static void appendNow(File dir,String value) throws IOException {
    dir.mkdirs();long now=System.currentTimeMillis();
    for(File f:files(dir))if(now-f.lastModified()>RETENTION_MS)f.delete();
    File[] all=files(dir);File last=all.length==0?null:all[all.length-1];
    if(value.length()>60000)value=value.substring(0,60000)+" [record truncated at 60000 chars]";
    byte[] bytes=(value+"\n").getBytes(StandardCharsets.UTF_8);
    if(last==null || last.length()+bytes.length>SEGMENT_BYTES){
      long id=all.length==0?now:Math.max(now,Long.parseLong(last.getName().replace(".log",""))+1);
      last=new File(dir,String.format(Locale.ROOT,"%019d.log",id));
    }
    try(FileOutputStream out=new FileOutputStream(last,true)){out.write(bytes);}
    all=files(dir);for(int i=0;i<all.length-SEGMENTS;i++)all[i].delete();
  }
  static String read(Context c,String channel) {
    try{return IO.submit(()->{
      StringBuilder out=new StringBuilder();long now=System.currentTimeMillis();
      for(File f:files(new File(c.getFilesDir(),"caption-diagnostics-r25/"+channel))){
        if(now-f.lastModified()>RETENTION_MS){f.delete();continue;}
        try(InputStream in=new FileInputStream(f)){byte[] b=new byte[(int)f.length()];int n=0,k;while(n<b.length&&(k=in.read(b,n,b.length-n))>0)n+=k;out.append(new String(b,0,n,StandardCharsets.UTF_8));}
      }
      if(dropped.get()>0)out.append("\n[archive dropped records: ").append(dropped.get()).append("]\n");
      return out.toString();
    }).get(30,TimeUnit.SECONDS);}catch(Exception e){return "[archive read failed: "+e.getClass().getSimpleName()+"]";}
  }
  static void clear(Context c){
    try{IO.submit(()->{for(String channel:new String[]{"history","quality"})for(File f:files(new File(c.getFilesDir(),"caption-diagnostics-r25/"+channel)))f.delete();dropped.set(0);}).get(30,TimeUnit.SECONDS);}catch(Exception ignored){}
  }
}
