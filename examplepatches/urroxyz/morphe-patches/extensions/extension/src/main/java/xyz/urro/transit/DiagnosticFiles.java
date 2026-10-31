package xyz.urro.transit;

import android.content.*;
import android.net.Uri;
import android.provider.MediaStore;
import java.io.*;
import java.util.concurrent.*;

/** Private durable copy plus a Downloads mirror; no storage permission or network access. */
final class DiagnosticFiles {
 private static final ThreadPoolExecutor writer=new ThreadPoolExecutor(0,1,30,TimeUnit.SECONDS,new ArrayBlockingQueue<Runnable>(4096));
 private static DiagnosticJournal journal;
 private static File lastPrivate;
 private static Uri mirror;
 private static boolean mirrorNeedsCopy=true;
 private static String status="Waiting for first diagnostic event";
 private static long dropped;
 static void append(Context context,String run,String event){
  Context c=context.getApplicationContext();
  try{writer.execute(()->write(c,run,event));}catch(RejectedExecutionException error){synchronized(DiagnosticFiles.class){dropped++;}android.util.Log.e("TransitMorphe","Diagnostic queue full; event dropped");}
 }
 private static synchronized void write(Context c,String run,String event){
  try{
   if(journal==null)journal=new DiagnosticJournal(new File(c.getFilesDir(),"go-diagnostics"),run,16L*1024*1024);
   File file=journal.append(event);
   if(dropped>0){journal.append("{\"source\":\"logging_overflow\",\"dropped\":"+dropped+"}");dropped=0;}
   // The private append has completed before trying public storage. A mirror failure never loses it.
   if(!file.equals(lastPrivate)||mirror==null){
    mirror=null;mirrorNeedsCopy=true;
    ContentValues values=new ContentValues();values.put(MediaStore.MediaColumns.DISPLAY_NAME,file.getName());
    values.put(MediaStore.MediaColumns.MIME_TYPE,"text/plain");values.put(MediaStore.MediaColumns.RELATIVE_PATH,"Download/Transit GO Logs");
    mirror=c.getContentResolver().insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI,values);lastPrivate=file;
   }
   if(mirror==null)throw new IOException("Downloads log unavailable");
   try(OutputStream out=c.getContentResolver().openOutputStream(mirror,mirrorNeedsCopy?"w":"wa")){
    if(out==null)throw new IOException("Downloads log cannot open");
    if(mirrorNeedsCopy){try(InputStream in=new FileInputStream(file)){byte[] bytes=new byte[8192];int n;while((n=in.read(bytes))!=-1)out.write(bytes,0,n);}}
    else out.write((event+"\n").getBytes(java.nio.charset.StandardCharsets.UTF_8));
    mirrorNeedsCopy=false;
   }
   status="Saving to Download/Transit GO Logs/"+file.getName();
  }catch(IOException|RuntimeException error){mirrorNeedsCopy=true;status="Log write error (check private fallback): "+error.getClass().getSimpleName();android.util.Log.e("TransitMorphe",status);}
 }
 static synchronized String status(){return status;}
}
