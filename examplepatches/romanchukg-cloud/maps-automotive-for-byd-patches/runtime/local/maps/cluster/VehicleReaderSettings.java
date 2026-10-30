// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.*;
import org.json.*;

/** Reader addresses and user choices only: this preference file never stores readings. */
final class VehicleReaderSettings {
    private static final ExecutorService worker=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"MapsVehicleReaderSettings");t.setDaemon(true);return t;});
    private static final Map<String,State> states=new HashMap<>();
    private static volatile State installed;
    private static final class State {
        final Object io=new Object();
        volatile String mode="auto",message="Reader mode: automatic";
        volatile boolean loaded,pending,loading;
        volatile long serial;
        boolean restoreEnabled;
    }
    private VehicleReaderSettings(){}
    private static State state(Context c){
        String key=c.getApplicationInfo().dataDir;if(key==null)throw new IllegalStateException("Application storage identity unavailable");
        synchronized(states){State value=states.get(key);if(value==null){value=new State();states.put(key,value);}return value;}
    }
    /** Metadata only on the calling thread; preference loading is queued. */
    static void install(Context input){
        Context app=input.getApplicationContext();final Context c=app==null?input:app;final State s=state(c);installed=s;
        synchronized(s){if(s.loaded||s.loading||s.pending)return;s.loading=true;final long serial=s.serial;
            worker.execute(()->{try{synchronized(s.io){JSONObject value=read(c);synchronized(s){s.loading=false;if(s.serial==serial)publish(s,value);}}}catch(Exception e){synchronized(s){s.loading=false;if(s.serial==serial){s.loaded=true;s.message="Reader settings unavailable; automatic mode is the default.";}}}});
        }
    }
    static String mode(){State value=installed;return value==null?"auto":value.mode;}
    static String summary(){State value=installed;return value==null?"Reader mode: automatic":value.message;}
    private static SharedPreferences preferences(Context c){return c.getSharedPreferences("local_vehicle_reader",Context.MODE_PRIVATE);}
    private static JSONObject defaults()throws JSONException{return new JSONObject().put("mode","auto").put("generation",0).put("confirmed_selection","").put("cache",new JSONObject());}
    private static String mode(JSONObject value)throws JSONException{Object mode=value.get("mode");if(!(mode instanceof String)||!Arrays.asList("auto","legacy").contains(mode))throw new IllegalArgumentException("Invalid reader selection mode");return (String)mode;}
    private static String hash(JSONObject object,String key)throws JSONException{Object value=object.get(key);if(!(value instanceof String)||!((String)value).matches("[a-f0-9]{64}"))throw new IllegalArgumentException("Invalid reader source hash");return (String)value;}
    private static String protocol(JSONObject value)throws JSONException{Object protocol=value.get("protocol");if(!(protocol instanceof String)||!Arrays.asList("CAN","CANFD","UNKNOWN").contains(protocol))throw new IllegalArgumentException("Invalid reader protocol");return (String)protocol;}
    private static JSONObject addressCache(JSONObject input)throws JSONException{
        VehicleSampleCodec.keys(input,"firmware","protocol","mode","selection","addresses");
        String firmware=hash(input,"firmware"),protocol=protocol(input),mode=mode(input),selection=hash(input,"selection");
        JSONArray addresses=input.getJSONArray("addresses");if(addresses.length()>VehicleSampleCodec.ALL_FIELDS.length)throw new IllegalArgumentException("Too many reader addresses");
        Set<String> fields=new HashSet<>();JSONArray clean=new JSONArray();
        for(int i=0;i<addresses.length();i++){
            JSONObject address=addresses.getJSONObject(i);VehicleSampleCodec.keys(address,"field","tx","device","fid","origin");
            Object field=address.get("field"),origin=address.get("origin");
            if(!(field instanceof String)||!Arrays.asList(VehicleSampleCodec.ALL_FIELDS).contains(field)||!fields.add((String)field))throw new IllegalArgumentException("Invalid reader address field");
            if(!(origin instanceof String)||!Arrays.asList("firmware","documented","controller13","canfd-fallback").contains(origin))throw new IllegalArgumentException("Invalid reader address origin");
            long tx=VehicleSampleCodec.integer(address,"tx"),device=VehicleSampleCodec.integer(address,"device"),fid=VehicleSampleCodec.integer(address,"fid");
            if(tx!=(("soc".equals(field)||"remaining_energy".equals(field))?7:5)||device<1||device>65535||fid<1||fid>Integer.MAX_VALUE)throw new IllegalArgumentException("Invalid reader address");
            clean.put(new JSONObject().put("field",field).put("tx",tx).put("device",device).put("fid",fid).put("origin",origin));
        }
        return new JSONObject().put("firmware",firmware).put("protocol",protocol).put("mode",mode).put("selection",selection).put("addresses",clean);
    }
    private static JSONObject settings(JSONObject input)throws JSONException{
        VehicleSampleCodec.keys(input,"mode","generation","confirmed_selection","cache");String mode=mode(input);long generation=VehicleSampleCodec.integer(input,"generation");
        Object confirmed=input.get("confirmed_selection");if(!(confirmed instanceof String)||!((String)confirmed).matches("|[a-f0-9]{64}"))throw new IllegalArgumentException("Invalid reader confirmation");
        JSONObject cache=input.getJSONObject("cache");if(cache.length()!=0)cache=addressCache(cache);
        if(cache.length()!=0&&!mode.equals(cache.getString("mode")))throw new IllegalArgumentException("Reader cache mode mismatch");
        if(!"".equals(confirmed)&&(!"legacy".equals(mode)||cache.length()==0||!confirmed.equals(cache.getString("selection"))))throw new IllegalArgumentException("Reader confirmation does not match address cache");
        return new JSONObject().put("mode",mode).put("generation",generation).put("confirmed_selection",confirmed).put("cache",cache);
    }
    private static JSONObject read(Context c)throws Exception{
        String text=preferences(c).getString("settings",null);return text==null?defaults():settings(VehicleSampleCodec.object(text));
    }
    private static void write(Context c,JSONObject value)throws Exception{
        String text=settings(value).toString();VehicleSampleCodec.object(text);if(!preferences(c).edit().putString("settings",text).commit())throw new IOException("Reader settings were not saved");
    }
    private static void publish(State state,JSONObject value)throws JSONException{state.mode=value.getString("mode");state.loaded=true;state.message="Reader mode: "+("legacy".equals(state.mode)?"legacy (manual confirmation)":"automatic");}
    /** Worker or guarded provider threads only. Returns a detached validated object. */
    static JSONObject view(Context c)throws Exception{State s=state(c);synchronized(s.io){JSONObject value=read(c);if(!s.pending)publish(s,value);return value;}}
    private static long requireSession(Context c,String session)throws Exception{
        JSONObject status=VehicleDataStore.status(c);VehicleDataStore.Access access=VehicleDataStore.access(c);
        if(!status.optBoolean("enabled")||!session.equals(status.optString("session"))||!access.enabled||!access.readerActive||!session.equals(access.session))throw new IllegalStateException("Reader session is inactive");
        return access.epoch;
    }
    private static void checkSession(Context c,String session,long epoch){VehicleDataStore.Access access=VehicleDataStore.access(c);if(!access.enabled||!access.readerActive||access.epoch!=epoch||!session.equals(access.session))throw new IllegalStateException("Reader session changed");}
    /** Called only after the provider's UID 2000 and DUMP checks. No cached readings returned. */
    static JSONObject options(Context c,String text)throws Exception{
        JSONObject request=VehicleSampleCodec.object(text);VehicleSampleCodec.keys(request,"session","firmware","protocol");String sid=VehicleSampleCodec.session(request),firmware=hash(request,"firmware"),protocol=protocol(request);long epoch=requireSession(c,sid);State s=state(c);
        synchronized(s.io){JSONObject value=read(c);checkSession(c,sid,epoch);JSONObject cache=value.getJSONObject("cache");
            if(cache.length()!=0&&(!firmware.equals(cache.getString("firmware"))||!protocol.equals(cache.getString("protocol"))||!value.getString("mode").equals(cache.getString("mode"))))value.put("cache",new JSONObject()).put("confirmed_selection","");
            if(!s.pending)publish(s,value);return value;
        }
    }
    /** Session-bound addresses, never sensor values. Late replies cannot cross a setting generation. */
    static void cache(Context c,String text)throws Exception{
        JSONObject request=VehicleSampleCodec.object(text);VehicleSampleCodec.keys(request,"session","generation","cache");String sid=VehicleSampleCodec.session(request);long generation=VehicleSampleCodec.integer(request,"generation");JSONObject cache=addressCache(request.getJSONObject("cache"));long epoch=requireSession(c,sid);State s=state(c);
        synchronized(s.io){JSONObject value=read(c);checkSession(c,sid,epoch);if(generation!=value.getLong("generation")||!value.getString("mode").equals(cache.getString("mode")))throw new IllegalStateException("Reader settings changed");
            String confirmed=value.getString("confirmed_selection");JSONObject previous=value.getJSONObject("cache");if(!confirmed.equals(cache.getString("selection"))||previous.length()==0||!previous.getString("firmware").equals(cache.getString("firmware"))||!previous.getString("protocol").equals(cache.getString("protocol")))value.put("confirmed_selection","");
            value.put("cache",cache);write(c,value);checkSession(c,sid,epoch);if(!s.pending)publish(s,value);
        }
    }
    /** Explicit user action. Native data is revoked synchronously before any disk access. */
    static void configure(Context input,String mode,boolean redetect,String confirmedSelection,Runnable finished){
        if(!Arrays.asList("auto","legacy").contains(mode)||confirmedSelection==null||!confirmedSelection.matches("|[a-f0-9]{64}")||!confirmedSelection.isEmpty()&&(!"legacy".equals(mode)||redetect))throw new IllegalArgumentException("Invalid reader setting");
        Context app=input.getApplicationContext();final Context c=app==null?input:app;final State s=state(c);installed=s;final long serial,storeEpoch;final boolean restore;
        synchronized(s){restore=s.pending?s.restoreEnabled:VehicleDataStore.enabled(c);s.restoreEnabled=restore;s.pending=true;serial=++s.serial;storeEpoch=VehicleDataStore.requestEnabled(c);s.message="Updating reader settings…";}
        worker.execute(()->{
            try{synchronized(s.io){if(s.serial!=serial)return;JSONObject value=read(c);String oldMode=value.getString("mode");boolean reset=redetect||!mode.equals(oldMode);
                JSONObject cache=value.getJSONObject("cache");if(!confirmedSelection.isEmpty()&&(cache.length()==0||!mode.equals(cache.getString("mode"))||!confirmedSelection.equals(cache.getString("selection"))))throw new IllegalStateException("Choose a detected reader source before confirming");
                long generation=value.getLong("generation");if(generation==Long.MAX_VALUE)throw new IllegalStateException("Reader generation exhausted");value.put("mode",mode).put("generation",generation+1);
                if(reset)value.put("cache",new JSONObject()).put("confirmed_selection","");if(!confirmedSelection.isEmpty())value.put("confirmed_selection",confirmedSelection);
                if(s.serial!=serial)return;write(c,value);if(s.serial!=serial)return;
                if(!VehicleDataStore.finishEnabled(c,restore,storeEpoch)){synchronized(s){if(s.serial==serial){s.pending=false;s.message="Vehicle data changed while saving reader settings.";}}return;}
                synchronized(s){if(s.serial==serial){publish(s,value);s.pending=false;}}
            }}catch(Exception e){synchronized(s){if(s.serial==serial){s.loaded=true;s.pending=false;s.message="Reader setting was not saved. Vehicle data remains off.";}}}
            finally{if(finished!=null&&s.serial==serial)new Handler(Looper.getMainLooper()).post(()->{if(s.serial==serial)finished.run();});}
        });
    }
}
