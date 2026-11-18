package nl.johninnl.warningprobe.integration;

import android.app.Activity;
import android.view.View;
import android.view.ViewTreeObserver;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.accessibility.AccessibilityNodeInfo;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Observe the installed Maps car graph. The actual DriveDeck UI owns every surface. */
public final class MapsCarReceiverProbe extends Instrumentation {
    private Bundle args;
    private Class<?> telemetry,diagnostics;
    private Object productionConnection;
    private File cancelFile;
    private int createdPhoneActivities;
    private final LinkedHashMap<String,Map<?,?>> archive=new LinkedHashMap<>();
    @Override public void onCreate(Bundle value){super.onCreate(value);args=value;start();}
    @Override public void onStart(){
        JSONObject report=new JSONObject();Bundle output=new Bundle();SharedPreferences prefs=null;Map<String,Object> original=null;Application app=null;
        Application.ActivityLifecycleCallbacks activities=new Application.ActivityLifecycleCallbacks(){
            public void onActivityCreated(Activity a,Bundle b){if(a.getClass().getName().equals("com.google.android.maps.MapsActivity"))createdPhoneActivities++;}
            public void onActivityStarted(Activity a){}public void onActivityResumed(Activity a){}public void onActivityPaused(Activity a){}
            public void onActivityStopped(Activity a){}public void onActivitySaveInstanceState(Activity a,Bundle b){}public void onActivityDestroyed(Activity a){}
        };
        try{
            check("true".equals(args.getString("reviewed_synthetic_choices")),"Reviewed choices required");
            Context context=getTargetContext();check("org.ungoogled.android.apps.maps".equals(context.getPackageName()),"Unexpected target");app=(Application)context.getApplicationContext();app.registerActivityLifecycleCallbacks(activities);
            String token=args.getString("cancel_token","");if(!token.isEmpty()){check(token.matches("[A-Za-z0-9_-]{1,80}"),"Invalid private cancellation token");File folder=new File(context.getExternalFilesDir(null),"native-warning-car");check(folder.exists()||folder.mkdirs(),"Private output directory");cancelFile=new File(folder,"cancel-"+token+".request");check(!cancelFile.exists(),"Cancellation token reused");}
            ClassLoader loader=context.getClassLoader();telemetry=Class.forName("org.ungoogled.ui.ExternalTelemetry",true,loader);diagnostics=Class.forName("nl.johninnl.navigation.alerts.WarningDiagnostics",true,loader);
            String host=args.getString("host_package","app.johninnl.drivedeck");check(host.equals("app.johninnl.drivedeck")||host.equals("app.johninnl.drivedeck.dev"),"Unexpected host");
            String expected=args.getString("expected_warning_id","");check(!expected.isEmpty(),"Exact native warning ID required");
            prefs=(SharedPreferences)method(telemetry,"prefs",Context.class).invoke(null,context);original=copy(prefs.getAll());
            Object settings=loader.loadClass("nl.johninnl.navigation.alerts.WarningPreferences").getConstructor(SharedPreferences.class,boolean.class).newInstance(prefs,true);
            Class<?> selectedMode=loader.loadClass("nl.johninnl.navigation.alerts.WarningAudioOwner$Mode");method(settings.getClass(),"mode",selectedMode).invoke(settings,enumValue(selectedMode,args.getString("mode","VOICE")));method(settings.getClass(),"categories",int.class).invoke(settings,127);method(settings.getClass(),"confirm").invoke(settings);
            check(prefs.edit().putString("external_navigation_source","nl.flitsmeister").putBoolean("external_navigation_widget",true).commit(),"Reviewed source choice");
            report.put("preferences_before_sha256",fingerprint(original)).put("target_uid",context.getApplicationInfo().uid).put("process_uid",android.os.Process.myUid()).put("host_package",host).put("expected_warning_id",expected);
            long selected=SystemClock.elapsedRealtime();status("CAR_RECEIVER_CONFIGURED",new JSONObject().put("host_package",host).put("phone_activity_launched",false));
            long until=SystemClock.elapsedRealtime()+90000;boolean ready=false;
            while(SystemClock.elapsedRealtime()<until){checkNoPhone();Object semantic=field(telemetry,"semantic").get(null);if(carVisible()&&field(telemetry,"nativeSpeaker").get(null)!=null&&semantic!=null&&"ready".equals(method(semantic.getClass(),"state").invoke(semantic))&&Boolean.TRUE.equals(method(semantic.getClass(),"captureComplete").invoke(semantic))){ready=true;break;}SystemClock.sleep(20);}
            check(ready,"Genuine host car session/native guide/complete WarningSession not ready");Object semantic=field(telemetry,"semantic").get(null),connection=method(semantic.getClass(),"connection").invoke(semantic);productionConnection=connection;int sourceUid=field(connection.getClass(),"providerUid").getInt(connection);check(sourceUid!=android.os.Process.myUid(),"No cross UID boundary");
            report.put("actual_graph",new JSONObject().put("session",semantic.getClass().getName()).put("connection",connection.getClass().getName()).put("speaker",field(telemetry,"nativeSpeaker").get(null).getClass().getName()).put("scheduler",field(telemetry,"scheduler").get(null).getClass().getName()).put("provider_uid",sourceUid));report.put("native_guide_at_armed",guideState());status("CAR_RECEIVER_ARMED",report.getJSONObject("actual_graph"));
            File folder=new File(context.getExternalFilesDir(null),"native-warning-car");check(folder.exists()||folder.mkdirs(),"Output directory");
            boolean frame=false,completed=false,started=false,audioSignaled=false;Object authority=null;String key="";long authoritySeenAt=-1;until=SystemClock.elapsedRealtime()+45000;
            while(SystemClock.elapsedRealtime()<until){
                checkNoPhone();check(carVisible(),"Actual car session no longer visible");
                Object display=field(telemetry,"nativeWarnings").get(null);synchronized(display){for(Object event:((Map<?,?>)field(display.getClass(),"values").get(display)).values())if(expected.equals(field(event.getClass(),"warningId").get(event))){authority=event;key=eventKey(event);report.put("received_display_event",new JSONObject((Map<?,?>)method(event.getClass(),"fields").invoke(event)));}}
                Object scheduler=field(telemetry,"scheduler").get(null),active=field(scheduler.getClass(),"active").get(scheduler);if(active!=null){Object pending=field(active.getClass(),"pending").get(active),event=field(pending.getClass(),"authority").get(pending);if(expected.equals(field(event.getClass(),"warningId").get(event))){authority=event;key=eventKey(event);report.put("received_authority",new JSONObject((Map<?,?>)method(event.getClass(),"fields").invoke(event)));}}
                final JSONObject[] witness={null};onMain(()->{Object speaker=field(telemetry,"nativeSpeaker").get(null),attempt=field(speaker.getClass(),"active").get(speaker);if(attempt!=null){Object event=field(attempt.getClass(),"payload").get(attempt);if(expected.equals(field(event.getClass(),"warningId").get(event)))witness[0]=new JSONObject().put("payload",new JSONObject((Map<?,?>)method(event.getClass(),"fields").invoke(event))).put("started",field(attempt.getClass(),"started").getBoolean(attempt)).put("submitted",field(attempt.getClass(),"submitted").getBoolean(attempt));}});if(witness[0]!=null)report.put("actual_speaker_attempt",witness[0]);
                if(authority!=null&&authoritySeenAt<0)authoritySeenAt=SystemClock.elapsedRealtime();
                if(authority!=null&&!frame){watchCarDraws();long carAt=lastCarDrawAt;String text=String.valueOf(method(telemetry,"compactWarning").invoke(null)),message=String.valueOf(field(authority.getClass(),"message").get(authority));if(SystemClock.elapsedRealtime()-carAt<=3000&&SystemClock.elapsedRealtime()-authoritySeenAt>=250&&carAt>=authoritySeenAt&&text.contains(message)){
                    AccessibilityNodeInfo window=getUiAutomation().getRootInActiveWindow();long windowUntil=SystemClock.elapsedRealtime()+3000;while(window==null&&SystemClock.elapsedRealtime()<windowUntil){checkNoPhone();SystemClock.sleep(20);window=getUiAutomation().getRootInActiveWindow();}String visible=window==null?"":String.valueOf(window.getPackageName());check(host.equals(visible),"Displayed active window is not the actual host: "+visible);Bitmap image=getUiAutomation().takeScreenshot();check(image!=null,"Actual host screenshot unavailable");File png=new File(folder,"maps-car-warning.png");try(FileOutputStream stream=new FileOutputStream(png)){check(image.compress(Bitmap.CompressFormat.PNG,100,stream),"Screenshot encoding");}
                    JSONObject ui=new JSONObject().put("host_window_package",visible).put("screenshot",png.getAbsolutePath()).put("compact_warning_text",text).put("native_car_frame_elapsed_ms",carAt).put("car_session_visible",true).put("maps_phone_activity_absent",true).put("width",image.getWidth()).put("height",image.getHeight());report.put("actual_host_frame",ui);frame=true;status("CAR_WARNING_FRAME",ui);
                }}
                for(Object entry:(List<?>)method(diagnostics,"snapshot").invoke(null)){Map<?,?> row=(Map<?,?>)entry;Object at=row.get("elapsed_ms");if(!(at instanceof Number)||((Number)at).longValue()<selected)continue;String id=row.toString();if(!archive.containsKey(id)){check(archive.size()<512,"Private archive full");archive.put(id,new HashMap<>(row));}if(!key.isEmpty()&&key.equals(String.valueOf(row.get("event_key")))){started|="SCHEDULER_STARTED".equals(row.get("stage"));completed|="SCHEDULER_COMPLETED".equals(row.get("stage"));}}
                if(started&&!audioSignaled){audioSignaled=true;status("CAR_AUDIO_STARTED",new JSONObject().put("event_key",key).put("maps_phone_activity_absent",true));}
                if(frame&&started&&completed&&field(scheduler.getClass(),"active").get(scheduler)==null)break;SystemClock.sleep(10);
            }
            report.put("actual_started",started).put("actual_completed",completed).put("actual_host_frame_observed",frame);check(frame&&started&&completed,"Actual car frame/STARTED/COMPLETED not all observed");Object sourceStartup=field(telemetry,"startup").get(null);boolean muted=sourceStartup!=null&&field(sourceStartup.getClass(),"providerMuted").getBoolean(sourceStartup);report.put("provider_audio_muted",muted);check(muted,"Actual startup did not observe managed provider mute");checkNoPhone();report.put("phone_activities_created",createdPhoneActivities).put("status","observed");
        }catch(Throwable failure){try{if(telemetry!=null)report.put("native_guide_at_failure",guideState());}catch(Exception ignored){}put(report,"status","blocked");put(report,"error",android.util.Log.getStackTraceString(failure));}
        finally{
            try{if(telemetry!=null){onMain(()->method(telemetry,"select",Context.class,String.class).invoke(null,getTargetContext(),""));long until=SystemClock.elapsedRealtime()+5000;while(SystemClock.elapsedRealtime()<until){Object semantic=field(telemetry,"semantic").get(null),speaker=field(telemetry,"nativeSpeaker").get(null);Object scheduler=field(telemetry,"scheduler").get(null);boolean quiet=(speaker==null||field(speaker.getClass(),"active").get(speaker)==null)&&(scheduler==null||field(scheduler.getClass(),"active").get(scheduler)==null&&field(scheduler.getClass(),"grantRequests").getInt(scheduler)==0)&&(productionConnection==null||!field(productionConnection.getClass(),"outputOutstanding").getBoolean(productionConnection)&&!field(productionConnection.getClass(),"grantRequestPending").getBoolean(productionConnection));if(quiet&&(semantic==null||"off".equals(method(semantic.getClass(),"state").invoke(semantic)))){put(report,"cleanup_output_quiescent",true);break;}SystemClock.sleep(20);}}}catch(Throwable failure){put(report,"cleanup_error",android.util.Log.getStackTraceString(failure));put(report,"status","blocked");}
            try{if(prefs!=null&&original!=null){restore(prefs,original);boolean exact=copy(prefs.getAll()).equals(original);put(report,"preferences_restored_exactly",exact);put(report,"preferences_after_sha256",fingerprint(copy(prefs.getAll())));if(!exact)put(report,"status","blocked");}}catch(Throwable failure){put(report,"cleanup_error",android.util.Log.getStackTraceString(failure));put(report,"status","blocked");}
            try{onMain(()->{for(Map.Entry<View,ViewTreeObserver.OnDrawListener> item:draws.entrySet())if(item.getKey().getViewTreeObserver().isAlive())item.getKey().getViewTreeObserver().removeOnDrawListener(item.getValue());});}catch(Exception ignored){}
            if(cancelFile!=null&&cancelFile.exists())put(report,"private_cancel_sentinel_removed",cancelFile.delete());if(app!=null)app.unregisterActivityLifecycleCallbacks(activities);JSONArray rows=new JSONArray();for(Map<?,?> row:archive.values())rows.put(new JSONObject(row));put(report,"diagnostics",rows);put(report,"scope","Actual host-bound Maps car lifecycle/native drawing and normal source/session/scheduler/speaker; no phone Activity, constructed speaker/owner, fake surface, packet or coverage override");put(report,"probe_completed",true);output.putString("maps_car_receiver_result",report.toString());finish("observed".equals(report.optString("status"))?Activity.RESULT_OK:Activity.RESULT_CANCELED,output);
        }
    }
    private volatile long lastCarDrawAt=-1;
    private final java.util.IdentityHashMap<View,ViewTreeObserver.OnDrawListener> draws=new java.util.IdentityHashMap<>();
    private void watchCarDraws()throws Exception{onMain(()->{
        for(Object object:((Map<?,?>)field(telemetry,"carWidgets").get(null)).values())if(object instanceof View){View view=(View)object;
            if(view.isAttachedToWindow()&&!draws.containsKey(view)){ViewTreeObserver.OnDrawListener listener=()->lastCarDrawAt=SystemClock.elapsedRealtime();draws.put(view,listener);view.getViewTreeObserver().addOnDrawListener(listener);view.invalidate();}
        }
    });}
    private JSONObject guideState()throws Exception{Object speaker=field(telemetry,"nativeSpeaker").get(null);return new JSONObject().put("speaker_present",speaker!=null).put("car_sessions",((java.util.Set<?>)field(telemetry,"carSessions").get(null)).size()).put("car_roots",((Map<?,?>)field(telemetry,"carRoots").get(null)).size()).put("phone_activity_count",createdPhoneActivities);}
    private void checkNoPhone()throws Exception{check(cancelFile==null||!cancelFile.exists(),"Coordinated source cancellation");check(createdPhoneActivities==0,"Maps phone Activity created");Object reference=field(telemetry,"foreground").get(null);check(!(reference instanceof java.lang.ref.WeakReference)||((java.lang.ref.WeakReference<?>)reference).get()==null,"Maps phone Activity present");}
    private boolean carVisible()throws Exception{AtomicReference<Boolean> value=new AtomicReference<>(false);onMain(()->value.set(!((java.util.Set<?>)field(telemetry,"carSessions").get(null)).isEmpty()));return value.get();}
    private String eventKey(Object event)throws Exception{Class<?> grant=getTargetContext().getClassLoader().loadClass("nl.johninnl.navigation.alerts.PlaybackGrant");return String.valueOf(method(grant,"key",event.getClass()).invoke(null,event));}
    private void status(String stage,JSONObject details){Bundle out=new Bundle();out.putString("stage",stage);out.putString("detail",details.toString());sendStatus(0,out);}
    private interface Action{void run()throws Exception;}
    private void onMain(Action action)throws Exception{AtomicReference<Throwable> error=new AtomicReference<>();runOnMainSync(()->{try{action.run();}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new IllegalStateException(error.get());}
    private static Field field(Class<?> owner,String name)throws Exception{for(Class<?> type=owner;type!=null;type=type.getSuperclass())try{Field f=type.getDeclaredField(name);f.setAccessible(true);return f;}catch(NoSuchFieldException ignored){}throw new NoSuchFieldException(name);}
    private static Method method(Class<?> owner,String name,Class<?>...types)throws Exception{for(Class<?> type=owner;type!=null;type=type.getSuperclass())try{Method m=type.getDeclaredMethod(name,types);m.setAccessible(true);return m;}catch(NoSuchMethodException ignored){}throw new NoSuchMethodException(name);}
    private static Object enumValue(Class<?> type,String name){for(Object value:type.getEnumConstants())if(((Enum<?>)value).name().equals(name))return value;throw new IllegalArgumentException(name);}
    private static void check(boolean condition,String message){if(!condition)throw new IllegalStateException(message);}
    private static void put(JSONObject json,String key,Object value){try{json.put(key,value);}catch(Exception ignored){}}
    private static Map<String,Object> copy(Map<String,?> source){Map<String,Object> result=new HashMap<>();for(Map.Entry<String,?> e:source.entrySet())result.put(e.getKey(),e.getValue() instanceof Set?new HashSet<>((Set<?>)e.getValue()):e.getValue());return result;}
    private static String fingerprint(Map<String,?> map)throws Exception{List<String> keys=new ArrayList<>(map.keySet());java.util.Collections.sort(keys);StringBuilder value=new StringBuilder();for(String key:keys){Object v=map.get(key);if(v instanceof Set){List<String> sorted=new ArrayList<>();for(Object item:(Set<?>)v)sorted.add(String.valueOf(item));java.util.Collections.sort(sorted);v=sorted;}value.append(key).append('=').append(v==null?"null":v.getClass().getName()).append(':').append(v).append('\n');}StringBuilder hex=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(value.toString().getBytes("UTF-8")))hex.append(String.format(java.util.Locale.ROOT,"%02x",b&255));return hex.toString();}
    @SuppressWarnings("unchecked")private static void restore(SharedPreferences prefs,Map<String,Object> values){SharedPreferences.Editor edit=prefs.edit().clear();for(Map.Entry<String,Object> e:values.entrySet()){Object v=e.getValue();String k=e.getKey();if(v instanceof String)edit.putString(k,(String)v);else if(v instanceof Boolean)edit.putBoolean(k,(Boolean)v);else if(v instanceof Integer)edit.putInt(k,(Integer)v);else if(v instanceof Long)edit.putLong(k,(Long)v);else if(v instanceof Float)edit.putFloat(k,(Float)v);else if(v instanceof Set)edit.putStringSet(k,(Set<String>)v);else throw new IllegalArgumentException(k);}check(edit.commit(),"Native preference restore failed");}
}
