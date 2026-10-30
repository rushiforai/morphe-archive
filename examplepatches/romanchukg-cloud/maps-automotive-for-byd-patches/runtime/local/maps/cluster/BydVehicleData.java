package local.maps.cluster;

import android.app.Activity;
import android.content.Context;
import android.os.*;
import java.io.*;
import java.lang.reflect.*;
import java.util.Locale;
import java.util.concurrent.*;
import org.json.JSONObject;

/** One-shot, read-only charge probe from Maps' own UID. Never runs a shell command. */
final class BydVehicleData {
    interface Result { void ready(String summary); }
    private static final ExecutorService worker=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"MapsVehicleRead");t.setDaemon(true);return t;});
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static boolean busy;
    static synchronized void read(Activity activity,Result result){
        if(busy){result.ready("A vehicle read is already in progress. Try Refresh shortly.");return;}
        busy=true;Context context=activity.getApplicationContext();
        worker.execute(()->{
            JSONObject report=new JSONObject();String summary;
            try {
                report.put("uid",android.os.Process.myUid()).put("timestamp_ms",System.currentTimeMillis());
                report.put("permissions_requested",false).put("vehicle_writes",false);
                JSONObject sdk=new JSONObject();
                sdk.put("soc",sdk(context,"getElecPercentageValue",true));
                sdk.put("range",sdk(context,"getElecDrivingRangeValue",false));report.put("sdk",sdk);
                String protocol=(String)Class.forName("android.os.SystemProperties").getMethod("get",String.class).invoke(null,"ro.car.protocol");
                if(protocol.isEmpty())protocol=(String)Class.forName("android.os.SystemProperties").getMethod("get",String.class).invoke(null,"sys.car.protocol");
                report.put("protocol",protocol);
                JSONObject direct=new JSONObject();
                if("CANFD".equals(protocol)){
                    IBinder service=(IBinder)Class.forName("android.os.ServiceManager").getMethod("getService",String.class).invoke(null,"autoservice");
                    if(service!=null&&service.isBinderAlive()){
                        direct.put("soc",binder(service,7,1246777400,true));
                        direct.put("range",binder(service,5,1246765118,false));
                    }else direct.put("status","autoservice unavailable");
                }else direct.put("status","Unsupported protocol; no Binder requests sent");
                report.put("direct_binder",direct);
                summary="Battery: "+display(sdk,direct,"soc")+"\nElectric range: "+display(sdk,direct,"range")
                    +"\n\nSDK battery: "+display(sdk,new JSONObject(),"soc")+"\nDirect battery: "+display(direct,new JSONObject(),"soc")
                    +"\n\nRead from Maps (UID "+android.os.Process.myUid()+"). No permission request or ADB reader.";
            }catch(Throwable error){try{report.put("error",failure(error));}catch(Exception ignored){}summary="Vehicle data unavailable ("+cause(error).getClass().getSimpleName()+").";}
            // Private diagnostic artifact; contains only these two readings, never account/location data.
            try{File folder=context.getExternalFilesDir(null);if(folder!=null)try(FileWriter out=new FileWriter(new File(folder,"byd-vehicle-data.json"))){out.write(report.toString(2));}}
            catch(Exception ignored){}
            String message=summary;
            synchronized(BydVehicleData.class){busy=false;}
            main.post(()->{if(!activity.isFinishing()&&!activity.isDestroyed())result.ready(message);});
        });
    }
    private static Throwable cause(Throwable e){while(e instanceof InvocationTargetException&&e.getCause()!=null)e=e.getCause();return e;}
    private static JSONObject failure(Throwable error)throws Exception{
        Throwable e=cause(error);return new JSONObject().put("status",e instanceof SecurityException?"denied":"unavailable").put("error_class",e.getClass().getSimpleName());
    }
    private static JSONObject sdk(Context c,String method,boolean soc)throws Exception{
        try{Class<?> type=Class.forName("android.hardware.bydauto.statistic.BYDAutoStatisticDevice");Object device=type.getMethod("getInstance",Context.class).invoke(null,c);
            return reading(((Number)type.getMethod(method).invoke(device)).doubleValue(),soc);
        }catch(Throwable e){return failure(e);}
    }
    private static JSONObject binder(IBinder service,int tx,int fid,boolean soc)throws Exception{
        Parcel request=Parcel.obtain(),reply=Parcel.obtain();
        try{
            request.writeInterfaceToken("android.gui.BYDAutoServer");request.writeInt(1014);request.writeInt(fid);
            if(!service.transact(tx,request,reply,0))throw new IllegalStateException("Unsupported getter");
            if(reply.dataSize()!=8)throw new IllegalStateException("Unexpected reply");
            int status=reply.readInt();
            if(status==-2147482644)return new JSONObject().put("status","denied").put("byd_status",status);
            if(status!=0)return new JSONObject().put("status","unavailable").put("byd_status",status);
            return reading(soc?reply.readFloat():reply.readInt(),soc);
        }catch(Throwable e){return failure(e);}finally{reply.recycle();request.recycle();}
    }
    static boolean valid(double n,boolean soc){return Double.isFinite(n)&&n>=0&&(soc?n<=100:n<=3000&&n==Math.rint(n)&&n!=1000&&n!=1023);}
    private static JSONObject reading(double n,boolean soc)throws Exception{
        JSONObject row=new JSONObject().put("status",valid(n,soc)?"available":"unknown");
        if(Double.isFinite(n))row.put("raw",n);
        if(valid(n,soc))row.put("display",String.format(Locale.US,soc?"%.1f %%":"%.0f km",n));return row;
    }
    private static String display(JSONObject first,JSONObject second,String key){
        JSONObject a=first.optJSONObject(key),b=second.optJSONObject(key);
        if(a!=null&&"available".equals(a.optString("status")))return a.optString("display");
        if(b!=null&&"available".equals(b.optString("status")))return b.optString("display");
        if(a!=null&&"denied".equals(a.optString("status"))||b!=null&&"denied".equals(b.optString("status")))return "Access denied by BYD";
        return "Unavailable";
    }
}
