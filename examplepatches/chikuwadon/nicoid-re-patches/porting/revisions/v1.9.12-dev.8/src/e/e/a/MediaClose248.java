package e.e.a;

import android.app.*;
import android.content.*;
import java.lang.reflect.*;
import java.util.*;

/** A close action must still be deliverable after Android removes the UI process. */
public final class MediaClose248 {
 static final String ACTION="com.sauzask.nicoid.RE_STOP_248", PREFS="nicoid_media_close_248";
 static final Map<Object,String> TOKENS=new WeakHashMap<>();
 static PendingIntent action(Context context,Object state,int notificationId,int requestCode){
  String token=TOKENS.get(state);
  if(token==null){token=UUID.randomUUID().toString();TOKENS.put(state,token);context.getSharedPreferences(PREFS,0).edit().putString("token",token).putInt("notification",notificationId).apply();}
  Intent intent=new Intent(ACTION).setData(android.net.Uri.parse("nicoid-media-close:"+token)).setClassName(context,"com.sauzask.nicoid.NicoidPopupViewService").putExtra("token",token).putExtra("notification",notificationId);
  return PendingIntent.getService(context,requestCode,intent,PendingIntent.FLAG_UPDATE_CURRENT|PendingIntent.FLAG_IMMUTABLE);
 }
 static boolean valid(Context context,Intent intent){
  if(intent==null||!ACTION.equals(intent.getAction()))return false;
  SharedPreferences prefs=context.getSharedPreferences(PREFS,0);String token=intent.getStringExtra("token"),saved=prefs.getString("token",null);
  return token!=null&&token.length()==36&&token.equals(saved)&&intent.getIntExtra("notification",-1)==prefs.getInt("notification",-2);
 }
 public static boolean consume(Service service,Intent intent){
  if(intent==null||!ACTION.equals(intent.getAction()))return false;
  if(valid(service,intent)){
   service.getSharedPreferences(PREFS,0).edit().remove("token").remove("notification").apply();
   try{Field field=MediaControls.class.getDeclaredField("active");field.setAccessible(true);Object state=field.get(null);
    if(state!=null){Method command=MediaControls.class.getDeclaredMethod("command",state.getClass(),String.class);command.setAccessible(true);command.invoke(null,state,"stop");}
   }catch(Exception e){android.util.Log.w("nicoid-media","Cannot stop the active playback session",e);}
   ((NotificationManager)service.getSystemService(Context.NOTIFICATION_SERVICE)).cancel(intent.getIntExtra("notification",-1));
   service.stopForeground(true);service.stopSelf();
   ModernDebug.record("Notification close handled");
  }else{
   // An invalid command must not stop an existing service/player.
   try{if(Playback214.get(service,"e")==null&&Playback214.get(service,"z")==null)service.stopSelf();}catch(Exception ignored){}
  }
  return true;
 }
}
