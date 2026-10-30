// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.*;
import android.content.*;
import android.os.*;
import android.provider.Settings;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicLong;
import org.json.JSONObject;

/** Opt-in local ADB supervisor. No root, remote endpoint, bundled key, car writes or main-thread I/O. */
public final class VehicleAutoReader {
    private static final String SAMPLER="local.maps.cluster.VehicleShellSampler";
    private static final ScheduledExecutorService worker=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"MapsVehicleAuto");t.setDaemon(true);return t;});
    private static final AtomicLong generation=new AtomicLong();
    private static volatile Context context;
    private static volatile boolean enabled,loaded;
    private static volatile String state="Automatic reader is loading.";
    private static volatile VehicleLocalAdb connection;
    private static boolean registered;
    private VehicleAutoReader(){}

    public static void install(Context input){
        if(context!=null)return;
        synchronized(VehicleAutoReader.class){
            if(context!=null)return;Context app=input.getApplicationContext();context=app==null?input:app;
            final long loadingEpoch=generation.get();
            worker.execute(()->{
                boolean saved=false;
                try{saved=context.getSharedPreferences("local_vehicle_auto",0).getBoolean("enabled",false);}catch(RuntimeException ignored){}
                if(generation.get()==loadingEpoch)enabled=saved;loaded=true;
                state=enabled?"Waiting for the vehicle reader.":"Automatic reader is off.";
            // This receiver only queues bounded work; it never holds a wake lock through car sleep.
            IntentFilter filter=new IntentFilter(Intent.ACTION_SCREEN_ON);filter.addAction(Intent.ACTION_USER_PRESENT);
            BroadcastReceiver wake=new BroadcastReceiver(){public void onReceive(Context c,Intent i){trigger(c,false);}};
            if(Build.VERSION.SDK_INT>=33)context.registerReceiver(wake,filter,Context.RECEIVER_NOT_EXPORTED);else context.registerReceiver(wake,filter);
            if(context instanceof Application)((Application)context).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
                public void onActivityResumed(Activity a){trigger(a,false);} public void onActivityCreated(Activity a,Bundle b){}public void onActivityStarted(Activity a){}public void onActivityPaused(Activity a){}public void onActivityStopped(Activity a){}public void onActivitySaveInstanceState(Activity a,Bundle b){}public void onActivityDestroyed(Activity a){}
            });

                attempt(false);
            });
            if(!registered){registered=true;worker.scheduleWithFixedDelay(()->attempt(false),15,15,TimeUnit.SECONDS);}
        }
    }
    public static void trigger(Context c,boolean authorize){install(c);worker.execute(()->attempt(authorize));}
    public static void runJob(Context c,Runnable finished){install(c);worker.execute(()->{try{attempt(false);}finally{finished.run();}});}
    /** Called after the vehicle opt-in changes, without replacing the EV repository's observer. */
    static void changed(){
        Context c=context;if(c==null)return;
        if(!VehicleDataStore.enabled(c)){generation.incrementAndGet();VehicleLocalAdb old=connection;if(old!=null)old.close();}
        worker.execute(()->attempt(false));
    }
    static boolean enabled(){return enabled;}
    static boolean loaded(){return loaded;}
    static String description(){return state;}
    static void configure(Context c,boolean on,boolean authorize,Runnable finished){
        install(c);long epoch=generation.incrementAndGet();enabled=on;state=on?"Preparing local ADB authorization…":"Automatic reader is off.";
        VehicleLocalAdb old=connection;if(old!=null)old.close();
        worker.execute(()->{
            try{
                if(generation.get()!=epoch)return;
                if(!on){VehicleAutoJob.cancel(context);endOwnLease();}
                if(!context.getSharedPreferences("local_vehicle_auto",0).edit().putBoolean("enabled",on).commit())throw new IOException();
                loaded=true;
                if(on)attempt(authorize);else{VehicleAutoJob.cancel(context);endOwnLease();}
            }catch(Exception e){if(generation.get()==epoch){enabled=false;state="Could not save automatic-reader setting.";VehicleAutoJob.cancel(context);endOwnLease();}}
            finally{if(finished!=null)new Handler(Looper.getMainLooper()).post(finished);}
        });
    }
    private static boolean allowed(long epoch){Context c=context;return c!=null&&enabled&&generation.get()==epoch&&VehicleDataStore.enabled(c);}
    private static void check(long epoch)throws IOException{if(!allowed(epoch))throw new IOException("Vehicle reader opt-in changed");}
    private static int boot(){return Settings.Global.getInt(context.getContentResolver(),Settings.Global.BOOT_COUNT,-1);}
    private static AtomicFile ownFile(){return new AtomicFile(new File(context.getNoBackupFilesDir(),"local-vehicle-auto.json"));}
    private static JSONObject loadOwn()throws Exception{
        try(InputStream in=ownFile().openRead()){
            ByteArrayOutputStream out=new ByteArrayOutputStream();byte[] b=new byte[512];int n;
            while((n=in.read(b))!=-1){if(out.size()+n>4096)throw new IOException();out.write(b,0,n);}
            JSONObject s=new JSONObject(new String(out.toByteArray(),StandardCharsets.UTF_8));
            if(!s.getString("session").matches("[0-9a-f]{32}")||!source(s.getString("apk"))||s.getInt("boot")<0)throw new IOException();
            if(s.has("pid")&&(s.getInt("pid")<=1||s.getInt("pid")==Integer.MAX_VALUE))throw new IOException();
            if(s.has("ticks")&&!s.getString("ticks").matches("[0-9]+"))throw new IOException();return s;
        }catch(FileNotFoundException none){return null;}
    }
    private static void saveOwn(JSONObject value)throws Exception{
        AtomicFile f=ownFile();FileOutputStream out=null;try{out=f.startWrite();out.write(value.toString().getBytes(StandardCharsets.UTF_8));f.finishWrite(out);}catch(Exception e){if(out!=null)f.failWrite(out);throw e;}
    }
    private static boolean source(String value){return value!=null&&value.startsWith("/data/app/")&&value.endsWith("/base.apk")&&value.matches("[A-Za-z0-9_./=+~-]+")&&!value.contains("/../");}
    private static String quote(String value){return "'"+value.replace("'","'\\''")+"'";}
    private static String marker(JSONObject s)throws Exception{return "/data/local/tmp/maps-auto-vehicle-"+s.getString("session")+".pid";}
    private static String nice(JSONObject s)throws Exception{return SAMPLER+"|"+s.getString("session")+"|"+s.getString("apk");}
    private static String session(){byte[] bytes=new byte[16];new SecureRandom().nextBytes(bytes);StringBuilder s=new StringBuilder();for(byte b:bytes)s.append(String.format(Locale.US,"%02x",b&255));return s.toString();}
    private static void endOwnLease(){
        try{JSONObject s=loadOwn();if(s==null||s.getInt("boot")!=boot())return;JSONObject status=VehicleDataStore.status(context);
            if(s.getString("session").equals(status.optString("session")))VehicleDataStore.end(context,new JSONObject().put("session",s.getString("session")).toString());
        }catch(Exception ignored){}
    }
    // No process signals. A revoked reader must exit itself before another one is launched.
    private static String process(VehicleLocalAdb adb,JSONObject s)throws Exception{
        if(!s.has("pid")){
            String p=adb.execute("if test -L "+quote(marker(s))+"; then printf symlink; else cat "+quote(marker(s))+" 2>/dev/null; fi").trim();
            if(!p.matches("[0-9]{1,10}"))return p.isEmpty()?"gone":"unknown";
            long pid=Long.parseLong(p);if(pid<=1||pid>=Integer.MAX_VALUE)return "unknown";s.put("pid",pid);saveOwn(s);
        }
        String pid=Integer.toString(s.getInt("pid"));
        if("absent".equals(adb.execute("if test -d /proc/"+pid+"; then printf present; else printf absent; fi").trim()))return "gone";
        String command=adb.execute("cat /proc/"+pid+"/cmdline");String expected=nice(s);
        String clean=command.replaceAll("[\\x00\\n]+$","");
        String tail="/system/bin\0--nice-name="+expected+"\0"+SAMPLER+"\0"+s.getString("session")+"\0--continuous";
        if(!clean.equals(expected)&&!clean.equals("app_process\0"+tail)&&!clean.equals("/system/bin/app_process\0"+tail))return "mismatch";
        String status=adb.execute("cat /proc/"+pid+"/status");
        if(!java.util.regex.Pattern.compile("(?m)^Uid:\\s+2000\\s+2000\\s+2000\\s+2000\\s*$").matcher(status).find())return "mismatch";
        String stat=adb.execute("cat /proc/"+pid+"/stat");int close=stat.lastIndexOf(')');String[] fields=stat.substring(close+1).trim().split("\\s+");
        if(close<0||fields.length<20||!fields[19].matches("[0-9]+"))return "unknown";String ticks=fields[19];
        if(s.has("ticks")&&!ticks.equals(s.getString("ticks")))return "mismatch";s.put("ticks",ticks);saveOwn(s);return "own";
    }
    private static void attempt(boolean authorize){
        Context c=context;if(c==null||!loaded)return;
        if(!enabled){VehicleAutoJob.cancel(c);return;}
        if(!VehicleDataStore.access(c).loaded){state="Waiting for BYD-data settings.";worker.schedule(()->attempt(false),1000,TimeUnit.MILLISECONDS);return;}
        if(!VehicleDataStore.enabled(c)){state="Automatic reader is paused: turn on BYD vehicle data.";VehicleAutoJob.cancel(c);endOwnLease();return;}
        long epoch=generation.get();JSONObject record=null;String stage="cache";
        try{
            check(epoch);JSONObject status=VehicleDataStore.status(c);record=loadOwn();
            boolean live=VehicleDataStore.access(c).readerActive;String sid=status.optString("session");int boot=boot();if(boot<0)throw new IOException();
            if(live&&(record==null||record.getInt("boot")!=boot||!record.getString("session").equals(sid))){state="A manually started reader is active.";VehicleAutoJob.schedule(c,30000);return;}
            String apk=c.getApplicationInfo().sourceDir;if(!source(apk))throw new IOException();
            stage="connect";
            try(VehicleLocalAdb adb=VehicleLocalAdb.open(c.getNoBackupFilesDir(),authorize,()->allowed(epoch))){
                connection=adb;stage="identity";check(epoch);if(!"2000".equals(adb.execute("id -u").trim()))throw new IOException();
                // The sampler selects documented CAN/CANFD or the explicit legacy probe.
                // Unknown automatic protocols publish unsupported values without car getters.
                stage="recover";if(record!=null){
                    if(record.getInt("boot")!=boot){adb.execute("rm -f "+quote(marker(record)));ownFile().delete();record=null;}
                    else{
                        String identity=process(adb,record);check(epoch);
                        boolean stalled=!status.optBoolean("fresh")&&((status.optLong("sample_age_ms",-1)>VehicleReadingRules.MAX_AGE_MS)||(status.optLong("sample_age_ms",-1)<0&&SystemClock.elapsedRealtime()-record.optLong("created_elapsed",0)>VehicleReadingRules.MAX_AGE_MS));
                        if("own".equals(identity)&&live&&!stalled&&apk.equals(record.getString("apk"))){state=status.optBoolean("fresh")?"Automatic reader connected.":"Automatic reader running; waiting for fresh data.";VehicleAutoJob.schedule(c,60000);return;}
                        if(!"own".equals(identity)&&!"gone".equals(identity)){state="Previous reader identity cannot be verified; waiting.";VehicleAutoJob.schedule(c,30000);return;}
                        if(record.getString("session").equals(sid))VehicleDataStore.end(c,new JSONObject().put("session",record.getString("session")).toString());
                        if("own".equals(identity)){
                            for(int i=0;i<8&&"own".equals(identity);i++){Thread.sleep(250);check(epoch);identity=process(adb,record);}
                            if(!"gone".equals(identity)){state="Waiting for the previous reader to finish.";VehicleAutoJob.schedule(c,30000);return;}
                        }
                        adb.execute("rm -f "+quote(marker(record)));ownFile().delete();record=null;
                    }
                }
                check(epoch);record=new JSONObject().put("session",session()).put("boot",boot).put("apk",apk).put("phase","beginning").put("created_elapsed",SystemClock.elapsedRealtime());saveOwn(record);
                stage="begin";VehicleDataStore.begin(c,new JSONObject().put("session",record.getString("session")).put("mode","continuous").toString());check(epoch);
                record.put("phase","launching");saveOwn(record);String m=marker(record);
                String cmd="umask 077; CLASSPATH="+quote(apk)+" nohup app_process /system/bin --nice-name="+quote(nice(record))+" "+SAMPLER+" "+record.getString("session")+" --continuous > /dev/null 2>&1 < /dev/null & maps_vehicle_pid=$!; printf '%s\\n' \"$maps_vehicle_pid\" > "+quote(m)+"; printf '%s\\n' \"$maps_vehicle_pid\"";
                stage="launch";check(epoch);String p=adb.execute(cmd).trim();check(epoch);if(p.matches("[0-9]{1,10}")){long pid=Long.parseLong(p);if(pid>1&&pid<Integer.MAX_VALUE){record.put("pid",pid);saveOwn(record);}}
                stage="verify";String identity="unknown";for(int i=0;i<8;i++){check(epoch);identity=process(adb,record);if("own".equals(identity))break;Thread.sleep(250);}
                if(!"own".equals(identity))throw new IOException();record.put("phase","running");saveOwn(record);state="Automatic reader connected.";android.util.Log.i("MapsVehicleAuto","reader launched and verified");VehicleAutoJob.schedule(c,60000);
            }
        }catch(VehicleLocalAdb.ApprovalRequiredException approval){state="Allow the Maps ADB key on this head unit, then retry. Select Always allow for automatic startup.";if(enabled)VehicleAutoJob.schedule(c,30000);}
        catch(Exception unavailable){String reason=unavailable.getMessage();boolean safe=reason!=null&&reason.contains("ADB ")&&reason.matches("[A-Za-z0-9 :()./-]{1,120}");android.util.Log.w("MapsVehicleAuto",VehicleReaderFailure.stage(stage)+": "+VehicleReaderFailure.type(unavailable)+(safe?" / "+reason:""));if(enabled)state=VehicleReaderFailure.message(stage,unavailable);if(enabled)VehicleAutoJob.schedule(c,30000);}
        finally{connection=null;if(!allowed(epoch)){endOwnLease();if(!enabled||!VehicleDataStore.enabled(c))VehicleAutoJob.cancel(c);if(!enabled)state="Automatic reader is off.";}}
    }
}
