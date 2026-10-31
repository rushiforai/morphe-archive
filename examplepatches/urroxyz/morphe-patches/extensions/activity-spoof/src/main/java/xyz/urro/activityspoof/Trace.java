package xyz.urro.activityspoof;
import android.content.Context;
import android.os.SystemClock;
import java.io.*;
import org.json.JSONObject;
final class Trace {
 static synchronized void write(Context c,String event,String detail){
  android.util.Log.i("ActivitySpoof",event+" "+detail);
  if(c==null)return;
  try{
   File dir=c.getExternalFilesDir("activity-spoof");if(dir==null)return;dir.mkdirs();
   File file=new File(dir,"events.jsonl");
   if(file.length()>2*1024*1024){File previous=new File(dir,"events.previous.jsonl");if(previous.exists())previous.delete();file.renameTo(previous);}
   JSONObject e=new JSONObject().put("elapsed_ms",SystemClock.elapsedRealtime()).put("event",event).put("detail",detail);
   try(FileWriter writer=new FileWriter(file,true)){writer.write(e.toString());writer.write('\n');}
  }catch(Exception ignored){}
 }
}
