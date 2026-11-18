package nl.johninnl.wavereceiver;
import android.app.Activity;import android.content.*;import android.os.*;import java.io.*;import org.json.*;
public class Receiver extends BroadcastReceiver {
 public void onReceive(Context c,Intent i){try{
  JSONObject extras=new JSONObject();for(String k:i.getExtras().keySet())extras.put(k,i.getExtras().get(k));
  JSONObject row=new JSONObject().put("receiver_uid",android.os.Process.myUid()).put("received_elapsed_ms",SystemClock.elapsedRealtime()).put("extras",extras);
  if(Build.VERSION.SDK_INT>=34)row.put("sender_package",getSentFromPackage()).put("sender_uid",getSentFromUid());
  try(FileWriter f=new FileWriter(new File(c.getFilesDir(),"events.jsonl"),true)){f.write(row.toString()+"\n");}
 }catch(Exception e){throw new RuntimeException(e);}}
}
