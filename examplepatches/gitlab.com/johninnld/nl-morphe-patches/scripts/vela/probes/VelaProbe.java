package nl.johninnl.velaprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Read-only instrumentation of the actual Vela consumer. Does not launch UI or send broadcasts. */
public final class VelaProbe extends Instrumentation {
    private static final String RUNTIME="nl.johninnl.vela.TelemetryRuntime",UI="nl.johninnl.vela.NativeUi";
    private static final String[] EFFECTIVE={"effectiveFlock","effectiveFlockRoute","effectiveFlockDetour","effectiveFlockCard","effectiveFlockVoice"};
    private static final String[] SAVED={"flock_cameras_on","flock_route_alert_on","flock_detour","flock_nav_alert_card","flock_nav_alert_voice"};
    private Bundle arguments;
    private ClassLoader loader;
    private boolean everMatched;
    private int samples;

    private Class<?> type(String name)throws Exception{return Class.forName(name,false,loader);}
    private Object field(Object owner,String name)throws Exception {
        Class<?> cls=owner instanceof Class?(Class<?>)owner:owner.getClass();
        while(cls!=null) {
            try {Field f=cls.getDeclaredField(name);f.setAccessible(true);return f.get(owner instanceof Class?null:owner);}
            catch(NoSuchFieldException e){cls=cls.getSuperclass();}
        }
        throw new NoSuchFieldException(name);
    }
    private Object call(Object owner,String name)throws Exception {
        Class<?> cls=owner instanceof Class?(Class<?>)owner:owner.getClass();
        Method method=cls.getMethod(name);method.setAccessible(true);return method.invoke(owner instanceof Class?null:owner);
    }
    private void put(JSONObject row,String key,Object value)throws Exception {
        if(value instanceof Number&&!Double.isFinite(((Number)value).doubleValue()))value=null;
        row.put(key,value==null?JSONObject.NULL:value);
    }
    private long age(long now,Object timestamp) {
        long at=((Number)timestamp).longValue();return at<0?-1:now-at;
    }
    private JSONObject sample()throws Exception {
        AtomicReference<JSONObject> result=new AtomicReference<>();AtomicReference<Throwable> failure=new AtomicReference<>();
        runOnMainSync(()->{try{result.set(read());}catch(Throwable error){failure.set(error);}});
        if(failure.get()!=null)throw new IllegalStateException("Vela read-only snapshot failed",failure.get());
        return result.get();
    }
    private JSONObject read()throws Exception {
        long now=SystemClock.elapsedRealtime();Class<?> runtime=type(RUNTIME),ui=type(UI);
        Object view=call(runtime,"view");JSONObject row=new JSONObject();
        put(row,"elapsed_ms",now);put(row,"sample",samples++);
        put(row,"selected",call(runtime,"selected"));put(row,"external",field(view,"external"));
        put(row,"current_kmh",field(view,"currentKmh"));put(row,"limit_kmh",field(view,"limitKmh"));
        put(row,"zone_active",field(view,"zoneActive"));put(row,"zone_session",field(view,"zoneSession"));
        put(row,"remaining_m",field(view,"remainingMeters"));put(row,"progress_percent",field(view,"progressPercent"));
        put(row,"average_kmh",field(view,"averageKmh"));put(row,"average_partial",field(view,"partialAverage"));
        put(row,"progress_estimated",field(view,"progressEstimated"));
        put(row,"approach_distance_m",field(view,"approachDistanceMeters"));put(row,"approach_estimated",field(view,"approachEstimated"));
        List<?> alerts=(List<?>)field(view,"alerts");TreeSet<String> kinds=new TreeSet<>();
        for(Object alert:alerts)kinds.add((String)field(alert,"kind"));
        put(row,"alerts_count",alerts.size());put(row,"alert_kinds",new JSONArray(kinds));
        put(row,"warning",call(runtime,"warningText"));put(row,"flock_suppressed",call(runtime,"suppressNativeFlock"));
        SharedPreferences prefs=getTargetContext().getSharedPreferences("vela_settings",0);
        JSONObject effective=new JSONObject(),saved=new JSONObject();boolean consistent=true,paused=row.getBoolean("flock_suppressed");
        for(int i=0;i<EFFECTIVE.length;i++) {
            Object state=field(ui,EFFECTIVE[i]);Object value=state==null?null:call(state,"getValue");
            boolean preference=prefs.getBoolean(SAVED[i],i==0);put(effective,EFFECTIVE[i],value);put(saved,SAVED[i],preference);
            consistent&=value instanceof Boolean&&((Boolean)value)==(!paused&&preference);
        }
        put(row,"flock_effective",effective);put(row,"flock_saved",saved);put(row,"flock_mask_consistent",consistent);
        put(row,"car_enabled",call(runtime,"carEnabled"));put(row,"spoken_enabled",call(runtime,"spokenEnabled"));
        put(row,"navigation_service_active",field(runtime,"navigationActive"));put(row,"car_scene_active",call(runtime,"carActive"));
        put(row,"phone_scene_age_ms",age(now,field(runtime,"phoneAt")));put(row,"native_fix_age_ms",age(now,field(runtime,"fixAt")));
        put(row,"native_speed_known",field(runtime,"nativeSpeedKnown"));put(row,"native_speed_age_ms",age(now,field(runtime,"nativeSpeedAt")));
        put(row,"native_phone_limit_kmh",field(runtime,"phoneNativeLimit"));
        Object voice=field(runtime,"voice");put(row,"voice_bound",voice!=null);put(row,"voice_muted",voice==null?null:field(voice,"n"));
        Object session=field(runtime,"navSession");put(row,"native_session_bound",session!=null);
        if(session!=null) {
            Object state=call(field(session,"f"),"getValue");put(row,"native_navigating",field(state,"a"));
            put(row,"native_paused",field(state,"b"));put(row,"native_arrived",field(state,"c"));
            Object route=field(state,"d");put(row,"native_route_present",route!=null);
            put(row,"native_route_points",route==null?0:((List<?>)call(route,"getPolyline")).size());
        }
        Map<?,?> peers=(Map<?,?>)field(field(runtime,"store"),"peers");JSONObject peerRows=new JSONObject();
        for(String source:new String[]{"com.waze","nl.flitsmeister"}) {
            Object peer=peers.get(source);if(peer==null)continue;JSONObject peerRow=new JSONObject();
            put(peerRow,"publisher_session",field(peer,"session"));put(peerRow,"sequence",field(peer,"sequence"));
            for(String at:new String[]{"sent","speedAt","roadAt","zoneAt","alertsAt","approachAt"})put(peerRow,at+"_age_ms",age(now,field(peer,at)));
            put(peerRows,source,peerRow);
        }
        put(row,"accepted_peers",peerRows);return row;
    }
    private boolean matches(JSONObject row)throws Exception {
        String source=arguments.getString("expected_source");
        if(source!=null&&!source.equals("any")) {
            if(source.equals("native"))source="";
            if(!source.equals(row.getString("selected")))return false;
        }
        String zone=arguments.getString("expected_zone");
        if(zone!=null&&!zone.equals("any")) {
            boolean active=zone.equals("active")||zone.equals("true");
            if(row.getBoolean("zone_active")!=active)return false;
        }
        String flock=arguments.getString("expected_flock");
        if(flock!=null&&!flock.equals("any")) {
            boolean paused=flock.equals("suppressed")||flock.equals("paused")||flock.equals("true");
            if(row.getBoolean("flock_suppressed")!=paused||!row.getBoolean("flock_mask_consistent"))return false;
        }
        return true;
    }
    private void validateOptions() {
        String source=arguments.getString("expected_source");
        if(source!=null&&!source.equals("")&&!source.equals("native")&&!source.equals("com.waze")&&!source.equals("nl.flitsmeister")&&!source.equals("any"))throw new IllegalArgumentException("expected_source");
        String zone=arguments.getString("expected_zone");
        if(zone!=null&&!zone.matches("active|inactive|true|false|any"))throw new IllegalArgumentException("expected_zone");
        String flock=arguments.getString("expected_flock");
        if(flock!=null&&!flock.matches("suppressed|paused|restored|true|false|any"))throw new IllegalArgumentException("expected_flock");
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);arguments=args==null?new Bundle():args;start();}
    @Override public void onStart() {
        Bundle result=new Bundle();
        try {
            loader=getTargetContext().getClassLoader();validateOptions();
            long hold=Long.parseLong(arguments.getString("hold_ms","120000"));
            if(hold<0||hold>1800000)throw new IllegalArgumentException("hold_ms");
            long deadline=SystemClock.elapsedRealtime()+hold;JSONObject latest;
            do {
                latest=sample();boolean matched=matches(latest);everMatched|=matched;
                put(latest,"assertion_match",matched);put(latest,"assertion_ever_matched",everMatched);
                Bundle status=new Bundle();status.putString("stream","VELA_CONSUMER_SAMPLE "+latest+"\n");sendStatus(0,status);
                long left=deadline-SystemClock.elapsedRealtime();if(left<=0)break;SystemClock.sleep(Math.min(1000,left));
            }while(true);
            boolean passed=matches(latest);
            result.putString("stream","VELA_CONSUMER_RESULT "+(passed?"PASS":"FAIL")+" samples="+samples+" ever_matched="+everMatched+" final="+latest+"\n");
            result.putBoolean("assertions_passed",passed);finish(passed?Activity.RESULT_OK:Activity.RESULT_CANCELED,result);
        }catch(Throwable error) {
            // Do not print arbitrary native exception messages, objects or coordinates.
            result.putString("stream","VELA_CONSUMER_RESULT ERROR "+error.getClass().getName()+"\n");finish(Activity.RESULT_CANCELED,result);
        }
    }
}
