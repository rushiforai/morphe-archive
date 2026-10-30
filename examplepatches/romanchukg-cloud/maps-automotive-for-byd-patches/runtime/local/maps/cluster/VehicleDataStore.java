// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.AtomicFile;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Private atomic cache bound to this boot, a manual reader lease and acquisition time. */
final class VehicleDataStore {
    private static final Object LOCK=new Object();
    static final class Access {
        volatile boolean enabled,loaded,readerActive;volatile long epoch;volatile String session;
        volatile boolean sourceKnown,energyUsable;volatile String sourceIdentity;
        volatile SharedPreferences preferences;
    }
    interface Observer { void changed(boolean revoke,String session,long epoch); }
    private static volatile Observer observer;
    static void observe(Observer value){observer=value;}
    private static void signal(boolean revoke,String session,long epoch){Observer target=observer;if(target!=null)try{target.changed(revoke,session,epoch);}catch(RuntimeException ignored){}}
    private static final Map<String,Access> ACCESS=new HashMap<>();
    private static final ExecutorService loader=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"MapsVehiclePreferences");t.setDaemon(true);return t;});
    static Access access(Context c){
        String key=c.getApplicationInfo().dataDir;
        if(key==null)throw new IllegalStateException("Application storage identity unavailable");
        synchronized(ACCESS){
            Access value=ACCESS.get(key);
            if(value==null){
                value=new Access();ACCESS.put(key,value);Access target=value;Context context=c.getApplicationContext();
                loader.execute(()->{
                    try{
                        SharedPreferences preferences=context.getSharedPreferences("local_vehicle_data",Context.MODE_PRIVATE);
                        boolean saved=preferences.getBoolean("enabled",false);
                        synchronized(target){target.preferences=preferences;if(target.epoch==0)target.enabled=saved;target.loaded=true;}
                    }catch(RuntimeException e){synchronized(target){target.loaded=true;}}
                });
            }
            return value;
        }
    }
    static boolean enabled(Context c){return access(c).enabled;}
    /** Immediate, nonblocking revocation. Persistence/cache work follows on a worker. */
    static long requestEnabled(Context c){
        Access value=access(c);
        long token;synchronized(value){value.enabled=false;value.readerActive=false;value.energyUsable=false;value.sourceKnown=true;value.sourceIdentity=null;token=++value.epoch;SharedPreferences preferences=value.preferences;if(preferences!=null)preferences.edit().putBoolean("enabled",false).apply();}signal(true,null,token);return token;
    }
    static boolean finishEnabled(Context c,boolean on,long token)throws Exception{
        Access value=access(c);
        synchronized(LOCK){
            if(value.epoch!=token)return false;
            save(c,new JSONObject()); // A new opt-in never revives an old reader or sample.
            if(value.epoch!=token)return false;
            SharedPreferences preferences=c.getSharedPreferences("local_vehicle_data",Context.MODE_PRIVATE);
            preferences.getBoolean("enabled",false); // Wait for initial loading only on this worker.
            value.preferences=preferences;
            if(!preferences.edit().putBoolean("enabled",on).commit())throw new IOException("Cannot save vehicle-data setting");
            synchronized(value){
                if(value.epoch!=token){preferences.edit().putBoolean("enabled",false).apply();return false;}
                value.enabled=on;value.loaded=true;
            }
        }
        signal(false,null,token);return true;
    }
    static void setEnabled(Context c,boolean on)throws Exception{long token=requestEnabled(c);finishEnabled(c,on,token);}
    private static void requireEnabled(Access access,long epoch){if(!access.enabled||access.epoch!=epoch)throw new IllegalStateException("BYD vehicle data is disabled or changed");}
    private static JSONObject disabled()throws JSONException{return new JSONObject().put("schema",1).put("enabled",false).put("reader_state","DISABLED").put("fresh",false).put("sample_age_ms",-1).put("valid_until_elapsed_ms",0).put("values",new JSONObject());}
    private static AtomicFile file(Context c){return new AtomicFile(new File(c.getNoBackupFilesDir(),"local-vehicle-reader.json"));}
    private static int boot(Context c){try{return Settings.Global.getInt(c.getContentResolver(),Settings.Global.BOOT_COUNT,-1);}catch(RuntimeException e){return -1;}}
    private static JSONObject load(Context c)throws Exception{
        try(InputStream in=file(c).openRead();ByteArrayOutputStream out=new ByteArrayOutputStream()){
            byte[] buffer=new byte[1024];int n;
            while((n=in.read(buffer))!=-1){if(out.size()+n>VehicleSampleCodec.MAX_BYTES)throw new IOException("Vehicle cache too large");out.write(buffer,0,n);}
            JSONObject state=VehicleSampleCodec.object(new String(out.toByteArray(),StandardCharsets.UTF_8));
            if(state.length()!=0){
                List<String> keys=new ArrayList<>(Arrays.asList("schema","session","boot_count","active","started_elapsed_ms","lease_deadline_elapsed_ms"));
                for(String optional:new String[]{"mode","lease_refreshed_elapsed_ms","sample"})if(state.has(optional))keys.add(optional);
                VehicleSampleCodec.keys(state,keys.toArray(new String[0]));
                VehicleSampleCodec.session(state);
                long started=VehicleSampleCodec.integer(state,"started_elapsed_ms"),deadline=VehicleSampleCodec.integer(state,"lease_deadline_elapsed_ms");
                String mode=mode(state);long refreshed=state.has("lease_refreshed_elapsed_ms")?VehicleSampleCodec.integer(state,"lease_refreshed_elapsed_ms"):started;
                if(VehicleSampleCodec.integer(state,"schema")!=1||VehicleSampleCodec.integer(state,"boot_count")>Integer.MAX_VALUE
                    ||!(state.get("active") instanceof Boolean)||refreshed<started||deadline<refreshed||deadline-refreshed!=VehicleReadingRules.LEASE_MS
                    ||"bounded".equals(mode)&&refreshed!=started||"continuous".equals(mode)&&!state.has("lease_refreshed_elapsed_ms")
                    ||state.has("sample")&&!(state.get("sample") instanceof JSONObject))throw new IllegalArgumentException("Invalid vehicle cache");
            }
            return state;
        }catch(FileNotFoundException empty){return new JSONObject();}
    }
    private static void save(Context c,JSONObject state)throws Exception{
        AtomicFile file=file(c);FileOutputStream stream=null;
        try{stream=file.startWrite();stream.write(state.toString().getBytes(StandardCharsets.UTF_8));file.finishWrite(stream);}
        catch(Exception e){if(stream!=null)file.failWrite(stream);throw e;}
    }
    private static boolean live(JSONObject state,int boot,long now){
        return boot>=0&&state.optInt("boot_count",-1)==boot&&state.optBoolean("active",false)
            &&state.optLong("started_elapsed_ms",-1)>=0&&state.optLong("started_elapsed_ms",-1)<=now
            &&state.optLong("lease_refreshed_elapsed_ms",state.optLong("started_elapsed_ms",-1))<=now
            &&now<state.optLong("lease_deadline_elapsed_ms",-1);
    }
    private static String mode(JSONObject object)throws JSONException{
        Object value=object.has("mode")?object.get("mode"):"bounded";
        if(!(value instanceof String)||!Arrays.asList("bounded","continuous").contains(value))throw new IllegalArgumentException("Invalid reader mode");
        return (String)value;
    }
    static void begin(Context c,String text)throws Exception{
        JSONObject request=VehicleSampleCodec.object(text);
        if(request.has("mode"))VehicleSampleCodec.keys(request,"session","mode");else VehicleSampleCodec.keys(request,"session");
        String session=VehicleSampleCodec.session(request),mode=mode(request);Access access=access(c);long epoch=access.epoch;requireEnabled(access,epoch);int boot=boot(c);
        synchronized(LOCK){
            requireEnabled(access,epoch);long now=SystemClock.elapsedRealtime();if(boot<0)throw new IllegalStateException("Boot identity unavailable");
            JSONObject previous=load(c);if(live(previous,boot,now))throw new IllegalStateException("Reader session already active");
            save(c,new JSONObject().put("schema",1).put("session",session).put("boot_count",boot).put("active",true)
                .put("mode",mode).put("started_elapsed_ms",now).put("lease_refreshed_elapsed_ms",now).put("lease_deadline_elapsed_ms",now+VehicleReadingRules.LEASE_MS));
            access.energyUsable=false;access.sourceKnown=true;access.sourceIdentity=null;access.session=session;access.readerActive=true;
        }
    }
    static void renew(Context c,String text)throws Exception{
        JSONObject request=VehicleSampleCodec.object(text);VehicleSampleCodec.keys(request,"session");String session=VehicleSampleCodec.session(request);
        Access access=access(c);long epoch=access.epoch;requireEnabled(access,epoch);int boot=boot(c);
        synchronized(LOCK){
            requireEnabled(access,epoch);long now=SystemClock.elapsedRealtime();JSONObject state=load(c);
            if(!live(state,boot,now)||!session.equals(state.optString("session"))||!"continuous".equals(mode(state)))throw new IllegalStateException("Continuous reader inactive");
            state.put("lease_refreshed_elapsed_ms",now).put("lease_deadline_elapsed_ms",now+VehicleReadingRules.LEASE_MS);save(c,state);
        }
    }
    static void receive(Context c,String text)throws Exception{
        JSONObject sample=VehicleSampleCodec.sample(text);Access access=access(c);long epoch=access.epoch;requireEnabled(access,epoch);int boot=boot(c);
        boolean revoke;
        synchronized(LOCK){
            requireEnabled(access,epoch);JSONObject state=load(c);long now=SystemClock.elapsedRealtime();
            if(!live(state,boot,now)||!sample.getString("session").equals(state.optString("session")))throw new IllegalStateException("Reader session inactive");
            long captured=sample.getLong("captured_elapsed_ms");
            if(captured<state.getLong("started_elapsed_ms")||!VehicleReadingRules.fresh(captured,now,now,boot,boot,state.getLong("lease_deadline_elapsed_ms")))throw new IllegalArgumentException("Vehicle sample too old");
            JSONObject previous=state.optJSONObject("sample");
            if(previous!=null&&captured<=previous.getLong("captured_elapsed_ms"))throw new IllegalArgumentException("Vehicle sample replayed");
            sample.put("received_elapsed_ms",now);state.put("sample",sample);save(c,state);
            access.session=state.getString("session");access.readerActive=true;
            revoke=sourceState(access,sample,true);
        }
        if(revoke)signal(true,sample.getString("session"),epoch);
    }
    /** Caller holds LOCK. Invalid/new provenance revokes old native data using volatile fields. */
    private static boolean sourceState(Access access,JSONObject sample,boolean fresh)throws JSONException{
        String identity=sample==null?null:VehicleSampleCodec.identity(sample);boolean usable=false;
        if(fresh&&sample!=null){
            JSONObject values=sample.getJSONObject("values"),soc=values.getJSONObject("soc"),range=values.getJSONObject("range");
            double percent=soc.optDouble("raw",Double.NaN),km=range.optDouble("raw",Double.NaN);
            usable="available".equals(soc.optString("status"))&&"available".equals(range.optString("status"))&&VehicleReadingRules.percent(percent)&&VehicleReadingRules.range(km)&&percent>0&&km>0;
        }
        boolean changed=access.sourceKnown&&!Objects.equals(access.sourceIdentity,identity);
        boolean revoked=access.energyUsable&&!usable;
        // First withdraw before changing identity; native callbacks perform no disk reads.
        if(!access.sourceKnown||changed||!usable)access.energyUsable=false;
        access.sourceKnown=true;access.sourceIdentity=identity;if(usable)access.energyUsable=true;
        return changed||revoked;
    }
    static void end(Context c,String text)throws Exception{
        JSONObject request=VehicleSampleCodec.object(text);VehicleSampleCodec.keys(request,"session");String session=VehicleSampleCodec.session(request);
        if(!enabled(c))return; // OFF already revoked every session; allow the owner to clean its worker.
        Access value=access(c);long endedEpoch;
        synchronized(LOCK){
            JSONObject state=load(c);
            if(!enabled(c)||state.length()==0)return;
            if(!session.equals(state.optString("session")))throw new IllegalStateException("Reader session does not match");
            state.put("active",false);state.remove("sample");save(c,state);
            value.readerActive=false;value.energyUsable=false;value.sourceKnown=true;value.sourceIdentity=null;endedEpoch=value.epoch;
        }
        signal(true,session,endedEpoch);
    }
    static JSONObject status(Context c)throws Exception{
        Access access=access(c);long epoch=access.epoch;
        try{return readStatus(c,access,epoch);}
        catch(Exception failure){
            boolean revoke=false;String sid=null;
            synchronized(LOCK){if(access.epoch==epoch){revoke=sourceState(access,null,false);sid=access.session;}}
            if(revoke)signal(true,sid,epoch);
            throw failure;
        }
    }
    private static JSONObject readStatus(Context c,Access access,long epoch)throws Exception{
        if(!access.enabled){JSONObject result=disabled();if(!access.loaded)result.put("reader_state","LOADING");return result;}
        int boot=boot(c);JSONObject result;boolean revoke;String sid;
        synchronized(LOCK){
            if(!access.enabled||access.epoch!=epoch)return disabled();JSONObject state=load(c);long now=SystemClock.elapsedRealtime();
            boolean active=live(state,boot,now);JSONObject stored=state.optJSONObject("sample"),validated=null;
            String mode=state.length()==0?"NOT_STARTED":boot<0?"BOOT_UNAVAILABLE":state.optInt("boot_count",-1)!=boot?"RESTART_REQUIRED":!state.optBoolean("active",false)?"STOPPED":!active?"EXPIRED":stored==null?"WAITING":"STALE";
            JSONObject values=new JSONObject();long age=-1,validUntil=0;boolean fresh=false;
            if(active&&stored!=null){
                // Revalidate persisted nested values rather than trusting earlier validation.
                JSONObject packet=new JSONObject(stored.toString());long received=VehicleSampleCodec.integer(packet,"received_elapsed_ms");packet.remove("received_elapsed_ms");
                validated=VehicleSampleCodec.sample(packet.toString());long captured=validated.getLong("captured_elapsed_ms");
                if(!validated.getString("session").equals(state.optString("session")))throw new IllegalArgumentException("Vehicle cache session mismatch");
                age=now-captured;
                fresh=VehicleReadingRules.fresh(captured,received,now,state.optInt("boot_count",-1),boot,state.optLong("lease_deadline_elapsed_ms",-1));
                if(fresh){
                    values=validated.getJSONObject("values");mode="FRESH";
                    validUntil=Math.min(captured+VehicleReadingRules.MAX_AGE_MS,state.getLong("lease_deadline_elapsed_ms")-1);
                }
            }
            if(!access.enabled||access.epoch!=epoch)return disabled();
            sid=state.optString("session",null);access.session=sid;access.readerActive=active;
            revoke=sourceState(access,validated,fresh);
            result=new JSONObject().put("schema",1).put("enabled",true).put("access_epoch",epoch).put("session",state.optString("session","")).put("captured_elapsed_ms",stored==null?-1:stored.optLong("captured_elapsed_ms",-1)).put("reader_mode",state.length()==0?"bounded":mode(state)).put("reader_state",mode).put("fresh",fresh).put("sample_age_ms",age).put("valid_until_elapsed_ms",validUntil).put("values",values)
                .put("protocol",validated==null?"UNKNOWN":validated.getString("protocol"))
                .put("source",validated==null||validated.getInt("schema")==1?new JSONObject():validated.getJSONObject("source"))
                .put("source_identity",validated==null?"":VehicleSampleCodec.identity(validated));
        }
        if(revoke)signal(true,sid,epoch);
        return result;
    }
}
