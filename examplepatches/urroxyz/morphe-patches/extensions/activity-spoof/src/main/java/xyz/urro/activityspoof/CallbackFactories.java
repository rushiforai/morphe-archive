package xyz.urro.activityspoof;
import android.app.PendingIntent;
import android.content.*;
import android.os.Bundle;
import java.util.*;
import org.json.*;

/** Records callback identity, not extras. Existing system-owned tokens can be reacquired after process death. */
public final class CallbackFactories {
 private static final Map<PendingIntent,JSONObject> descriptors=new WeakHashMap<>();
 private CallbackFactories(){}
 private static synchronized PendingIntent remember(PendingIntent callback,String kind,int code,Intent[] intents,int flags){
  if(callback==null)return null;
  try{
   JSONArray filters=new JSONArray();for(Intent intent:intents)filters.put(intent.cloneFilter().toUri(0));
   descriptors.put(callback,new JSONObject().put("kind",kind).put("request_code",code).put("flags",flags).put("filters",filters));
  }catch(JSONException ignored){}
  return callback;
 }
 static synchronized JSONObject describe(PendingIntent callback){return descriptors.get(callback);}
 public static PendingIntent broadcast(Context c,int code,Intent intent,int flags){return remember(PendingIntent.getBroadcast(c,code,intent,flags),"broadcast",code,new Intent[]{intent},flags);}
 public static PendingIntent service(Context c,int code,Intent intent,int flags){return remember(PendingIntent.getService(c,code,intent,flags),"service",code,new Intent[]{intent},flags);}
 public static PendingIntent foregroundService(Context c,int code,Intent intent,int flags){return remember(PendingIntent.getForegroundService(c,code,intent,flags),"foreground",code,new Intent[]{intent},flags);}
 public static PendingIntent activity(Context c,int code,Intent intent,int flags){return activityOptions(c,code,intent,flags,null);}
 public static PendingIntent activityOptions(Context c,int code,Intent intent,int flags,Bundle options){return remember(PendingIntent.getActivity(c,code,intent,flags,options),"activity",code,new Intent[]{intent},flags);}
 public static PendingIntent activities(Context c,int code,Intent[] intents,int flags){return activitiesOptions(c,code,intents,flags,null);}
 public static PendingIntent activitiesOptions(Context c,int code,Intent[] intents,int flags,Bundle options){return remember(PendingIntent.getActivities(c,code,intents,flags,options),"activities",code,intents,flags);}
 static PendingIntent reacquire(Context c,JSONObject descriptor)throws Exception{
  JSONArray filters=descriptor.getJSONArray("filters");Intent[] intents=new Intent[filters.length()];
  for(int i=0;i<intents.length;i++)intents[i]=Intent.parseUri(filters.getString(i),0);
  if(intents.length==0)return null;
  int code=descriptor.getInt("request_code");
  // NO_CREATE never creates a new callback or changes the original callback's extras.
  int flags=PendingIntent.FLAG_NO_CREATE|(descriptor.getInt("flags")&(PendingIntent.FLAG_ONE_SHOT|PendingIntent.FLAG_IMMUTABLE|PendingIntent.FLAG_MUTABLE));
  PendingIntent callback;
  switch(descriptor.getString("kind")){
   case "broadcast":callback=PendingIntent.getBroadcast(c,code,intents[0],flags);break;
   case "service":callback=PendingIntent.getService(c,code,intents[0],flags);break;
   case "foreground":callback=PendingIntent.getForegroundService(c,code,intents[0],flags);break;
   case "activity":callback=PendingIntent.getActivity(c,code,intents[0],flags);break;
   case "activities":callback=PendingIntent.getActivities(c,code,intents,flags);break;
   default:return null;
  }
  if(callback!=null)synchronized(CallbackFactories.class){descriptors.put(callback,descriptor);}
  return callback;
 }
}
