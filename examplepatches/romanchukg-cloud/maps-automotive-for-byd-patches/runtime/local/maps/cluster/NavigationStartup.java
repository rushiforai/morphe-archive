package local.maps.cluster;

import android.app.*;
import android.content.Intent;
import android.os.SystemClock;
import android.util.Log;
import java.lang.ref.WeakReference;

/** Local lifecycle timing only. Never logs route intents, account data or notification text. */
public final class NavigationStartup {
    private static final String TAG="MapsNavStartup";
    private static long createAt,commandAt;
    private static WeakReference<Service> current=new WeakReference<>(null);
    private static void event(String value){Log.i(TAG,"t="+SystemClock.uptimeMillis()+" "+value);}
    public static void create(Service service){current=new WeakReference<>(service);createAt=SystemClock.uptimeMillis();event("serviceCreate begin");}
    public static void created(){
        boolean initialized=false;Service service=current.get();
        try{java.lang.reflect.Field f=service.getClass().getDeclaredField("i");f.setAccessible(true);initialized=f.getBoolean(service);}catch(Exception ignored){}
        event("serviceCreate end ms="+(SystemClock.uptimeMillis()-createAt)+" initialized="+initialized);
    }
    public static void command(Service service,Intent intent){commandAt=SystemClock.uptimeMillis();event("serviceCommand begin nullIntent="+(intent==null));}
    public static void commandFinished(){event("serviceCommand end ms="+(SystemClock.uptimeMillis()-commandAt));}
    public static void missingChannel(){event("navigationChannel registryMissing");}
    public static void promote(Service service,int id,Notification notification){
        long began=SystemClock.uptimeMillis();event("promote begin channel="+notification.getChannelId());
        try{service.startForeground(id,notification);event("promote success ms="+(SystemClock.uptimeMillis()-began));}
        catch(RuntimeException e){event("promote failed type="+e.getClass().getSimpleName());throw e;}
    }
}
