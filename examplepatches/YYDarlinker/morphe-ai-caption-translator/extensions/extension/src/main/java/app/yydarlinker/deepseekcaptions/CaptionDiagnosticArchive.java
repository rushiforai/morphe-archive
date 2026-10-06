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
      // A larger bounded lane: a report may queue hundreds of records between drains, and the lane itself
      // is still hard-bounded, so a burst cannot grow memory without limit.
      new ArrayBlockingQueue<>(4096),r->{Thread t=new Thread(r,"caption-diagnostics");t.setDaemon(true);return t;});
  private static final java.util.concurrent.atomic.AtomicLong dropped=new java.util.concurrent.atomic.AtomicLong();
  private static final java.util.concurrent.atomic.AtomicLong clearEpoch=new java.util.concurrent.atomic.AtomicLong();
  static long epoch(){return clearEpoch.get();}
  static { IO.allowCoreThreadTimeOut(true); }
  static void append(Context c,String channel,String value) {
    File dir=new File(c.getFilesDir(),"caption-diagnostics-r25/"+channel);
    String entry=value.length()>60000?value.substring(0,60000)+" [record truncated at 60000 chars]":value;
    long generation=clearEpoch.get();
    try { IO.execute(()->{if(generation!=clearEpoch.get())return;try { appendNow(dir,entry); }catch(IOException e){dropped.incrementAndGet();}}); }
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
    long generation=clearEpoch.incrementAndGet();
    IO.execute(()->{
      if(generation!=clearEpoch.get())return;
      for(String channel:new String[]{"history","quality","timing","batch","summary"}){
        File dir=new File(c.getFilesDir(),"caption-diagnostics-r25/"+channel);
        for(File f:files(dir))f.delete();
        if(channel.equals("summary"))new android.util.AtomicFile(new File(dir,"latest.slot")).delete();
      }
      dropped.set(0);
    });
  }

  /**
   * Latest stage/detail and the preserved decision lines, written on the archive lane so no display
   * path commits SharedPreferences. The fields are a small bounded record, not a history channel.
   * {@code epoch} identifies the clearing generation: a batch queued before a clear is not revived.
   */
  static void appendSummary(Context c,String stage,String detail,long at,String decisions,long epoch){
    appendSummary(c,stage,detail,at,()->decisions,epoch);
  }
  static void appendSummary(Context c,String stage,String detail,long at,java.util.function.Supplier<String> decisions,long epoch){
    long generation=clearEpoch.get();
    try{IO.execute(()->{
      if(generation!=clearEpoch.get())return;
      String tail=decisions.get();
      String entry=epoch+"\u0001"+stage+"\u0001"+(detail==null?"":detail)+"\u0001"+at+"\u0001"+(tail==null?"":tail);
      File dir=new File(c.getFilesDir(),"caption-diagnostics-r25/summary");dir.mkdirs();
      android.util.AtomicFile slot=new android.util.AtomicFile(new File(dir,"latest.slot"));
      FileOutputStream stream=null;
      try{
        stream=slot.startWrite();stream.write(entry.getBytes(StandardCharsets.UTF_8));
        if(generation==clearEpoch.get())slot.finishWrite(stream);else slot.failWrite(stream);
      }catch(IOException failed){if(stream!=null)slot.failWrite(stream);dropped.incrementAndGet();}
    });}catch(RejectedExecutionException full){dropped.incrementAndGet();}
  }
  /** One bounded atomic latest slot. Legacy summary logs are preserved and migrated by tail only. */
  static void readSummaryAsync(Context c,long epoch,java.util.function.Consumer<String> callback){
    IO.execute(()->{try{callback.accept(readSummaryNow(c,epoch));}catch(IOException failed){callback.accept(null);}});
  }
  static String readSummary(Context c,long epoch){
    try{return IO.submit(()->readSummaryNow(c,epoch)).get(30,TimeUnit.SECONDS);}
    catch(Exception failed){return null;}
  }
  private static String readSummaryNow(Context c,long epoch)throws IOException{
      File dir=new File(c.getFilesDir(),"caption-diagnostics-r25/summary");
      File latest=new File(dir,"latest.slot");
      if(latest.isFile()&&latest.length()<=64000){
        String text=new String(new android.util.AtomicFile(latest).readFully(),StandardCharsets.UTF_8);
        if(text.startsWith(epoch+"\u0001"))return text;
      }
      File[] legacy=files(dir);
      for(int index=legacy.length-1;index>=Math.max(0,legacy.length-2);index--){
        try(RandomAccessFile in=new RandomAccessFile(legacy[index],"r")){
          int length=(int)Math.min(64000,in.length());byte[] tail=new byte[length];
          in.seek(in.length()-length);in.readFully(tail);
          String[] lines=new String(tail,StandardCharsets.UTF_8).split("\n");
          for(int i=lines.length-1;i>=0;i--)if(lines[i].startsWith(epoch+"\u0001"))return lines[i];
        }
      }
      return null;
  }
}
