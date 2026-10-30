// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.os.SystemClock;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;
import org.json.JSONObject;

/** Manual app_process entry point from this same APK, always shell UID2000. */
public final class VehicleShellSampler {
    private static volatile Process delivery;
    private static final String URI="content://com.google.android.apps.maps.automotive.local.vehicle";
    public static void main(String[] args)throws Exception{
        if(android.os.Process.myUid()!=2000)throw new SecurityException("Authorized ADB reader session required");
        boolean continuous=VehicleReadingRules.continuousMode(args);
        Runtime.getRuntime().addShutdownHook(new Thread(()->{Process child=delivery;if(child!=null)child.destroy();},"vehicle-reader-shutdown"));
        long started=SystemClock.elapsedRealtime();
        System.out.println(continuous?"continuous_vehicle_reader_started":"bounded_vehicle_reader_started");
        try{run(continuous,args[0],started,PROVIDER,DEVICE);}
        finally{Process child=delivery;if(child!=null)child.destroy();}
        System.out.println(continuous?"continuous_vehicle_reader_finished":"bounded_vehicle_reader_finished");
    }
    /** The provider and BYD binder calls of one session; PROVIDER is the only production implementation. */
    interface Channel {
        boolean call(String method,JSONObject packet)throws Exception;
        JSONObject read(String session)throws Exception;
    }
    private static final Channel PROVIDER=new Channel(){
        public boolean call(String method,JSONObject packet)throws Exception{return VehicleShellSampler.call(method,packet);}
        public JSONObject read(String session)throws Exception{return VehicleBinderReader.read(session);}
    };
    static void run(boolean continuous,String session,long started,Channel channel,VehicleWakeWait.Source clock)throws Exception{
        for(int cycle=0;VehicleReadingRules.continueSampling(continuous,cycle,clock.elapsed()-started);cycle++){
            if(continuous){
                boolean renewed;try{renewed=channel.call("renew",new JSONObject().put("session",session));}catch(Exception unavailable){renewed=false;}
                // Off, stopped, expired, rebooted or mismatched sessions cannot be resurrected.
                if(!renewed){System.out.println("reader_renewal_rejected_or_unavailable");break;}
            }
            JSONObject sample;
            try{sample=channel.read(session);}catch(Exception unavailable){sample=null;}
            if(!continuous&&clock.elapsed()-started>=VehicleReadingRules.LEASE_MS)break;
            if(sample==null){channel.call("end",new JSONObject().put("session",session));System.out.println("vehicle_source_unavailable_session_ended");break;}
            if(sample!=null){
                boolean sent;try{sent=channel.call("sample",sample);}catch(Exception unavailable){sent=false;}
                if(!sent){channel.call("end",new JSONObject().put("session",session));System.out.println("sample_rejected_or_delivery_unavailable");break;}
                System.out.println("vehicle_sample_delivered");
            }else System.out.println("vehicle_source_unavailable");
            // 54H: continuous mode samples at once after the car wakes (next cycle renews first, so an ended session stops).
            if(continuous)woke(VehicleWakeWait.await(clock));else clock.sleep(VehicleReadingRules.PERIOD_MS);
        }
    }
    private static void woke(String reason){
        if(VehicleWakeWait.PERIOD.equals(reason))return;
        System.out.println("vehicle_wake_sample_"+reason);
        try{android.util.Log.i("MapsVehicleWake","wake sample: "+reason);}catch(RuntimeException ignored){}
    }
    /** Shell process clock and IPowerManager.isInteractive() via ServiceManager, as for autoservice:
     * no permission, no Context, no wake lock. A missing interface leaves only the clock-jump signal. */
    private static final VehicleWakeWait.Source DEVICE=new VehicleWakeWait.Source(){
        private Object power;private java.lang.reflect.Method interactive;private boolean unsupported;
        public long elapsed(){return SystemClock.elapsedRealtime();}
        public long uptime(){return SystemClock.uptimeMillis();}
        public void sleep(long ms)throws InterruptedException{Thread.sleep(ms);}
        public Boolean interactive(){
            if(unsupported)return null;
            try{
                if(interactive==null){
                    Object binder=Class.forName("android.os.ServiceManager").getMethod("getService",String.class).invoke(null,"power");
                    if(binder==null)return null;
                    power=Class.forName("android.os.IPowerManager$Stub").getMethod("asInterface",android.os.IBinder.class).invoke(null,binder);
                    interactive=Class.forName("android.os.IPowerManager").getMethod("isInteractive");
                }
                return (Boolean)interactive.invoke(power);
            }catch(ClassNotFoundException|NoSuchMethodException|ClassCastException missing){unsupported=true;return null;}
            catch(Exception transientFailure){interactive=null;power=null;return null;}
        }
    };
    static JSONObject options(JSONObject packet)throws Exception{return exchange("reader_options",packet,"options");}
    static void cache(JSONObject packet)throws Exception{exchange("reader_cache",packet,null);}
    private static boolean call(String method,JSONObject packet)throws Exception{
        if(!"sample".equals(method)&&!"renew".equals(method)&&!"end".equals(method))throw new IllegalArgumentException("Unsupported reader operation");
        try{exchange(method,packet,null);return true;}catch(Exception rejected){return false;}
    }
    static JSONObject replyObject(String output,String field)throws Exception{
        String text=output.trim(),prefix="Result: Bundle[{",suffix="}]";
        if(!text.startsWith(prefix)||!text.endsWith(suffix))throw new IOException("Invalid vehicle options reply");
        org.json.JSONTokener parser=new org.json.JSONTokener(text.substring(prefix.length(),text.length()-suffix.length()));
        boolean accepted=false,seen=false;JSONObject result=null;
        for(int i=0;i<2;i++){
            String key=parser.nextTo('=').trim();if(parser.next()!='=')throw new IOException("Invalid options field");Object value=parser.nextValue();
            if("accepted".equals(key)&&!seen){if(!Boolean.TRUE.equals(value))throw new IOException("Options rejected");accepted=true;seen=true;}
            else if(field.equals(key)&&result==null&&value instanceof JSONObject)result=(JSONObject)value;
            else throw new IOException("Unexpected options field");
            char next=parser.nextClean();if(i==0&&next!=','||i==1&&next!=0)throw new IOException("Invalid options delimiter");
        }
        if(!accepted||result==null)throw new IOException("Incomplete options reply");return result;
    }
    private static JSONObject exchange(String method,JSONObject packet,String field)throws Exception{
        if(!java.util.Arrays.asList("sample","renew","end","reader_options","reader_cache").contains(method))throw new IllegalArgumentException("Unsupported reader operation");
        Process child=new ProcessBuilder("/system/bin/content","call","--uri",URI,"--method",method,"--arg",packet.toString()).redirectErrorStream(true).start();delivery=child;
        try{
            if(!child.waitFor(10,TimeUnit.SECONDS)){child.destroyForcibly();throw new IOException("Vehicle provider timed out");}
            ByteArrayOutputStream reply=new ByteArrayOutputStream();
            try(InputStream in=child.getInputStream()){
                byte[] buffer=new byte[512];int n;while(reply.size()<16384&&(n=in.read(buffer,0,Math.min(buffer.length,16384-reply.size())))!=-1)reply.write(buffer,0,n);
            }
            String output=new String(reply.toByteArray(),StandardCharsets.UTF_8);
            if(child.exitValue()!=0)throw new IOException("Vehicle provider rejected request");
            if(field==null){if(!"Result: Bundle[{accepted=true}]".equals(output.trim()))throw new IOException("Invalid vehicle acknowledgement");return null;}
            return replyObject(output,field);
        }finally{delivery=null;child.destroy();}
    }
}
