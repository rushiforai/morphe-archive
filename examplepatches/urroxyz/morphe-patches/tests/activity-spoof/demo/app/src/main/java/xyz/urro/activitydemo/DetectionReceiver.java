package xyz.urro.activitydemo;
import android.content.*;
import android.os.SystemClock;
import com.google.android.gms.location.*;
import java.util.*;
import org.json.*;

/** Ordinary Google API consumer. No knowledge of the spoof protocol or its transport. */
public final class DetectionReceiver extends BroadcastReceiver {
 public static String name(int type){switch(type){case 0:return "IN_VEHICLE";case 1:return "ON_BICYCLE";case 2:return "ON_FOOT";case 3:return "STILL";case 4:return "UNKNOWN";case 5:return "TILTING";case 7:return "WALKING";case 8:return "RUNNING";default:return "TYPE_"+type;}}
 public void onReceive(Context c,Intent intent){
  try{
   if(ActivityTransitionResult.hasResult(intent)){
    ActivityTransitionResult result=ActivityTransitionResult.extractResult(intent);
    if(result!=null)for(ActivityTransitionEvent event:result.getTransitionEvents())record(c,"transition",name(event.getActivityType())+" "+(event.getTransitionType()==0?"ENTER":"EXIT"),event.getElapsedRealTimeNanos()/1000000);
   }
   if(ActivityRecognitionResult.hasResult(intent)){
    ActivityRecognitionResult result=ActivityRecognitionResult.extractResult(intent);
    if(result!=null){DetectedActivity a=result.getMostProbableActivity();record(c,"sampling",name(a.getType())+" "+a.getConfidence()+"%",result.getElapsedRealtimeMillis());}
   }
  }catch(Exception e){record(c,"error",e.getClass().getSimpleName(),SystemClock.elapsedRealtime());}
 }
 static synchronized void record(Context c,String kind,String value,long eventTime){
  try{
   android.content.SharedPreferences p=c.getSharedPreferences("demo",0);JSONArray old=new JSONArray(p.getString("events","[]")),next=new JSONArray();
   for(int i=Math.max(0,old.length()-99);i<old.length();i++)next.put(old.get(i));
   JSONObject e=new JSONObject().put("kind",kind).put("value",value).put("event_elapsed_ms",eventTime).put("received_elapsed_ms",SystemClock.elapsedRealtime());next.put(e);
   p.edit().putString("events",next.toString()).putString("latest_"+kind,value).apply();
   android.util.Log.i("ActivityDemo",kind+" "+value);
   java.io.File dir=c.getExternalFilesDir(null);if(dir!=null)try(java.io.FileWriter out=new java.io.FileWriter(new java.io.File(dir,"events.jsonl"),true)){out.write(e.toString()+"\n");}
  }catch(Exception ignored){}
 }
}
