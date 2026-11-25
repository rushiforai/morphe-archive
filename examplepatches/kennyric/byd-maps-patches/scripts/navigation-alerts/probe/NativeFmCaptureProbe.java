package nl.johninnl.warningprobe;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.SharedPreferences;
import android.location.Location;
import android.media.AudioManager;
import android.media.AudioPlaybackConfiguration;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;
import org.json.JSONArray;
import org.json.JSONObject;
import nl.johninnl.warningprobe.fm15moving.Fm15PrivateMovingInput;

/** Private actual-native-entry capture probe. Detectors and public report submission stay off. */
public final class NativeFmCaptureProbe extends Instrumentation {
    private static final String REPORTS="nl.flitsmeister.fmcore.data.model.reports.";
    private static final String EARLY="nl.flitsmeister.earlywarning.model.";
    private Context context;
    private boolean fm15;
    private Bundle arguments;
    private Class<?> capture,audio;
    private final List<Bundle> events=Collections.synchronizedList(new ArrayList<>());
    private final List<String> roots=new ArrayList<>();
    private ScheduledExecutorService renewer;
    private SharedPreferences preferences,lease;
    private Map<String,?> oldPreferences,oldLease;
    private AudioManager manager;
    private int initialVolume;
    private final AtomicInteger maxActive=new AtomicInteger();
    private String integratedEventKey,observedConsumerNonce;
    private int observedConsumerUid=-1;
    private boolean terminalObserved,ownerPresent,pendingPresent;
    private boolean startedObserved;
    private boolean startedTerminalObserved;
    private String lastStartedTerminalState;
    private String lastTerminalState;
    private java.io.File traceReady,traceLost;
    private void awaitTrace(JSONObject report)throws Exception{
        String token=arguments.getString("trace_token","");if(token.isEmpty())return;
        check(token.matches("[a-f0-9]{32}"),"Invalid owned trace token");
        java.io.File folder=new java.io.File(context.getExternalFilesDir(null),"native-warning-integrated");check(folder.isDirectory()||folder.mkdirs(),"Trace barrier folder");
        traceReady=new java.io.File(folder,"trace-ready-"+token+".request");traceLost=new java.io.File(folder,"trace-lost-"+token+".request");
        long deadline=SystemClock.elapsedRealtime()+30000;
        while(!traceReady.exists()&&SystemClock.elapsedRealtime()<deadline){assertMuted();SystemClock.sleep(20);}
        check(traceReady.exists()&&!traceLost.exists(),"Required Frida observation is not ready; no test stimulus admitted");
        report.put("frida_barrier_passed_at_elapsed_ms",SystemClock.elapsedRealtime());
    }
    private final AudioManager.AudioPlaybackCallback playback=new AudioManager.AudioPlaybackCallback(){
        @Override public void onPlaybackConfigChanged(List<AudioPlaybackConfiguration> configs){observePlayback(configs);}
    };
    @Override public void onCreate(Bundle args){super.onCreate(args);arguments=args==null?new Bundle():args;start();}
    @Override public void onStart(){
        Bundle output=new Bundle();JSONObject report=new JSONObject();
        try{
            String scenario=arguments.getString("scenario","sound");boolean integrated=scenario.equals("integrated_trigger")||scenario.equals("integrated_matrix")||scenario.equals("integrated_handover")||scenario.equals("integrated_death_recovery")||scenario.equals("integrated_restart_seed")||scenario.equals("integrated_restart_recovery")||scenario.equals("integrated_parked_cleanup")||scenario.equals("integrated_warning_suite");
            context=getTargetContext();check(context.getPackageName().equals("nl.flitsmeister"),"Unexpected target");
            check(context.getApplicationInfo().uid==Process.myUid(),"Target UID mismatch");admitVersion(report);
            bootstrap();
            preferences=(SharedPreferences)type("androidx.preference.PreferenceManager").getMethod("getDefaultSharedPreferences",Context.class).invoke(null,context);
            lease=context.getSharedPreferences("navigation_startup_lease",0);oldPreferences=new HashMap<>(preferences.getAll());oldLease=new HashMap<>(lease.getAll());
            manager=(AudioManager)context.getSystemService(Context.AUDIO_SERVICE);initialVolume=manager.getStreamVolume(AudioManager.STREAM_MUSIC);
            manager.registerAudioPlaybackCallback(playback,new Handler(Looper.getMainLooper()));observePlayback(manager.getActivePlaybackConfigurations());if(!integrated)check(maxActive.get()==0,"Baseline active playback is not quiet");
            audio=type("nl.johninnl.navigation.startup.ProviderAudio");renew();
            renewer=Executors.newSingleThreadScheduledExecutor();renewer.scheduleAtFixedRate(()->{try{renew();}catch(Exception e){throw new IllegalStateException(e);}},1,1,TimeUnit.SECONDS);
            capture=type("nl.johninnl.flitsmeister.NativeWarnings");
            if(!integrated){Method reset=capture.getDeclaredMethod("resetForTest",Context.class,Consumer.class);reset.setAccessible(true);reset.invoke(null,context,(Consumer<Bundle>)value->events.add(new Bundle(value)));}
            if(scenario.equals("sound"))sound(report);
            else if(scenario.equals("point"))point(report);
            else if(scenario.equals("voice"))voice(report);
            else if(scenario.equals("cits_direct"))directCits(report);
            else if(scenario.equals("early_bus"))earlyBus(report);
            else if(scenario.equals("impact"))impact(report);
            else if(scenario.equals("vri"))vri(report);
            else if(scenario.equals("cits"))cits(report);
            else if(scenario.equals("integrated_trigger"))realEndpointTrigger(report);
            else if(scenario.equals("integrated_matrix"))realEndpointMatrix(report);
            else if(scenario.equals("integrated_restart_seed"))realProviderRestartSeed(report);
            else if(scenario.equals("integrated_restart_recovery"))realProviderRestartRecovery(report);
            else if(scenario.equals("integrated_parked_cleanup"))realParkedCleanup(report);
            else if(scenario.equals("integrated_warning_suite"))realWarningSuite(report);
            else if(scenario.equals("integrated_handover")||scenario.equals("integrated_death_recovery"))realEndpointHandover(report);
            else throw new IllegalArgumentException("Unknown native capture scenario");
            waitForIdleSync();SystemClock.sleep(300);assertMuted();observePlayback(manager.getActivePlaybackConfigurations());
            if(!integrated)check(maxActive.get()==0,"Active playback occurred during managed native capture");check(initialVolume==manager.getStreamVolume(AudioManager.STREAM_MUSIC),"Device stream volume changed");
            report.put("scenario",scenario);report.put("process_uid",Process.myUid());report.put("process_pid",Process.myPid());report.put("android_sdk",android.os.Build.VERSION.SDK_INT);
            report.put("actual_native_roots",new JSONArray(roots));report.put("events",eventJson());report.put("max_active_playbacks",maxActive.get());report.put("managed_mute_verified",true);report.put("device_stream_unchanged",true);
            report.put("detectors_started_by_probe",false);report.put("public_report_submission_called",false);report.put("probe_completed",true);
            if(!integrated)report.put("detectors_started",false);else report.put("real_consumer_may_start_provider_engine",true);
            report.put("acceptance_scope","Actual patched native entry/callback capture with genuine initialization, controlled synthetic inputs and managed mute; not natural detector or receiver/car acceptance");
            output.putString("fm_capture_result",report.toString());
        }catch(Throwable error){try{report.put("partial",true).put("probe_completed",false);output.putString("fm_capture_partial_result",report.toString());}catch(Exception ignored){}output.putString("fm_capture_error",android.util.Log.getStackTraceString(error));}
        finally{
            // Keep the verified mute lease until the runner force-stops this process. Restoring
            // it earlier could unmute a late native callback; the runner restores exact lease XML.
            try{if(renewer!=null){renewer.shutdownNow();check(renewer.awaitTermination(2,TimeUnit.SECONDS),"Lease renewal did not stop");}if(oldPreferences!=null)restore(preferences,oldPreferences);if(manager!=null)manager.unregisterAudioPlaybackCallback(playback);}
            catch(Throwable error){output.putString("fm_capture_cleanup_error",android.util.Log.getStackTraceString(error));}
        }
        finish(output.containsKey("fm_capture_result")&&!output.containsKey("fm_capture_cleanup_error")?Activity.RESULT_OK:Activity.RESULT_CANCELED,output);
    }
    private void admitVersion(JSONObject report)throws Exception{
        android.content.pm.PackageInfo info=context.getPackageManager().getPackageInfo(context.getPackageName(),0);long code=info.getLongVersionCode();
        report.put("target_version",info.versionName).put("target_version_code",code);
        fm15="15.0".equals(info.versionName)&&code==1289;
        check(fm15||"14.17".equals(info.versionName)&&code==1287,"Only exact FM14.17/1287 or FM15.0/1289 is admitted");
        report.put("native_binding_profile",fm15?"15.0/1289":"14.17/1287");
    }
    private String nativeName(String legacy){
        if(!fm15||legacy.indexOf('.')>=0)return legacy;
        switch(legacy){
            case "t25":return "lp0";case "z80":return "y80";case "ye4":return "ff4";case "ma9":return "aa9";
            case "bza":return "nza";case "s6i":return "fci";case "vz2":return "pz2";case "vz2$c":return "pz2$c";
            case "cz2":return "yy2";case "nh7":return "lh7";case "nh7$c":return "lh7$c";case "wie":return "hle";
            case "z39":return "s39";case "tvj":return "l1k";case "gqg":return "vug";case "xie":return "ile";case "zp0":return "yig";
            case "fc0":return "fc0";case "xl":return "xl";case "xl$c":return "xl$c";
            case "x9i":throw new IllegalStateException("Unported FM15 moving-camera task: old x9i is an unrelated Snackbar lambda");
            default:throw new IllegalArgumentException("Unported FM15 native capture alias: "+legacy);
        }
    }
    private String root(String owner,String method){return "L"+nativeName(owner)+";->"+method;}
    private String stateUpdateMethod(){return fm15?"P":"O";}
    private String presentationMethod(){return fm15?"i":"k";}
    private void clearNativeReports(Object service)throws Exception{call(service,fm15?"Q":"P");}
    private void bootstrap()throws Exception{
        Class<?> globals=type("t25");String field=fm15?"b":"a";if(globals.getField(field).get(null)!=null)return;
        Object factory=type("z80").getField("e").get(null),value=call(factory,"getInstance",context);
        globals.getMethod(fm15?"j":"i",Context.class,type("ye4")).invoke(null,context,value);
        check(globals.getField(field).get(null)==value,"Original native configuration bootstrap failed");
    }
    private void renew()throws Exception{type("nl.johninnl.navigation.startup.ProviderEngineService").getMethod("renewLease",Context.class).invoke(null,context);assertMuted();}
    private void assertMuted()throws Exception{check(traceLost==null||!traceLost.exists(),"Required Frida observation lost; no further test stimuli permitted");check(Boolean.TRUE.equals(audio.getMethod("muted").invoke(null)),"Managed ProviderAudio lease is not active");}
    // The public unprivileged active-playback view must stay empty. Do not rely on
    // hidden player-state/UID accessors or change platform hidden-API policy.
    private void observePlayback(List<AudioPlaybackConfiguration> configs){maxActive.accumulateAndGet(configs.size(),Math::max);}
    private void sound(JSONObject report)throws Exception{
        preferences.edit().putBoolean("pref_enable_custom_spoken_warnings",false).putBoolean("pref_traffic_cam_warning_sound",false).commit();
        Object sound=singleton("s6i","f");check(Boolean.FALSE.equals(call(sound,"g")),"Native local speech preference not disabled");
        Object camera=camera("TRAFFIC_CAMERA","probe-native-sound");Completion first=new Completion();int before=announces();
        onMain(()->call(sound,"l",camera,true,false,"TEST ONLY native camera instruction",first.proxy));roots.add(root("s6i","l"));first.await();
        check(announces()==before+1,"Actual s6i.l did not emit exactly one ANNOUNCE");Bundle one=lastAnnounce();check("TEST ONLY native camera instruction".equals(one.getString("message")),"Native text was lost before local g() suppression");
        Completion repeat=new Completion();onMain(()->call(sound,"l",camera,true,true,"TEST ONLY native camera instruction",repeat.proxy));repeat.await();
        Bundle two=lastAnnounce();check(one.getString("warning_id").equals(two.getString("warning_id"))&&two.getLong("announcement_index")==one.getLong("announcement_index")+1,"Native repeated intent lost distinct identity");
        Object notification=notification("AMBULANCE","probe-native-early"),type=call(notification,"getType");Completion early=new Completion();
        onMain(()->call(sound,"b",type,null,notification,"TEST ONLY ambulance behind you",true,early.proxy));roots.add(root("s6i","b"));early.await();
        check("TEST ONLY ambulance behind you".equals(lastAnnounce().getString("message")),"Actual early native entry lost text");
        Object queue=call(sound,"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Muted native sound reached playback queue");
        report.put("native_completions",first.count.get()+repeat.count.get()+early.count.get());report.put("local_speech_disabled",true);report.put("local_traffic_sound_disabled",true);report.put("native_queue_empty",true);
    }
    /** Select the released profile through its real entrypoint before any subscribe/app guard. */
    private Class<?> initializeProductionFeed(boolean inert)throws Exception{
        Class<?> feed=type("nl.johninnl.flitsmeister.NavigationBroadcasts");
        onMain(()->{
            Field app=feed.getDeclaredField("app");app.setAccessible(true);
            Field subscription=feed.getDeclaredField("reportSubscription");subscription.setAccessible(true);
            Field profile=feed.getDeclaredField("version15");profile.setAccessible(true);
            check(subscription.get(null)==null||profile.getBoolean(null)==fm15,"A prior wrong-profile subscription requires a fresh source process");
            // Retain the existing inert-fixture context boundary: skip receiver/heartbeat
            // registration and initial legacy broadcasts, not native profile selection.
            if(inert&&app.get(null)==null)app.set(null,context);
            feed.getMethod(fm15?"init15":"init",Context.class).invoke(null,context);
            check(profile.getBoolean(null)==fm15,"Real feed initializer did not select the admitted publisher profile");
            if(inert){Field active=feed.getDeclaredField("active");active.setAccessible(true);active.setBoolean(null,false);}
        });
        return feed;
    }
    private void attachProductionReports(JSONObject report)throws Exception{
        // This is the genuine endpoint constructor; its immutable complete flag stays
        // exactly what the installed source advertises, including pre-acceptance false.
        Object endpoint=capture.getMethod("init",Context.class).invoke(null,context);
        Class<?> feed=initializeProductionFeed(true);
        Method subscribe=feed.getDeclaredMethod("subscribeReports");subscribe.setAccessible(true);onMain(()->subscribe.invoke(null));
        Field subscription=feed.getDeclaredField("reportSubscription");subscription.setAccessible(true);check(subscription.get(null)!=null,"Original production report subscription was not attached");
        report.put("native_endpoint_initialized",true).put("producer_capture_complete_advertised",read(read(endpoint,"profile"),"complete"))
            .put("native_report_feed_initializer",fm15?"init15":"init").put("native_report_callback",fm15?"u39":"b49")
            .put("inert_legacy_publication",true).put("test_sink_used",true).put("production_endpoint_used",false);
    }
    private void controlledFix()throws Exception{
        Location fix=new Location("synthetic-native-probe");fix.setLatitude(52);fix.setLongitude(5);fix.setAccuracy(3);fix.setSpeed(20);fix.setBearing(0);fix.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());
        Class<?> source=type("bza");source.getField("b").set(null,fix);source.getField("h").set(null,null);
    }
    private void point(JSONObject report)throws Exception{
        attachProductionReports(report);controlledFix();Object service=singleton("fc0","S1");clearNativeReports(service);Object camera=camera("SPEED_50","probe-native-point");
        int before=announces();onMain(()->call(service,"J",camera,true));roots.add(root("fc0","J"));waitFor(()->announces()==before+1,"Native accepted point did not announce");
        String id=lastAnnounce().getString("warning_id");int updates=count("UPSERT",id);onMain(()->call(service,stateUpdateMethod(),camera));roots.add(root("fc0",stateUpdateMethod()));waitFor(()->count("UPSERT",id)>updates,"Native state update did not reach production report subscription");
        check(announces()==before+1,"State update manufactured an ANNOUNCE");onMain(()->call(service,"J",camera,true));waitForIdleSync();check(announces()==before+1,"Native immediate repeat guard was bypassed");
        onMain(()->call(service,"J",camera,false));waitFor(()->has("CLEAR",id),"Native removal did not clear source state");
        Class<?> typeClass=type(REPORTS+"SpeedCamType");Method mute=typeClass.getMethod("muteCategory",Context.class,int.class,boolean.class);Object type=enumValue(REPORTS+"SpeedCamType","RED_LIGHT");int category=-1;
        for(int i=0;i<3;i++)mute.invoke(null,context,i,false);
        for(int i=0;i<3;i++){mute.invoke(null,context,i,true);if(Boolean.TRUE.equals(call(type,"isSpeedCamTypeMutedFromCategory",context))){category=i;break;}mute.invoke(null,context,i,false);}
        check(category>=0,"Could not select the native red-light category filter");Object disabled=camera("RED_LIGHT","probe-native-disabled-category");int accepted=announces();
        onMain(()->call(service,"J",disabled,true));waitForIdleSync();SystemClock.sleep(200);check(announces()==accepted,"Native disabled category still exported an announcement");
        report.put("state_updates_never_announce",true);report.put("native_removal_cleared",true);report.put("native_immediate_repeat_guard_preserved",true);report.put("native_category_filter_preserved",true);report.put("native_muted_category_index",category);
    }
    private void voice(JSONObject report)throws Exception{
        controlledFix();preferences.edit().putBoolean("pref_enable_custom_spoken_warnings",false).commit();Object incident=type(REPORTS+"Incident").getConstructor().newInstance();
        call(incident,"setId","probe-native-voice-only");call(incident,"setIncidentType",enumValue(REPORTS+"IncidentType","VOICE_ONLY"));call(incident,"setVoiceOnlyText","TEST ONLY native voice-only warning");
        Object manager=type("xl").getField("a").get(null);int before=announces();onMain(()->call(manager,"a",context,incident));
        waitFor(()->announces()==before+1,"Accepted resumed native VOICE_ONLY arm did not announce");roots.add(root("xl$c","invokeSuspend"));check("TEST ONLY native voice-only warning".equals(lastAnnounce().getString("message")),"VOICE_ONLY text lost before g()");
        report.put("accepted_resumed_voice_only",true);
    }
    private void directCits(JSONObject report)throws Exception{
        controlledFix();Class<?> eventClass=type("bemobile.cits.sdk.core.model.response.RoadWorks");Object event=eventClass.getConstructor().newInstance();
        event.getClass().getField("info").set(event,type("bemobile.cits.sdk.core.model.response.generalObjects.Info").getConstructor(JSONObject.class).newInstance(new JSONObject().put("eventID","probe-native-roadworks").put("version",1)));
        JSONObject geo=new JSONObject("{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[5,52.001]},\"properties\":{}}]}");
        event.getClass().getField("geoJSON").set(event,type("ma9").getMethod("a",JSONObject.class).invoke(null,geo));
        Object model=type("nl.flitsmeister.fmcore.models.data.cits.CitsRoadWorks").getConstructor(eventClass).newInstance(event),service=singleton("fc0","S1");int before=announces();
        onMain(()->call(service,"x",model));roots.add(root("fc0","x"));waitFor(()->announces()==before+1,"Actual accepted CITS branch did not announce");
        check("CitsRoadWorks".equals(lastAnnounce().getString("native_family")),"CITS family lost");report.put("actual_cits_branch",true);
    }
    private Object genuinePreferences()throws Exception{
        Class<?> api=type("xie"),entry=type("zp0");Object component=entry.getMethod("b",Context.class,Class.class).invoke(null,context,api);
        Object value=api.getMethod(fm15?"D":"C").invoke(component);
        check(type("wie").isInstance(value)&&!Proxy.isProxyClass(value.getClass())&&(!fm15||value.getClass().getName().equals("gm8")),"Genuine native feature preferences were not resolved");return value;
    }
    private void earlyBus(JSONObject report)throws Exception{
        attachProductionReports(report);controlledFix();type("gqg").getField("b").setBoolean(null,true);
        Object service=singleton("nh7","Z");service.getClass().getField("s").set(service,genuinePreferences());Object listener=service.getClass().getField("I").get(service);
        Object notification=notification("AMBULANCE","probe-native-early-bus");call(notification,"setLatitude",52.001d);call(notification,"setLongitude",5d);
        int before=announces();onMain(()->call(listener,"onEarlyWarningNotificationUpdate",type("bza").getField("b").get(null),notification));roots.add(root("nh7$c","onEarlyWarningNotificationUpdate"));
        waitFor(()->announces()==before+1,"Accepted native early listener did not announce");String id=lastAnnounce().getString("warning_id");
        Object update=notification("AMBULANCE","probe-native-early-bus");call(update,"setLatitude",52.001d);call(update,"setLongitude",5d);call(update,"setFreetext","TEST ONLY updated early instruction");
        onMain(()->call(listener,"onEarlyWarningNotificationUpdate",type("bza").getField("b").get(null),update));waitFor(()->hasMessage("UPSERT",id,"TEST ONLY updated early instruction"),"Native early update did not produce revised state text");
        check(announces()==before+1,"Native early update manufactured ANNOUNCE");onMain(()->call(listener,"onEarlyWarningNotificationUpdate",type("bza").getField("b").get(null),null));
        waitFor(()->has("CLEAR",id),"Native early null removal did not clear");report.put("native_early_state_and_null_removal",true);report.put("native_service_onStart_called",false);
    }
    private Object fallbackCitsManager()throws Exception{
        preferences.edit().putString("pref_cits_base_url","ACCEPTANCE").commit();
        return type("cz2").getConstructor(Context.class,type("wie")).newInstance(context,genuinePreferences());
    }
    private Object baseEvent(String kind,String id)throws Exception{
        Object event=type("bemobile.cits.sdk.core.model.response."+kind).getConstructor().newInstance();
        JSONObject info=new JSONObject().put("eventID",id).put("version",1).put("countries",new JSONArray().put("nl"));
        event.getClass().getField("info").set(event,type("bemobile.cits.sdk.core.model.response.generalObjects.Info").getConstructor(JSONObject.class).newInstance(info));
        JSONObject geo=new JSONObject("{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[5,52.001]},\"properties\":{}}]}");
        event.getClass().getField("geoJSON").set(event,type("ma9").getMethod("a",JSONObject.class).invoke(null,geo));
        JSONObject alert=new JSONObject().put("codes",new JSONArray().put(new JSONObject().put("code",201)));
        event.getClass().getField("alertC").set(event,type("bemobile.cits.sdk.core.model.response.generalObjects.AlertC").getConstructor(JSONObject.class).newInstance(alert));
        event.getClass().getField("heading").setDouble(event,0);return event;
    }
    private void impact(JSONObject report)throws Exception{
        controlledFix();Object manager=fallbackCitsManager(),event=baseEvent("ImpactAttenuator","probe-native-impact");int before=announces();
        onMain(()->call(manager,"a",event));roots.add(root("cz2","a"));roots.add(root("xl",presentationMethod()));waitFor(()->announces()==before+1,"Native Impact producer did not announce once");
        String id=lastAnnounce().getString("warning_id");onMain(()->call(manager,"e",event));roots.add(root("cz2","e"));waitFor(()->has("UPSERT",id),"Native Impact update missing");
        check(announces()==before+1,"Native Impact projection/update duplicated ANNOUNCE");onMain(()->call(manager,"b",event));roots.add(root("cz2","b"));waitFor(()->has("CLEAR",id),"Native Impact deletion did not clear");
        report.put("native_impact_single_authority",true);report.put("native_impact_update_and_clear",true);
    }
    private void vri(JSONObject report)throws Exception{
        controlledFix();Object manager=fallbackCitsManager(),event=baseEvent("SpeedAdvice","probe-native-vri");event.getClass().getField("adviceKph").setInt(event,40);event.getClass().getField("isTrafficLight").setBoolean(event,true);
        int before=announces();onMain(()->call(manager,"a",event));roots.add(root("cz2","a"));waitFor(()->hasAnyType("UPSERT","CITS_SPEED_ADVICE"),"Native VRI state missing");String id=lastType("CITS_SPEED_ADVICE").getString("warning_id");
        event.getClass().getField("adviceKph").setInt(event,50);onMain(()->call(manager,"e",event));roots.add(root("cz2","e"));waitFor(()->lastType("CITS_SPEED_ADVICE").getInt("native_advice_kmh")==50,"Native VRI update lost speed");
        onMain(()->call(manager,"b",event));roots.add(root("cz2","b"));waitFor(()->has("CLEAR",id),"Native VRI removal missing");check(announces()==before,"Native VRI state manufactured speech authority");report.put("native_vri_state_only",true);
    }
    private Object emergencyEvent(String kind,String id)throws Exception{
        Object event=baseEvent(kind,id);String prefix="bemobile.cits.sdk.core.model.response.generalObjects.";Class<?> vehicle=type(prefix+"SourceVehicle");
        event.getClass().getField("sourceVehicleWhat").set(event,vehicle.getConstructor(type(prefix+"SourceVehicleType"),type(prefix+"SourceVehicleSubType")).newInstance(enumValue(prefix+"SourceVehicleType","SPECIAL"),enumValue(prefix+"SourceVehicleSubType","AMBULANCE")));
        Object language=type("t25").getMethod(fm15?"d":"c").invoke(null);String tag=((java.util.Locale)call(language,"a")).toLanguageTag();
        JSONObject free=new JSONObject().put("language",tag).put("freeText","TEST ONLY ambulance behind you");Object value=type(prefix+"FreeTextWhere").getConstructor(JSONObject.class).newInstance(free);
        event.getClass().getField("freeTextsWhere").set(event,Collections.singletonList(value));return event;
    }
    private void cits(JSONObject report)throws Exception{
        controlledFix();((Location)type("bza").getField("b").get(null)).setSpeed(0);type("bza").getField("h").set(null,null);
        preferences.edit().putString("pref_cits_base_url","ACCEPTANCE").commit();Object service=singleton("vz2","x1"),first=emergencyEvent("IncomingEmergencyVehicle","probe-native-cits-a"),second=emergencyEvent("IncomingEmergencyVehicle","probe-native-cits-b");int before=announces();
        onMain(()->check(Boolean.TRUE.equals(call(service,"J",first)),"Native CITS first eligibility rejected"));roots.add(root("vz2","J"));waitFor(()->announces()==before+1,"Native CITS first announce missing");String firstId=lastAnnounce().getString("warning_id");
        check("TEST ONLY ambulance behind you".equals(lastAnnounce().getString("native_instruction")),"Actual CITS instruction was discarded");
        check(lastAnnounce().getString("message").contains("TEST ONLY ambulance behind you"),"Native CITS playback payload lost the available instruction");check(hasText(lastAnnounce().getString("native_announced_text")),"Original native announced text missing");
        onMain(()->check(Boolean.TRUE.equals(call(service,"J",second)),"Native CITS second eligibility rejected"));waitFor(()->announces()==before+2,"Native CITS second announce missing");String secondId=lastAnnounce().getString("warning_id");check(!firstId.equals(secondId),"Same-labelled native CITS vehicles merged");
        Object updatedWhere=((List<?>)second.getClass().getField("freeTextsWhere").get(second)).get(0);updatedWhere.getClass().getField("freeText").set(updatedWhere,"TEST ONLY updated ambulance instruction");
        onMain(()->check(Boolean.TRUE.equals(call(service,"L",second)),"Native CITS update rejected"));roots.add(root("vz2","L"));waitFor(()->hasMessage("UPSERT",secondId,"TEST ONLY updated ambulance instruction"),"Native CITS update lost revised instruction");check(announces()==before+2,"Native CITS update duplicated ANNOUNCE");
        onMain(()->check(Boolean.TRUE.equals(call(service,"K",first)),"Native CITS deletion rejected"));roots.add(root("vz2","K"));waitFor(()->has("CLEAR",firstId),"Resumed native CITS deletion did not clear first event");roots.add(root("vz2$c","invokeSuspend"));
        check(!has("CLEAR",secondId),"Deleting first native CITS event cleared a different vehicle");report.put("native_cits_distinct_vehicle_ids",true);report.put("stationary_driver_did_not_veto_emergency",true);report.put("native_cits_update_and_individual_clear",true);report.put("native_cits_instruction_preserved",true);
    }
    /** Actual producer singleton/journal/owner only: no test sink, packet emit or coverage override. */
    private void realEndpointTrigger(JSONObject report)throws Exception{
        Field sink=capture.getDeclaredField("testSink");sink.setAccessible(true);check(sink.get(null)==null,"A test sink would bypass the production Endpoint");
        Object endpoint=capture.getMethod("init",Context.class).invoke(null,context);Object profile=read(endpoint,"profile");check(Boolean.TRUE.equals(profile.getClass().getField("complete").get(profile)),"Production producer coverage is not complete");
        initializeProductionFeed(false);
        String receiver=arguments.getString("receiver_package","com.google.android.apps.maps");String session=String.valueOf(call(endpoint,"sourceSession"));
        String nativeId=arguments.getString("native_id","probe-integrated-"+java.util.UUID.randomUUID());
        status("production_endpoint_ready",new JSONObject().put("provider_session",session).put("receiver_package",receiver).put("producer_complete",true).put("test_sink_present",false).put("target_classloader_used",capture==context.getClassLoader().loadClass(capture.getName())).put("expected_warning_id","SpeedCam:"+nativeId).put("expected_type","SPEED_CAM").put("expected_subtype","SPEED_50"));
        int confirmWait=Integer.parseInt(arguments.getString("receiver_wait_seconds",arguments.getString("confirm_wait_seconds","120")));check(confirmWait>=30&&confirmWait<=120,"Invalid bounded source confirmation wait");long waitUntil=SystemClock.elapsedRealtime()+confirmWait*1000L;
        while(SystemClock.elapsedRealtime()<waitUntil&&!productionReceiverSynced(endpoint,receiver)){assertMuted();SystemClock.sleep(25);}
        check(productionReceiverSynced(endpoint,receiver),"Real receiver never confirmed/synced with production Endpoint");
        controlledFix();Object nativeService=singleton("fc0","S1");clearNativeReports(nativeService);Object camera=camera("SPEED_50",nativeId);
        onMain(()->call(nativeService,"J",camera,true));roots.add(root("fc0","J"));
        Object event=null;long deadline=SystemClock.elapsedRealtime()+3000;
        while(event==null&&SystemClock.elapsedRealtime()<deadline){event=productionEvent(endpoint,session,nativeId);if(event==null)SystemClock.sleep(10);}
        check(event!=null,"Actual accepted native point did not reach the production journal");JSONObject record=new JSONObject((Map<?,?>)call(event,"fields"));report.put("production_native_event",record);
        Method eventKey=type("nl.johninnl.navigation.alerts.PlaybackGrant").getDeclaredMethod("key",event.getClass());eventKey.setAccessible(true);integratedEventKey=String.valueOf(eventKey.invoke(null,event));
        status("native_event_in_production_journal",record);check(sink.get(null)==null,"Production test sink unexpectedly changed");
        int hold=Integer.parseInt(arguments.getString("hold_seconds","20"));hold=Math.min(30,Math.max(10,hold));long minimum=SystemClock.elapsedRealtime()+hold*1000L,until=minimum+30000;
        Set<String> seen=new HashSet<>();JSONArray outcomes=new JSONArray();
        boolean quiescent=false;
        while(SystemClock.elapsedRealtime()<until){assertMuted();JSONArray fresh=productionOutcomes(endpoint,seen);for(int i=0;i<fresh.length();i++)outcomes.put(fresh.get(i));
            if(SystemClock.elapsedRealtime()>=minimum&&terminalObserved&&!ownerPresent&&!pendingPresent&&!((Set<?>)call(endpoint,"capablePackages")).contains(receiver)){quiescent=true;break;}SystemClock.sleep(25);}
        report.put("real_terminal_ack_observed",terminalObserved);report.put("receiver_source_off_and_quiescent",quiescent);check(quiescent,"Real receiver did not terminally ACK and release source ownership before cleanup");
        onMain(()->call(nativeService,"J",camera,false));report.put("production_endpoint_used",true);report.put("test_sink_used",false);report.put("raw_packet_emitted",false);report.put("coverage_override_used",false);report.put("source_dispositions",outcomes);report.put("source_process_hold_seconds",hold);report.put("provider_native_clear_called",true);
        Object sound=singleton("s6i","f"),queue=call(sound,"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Provider native queue is not muted/empty");report.put("provider_native_queue_empty",true);
        status("native_trigger_complete",new JSONObject().put("source_dispositions",outcomes).put("provider_muted",true));
    }
    /** Observe two real consumers and trigger original native models; never create a lease or grant. */
    private void realEndpointHandover(JSONObject report)throws Exception{
        Field sink=capture.getDeclaredField("testSink");sink.setAccessible(true);check(sink.get(null)==null,"Production handover forbids a test sink");
        Object endpoint=capture.getMethod("init",Context.class).invoke(null,context),profile=read(endpoint,"profile");check(Boolean.TRUE.equals(read(profile,"complete")),"Incomplete native profile");
        initializeProductionFeed(false);
        String first=arguments.getString("receiver_package","com.google.android.apps.maps"),second="app.vela",session=String.valueOf(call(endpoint,"sourceSession")),base=arguments.getString("native_id");
        check(first.equals("com.google.android.apps.maps")||first.equals("org.ungoogled.android.apps.maps"),"Unsupported reviewed Maps target");
        status("production_endpoint_ready",new JSONObject().put("provider_session",session).put("receiver_package",first));
        long end=SystemClock.elapsedRealtime()+120000;while(SystemClock.elapsedRealtime()<end&&(!productionReceiverSynced(endpoint,first)||!first.equals(productionOwnerPackage(endpoint)))){assertMuted();SystemClock.sleep(20);}
        check(first.equals(productionOwnerPackage(endpoint)),"First actual receiver never owned audio");status("handover_first_owner_ready",new JSONObject().put("owner",first));
        end=SystemClock.elapsedRealtime()+60000;while(SystemClock.elapsedRealtime()<end&&!productionReceiverSynced(endpoint,second)){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,second),"Second receiver never synced");
        SystemClock.sleep(1500);check(first.equals(productionOwnerPackage(endpoint)),"Second receiver stole first ready owner");
        report.put("both_confirmed_before_first_warning",productionReceiverSynced(endpoint,first)&&productionReceiverSynced(endpoint,second));
        Object service=singleton("fc0","S1");clearNativeReports(service);JSONArray rows=new JSONArray();
        for(int index=1;index<=2;index++){
            String expected=index==1?first:second;
            if(index==2){end=SystemClock.elapsedRealtime()+20000;while(SystemClock.elapsedRealtime()<end&&(productionReceiverSynced(endpoint,first)||!second.equals(productionOwnerPackage(endpoint)))){assertMuted();SystemClock.sleep(20);}check(!productionReceiverSynced(endpoint,first)&&second.equals(productionOwnerPackage(endpoint)),"Actual release did not hand ownership to Vela");}
            String id=base+"-"+index;Object model=camera("SPEED_50",id);controlledFix();onMain(()->call(service,"J",model,true));roots.add(root("fc0","J"));Object event=awaitProductionEvent(endpoint,session,id,0);
            activateEvent(event);Set<String> seen=new HashSet<>();JSONArray outcomes=new JSONArray();status("native_event_in_production_journal",new JSONObject((Map<?,?>)call(event,"fields")));awaitTerminal(endpoint,seen,outcomes,SystemClock.elapsedRealtime()+15000,false);
            check("COMPLETED".equals(lastTerminalState),"Handover native speech not completed");check(expected.equals(productionOwnerPackage(endpoint)),"Wrong receiver owned terminal output");
            if(index==1){java.io.File barrier=new java.io.File(context.getExternalFilesDir(null),"native-warning-ownership/"+base+"-contender-busy");end=SystemClock.elapsedRealtime()+15000;while(!barrier.exists()&&SystemClock.elapsedRealtime()<end){assertMuted();check(first.equals(productionOwnerPackage(endpoint)),"First owner changed before release");SystemClock.sleep(20);}check(barrier.exists(),"Second genuine speaker never reported BUSY");check(barrier.delete(),"Private BUSY barrier cleanup");report.put("contender_busy_observed_before_release",true);if(arguments.getString("scenario").equals("integrated_death_recovery"))verifyRecoveryUi(endpoint,true,report,base);}
            onMain(()->call(service,"J",model,false));JSONObject row=new JSONObject().put("index",index).put("owner",expected).put("authority",new JSONObject((Map<?,?>)call(event,"fields"))).put("source_dispositions",outcomes);rows.put(row);report.put("handover_records",rows);status(index==1?"handover_first_complete":"handover_second_complete",row);
        }
        if(arguments.getString("scenario").equals("integrated_death_recovery"))realDeathRecovery(endpoint,service,session,base,report);
        end=SystemClock.elapsedRealtime()+20000;while(SystemClock.elapsedRealtime()<end){productionOutcomes(endpoint,new HashSet<>());if(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty())break;assertMuted();SystemClock.sleep(20);}
        check(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"Actual receivers did not release and quiesce");
        Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Source queue not muted");
        report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",true).put("real_terminal_ack_observed",true).put("handover_records",rows);
    }
    private void realDeathRecovery(Object endpoint,Object service,String session,String base,JSONObject report)throws Exception{
        String maps=arguments.getString("receiver_package","com.google.android.apps.maps"),deathOwner=arguments.getString("death_owner","app.vela");
        check(deathOwner.equals("app.vela")||deathOwner.equals(maps),"Unexpected death owner");
        if(deathOwner.equals(maps)){status("death_maps_handover_required",new JSONObject().put("owner",deathOwner));long switchEnd=SystemClock.elapsedRealtime()+20000;while(SystemClock.elapsedRealtime()<switchEnd&&(!productionReceiverSynced(endpoint,deathOwner)||productionReceiverSynced(endpoint,"app.vela")||!deathOwner.equals(productionOwnerPackage(endpoint)))){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,deathOwner)&&!productionReceiverSynced(endpoint,"app.vela")&&deathOwner.equals(productionOwnerPackage(endpoint)),"Actual return handover to Maps failed");}
        String id=base+"-death";Object model=camera("SPEED_50",id);controlledFix();onMain(()->call(service,"J",model,true));roots.add(root("fc0","J"));Object event=awaitProductionEvent(endpoint,session,id,0);activateEvent(event);Set<String> seen=new HashSet<>();JSONArray outcomes=new JSONArray();
        long end=SystemClock.elapsedRealtime()+15000;while(!startedObserved&&SystemClock.elapsedRealtime()<end){append(outcomes,productionOutcomes(endpoint,seen));assertMuted();SystemClock.sleep(5);}check(startedObserved&&!terminalObserved,"Cannot kill a genuinely started, nonterminal native player");
        JSONObject death=new JSONObject().put("owner_package",deathOwner).put("authority",new JSONObject((Map<?,?>)call(event,"fields"))).put("source_dispositions_before_death",new JSONArray(outcomes.toString())).put("before_death",productionAudioState(endpoint));report.put("death_recovery",death);status("death_playback_started",death);
        end=SystemClock.elapsedRealtime()+20000;JSONObject uncertain=productionAudioState(endpoint);while(!"AUDIO_UNCERTAIN".equals(uncertain.optString("code"))&&SystemClock.elapsedRealtime()<end){append(outcomes,productionOutcomes(endpoint,seen));check(!terminalObserved,"Player completed before process death; no unknown-output proof");SystemClock.sleep(10);uncertain=productionAudioState(endpoint);}check("AUDIO_UNCERTAIN".equals(uncertain.optString("code"))&&uncertain.optBoolean("pending_started"),"Actual receiver death did not preserve started uncertainty");death.put("after_death",uncertain);status("death_uncertainty_observed",uncertain);
        // Lease expiry alone must never turn potentially playing output into a fresh grant.
        SystemClock.sleep(7000);JSONObject expired=productionAudioState(endpoint);check("AUDIO_UNCERTAIN".equals(expired.optString("code"))&&expired.optBoolean("pending_present")&&!expired.optBoolean("owner_present"),"Lease expiry unfenced actual unknown output");death.put("after_lease_expiry",expired);status("death_uncertainty_fenced",expired);
        java.io.File stopped=new java.io.File(context.getExternalFilesDir(null),"native-warning-ownership/"+base+"-outputs-stopped");end=SystemClock.elapsedRealtime()+30000;while(!stopped.exists()&&SystemClock.elapsedRealtime()<end){assertMuted();SystemClock.sleep(20);}check(stopped.exists(),"Host has not verified both receivers and native TTS stopped");check(stopped.delete(),"Stopped-output barrier cleanup");
        check(((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"A receiver is still registered before parked recovery");verifyRecoveryUi(endpoint,false,report,base);death.put("after_recovery",productionAudioState(endpoint));onMain(()->call(service,"J",model,false));status("death_recovery_completed",death);
        end=SystemClock.elapsedRealtime()+45000;while(SystemClock.elapsedRealtime()<end&&!productionReceiverSynced(endpoint,deathOwner)){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,deathOwner),"Fresh genuine receiver did not reconnect after recovery");check(!productionAudioState(endpoint).optBoolean("pending_present"),"Old pending output returned before future authority");
        String futureId=base+"-future";Object future=camera("SPEED_50",futureId);controlledFix();onMain(()->call(service,"J",future,true));Object futureEvent=awaitProductionEvent(endpoint,session,futureId,0);activateEvent(futureEvent);JSONArray futureOutcomes=new JSONArray();awaitTerminal(endpoint,new HashSet<>(),futureOutcomes,SystemClock.elapsedRealtime()+15000,false);check("COMPLETED".equals(lastTerminalState),"Future native warning did not complete after actual recovery");onMain(()->call(service,"J",future,false));death.put("future_authority",new JSONObject((Map<?,?>)call(futureEvent,"fields"))).put("future_source_dispositions",futureOutcomes);status("death_future_completed",death);
    }
    private void realWarningSuite(JSONObject report)throws Exception{
        if(arguments.getString("warning_suite_cases","all").equals("native-zone")){realNativeZone15Suite(report);return;}
        if(arguments.getString("warning_suite_cases","all").equals("delayed-passage")){realDelayedPassageSuite(report);return;}
        if(arguments.getString("warning_suite_cases","all").equals("moving-camera")){realMovingCameraSuite(report);return;}
        if(arguments.getString("warning_suite_cases","all").equals("concurrent")){realConcurrentWarningSuite(report);return;}
        if(arguments.getString("warning_suite_cases","all").equals("native-guidance")){realNativeGuidanceSuite(report);return;}
        Object endpoint=restartEndpoint();String session=String.valueOf(call(endpoint,"sourceSession")),receiver=arguments.getString("death_owner"),base=arguments.getString("native_id");JSONObject initial=productionAudioState(endpoint);check(!initial.optBoolean("pending_present")&&!initial.optBoolean("owner_present"),"Refuse to overwrite existing warning output");status("warning_suite_ready",new JSONObject().put("provider_session",session).put("receiver",receiver));
        long end=SystemClock.elapsedRealtime()+90000;while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<end){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,receiver),"Real warning-suite receiver did not connect");Object service=singleton("fc0","S1");clearNativeReports(service);JSONArray rows=new JSONArray();
        String[][] cases={{"camera","SPEED_50","50"},{"camera","SPEED_100","100"},{"camera","SPEED_130","130"},{"incident","WRONG_WAY_DRIVER","Wrong-way driver"},{"incident","PERSON_ON_ROAD","Person on the road"},{"incident","STATIONARY_VEHICLE","Stationary vehicle"},{"incident","OBSTACLE","Object on the road"},{"early","AMBULANCE","aa_ew_ambulance"},{"early","FIRE_DEPARTMENT","aa_ew_fire"},{"early","POLICE","aa_ew_police"},{"early","ROAD_SERVICE","aa_ew_emergency_service"}};
        String selection=arguments.getString("warning_suite_cases","all");check(selection.equals("all")||selection.equals("road-service"),"Unknown bounded warning-suite selection");if(selection.equals("road-service"))cases=new String[][]{cases[cases.length-1]};report.put("warning_suite_selection",selection);
        for(int index=0;index<cases.length;index++){
            String family=cases[index][0],subtype=cases[index][1],expect=cases[index][2],id=base+"-"+index;Object model;String nativeExpected=expect;
            if(family.equals("camera"))model=camera(subtype,id);
            else if(family.equals("incident")){model=type(REPORTS+"Incident").getConstructor().newInstance();call(model,"setId",id);call(model,"setIncidentType",enumValue(REPORTS+"IncidentType",subtype));Location target=new Location("synthetic-native-suite-target");target.setLatitude(52.001);target.setLongitude(5);call(model,"setLocation",target);}
            else{Object notification=notification(subtype,id);int resource=context.getResources().getIdentifier(expect,"string",context.getPackageName());check(resource!=0,"Original emergency resource missing");nativeExpected=context.getString(resource);call(notification,"setFreetext","");call(notification,"setTitle",nativeExpected);call(notification,"setDescription","[]");model=type("nl.flitsmeister.fmcore.models.data.reports.EarlyWarningReport").getConstructor(type(EARLY+"EarlyWarningNotification")).newInstance(notification);}
            Object actualModel=model;final float speed=family.equals("camera")?Float.parseFloat(expect)/3.6f:20f;JSONObject input=new JSONObject();boolean ready=productionOwnerReady(endpoint);
            onMain(()->{if(family.equals("early")){type("bza").getField("b").set(null,null);type("bza").getField("h").set(null,Float.valueOf(0));input.put("native_gps_present",false).put("native_speed_mps",0);}else{controlledFix();Location fix=(Location)type("bza").getField("b").get(null);fix.setSpeed(speed);Location target=(Location)call(actualModel,"getLocation");input.put("native_gps_present",true).put("native_speed_mps",fix.getSpeed()).put("native_fix_latitude",fix.getLatitude()).put("native_fix_longitude",fix.getLongitude()).put("distance_to_native_target_m",fix.distanceTo(target));}call(service,"J",actualModel,true);});roots.add(root("fc0","J"));Object event=awaitProductionEvent(endpoint,session,id,0);JSONObject authority=new JSONObject((Map<?,?>)call(event,"fields"));check(subtype.equals(authority.getString("native_subtype")),"Native warning subtype changed");check(authority.getString("message").contains(nativeExpected),"Distinct native warning text was lost: "+subtype);if(family.equals("early")){check(!authority.has("latitude")&&!authority.has("longitude"),"No-coordinate native emergency gained a point");check("emergency_vehicle".equals(authority.getString("category"))&&authority.getInt("priority")==0&&"moving_emergency".equals(authority.getString("relevance")),"Native early emergency lost its emergency category/immediate scheduling policy");}
            activateEvent(event);JSONArray outcomes=new JSONArray();Set<String> seen=new HashSet<>();JSONObject row=new JSONObject().put("index",index).put("family",family).put("native_subtype",subtype).put("expected_native_text_fragment",nativeExpected).put("controlled_native_input",input).put("receiver_owner_ready_before_native",ready).put("authority",authority).put("source_dispositions",outcomes);rows.put(row);report.put("warning_suite_records",rows);status("warning_suite_native_event",row);awaitTerminal(endpoint,seen,outcomes,SystemClock.elapsedRealtime()+18000,false);check("COMPLETED".equals(lastTerminalState),"Native warning-suite event did not complete: "+subtype);row.put("source_terminal",lastTerminalState);onMain(()->call(service,"J",actualModel,false));status("warning_suite_event_completed",row);
        }
        status("warning_suite_complete",new JSONObject().put("native_authorities",rows.length()));end=SystemClock.elapsedRealtime()+30000;while(SystemClock.elapsedRealtime()<end){productionOutcomes(endpoint,new HashSet<>());if(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty())break;assertMuted();SystemClock.sleep(20);}check(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"Suite receiver did not quiesce/release");Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Suite provider queue was not muted/empty");report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",true).put("real_terminal_ack_observed",true).put("warning_suite_records",rows).put("scope_note","Controlled accepted original native announcement entry points and input speeds; not natural detector/route lead-time proof or a latency percentile corpus.");
    }
    private JSONObject replayJournal(Object endpoint,String session)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");
        return actor.submit(()->{
            long now=SystemClock.elapsedRealtime();Object view=call(read(endpoint,"journal"),"resume",session,0L,now);
            JSONObject snapshot=new JSONObject().put("observed_elapsed_ms",now).put("head_sequence",read(view,"headSequence"));
            for(String key:new String[]{"events","currentState"}){JSONArray values=new JSONArray();for(Object event:(List<?>)read(view,key))values.put(new JSONObject((Map<?,?>)call(event,"fields")));snapshot.put(key,values);}
            JSONArray announcements=new JSONArray();for(Object candidate:(List<?>)read(view,"announcements"))announcements.put(new JSONObject((Map<?,?>)call(read(candidate,"authority"),"fields")));return snapshot.put("announcements",announcements);
        }).get(3,TimeUnit.SECONDS);
    }
    private void replayWaitConnected(Object endpoint,String receiver)throws Exception{
        long until=SystemClock.elapsedRealtime()+12000;while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<until){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,receiver),"Replay receiver did not synchronize");
    }
    private void replayWaitReleased(Object endpoint)throws Exception{
        long until=SystemClock.elapsedRealtime()+10000;
        while(SystemClock.elapsedRealtime()<until){productionOutcomes(endpoint,new HashSet<>());if(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty())return;assertMuted();SystemClock.sleep(20);}
        throw new IllegalStateException("Replay receiver did not release/quiesce");
    }
    private void realDelayedPassageSuite(JSONObject report)throws Exception{
        Object endpoint=restartEndpoint();String session=String.valueOf(call(endpoint,"sourceSession")),receiver=arguments.getString("death_owner"),base=arguments.getString("native_id");
        JSONObject initial=productionAudioState(endpoint);check(!initial.optBoolean("pending_present")&&!initial.optBoolean("owner_present")&&((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"Pre-existing replay output or client");
        status("warning_suite_ready",new JSONObject().put("provider_session",session).put("receiver",receiver));Object service=singleton("fc0","S1");clearNativeReports(service);JSONArray cases=new JSONArray();report.put("delayed_passage_records",cases);
        replayWaitConnected(endpoint,receiver);java.io.File gpsReady=new java.io.File(context.getExternalFilesDir(null),"native-warning-ownership/"+base+"-replay-gps-ready");long gpsDeadline=SystemClock.elapsedRealtime()+10000;while(!gpsReady.exists()&&SystemClock.elapsedRealtime()<gpsDeadline){assertMuted();SystemClock.sleep(20);}check(gpsReady.exists()&&gpsReady.delete(),"Empty-journal receiving GPS warmup was not witnessed");JSONObject emptyJournal=replayJournal(endpoint,session);check(emptyJournal.getJSONArray("events").length()==0,"Preflight journal is not empty");report.put("empty_journal_preflight",emptyJournal);status("replay_preflight_completed",emptyJournal);replayWaitReleased(endpoint);
        for(String scenario:new String[]{"passed_fresh","ahead_fresh","expired_ahead"}){
            String id=base+"-"+scenario;Object model=camera("SPEED_50",id);Location target=new Location("private-delayed-camera-target");target.setLatitude(scenario.equals("passed_fresh")?52.38:52.3815);target.setLongitude(4.9);call(model,"setLocation",target);
            check(((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"Replay warning must precede receiver registration");
            onMain(()->{Location sourceFix=new Location("private-native-before-target");sourceFix.setLatitude(target.getLatitude()-.0005);sourceFix.setLongitude(4.9);sourceFix.setBearing(0);sourceFix.setSpeed(20);sourceFix.setAccuracy(3);sourceFix.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());type("bza").getField("b").set(null,sourceFix);type("bza").getField("h").set(null,null);call(service,"J",model,true);});roots.add(root("fc0","J"));
            Object event=awaitProductionEvent(endpoint,session,id,0);activateEvent(event);JSONObject authority=new JSONObject((Map<?,?>)call(event,"fields"));JSONArray outcomes=new JSONArray();Set<String> seen=new HashSet<>();
            JSONObject row=new JSONObject().put("scenario",scenario).put("authority",authority).put("source_dispositions",outcomes).put("receiver_latitude",52.3806).put("receiver_longitude",4.9).put("receiver_speed_mps",20).put("receiver_registered_at_native_issue",false);cases.put(row);
            if(scenario.equals("expired_ahead")){long expiry=authority.getLong("announce_until_elapsed_ms");status("replay_waiting_for_native_deadline",row);while(SystemClock.elapsedRealtime()<=expiry+250){assertMuted();SystemClock.sleep(20);}}
            row.put("journal_before_receiver",replayJournal(endpoint,session));status("replay_case_prepared",row);replayWaitConnected(endpoint,receiver);row.put("receiver_synchronized_elapsed_ms",SystemClock.elapsedRealtime());
            if(scenario.equals("expired_ahead")){
                long until=SystemClock.elapsedRealtime()+1600;while(SystemClock.elapsedRealtime()<until){append(outcomes,productionOutcomes(endpoint,seen));assertMuted();SystemClock.sleep(20);}check(outcomes.length()==0&&!pendingPresent,"Expired snapshot acquired playback authority");row.put("journal_after_receiver",replayJournal(endpoint,session)).put("expected_result","STATE_ONLY_NO_AUTHORITY");
            }else{
                String desired=scenario.equals("passed_fresh")?"REJECTED":"COMPLETED";long until=SystemClock.elapsedRealtime()+8000;
                while(!desired.equals(lastTerminalState)&&SystemClock.elapsedRealtime()<until){append(outcomes,productionOutcomes(endpoint,seen));assertMuted();SystemClock.sleep(10);}check(desired.equals(lastTerminalState),"Delayed native warning had wrong outcome: "+scenario+" / "+lastTerminalState);row.put("expected_result",desired);
                if(scenario.equals("passed_fresh")){check(!startedObserved&&SystemClock.elapsedRealtime()<authority.getLong("announce_until_elapsed_ms"),"Passed case expired or actually started");}
                else check(startedObserved,"Ahead replay completed without a real native start");
            }
            status("replay_case_completed",row);replayWaitReleased(endpoint);
            if(scenario.equals("passed_fresh")){
                status("replay_same_authority_rebind",row);replayWaitConnected(endpoint,receiver);JSONArray rebound=new JSONArray();long until=SystemClock.elapsedRealtime()+1000;Set<String> reboundSeen=new HashSet<>();while(SystemClock.elapsedRealtime()<until){append(rebound,productionOutcomes(endpoint,reboundSeen));assertMuted();SystemClock.sleep(20);}check(!startedObserved&&!pendingPresent&&"REJECTED".equals(lastTerminalState),"Passed authority replayed after receiver rebind");row.put("same_authority_rebind_dispositions",rebound);status("replay_rebind_completed",row);replayWaitReleased(endpoint);
            }
            onMain(()->call(service,"J",model,false));Object clear=awaitNativeOperation(endpoint,session,authority.getString("warning_id"),"CLEAR",authority.getLong("sequence"));row.put("native_clear",new JSONObject((Map<?,?>)call(clear,"fields")));
        }
        Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Replay provider queue was not muted/empty");report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",true).put("scope_note","Controlled original accepted native events before genuine registration/rebind, real journal deadlines and receiving GPS. No constructed packets, cursor/clock edits or grant overrides.");status("warning_suite_complete",new JSONObject().put("native_authorities",cases.length()));
    }
    private JSONObject zone15Bean(Object value)throws Exception{
        JSONObject out=new JSONObject();
        for(Field field:value.getClass().getFields()){
            if(java.lang.reflect.Modifier.isStatic(field.getModifiers()))continue;
            Object item=field.get(value);
            if(item instanceof Number&&!Double.isFinite(((Number)item).doubleValue()))item=null;
            if(item instanceof Map)item=new JSONObject((Map<?,?>)item);
            else if(item!=null&&!(item instanceof String)&&!(item instanceof Number)&&!(item instanceof Boolean))item=zone15Bean(item);
            out.put(field.getName(),item==null?JSONObject.NULL:item);
        }
        return out;
    }
    private JSONObject zone15Journal(Object endpoint,String session,long cursor)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");
        return actor.submit(()->{
            Object view=call(read(endpoint,"journal"),"resume",session,cursor,SystemClock.elapsedRealtime());
            check(!Boolean.TRUE.equals(read(view,"resyncRequired"))&&!Boolean.TRUE.equals(read(view,"overflow")),"Zone journal gap/overflow; no substitute authority admitted");
            JSONArray rows=new JSONArray();for(Object event:(List<?>)read(view,"events"))rows.put(new JSONObject((Map<?,?>)call(event,"fields")));
            return new JSONObject().put("head",read(view,"headSequence")).put("events",rows);
        }).get(3,TimeUnit.SECONDS);
    }
    private void zone15FailureIdentity(JSONObject trace,String key,
            nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.Handle handle){
        AtomicReference<nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.IdentityState> state=new AtomicReference<>();
        AtomicReference<Throwable> inspectionError=new AtomicReference<>();
        try{
            // Failure observation must not depend on mute/trace/admission still being healthy.
            // Inspect cached references only; never initialize, admit or restore input here.
            runOnMainSync(()->{try{
                nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.Handle current=handle==null?nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.current():handle;
                if(current!=null)state.set(nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.inspectIdentity(current));
            }catch(Throwable error){inspectionError.set(error);}});
            if(inspectionError.get()!=null)throw inspectionError.get();
            if(state.get()!=null)trace.put(key,zone15Bean(state.get()));
        }catch(Throwable error){try{trace.put(key+"_inspection_failure",android.util.Log.getStackTraceString(error));}catch(Exception ignored){}}
    }
    private void realNativeZone15Suite(JSONObject report)throws Exception{
        check(fm15,"Native zone fixture requires the admitted15 profile");
        Object endpoint=restartEndpoint();String session=String.valueOf(call(endpoint,"sourceSession")),receiver=arguments.getString("death_owner");
        JSONObject initial=productionAudioState(endpoint);check(!initial.optBoolean("pending_present")&&!initial.optBoolean("owner_present"),"Pre-existing zone playback");
        status("warning_suite_ready",new JSONObject().put("provider_session",session).put("receiver",receiver));
        long deadline=SystemClock.elapsedRealtime()+90000;while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<deadline){assertMuted();SystemClock.sleep(20);}
        check(productionReceiverSynced(endpoint,receiver),"Actual zone receiver did not synchronize");
        String id="private-fm15-zone-"+java.util.UUID.randomUUID();float speed=20;JSONArray requests=new JSONArray(),samples=new JSONArray(),events=new JSONArray(),announcements=new JSONArray();
        JSONObject trace=new JSONObject().put("native_id",id).put("source_location_override_used",false).put("native_policy_override_used",false)
                .put("native_decision_override_used",false).put("native_repeat_acceptance",false).put("gps_requests",requests).put("source_samples",samples).put("journal_events",events).put("announcements",announcements);
        nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.Handle handle=null;Throwable primaryFailure=null;
        Map<Long,Object> authorities=new LinkedHashMap<>();Map<Long,JSONArray> outcomes=new LinkedHashMap<>();Map<Long,Set<String>> seen=new LinkedHashMap<>();
        try{
            AtomicReference<nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.SourceState> warm=new AtomicReference<>();
            long began=SystemClock.elapsedRealtime(),next=began;Exception last=null;
            while(warm.get()==null&&SystemClock.elapsedRealtime()-began<20000){
                long now=SystemClock.elapsedRealtime();if(now>=next){next=now+1000;requestMoving15Gps(requests,72,52.345+speed*(now-began)/111195000d,4.9,speed,"zone_warmup");}
                try{onMain(()->{nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.SourceState state=nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.inspect(context);if(state.sourceElapsedRealtimeNanos/1000000>=began&&Math.abs(state.sourceSpeedMps-speed)<1)warm.set(state);});}catch(Exception error){last=error;}
                if(warm.get()==null)SystemClock.sleep(50);
            }
            check(warm.get()!=null,"Original zone lifecycle/jobs/GPS unavailable: "+(last==null?"":last.getClass().getName()));
            final double origin=warm.get().sourceLatitude,longitude=warm.get().sourceLongitude,start=origin+300/111195d,end=start+500/111195d;
            trace.put("warmup",zone15Bean(warm.get())).put("start_latitude",start).put("end_latitude",end).put("longitude",longitude).put("speed_mps",speed);
            AtomicReference<nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.Handle> admitted=new AtomicReference<>();
            onMain(()->admitted.set(nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.begin(context,id,start,longitude,end,longitude)));handle=admitted.get();
            roots.add("Liji;->l");roots.add("Lwd6;->B");final nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.Handle owned=handle;
            long anchor=warm.get().sourceElapsedRealtimeNanos/1000000,nextGps=SystemClock.elapsedRealtime(),lastFix=-1,cursor=0;
            boolean entered=false,left=false;long crossedEnd=-1;
            while(SystemClock.elapsedRealtime()-anchor<75000){
                long now=SystemClock.elapsedRealtime();if(now>=nextGps){nextGps=now+1000;requestMoving15Gps(requests,72,origin+speed*(now-anchor)/111195000d,longitude,speed,"zone_native_motion");}
                AtomicReference<nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.Sample> sample=new AtomicReference<>();AtomicReference<nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.ZoneObservation> zone=new AtomicReference<>();
                onMain(()->{sample.set(nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.check(owned));zone.set(nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.observeZone(owned));});
                if(sample.get().sourceElapsedRealtimeNanos!=lastFix){lastFix=sample.get().sourceElapsedRealtimeNanos;samples.put(new JSONObject().put("observed_elapsed_ms",now).put("native",zone15Bean(sample.get())).put("zone",zone15Bean(zone.get())));check(samples.length()<=128,"Zone sample archive bound");}
                entered|=sample.get().nativeInGpsPath;
                if(sample.get().sourceLatitude>=end&&crossedEnd<0)crossedEnd=sample.get().sourceElapsedRealtimeNanos/1000000;
                left|=entered&&crossedEnd>=0&&!sample.get().nativeInGpsPath&&!sample.get().nativeWarningActive;
                JSONObject journal=zone15Journal(endpoint,session,cursor);cursor=journal.getLong("head");JSONArray rows=journal.getJSONArray("events");
                for(int i=0;i<rows.length();i++){JSONObject row=rows.getJSONObject(i);if(!row.optString("warning_id").endsWith(id))continue;events.put(row);check(events.length()<=512,"Zone event archive bound");
                    if(row.optString("operation").equals("ANNOUNCE")){
                        Object event=productionEventAfter(endpoint,session,id,row.getLong("sequence")-1);check(event!=null,"Original zone ANNOUNCE unavailable");
                        long seq=row.getLong("sequence");authorities.put(seq,event);JSONArray acks=new JSONArray();outcomes.put(seq,acks);seen.put(seq,new HashSet<>());
                        announcements.put(new JSONObject().put("authority",row).put("source_dispositions",acks));
                        status("native_zone_announcement",row);
                    }
                }
                for(Map.Entry<Long,Object> entry:authorities.entrySet()){activateEvent(entry.getValue());append(outcomes.get(entry.getKey()),productionOutcomes(endpoint,seen.get(entry.getKey())));}
                if(left&&crossedEnd>=0&&now-crossedEnd>=6000&&authorities.size()>=2){boolean done=true;for(JSONArray acks:outcomes.values()){boolean completed=false;for(int i=0;i<acks.length();i++)completed|=acks.getJSONObject(i).optString("outcome").equals("COMPLETED");done&=completed;}if(done)break;}
                assertMuted();SystemClock.sleep(50);
            }
            trace.put("native_path_entry_observed",entered).put("native_path_exit_and_removal_observed",left).put("source_end_crossed_elapsed_ms",crossedEnd);
            check(entered&&left&&crossedEnd>0,"Original native zone entry/exit/removal missing");
            check(announcements.length()==2,"Expected actual native zone start and end; preserve any different original result");
            check(announcements.getJSONObject(0).getJSONObject("authority").getString("phase").equals("enter")&&announcements.getJSONObject(1).getJSONObject("authority").getString("phase").equals("exit"),"Unexpected native zone authority phases");
            for(JSONArray acks:outcomes.values()){check(acks.length()==3&&acks.getJSONObject(2).getString("outcome").equals("COMPLETED"),"Actual zone output did not complete exactly once");}
        }catch(Throwable error){primaryFailure=error;trace.put("failure",android.util.Log.getStackTraceString(error));zone15FailureIdentity(trace,"identity_after_failure",handle);if(error instanceof Exception)throw (Exception)error;throw (Error)error;}finally{
            Exception cleanupFailure=null;
            AtomicReference<nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.RestoreResult> restored=new AtomicReference<>();
            final nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.Handle owned=handle;
            try{onMain(()->{nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.Handle current=owned==null?nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.current():owned;if(current!=null)restored.set(nl.johninnl.warningprobe.phasezone.Fm15PrivateZoneInput.restore(current));});}catch(Exception error){trace.put("candidate_restore_failure",android.util.Log.getStackTraceString(error));zone15FailureIdentity(trace,"identity_after_restore_failure",owned);if(primaryFailure!=null)primaryFailure.addSuppressed(error);else cleanupFailure=error;}
            if(restored.get()!=null)trace.put("candidate_restore",zone15Bean(restored.get()));
            java.io.File folder=new java.io.File(context.getExternalFilesDir(null),"native-warning-zones");check(folder.exists()||folder.mkdirs(),"Private zone trace folder");java.io.File file=new java.io.File(folder,id+".json");byte[] bytes=trace.toString().getBytes("UTF-8");try(java.io.FileOutputStream stream=new java.io.FileOutputStream(file)){stream.write(bytes);}
            StringBuilder digest=new StringBuilder();for(byte value:java.security.MessageDigest.getInstance("SHA-256").digest(bytes))digest.append(String.format(java.util.Locale.ROOT,"%02x",value&255));
            report.put("native_zone_trace",file.getAbsolutePath()).put("native_zone_trace_sha256",digest.toString());status("native_zone_trace_ready",new JSONObject().put("remote_trace",file.getAbsolutePath()).put("trace_sha256",digest.toString()));
            if(cleanupFailure!=null)throw cleanupFailure;
        }
        status("warning_suite_complete",new JSONObject().put("native_authorities",announcements.length()));
        deadline=SystemClock.elapsedRealtime()+20000;while(SystemClock.elapsedRealtime()<deadline){productionOutcomes(endpoint,new HashSet<>());if(!ownerPresent&&!pendingPresent&&!productionReceiverSynced(endpoint,receiver))break;assertMuted();SystemClock.sleep(20);}
        check(!ownerPresent&&!pendingPresent&&!productionReceiverSynced(endpoint,receiver),"Zone receiver did not release");Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Native source zone queue not muted/empty");
        report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",true).put("real_terminal_ack_observed",true);
    }
    /** Candidate list is private; original task geometry, decision and alert callbacks remain intact. */
    /** FM15 path v3: GNSS requests are forwarded by the host; only real collected native fixes are read. */
    private void realMovingCamera15Suite(JSONObject report)throws Exception{
        long suiteDeadline=SystemClock.elapsedRealtime()+240000;
        Object endpoint=restartEndpoint();
        String session=String.valueOf(call(endpoint,"sourceSession")),receiver=arguments.getString("death_owner");
        JSONObject initial=productionAudioState(endpoint);
        check(!initial.optBoolean("pending_present")&&!initial.optBoolean("owner_present"),"Pre-existing FM15 moving output");
        JSONArray rows=new JSONArray();report.put("moving_camera_records",rows).put("moving_camera_path","fm15-report-events-v3-settling-tail")
                .put("source_location_override_used",false).put("native_history_override_used",false)
                .put("native_policy_override_used",false).put("candidate_reapply_used",false)
                .put("planned_source_tile",new JSONObject().put("precision",5).put("geohash","u173z")
                        .put("latitude_min",52.3388671875).put("latitude_max",52.3828125)
                        .put("longitude_min",4.8779296875).put("longitude_max",4.921875)
                        .put("interior_latitude_margin_m",100).put("initial_latitude",52.3450).put("initial_longitude",4.9)
                        .put("reason","Keep continuous private trajectory inside one original precision-5 source tile; no geohash, history, query job or native policy override"))
                .put("native_pipeline_original_dex",new JSONArray().put("pef.f/g -> nef -> es7").put("wd6$a$a -> paf -> xd6$a -> ajf.a")
                        .put("xd6 -> wd6.z/A -> xl -> native capture"));
        status("warning_suite_ready",new JSONObject().put("provider_session",session).put("receiver",receiver).put("moving_camera_path","fm15-report-events-v3-settling-tail"));
        long deadline=SystemClock.elapsedRealtime()+90000;
        while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<deadline){assertMuted();SystemClock.sleep(20);}
        check(productionReceiverSynced(endpoint,receiver),"FM15 moving real receiver not synced; native startup is not fabricated");
        double warmLatitude=52.3450,warmLongitude=4.9;
        for(int kmh:new int[]{50,100,130}){
            String id="private-fm15-moving-"+java.util.UUID.randomUUID().toString()+"-"+kmh;
            float speed=kmh/3.6f;JSONArray requests=new JSONArray(),fixes=new JSONArray(),outcomes=new JSONArray();
            JSONObject row=new JSONObject().put("speed_kmh",kmh).put("native_id",id).put("native_fixes",fixes)
                    .put("gps_requests",requests).put("source_dispositions",outcomes)
                    .put("candidate_injection_boundary","Existing pef.g immutable augmentation; guarded native CAS; abort on producer replacement");
            rows.put(row);
            Fm15PrivateMovingInput.Handle handle=null;Throwable failure=null;
            try{
                Fm15PrivateMovingInput.SourceState warm=null;Exception lastWarmupFailure=null;
                long warmStart=SystemClock.elapsedRealtime(),nextRequest=warmStart;
                // Real receiver startup must already have initialized/started native Hilt service/jobs.
                // A finite GNSS warmup can observe readiness; it never creates that service or edits history.
                while(SystemClock.elapsedRealtime()-warmStart<20000&&SystemClock.elapsedRealtime()<suiteDeadline&&warm==null){
                    long now=SystemClock.elapsedRealtime();
                    if(now>=nextRequest){nextRequest=now+1000;requestMoving15Gps(requests,kmh,warmLatitude+speed*((now-warmStart)/1000d)/111195d,warmLongitude,speed,"native_warmup");}
                    AtomicReference<Fm15PrivateMovingInput.SourceState> observed=new AtomicReference<>();
                    try{
                        onMain(()->observed.set(Fm15PrivateMovingInput.inspect(context)));
                        Fm15PrivateMovingInput.SourceState candidate=observed.get();
                        if(candidate.sourceElapsedRealtimeNanos/1000000L>=warmStart&&Math.abs(candidate.sourceSpeedMps-speed)<=2f)warm=candidate;
                    }catch(Exception error){lastWarmupFailure=error;}
                    if(warm==null){assertMuted();SystemClock.sleep(50);}
                }
                if(warm==null){row.put("native_warmup_blocked",true);throw new IllegalStateException("FM15 native lifecycle/jobs or fresh original GPS did not become ready; no input admitted",lastWarmupFailure);}
                check(Math.abs(warm.sourceSpeedMps-speed)<=2f,"Original native GPS speed does not match requested moving case");
                check(moving15WithinBounds(warm.sourceLatitude,warm.sourceLongitude),"Original source GPS is outside planned interior tile bounds");
                int lead=warm.nativePolicy.defaultSecondsRadius;
                check(lead<=120,"FM15 native camera lead exceeds bounded private test duration; configuration unchanged");
                row.put("native_warmup",moving15SourceJson(warm)).put("native_policy",moving15PolicyJson(warm.nativePolicy));
                double travelSeconds=lead+12d,targetLatitude=warm.sourceLatitude+speed*travelSeconds/111195d,longitude=warm.sourceLongitude;
                // Cover bounded native removal, journal CLEAR wait, four-second tail and source-age margin.
                double postTargetBudgetSeconds=20d;
                double plannedEndLatitude=warm.sourceLatitude+speed*(travelSeconds+postTargetBudgetSeconds)/111195d;
                check(moving15WithinBounds(plannedEndLatitude,longitude),"Current native lead does not fit remaining private tile trajectory; policy is unchanged");
                row.put("target_latitude",targetLatitude).put("target_longitude",longitude).put("requested_travel_seconds",travelSeconds)
                        .put("planned_end_latitude",plannedEndLatitude).put("planned_post_target_seconds",postTargetBudgetSeconds)
                        .put("settling_tail_requested_ms",4000).put("planned_source_geohash","u173z");
                final double targetLat=targetLatitude,targetLon=longitude;
                AtomicReference<Fm15PrivateMovingInput.Handle> admitted=new AtomicReference<>();
                onMain(()->admitted.set(Fm15PrivateMovingInput.begin(context,id,"SPEED_"+kmh,targetLat,targetLon,null,null)));
                handle=admitted.get();check(handle!=null,"FM15 candidate input was not admitted");
                roots.add("Liji;->l");roots.add("Lp99$a;->e");
                row.put("native_input_admitted_elapsed_ms",SystemClock.elapsedRealtime());
                final Fm15PrivateMovingInput.Handle owned=handle;
                long start=SystemClock.elapsedRealtime(),crossed=-1,decision=-1,lastFix=-1;Object event=null;
                long sourceAnchor=warm.sourceElapsedRealtimeNanos/1000000L;
                nextRequest=start;Set<String> seen=new HashSet<>();
                boolean naturallyRemoved=false;
                while(SystemClock.elapsedRealtime()-start<(travelSeconds+10)*1000&&SystemClock.elapsedRealtime()<suiteDeadline){
                    long now=SystemClock.elapsedRealtime();
                    if(now>=nextRequest){
                        nextRequest=now+1000;
                        double requestedLatitude=warm.sourceLatitude+speed*((now-sourceAnchor)/1000d)/111195d;
                        requestMoving15Gps(requests,kmh,requestedLatitude,longitude,speed,"native_motion");
                    }
                    AtomicReference<Fm15PrivateMovingInput.Sample> observed=new AtomicReference<>();
                    onMain(()->observed.set(Fm15PrivateMovingInput.check(owned)));
                    Fm15PrivateMovingInput.Sample sample=observed.get();
                    check(moving15WithinBounds(sample.sourceLatitude,sample.sourceLongitude),"Actual native source GPS left planned interior tile bounds");
                    if(sample.nativeEngineActive&&sample.nativeWarningActive&&sample.nativeCalculatedRadiusMeters!=null
                            &&Float.isFinite(sample.nativeCalculatedRadiusMeters)&&sample.nativeCalculatedRadiusMeters>0
                            &&!row.has("native_active_decision_sample"))row.put("native_active_decision_sample",moving15SampleJson(sample));
                    if(sample.sourceElapsedRealtimeNanos!=lastFix){
                        lastFix=sample.sourceElapsedRealtimeNanos;
                        JSONObject fix=moving15SampleJson(sample).put("remaining_m",(targetLatitude-sample.sourceLatitude)*111195d);
                        fixes.put(fix);status("moving_camera_native_fix_observed",fix);
                    }
                    if(event==null){
                        event=productionEventAfter(endpoint,session,id,0);
                        if(event!=null){
                            decision=SystemClock.elapsedRealtime();activateEvent(event);
                            row.put("native_decision_elapsed_ms",decision).put("native_decision_remaining_m",(targetLatitude-sample.sourceLatitude)*111195d)
                                    .put("native_decision_sample",moving15SampleJson(sample)).put("authority",new JSONObject((Map<?,?>)call(event,"fields")));
                            status("moving_camera_native_decision",row);
                        }
                    }
                    if(event!=null){
                        append(outcomes,productionOutcomes(endpoint,seen));
                        if(startedObserved&&!row.has("source_started_observed_elapsed_ms"))row.put("source_started_observed_elapsed_ms",SystemClock.elapsedRealtime());
                        if("COMPLETED".equals(lastTerminalState)&&!row.has("source_completed_observed_elapsed_ms"))row.put("source_completed_observed_elapsed_ms",SystemClock.elapsedRealtime());
                    }
                    if(crossed<0&&sample.sourceLatitude>=targetLatitude){
                        crossed=sample.sourceElapsedRealtimeNanos/1000000L;
                        row.put("target_crossed_elapsed_ms",crossed).put("target_crossing_observed_elapsed_ms",SystemClock.elapsedRealtime());
                        status("moving_camera_target_crossed",new JSONObject().put("speed_kmh",kmh).put("elapsed_ms",crossed).put("origin","actual_native_source_fix"));
                    }
                    if(crossed>=0&&sample.everObservedNativeActive&&!sample.nativeWarningActive&&!sample.nativeInGpsPath){naturallyRemoved=true;break;}
                    assertMuted();SystemClock.sleep(50);
                }
                check(event!=null&&decision>=0&&crossed>decision,"FM15 original pipeline did not announce before actual source target crossing");
                check(row.has("native_active_decision_sample"),"FM15 active native engine/radius observation absent; no calculated substitute admitted");
                check(naturallyRemoved,"FM15 original native passed/removal was not observed; candidate withdrawal cannot substitute");
                check("COMPLETED".equals(lastTerminalState),"FM15 moving warning did not complete");
                check(row.getLong("source_started_observed_elapsed_ms")<crossed&&row.getLong("source_completed_observed_elapsed_ms")<crossed,
                        "FM15 native playback was not positively complete before actual source target crossing");
                JSONObject authority=row.getJSONObject("authority");
                Object clear=awaitNativeOperation(endpoint,session,authority.getString("warning_id"),"CLEAR",authority.getLong("sequence"));
                row.put("native_clear",new JSONObject((Map<?,?>)call(clear,"fields"))).put("natural_native_removal_observed",true)
                        .put("source_terminal",lastTerminalState).put("started_lead_ms",crossed-row.getLong("source_started_observed_elapsed_ms"))
                        .put("completion_lead_ms",crossed-row.getLong("source_completed_observed_elapsed_ms"));
                // Do not stop the receiver at source CLEAR. Keep real GNSS motion long enough for
                // its independent native collector to witness passage; no receiver state is written.
                long tailStarted=SystemClock.elapsedRealtime(),tailDeadline=tailStarted+4000;
                check(tailDeadline<=suiteDeadline,"Insufficient bounded suite time for genuine receiver GPS settling tail");
                JSONArray tailRequests=new JSONArray(),tailFixes=new JSONArray();
                JSONObject tail=new JSONObject().put("requested_duration_ms",4000).put("started_elapsed_ms",tailStarted)
                        .put("after_native_clear_sequence",new JSONObject((Map<?,?>)call(clear,"fields")).getLong("sequence"))
                        .put("gps_requests",tailRequests).put("native_fixes",tailFixes)
                        .put("scope","Source settling only; receiver post-target native GPS remains independently audited");
                row.put("receiver_gps_settling_tail",tail);status("moving_camera_settling_started",tail);
                long nextTailRequest=tailStarted,lastTailFix=-1;
                while(SystemClock.elapsedRealtime()<tailDeadline){
                    long now=SystemClock.elapsedRealtime();
                    if(now>=nextTailRequest){
                        nextTailRequest=now+1000;
                        double requestedLatitude=warm.sourceLatitude+speed*((now-sourceAnchor)/1000d)/111195d;
                        requestMoving15Gps(tailRequests,kmh,requestedLatitude,longitude,speed,"receiver_gps_settling_tail");
                    }
                    AtomicReference<Fm15PrivateMovingInput.Sample> observed=new AtomicReference<>();
                    onMain(()->observed.set(Fm15PrivateMovingInput.check(owned)));
                    Fm15PrivateMovingInput.Sample sample=observed.get();
                    check(moving15WithinBounds(sample.sourceLatitude,sample.sourceLongitude),"Actual native settling source fix left planned tile bounds");
                    check(sample.sourceLatitude>=targetLatitude,"Actual native settling source fix is before the target");
                    check(!sample.nativeWarningActive&&!sample.nativeInGpsPath,"Native warning/path reactivated during settling; no manual clear admitted");
                    if(sample.sourceElapsedRealtimeNanos!=lastTailFix){
                        lastTailFix=sample.sourceElapsedRealtimeNanos;
                        JSONObject fix=moving15SampleJson(sample).put("past_target_m",(sample.sourceLatitude-targetLatitude)*111195d);
                        tailFixes.put(fix);status("moving_camera_settling_native_fix_observed",fix);
                    }
                    assertMuted();SystemClock.sleep(50);
                }
                check(tailFixes.length()>0&&lastTailFix/1000000L>tailStarted,"No new original source GPS pulse was observed during settling tail");
                tail.put("completed_elapsed_ms",SystemClock.elapsedRealtime()).put("observed_duration_ms",SystemClock.elapsedRealtime()-tailStarted);
                status("moving_camera_settling_completed",tail);
            }catch(Exception error){
                failure=error;row.put("case_error",error.toString());
                try{
                    AtomicReference<Fm15PrivateMovingInput.Handle> observedHandle=new AtomicReference<>();
                    onMoving15Cleanup(()->observedHandle.set(Fm15PrivateMovingInput.current()));
                    final Fm15PrivateMovingInput.Handle diagnostic=handle!=null?handle:observedHandle.get();
                    if(diagnostic!=null){
                        AtomicReference<Fm15PrivateMovingInput.IdentityState> identities=new AtomicReference<>();
                        onMoving15Cleanup(()->identities.set(Fm15PrivateMovingInput.inspectIdentity(diagnostic)));
                        row.put("native_identity_at_failure",moving15IdentityJson(identities.get()));
                    }
                }catch(Exception diagnosticError){row.put("native_identity_diagnostic_error",diagnosticError.toString());error.addSuppressed(diagnosticError);}
                throw error;
            }catch(Error error){failure=error;throw error;}
            finally{
                try{
                    AtomicReference<Fm15PrivateMovingInput.Handle> outstanding=new AtomicReference<>();
                    onMoving15Cleanup(()->outstanding.set(Fm15PrivateMovingInput.current()));
                    Fm15PrivateMovingInput.Handle cleanup=handle!=null?handle:outstanding.get();
                    if(cleanup!=null){
                        AtomicReference<Fm15PrivateMovingInput.RestoreResult> restored=new AtomicReference<>();
                        onMoving15Cleanup(()->restored.set(Fm15PrivateMovingInput.restore(cleanup)));
                        Fm15PrivateMovingInput.RestoreResult result=restored.get();
                        row.put("candidate_restore",new JSONObject().put("restored",result.restored).put("was_native_warning_active",result.wasNativeWarningActive)
                                .put("was_in_native_gps_path",result.wasInNativeGpsPath).put("ever_observed_native_active",result.everObservedNativeActive));
                        if(failure==null)check(!result.wasNativeWarningActive&&!result.wasInNativeGpsPath,"FM15 cleanup withdrew an active fixture; no natural-passage acceptance");
                    }else row.put("candidate_restore",new JSONObject().put("input_never_admitted",true));
                }catch(Exception cleanupError){
                    row.put("candidate_cleanup_blocked",true).put("candidate_cleanup_error",cleanupError.toString());
                    if(failure!=null)failure.addSuppressed(cleanupError);else throw cleanupError;
                }
            }
            JSONArray settledFixes=row.getJSONObject("receiver_gps_settling_tail").getJSONArray("native_fixes");
            JSONObject lastFix=settledFixes.getJSONObject(settledFixes.length()-1);
            warmLatitude=lastFix.getDouble("latitude");warmLongitude=lastFix.getDouble("longitude");
            status("moving_camera_case_completed",row);
        }
        status("warning_suite_complete",new JSONObject().put("native_authorities",rows.length()));
        deadline=SystemClock.elapsedRealtime()+30000;
        while(SystemClock.elapsedRealtime()<deadline){productionOutcomes(endpoint,new HashSet<>());if(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty())break;assertMuted();SystemClock.sleep(20);}
        check(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"FM15 moving receiver did not quiesce");
        Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"FM15 moving provider queue not muted/empty");
        report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false)
                .put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",true).put("real_terminal_ack_observed",true)
                .put("scope_note","Existing FM15 native report-event pipeline over private candidate augmentation and host GNSS pulses observed through original source callbacks; not public detector/repository or physical-driving acceptance");
    }
    // Input withdrawal must still be attempted if the mute assertion itself caused failure.
    // This cleanup path can only inspect/restore our owned candidate value, never trigger a warning.
    private void onMoving15Cleanup(Action action)throws Exception{
        AtomicReference<Throwable> error=new AtomicReference<>();
        runOnMainSync(()->{try{action.run();}catch(Throwable failure){error.set(failure);}});
        if(error.get()!=null)throw new IllegalStateException("FM15 owned candidate cleanup failed",error.get());
    }
    private boolean moving15WithinBounds(double latitude,double longitude){
        return Double.isFinite(latitude)&&Double.isFinite(longitude)&&latitude>52.3388671875+100d/111195d
                &&latitude<52.3828125-100d/111195d&&longitude>4.8779296875&&longitude<4.921875;
    }
    private JSONObject moving15IdentityJson(Fm15PrivateMovingInput.IdentityState state)throws Exception{
        return new JSONObject().put("manager_same",state.managerSame).put("component_same",state.componentSame).put("scoped_same",state.scopedSame)
                .put("service_same",state.serviceSame).put("lazy_same",state.lazySame).put("provider_same",state.providerSame)
                .put("flow_same",state.flowSame).put("engine_same",state.engineSame).put("alert_manager_same",state.alertManagerSame)
                .put("job1_same",state.job1Same).put("job2_same",state.job2Same).put("config_same",state.configSame)
                .put("current_candidates_same",state.currentCandidatesSame).put("current_candidates_are_set",state.currentCandidatesAreSet)
                .put("current_candidate_count",state.currentCandidateCount).put("fixture_member_same",state.fixtureMemberSame).put("fixture_id_present",state.fixtureIdPresent);
    }
    private void requestMoving15Gps(JSONArray requests,int kmh,double latitude,double longitude,float speed,String phase)throws Exception{
        check(moving15WithinBounds(latitude,longitude),"Refuse a GNSS request outside the planned interior source tile");
        JSONObject request=new JSONObject().put("speed_kmh",kmh).put("source_elapsed_ms",SystemClock.elapsedRealtime()).put("latitude",latitude)
                .put("longitude",longitude).put("speed_mps",speed).put("phase",phase).put("origin","host_gnss_request_only");
        requests.put(request);status("moving_camera_fix",request);
    }
    private JSONObject moving15PolicyJson(Fm15PrivateMovingInput.Policy policy)throws Exception{
        return new JSONObject().put("default_seconds_radius",policy.defaultSecondsRadius).put("speed_trap_seconds_radius",policy.speedTrapSecondsRadius)
                .put("traffic_jam_seconds_radius",policy.trafficJamSecondsRadius).put("toll_max_distance_m",policy.tollMaxDistanceMeters);
    }
    private JSONObject moving15SourceJson(Fm15PrivateMovingInput.SourceState source)throws Exception{
        return new JSONObject().put("latitude",source.sourceLatitude).put("longitude",source.sourceLongitude).put("speed_mps",source.sourceSpeedMps)
                .put("bearing",source.sourceBearing).put("accuracy_m",source.sourceAccuracyMeters).put("provider",source.sourceProvider)
                .put("source_elapsed_realtime_nanos",source.sourceElapsedRealtimeNanos).put("source_age_ms",source.sourceAgeMillis)
                .put("native_service_class",source.nativeServiceClass).put("native_provider_class",source.nativeProviderClass)
                .put("native_candidate_state_class",source.nativeCandidateStateClass).put("native_job1_class",source.nativeJob1Class).put("native_job2_class",source.nativeJob2Class)
                .put("native_engine_class",source.nativeEngineClass).put("native_alert_manager_class",source.nativeAlertManagerClass);
    }
    private JSONObject moving15SampleJson(Fm15PrivateMovingInput.Sample sample)throws Exception{
        return moving15SourceJson(sample).put("native_relevant",sample.nativeRelevant).put("native_engine_active",sample.nativeEngineActive)
                .put("native_warning_active",sample.nativeWarningActive).put("native_in_gps_path",sample.nativeInGpsPath)
                .put("native_calculated_radius_m",sample.nativeCalculatedRadiusMeters==null?JSONObject.NULL:sample.nativeCalculatedRadiusMeters)
                .put("native_distance_m",sample.nativeDistanceMeters==null?JSONObject.NULL:sample.nativeDistanceMeters)
                .put("native_first_active_elapsed_ms",sample.nativeFirstActiveElapsedMillis==null?JSONObject.NULL:sample.nativeFirstActiveElapsedMillis)
                .put("native_validation_path",sample.nativeValidationPath).put("native_reason",sample.nativeReason);
    }
    private void realMovingCameraSuite(JSONObject report)throws Exception{
        if(fm15){realMovingCamera15Suite(report);return;}
        Object endpoint=restartEndpoint();String session=String.valueOf(call(endpoint,"sourceSession")),receiver=arguments.getString("death_owner"),base=arguments.getString("native_id");JSONObject initial=productionAudioState(endpoint);check(!initial.optBoolean("pending_present")&&!initial.optBoolean("owner_present"),"Pre-existing moving-camera output");status("warning_suite_ready",new JSONObject().put("provider_session",session).put("receiver",receiver));
        long end=SystemClock.elapsedRealtime()+90000;while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<end){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,receiver),"Moving-camera real receiver not synced");Object service=singleton("fc0","S1");clearNativeReports(service);JSONArray rows=new JSONArray();report.put("moving_camera_records",rows);
        for(int kmh:new int[]{50,100,130}){
            String id=base+"-moving-"+kmh;float speed=kmh/3.6f;double targetLatitude=52.38,longitude=4.9;Object model=camera("SPEED_"+kmh,id);Location target=new Location("private-moving-camera-target");target.setLatitude(targetLatitude);target.setLongitude(longitude);call(model,"setLocation",target);
            AtomicReference<Object> taskReference=new AtomicReference<>();onMain(()->taskReference.set(type("x9i").getConstructor(Context.class).newInstance(context)));Object task=taskReference.get();Field candidates=type("x9i").getDeclaredField("I");candidates.setAccessible(true);candidates.set(task,Collections.singletonList(model));check(read(task,"X")==type("xl").getField("a").get(null),"Original task alert manager replaced");
            JSONObject row=new JSONObject().put("speed_kmh",kmh).put("native_id",id).put("native_task_class",task.getClass().getName()).put("candidate_injection_boundary","Isolated original SpeedCamTask.I only; no repository writes, task subscription, direct alert calls or decision overrides").put("target_latitude",targetLatitude).put("target_longitude",longitude);JSONArray fixes=new JSONArray(),outcomes=new JSONArray();row.put("native_fixes",fixes).put("source_dispositions",outcomes);rows.put(row);long start=SystemClock.elapsedRealtime(),next=start,crossed=-1,decision=-1;Object event=null;Set<String> seen=new HashSet<>();int gpsTick=-1;
            while(SystemClock.elapsedRealtime()-start<27000){
                long now=SystemClock.elapsedRealtime();if(now<next){SystemClock.sleep(Math.min(20,next-now));continue;}next=now+100;double remaining=speed*(24-(now-start)/1000d);Location fix=new Location("private-moving-native-input");fix.setLatitude(targetLatitude-remaining/111195d);fix.setLongitude(longitude);fix.setAccuracy(3);fix.setSpeed(speed);fix.setBearing(0);fix.setTime(System.currentTimeMillis());fix.setElapsedRealtimeNanos(SystemClock.elapsedRealtimeNanos());
                int tick=(int)((now-start)/1000);if(tick!=gpsTick){gpsTick=tick;JSONObject sample=new JSONObject().put("speed_kmh",kmh).put("source_elapsed_ms",now).put("latitude",fix.getLatitude()).put("longitude",longitude).put("speed_mps",speed).put("remaining_m",remaining);fixes.put(sample);status("moving_camera_fix",sample);}
                final Location current=fix;onMain(()->{Class<?> gps=type("bza");gps.getField("b").set(null,current);gps.getField("h").set(null,null);gps.getField("i").set(null,null);call(task,"a",current);call(task,"d",current);Field previous=type("x9i").getDeclaredField("x");previous.setAccessible(true);previous.set(task,current);});
                if(decision<0&&((Map<?,?>)read(task,"q")).containsKey(model)){decision=now;row.put("native_decision_elapsed_ms",decision).put("native_decision_remaining_m",remaining);event=awaitProductionEvent(endpoint,session,id,0);activateEvent(event);row.put("authority",new JSONObject((Map<?,?>)call(event,"fields")));roots.add(root("x9i","a"));status("moving_camera_native_decision",row);}
                if(event!=null){append(outcomes,productionOutcomes(endpoint,seen));if(startedObserved&&!row.has("source_started_observed_elapsed_ms"))row.put("source_started_observed_elapsed_ms",SystemClock.elapsedRealtime());if("COMPLETED".equals(lastTerminalState)&&!row.has("source_completed_observed_elapsed_ms"))row.put("source_completed_observed_elapsed_ms",SystemClock.elapsedRealtime());}
                if(crossed<0&&remaining<=0){crossed=now;row.put("target_crossed_elapsed_ms",crossed);status("moving_camera_target_crossed",new JSONObject().put("speed_kmh",kmh).put("elapsed_ms",crossed));}assertMuted();
            }
            check(event!=null&&decision>=0&&crossed>decision,"Original native task did not warn before target");check("COMPLETED".equals(lastTerminalState),"Moving-camera warning did not complete");check(row.getLong("source_started_observed_elapsed_ms")<crossed&&row.getLong("source_completed_observed_elapsed_ms")<crossed,"Native warning playback was not positively complete before target");
            JSONObject authority=row.getJSONObject("authority");Object clear=awaitNativeOperation(endpoint,session,authority.getString("warning_id"),"CLEAR",authority.getLong("sequence"));row.put("native_clear",new JSONObject((Map<?,?>)call(clear,"fields"))).put("source_terminal",lastTerminalState).put("started_lead_ms",crossed-row.getLong("source_started_observed_elapsed_ms")).put("completion_lead_ms",crossed-row.getLong("source_completed_observed_elapsed_ms"));check(((Map<?,?>)read(task,"q")).isEmpty(),"Original task still holds passed fixture");status("moving_camera_case_completed",row);
        }
        status("warning_suite_complete",new JSONObject().put("native_authorities",rows.length()));end=SystemClock.elapsedRealtime()+30000;while(SystemClock.elapsedRealtime()<end){productionOutcomes(endpoint,new HashSet<>());if(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty())break;assertMuted();SystemClock.sleep(20);}check(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"Moving receiver did not quiesce");Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Moving provider queue not muted/empty");report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",true).put("real_terminal_ack_observed",true).put("scope_note","Original native task decisions over timed private candidate/location fixtures, mirrored to emulator GPS; not a public repository/detector or physical driving acceptance");
    }
    private void realNativeGuidanceSuite(JSONObject report)throws Exception{
        Object endpoint=restartEndpoint();String session=String.valueOf(call(endpoint,"sourceSession")),base=arguments.getString("native_id"),receiver=arguments.getString("death_owner");JSONObject initial=productionAudioState(endpoint);check(!initial.optBoolean("pending_present")&&!initial.optBoolean("owner_present"),"Pre-existing native-guidance output");status("warning_suite_ready",new JSONObject().put("provider_session",session).put("receiver",receiver));
        java.io.File ready=new java.io.File(context.getExternalFilesDir(null),"native-warning-ownership/"+base+"-native-guidance-started");long end=SystemClock.elapsedRealtime()+120000;while(!ready.exists()&&SystemClock.elapsedRealtime()<end){assertMuted();SystemClock.sleep(20);}check(ready.exists()&&productionReceiverSynced(endpoint,receiver),"Actual receiver route/guidance witness did not become ready");check(ready.delete(),"Native guidance barrier cleanup");
        Object notification=notification("ROAD_SERVICE",base+"-native-guidance");int resource=context.getResources().getIdentifier("aa_ew_emergency_service","string",context.getPackageName());check(resource!=0,"Original emergency-service resource missing");call(notification,"setFreetext","");call(notification,"setTitle",context.getString(resource));call(notification,"setDescription","[]");Object model=type("nl.flitsmeister.fmcore.models.data.reports.EarlyWarningReport").getConstructor(type(EARLY+"EarlyWarningNotification")).newInstance(notification),service=singleton("fc0","S1");clearNativeReports(service);onMain(()->{type("bza").getField("b").set(null,null);type("bza").getField("h").set(null,Float.valueOf(0));call(service,"J",model,true);});roots.add(root("fc0","J"));Object event=awaitProductionEvent(endpoint,session,base+"-native-guidance",0);activateEvent(event);JSONObject authority=new JSONObject((Map<?,?>)call(event,"fields"));check(authority.getInt("priority")==0&&authority.getString("category").equals("emergency_vehicle")&&!authority.has("latitude"),"Native emergency lost nonspatial P0 policy");JSONArray outcomes=new JSONArray();report.put("native_guidance_authority",authority).put("native_guidance_source_dispositions",outcomes);status("native_guidance_emergency_issued",authority);awaitTerminal(endpoint,new HashSet<>(),outcomes,SystemClock.elapsedRealtime()+18000,false);check("COMPLETED".equals(lastTerminalState),"Actual source-driven native guidance emergency did not complete");onMain(()->call(service,"J",model,false));status("warning_suite_complete",new JSONObject().put("native_authorities",1));
        end=SystemClock.elapsedRealtime()+30000;while(SystemClock.elapsedRealtime()<end){productionOutcomes(endpoint,new HashSet<>());if(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty())break;assertMuted();SystemClock.sleep(20);}check(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"Guidance receiver did not release/quiesce");Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Guidance provider queue not muted/empty");report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",true).put("real_terminal_ack_observed",true);
    }
    private Object suiteIncident(String subtype,String id,double latitude)throws Exception{
        Object value=type(REPORTS+"Incident").getConstructor().newInstance();call(value,"setId",id);call(value,"setIncidentType",enumValue(REPORTS+"IncidentType",subtype));Location target=new Location("synthetic-pair-native-target");target.setLatitude(latitude);target.setLongitude(5);call(value,"setLocation",target);return value;
    }
    private String suiteKey(Object event)throws Exception{Method key=type("nl.johninnl.navigation.alerts.PlaybackGrant").getDeclaredMethod("key",event.getClass());key.setAccessible(true);return String.valueOf(key.invoke(null,event));}
    private JSONArray pairDispositions(Object endpoint,Set<String> keys,Set<String> seen,Map<String,JSONObject> latest)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");return actor.submit(()->{Object audio=read(endpoint,"audio"),snapshot=call(audio,"snapshot",SystemClock.elapsedRealtime()),lease=read(snapshot,"owner");if(lease!=null){Object client=read(lease,"client");observedConsumerUid=(Integer)read(client,"uid");observedConsumerNonce=String.valueOf(read(client,"consumerNonce"));}JSONArray out=new JSONArray();if(observedConsumerUid>0)for(Object grant:(List<?>)call(audio,"dispositions",observedConsumerUid,observedConsumerNonce,SystemClock.elapsedRealtime())){String key=String.valueOf(read(grant,"eventKey"));if(!keys.contains(key))continue;String state=String.valueOf(read(grant,"outcome")),attempt=String.valueOf(read(grant,"attemptId"));JSONObject row=new JSONObject().put("event_key",key).put("attempt_id",attempt).put("outcome",state).put("started",read(grant,"started")).put("receiver_uid",observedConsumerUid).put("observed_elapsed_ms",SystemClock.elapsedRealtime());latest.put(key,row);if(seen.add(attempt+":"+state))out.put(row);}return out;}).get(3,TimeUnit.SECONDS);
    }
    private void realConcurrentWarningSuite(JSONObject report)throws Exception{
        Object endpoint=restartEndpoint();String session=String.valueOf(call(endpoint,"sourceSession")),receiver=arguments.getString("death_owner"),base=arguments.getString("native_id");JSONObject initial=productionAudioState(endpoint);check(!initial.optBoolean("pending_present")&&!initial.optBoolean("owner_present"),"Pre-existing concurrent-suite output");status("warning_suite_ready",new JSONObject().put("provider_session",session).put("receiver",receiver));long end=SystemClock.elapsedRealtime()+90000;while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<end){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,receiver),"Concurrent real receiver not synced");Object service=singleton("fc0","S1");clearNativeReports(service);JSONArray rows=new JSONArray();report.put("concurrent_warning_records",rows);
        // Genuine native warmup supplies language and must complete before overlap cases.
        Object warm=camera("SPEED_50",base+"-warmup");onMain(()->{controlledFix();call(service,"J",warm,true);});Object warmEvent=awaitProductionEvent(endpoint,session,base+"-warmup",0);activateEvent(warmEvent);JSONArray warmOutcomes=new JSONArray();awaitTerminal(endpoint,new HashSet<>(),warmOutcomes,SystemClock.elapsedRealtime()+20000,false);onMain(()->call(service,"J",warm,false));report.put("warmup_authority",new JSONObject((Map<?,?>)call(warmEvent,"fields"))).put("warmup_source_dispositions",warmOutcomes);
        for(int pair=0;pair<3;pair++){
            String firstId=base+"-pair"+pair+"-a",secondId=base+"-pair"+pair+"-b";Object first=pair==2?suiteIncident("WRONG_WAY_DRIVER",firstId,52.001):camera("SPEED_50",firstId),second=suiteIncident(pair==0?"OBSTACLE":pair==1?"WRONG_WAY_DRIVER":"PERSON_ON_ROAD",secondId,52.003);boolean ready=productionOwnerReady(endpoint);check(ready,"Concurrent suite requires actual ready idle owner after warmup");
            onMain(()->{controlledFix();call(service,"J",first,true);});roots.add(root("fc0","J"));Object a=awaitProductionEvent(endpoint,session,firstId,0);String aKey=suiteKey(a);Set<String> keys=new HashSet<>();keys.add(aKey);Set<String> seen=new HashSet<>();Map<String,JSONObject> latest=new HashMap<>();JSONArray outcomes=new JSONArray();
            if(pair==1){end=SystemClock.elapsedRealtime()+10000;while(SystemClock.elapsedRealtime()<end){append(outcomes,pairDispositions(endpoint,keys,seen,latest));JSONObject row=latest.get(aKey);if(row!=null&&row.optBoolean("started")&&row.optString("outcome").equals("STARTED"))break;assertMuted();SystemClock.sleep(5);}check(latest.containsKey(aKey)&&latest.get(aKey).optString("outcome").equals("STARTED"),"Priority case requires genuinely started camera speech");}else SystemClock.sleep(100);
            onMain(()->{controlledFix();call(service,"J",second,true);});roots.add(root("fc0","J"));Object b=awaitProductionEvent(endpoint,session,secondId,0);String bKey=suiteKey(b);keys.add(bKey);JSONObject firstAuthority=new JSONObject((Map<?,?>)call(a,"fields")),secondAuthority=new JSONObject((Map<?,?>)call(b,"fields"));check(secondAuthority.getLong("observed_elapsed_ms")-firstAuthority.getLong("observed_elapsed_ms")<8000,"Pair inputs were not within eight seconds");JSONObject row=new JSONObject().put("pair",pair).put("scenario",pair==0?"two_distinct_p1":pair==1?"farther_p0_during_started_nearer_camera":"two_distinct_p0").put("first_authority",firstAuthority).put("second_authority",secondAuthority).put("source_dispositions",outcomes).put("receiver_owner_ready_before_native",ready);rows.put(row);status("concurrent_pair_issued",row);
            end=SystemClock.elapsedRealtime()+20000;boolean done=false;while(SystemClock.elapsedRealtime()<end){append(outcomes,pairDispositions(endpoint,keys,seen,latest));JSONObject x=latest.get(aKey),y=latest.get(bKey);boolean firstDone=x!=null&&(x.optString("outcome").equals("COMPLETED")||pair==1&&(x.optString("outcome").equals("INTERRUPTED")||x.optString("outcome").equals("CANCELLED")));if(firstDone&&y!=null&&y.optString("outcome").equals("COMPLETED")){done=true;break;}assertMuted();SystemClock.sleep(5);}check(done,"Both real native pair outcomes were not accounted for");if(pair==1)check(latest.get(aKey).getBoolean("started")&&(latest.get(aKey).getString("outcome").equals("INTERRUPTED")||latest.get(aKey).getString("outcome").equals("CANCELLED")),"P0 did not positively stop already-started ordinary speech");row.put("first_terminal",latest.get(aKey)).put("second_terminal",latest.get(bKey));onMain(()->{call(service,"J",first,false);call(service,"J",second,false);});status("concurrent_pair_completed",row);
        }
        status("warning_suite_complete",new JSONObject().put("native_authorities",6).put("genuine_warmup",1));end=SystemClock.elapsedRealtime()+30000;while(SystemClock.elapsedRealtime()<end){productionOutcomes(endpoint,new HashSet<>());if(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty())break;assertMuted();SystemClock.sleep(20);}check(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"Concurrent receiver did not quiesce");Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Concurrent provider queue not empty");report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",true).put("real_terminal_ack_observed",true).put("concurrent_warning_records",rows);
    }
    private void realParkedCleanup(JSONObject report)throws Exception{
        check("true".equals(arguments.getString("reviewed_stopped_output")),"Explicit host-verified stopped-output review required");Object endpoint=restartEndpoint();JSONObject before=productionAudioState(endpoint);check("AUDIO_UNCERTAIN".equals(before.optString("code"))&&arguments.getString("expected_pending_attempt","").equals(before.optString("pending_attempt"))&&arguments.getString("expected_old_session","").equals(before.optString("pending_provider_session")),"Parked cleanup may only recover the exact test-owned pending attempt");check(((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"A receiver remains registered");verifyRecoveryUi(endpoint,false,report,arguments.getString("native_id"));JSONObject after=productionAudioState(endpoint);check("UNOWNED".equals(after.optString("code"))&&!after.optBoolean("pending_present"),"Actual parked cleanup failed");Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Provider queue not quiet");report.put("before",before).put("after",after).put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true);
    }
    private Object restartEndpoint()throws Exception{
        Field sink=capture.getDeclaredField("testSink");sink.setAccessible(true);check(sink.get(null)==null,"Provider restart test forbids a test sink");Object endpoint=capture.getMethod("init",Context.class).invoke(null,context);check(Boolean.TRUE.equals(read(read(endpoint,"profile"),"complete")),"Provider restart profile incomplete");initializeProductionFeed(false);return endpoint;
    }
    private void realProviderRestartSeed(JSONObject report)throws Exception{
        Object endpoint=restartEndpoint();JSONObject empty=productionAudioState(endpoint);check(!empty.optBoolean("pending_present")&&!empty.optBoolean("owner_present"),"Refuse to replace pre-existing playback uncertainty");String receiver=arguments.getString("death_owner"),base=arguments.getString("native_id"),session=String.valueOf(call(endpoint,"sourceSession"));status("restart_seed_ready",new JSONObject().put("provider_session",session).put("receiver",receiver));
        long end=SystemClock.elapsedRealtime()+90000;while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<end){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,receiver),"Actual seed receiver never connected");
        Object service=singleton("fc0","S1");clearNativeReports(service);Object model=camera("SPEED_50",base+"-seed");controlledFix();onMain(()->call(service,"J",model,true));roots.add(root("fc0","J"));Object event=awaitProductionEvent(endpoint,session,base+"-seed",0);activateEvent(event);Set<String> seen=new HashSet<>();JSONArray outcomes=new JSONArray();end=SystemClock.elapsedRealtime()+15000;
        while(!startedObserved&&SystemClock.elapsedRealtime()<end){append(outcomes,productionOutcomes(endpoint,seen));assertMuted();SystemClock.sleep(5);}check(startedObserved&&!terminalObserved,"Seed has no genuinely started, nonterminal native player");JSONObject pending=productionAudioState(endpoint);check(pending.optBoolean("stored_started"),"Actual STARTED was not durably saved");report.put("seed_authority",new JSONObject((Map<?,?>)call(event,"fields"))).put("seed_source_dispositions",outcomes).put("seed_pending",pending);status("restart_seed_started",new JSONObject().put("pending",pending).put("authority",new JSONObject((Map<?,?>)call(event,"fields"))).put("source_dispositions",outcomes));
        SystemClock.sleep(30000);throw new IllegalStateException("Controller did not kill the same real provider process at the required boundary");
    }
    private void realProviderRestartRecovery(JSONObject report)throws Exception{
        Object endpoint=restartEndpoint();String session=String.valueOf(call(endpoint,"sourceSession")),old=arguments.getString("expected_old_session",""),attempt=arguments.getString("expected_pending_attempt",""),receiver=arguments.getString("death_owner"),base=arguments.getString("native_id");JSONObject loaded=productionAudioState(endpoint);
        check(!old.isEmpty()&&!attempt.isEmpty()&&!session.equals(old)&&"AUDIO_UNCERTAIN".equals(loaded.optString("code"))&&!loaded.optBoolean("owner_present")&&attempt.equals(loaded.optString("pending_attempt"))&&attempt.equals(loaded.optString("stored_attempt"))&&old.equals(loaded.optString("pending_provider_session"))&&loaded.optBoolean("stored_started"),"Restart did not reload the exact old durable started attempt");report.put("reloaded_pending",loaded);status("restart_uncertainty_loaded",loaded);
        long end=SystemClock.elapsedRealtime()+90000;while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<end){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,receiver),"Fresh fenced receiver did not connect");Object service=singleton("fc0","S1");clearNativeReports(service);Object blocked=camera("SPEED_50",base+"-fenced");controlledFix();onMain(()->call(service,"J",blocked,true));roots.add(root("fc0","J"));Object event=awaitProductionEvent(endpoint,session,base+"-fenced",0);SystemClock.sleep(2000);JSONObject fenced=productionAudioState(endpoint);check("AUDIO_UNCERTAIN".equals(fenced.optString("code"))&&attempt.equals(fenced.optString("pending_attempt"))&&!fenced.optBoolean("owner_present"),"Fresh consumer obtained audio while old output remained unknown");report.put("fenced_native_authority",new JSONObject((Map<?,?>)call(event,"fields"))).put("after_fenced_native",fenced);status("restart_fenced_event_observed",new JSONObject().put("authority",new JSONObject((Map<?,?>)call(event,"fields"))).put("pending",fenced));
        java.io.File stopped=new java.io.File(context.getExternalFilesDir(null),"native-warning-ownership/"+base+"-outputs-stopped");end=SystemClock.elapsedRealtime()+90000;while(!stopped.exists()&&SystemClock.elapsedRealtime()<end){assertMuted();SystemClock.sleep(20);}check(stopped.exists(),"Output stop has not been positively verified");check(stopped.delete(),"Restart stopped-output barrier cleanup");check(((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"Receiver remains registered before restart recovery");verifyRecoveryUi(endpoint,false,report,base);onMain(()->call(service,"J",blocked,false));report.put("after_recovery",productionAudioState(endpoint));status("restart_recovery_completed",report.getJSONObject("after_recovery"));
        end=SystemClock.elapsedRealtime()+60000;while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<end){assertMuted();SystemClock.sleep(20);}check(productionReceiverSynced(endpoint,receiver),"Fresh post-recovery receiver never connected");Object future=camera("SPEED_50",base+"-future");controlledFix();onMain(()->call(service,"J",future,true));Object futureEvent=awaitProductionEvent(endpoint,session,base+"-future",0);activateEvent(futureEvent);JSONArray outcomes=new JSONArray();awaitTerminal(endpoint,new HashSet<>(),outcomes,SystemClock.elapsedRealtime()+15000,false);check("COMPLETED".equals(lastTerminalState),"Future warning failed after provider restart recovery");onMain(()->call(service,"J",future,false));report.put("future_authority",new JSONObject((Map<?,?>)call(futureEvent,"fields"))).put("future_source_dispositions",outcomes);status("restart_future_completed",new JSONObject().put("authority",report.getJSONObject("future_authority")).put("source_dispositions",outcomes));
        end=SystemClock.elapsedRealtime()+20000;while(SystemClock.elapsedRealtime()<end){productionOutcomes(endpoint,new HashSet<>());if(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty())break;assertMuted();SystemClock.sleep(20);}check(!ownerPresent&&!pendingPresent&&((Set<?>)call(endpoint,"capablePackages")).isEmpty(),"Restart receiver did not release and quiesce");Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Restart provider queue is not muted/empty");report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",true).put("real_terminal_ack_observed",true);
    }
    private JSONObject productionAudioState(Object endpoint)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");return actor.submit(()->{Object audio=read(endpoint,"audio"),snapshot=call(audio,"snapshot",SystemClock.elapsedRealtime()),owner=read(snapshot,"owner"),pending=read(snapshot,"pending");JSONObject value=new JSONObject().put("code",String.valueOf(read(snapshot,"code"))).put("owner_present",owner!=null).put("pending_present",pending!=null).put("provider_session",call(endpoint,"sourceSession"));if(owner!=null)value.put("owner_uid",read(owner,"uid")).put("owner_package",read(owner,"packageName")).put("owner_epoch",read(owner,"epoch")).put("owner_ready",read(owner,"ready"));if(pending!=null){value.put("pending_attempt",read(pending,"attemptId")).put("pending_started",read(pending,"started")).put("pending_outcome",String.valueOf(read(pending,"outcome"))).put("pending_event_key",read(pending,"eventKey")).put("pending_provider_session",read(pending,"providerSession"));Object stored=call(read(audio,"store"),"load");check(stored!=null,"Durable pending record missing");value.put("stored_attempt",read(stored,"attemptId")).put("stored_started",read(stored,"started")).put("stored_outcome",String.valueOf(read(stored,"outcome")));}return value;}).get(3,TimeUnit.SECONDS);
    }
    private void verifyRecoveryUi(Object endpoint,boolean refuse,JSONObject report,String base)throws Exception{
        JSONObject before=productionAudioState(endpoint);check(refuse?before.optBoolean("owner_ready"):"AUDIO_UNCERTAIN".equals(before.optString("code")),"Unexpected recovery precondition");Activity activity=null;
        try{
            android.content.Intent intent=new android.content.Intent().setClassName(context.getPackageName(),"nl.johninnl.flitsmeister.WarningRecoveryActivity").addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);check(!context.getPackageManager().getActivityInfo(intent.getComponent(),0).exported,"Recovery UI is exported");
            Bundle options=android.app.ActivityOptions.makeBasic().setLaunchBounds(new android.graphics.Rect(80,650,1000,1850)).toBundle();options.putInt("android.activity.windowingMode",5);activity=startActivitySync(intent,options);final Activity shown=activity;check(!refuse||shown.isInMultiWindowMode(),"Live-owner refusal requires actual multi-window");final android.widget.Button[] button={null};
            onMain(()->{List<android.widget.CheckBox> boxes=new ArrayList<>();List<android.widget.Button> buttons=new ArrayList<>();collectRecovery(shown.getWindow().getDecorView(),boxes,buttons);check(boxes.size()==2&&buttons.size()==1,"Actual recovery controls missing");button[0]=buttons.get(0);check(!button[0].isEnabled(),"Unconfirmed reset enabled");boxes.get(0).setChecked(true);check(!button[0].isEnabled(),"Parked alone enabled reset");boxes.get(0).setChecked(false);boxes.get(1).setChecked(true);check(!button[0].isEnabled(),"Stopped alone enabled reset");boxes.get(0).setChecked(true);check(button[0].isEnabled(),"Both confirmations did not enable reset");});
            JSONObject armed=productionAudioState(endpoint);check(refuse?armed.optBoolean("owner_ready"):"AUDIO_UNCERTAIN".equals(armed.optString("code")),"Opening recovery UI changed source ownership before click");java.util.concurrent.CountDownLatch drawn=new java.util.concurrent.CountDownLatch(1);android.view.View actualRoot=shown.getWindow().getDecorView();android.view.ViewTreeObserver.OnDrawListener draw=drawn::countDown;onMain(()->{actualRoot.getViewTreeObserver().addOnDrawListener(draw);actualRoot.invalidate();});check(drawn.await(3,TimeUnit.SECONDS),"Actual recovery draw absent");onMain(()->{if(actualRoot.getViewTreeObserver().isAlive())actualRoot.getViewTreeObserver().removeOnDrawListener(draw);});SystemClock.sleep(100);
            android.graphics.Bitmap confirmations=getUiAutomation().takeScreenshot();check(confirmations!=null,"Actual confirmation frame unavailable");java.io.File confirmationFile=new java.io.File(context.getExternalFilesDir(null),base+(refuse?"-live-confirmations.png":"-uncertain-confirmations.png"));try(java.io.FileOutputStream stream=new java.io.FileOutputStream(confirmationFile)){check(confirmations.compress(android.graphics.Bitmap.CompressFormat.PNG,100,stream),"Confirmation PNG encoding");}finally{confirmations.recycle();}
            onMain(()->check(button[0].performClick(),"Actual reset click unhandled"));
            long end=SystemClock.elapsedRealtime()+5000;boolean finished=false;while(SystemClock.elapsedRealtime()<end){final boolean[] ready={false};onMain(()->ready[0]=shown.isFinishing()||button[0].isEnabled());if(ready[0]){finished=true;break;}SystemClock.sleep(10);}check(finished,"Actual recovery response did not complete");
            JSONObject after=productionAudioState(endpoint);if(refuse){check(!shown.isFinishing()&&after.optBoolean("owner_ready")&&before.getInt("owner_uid")==after.getInt("owner_uid")&&before.getLong("owner_epoch")==after.getLong("owner_epoch"),"Live-owner recovery did not refuse/reset changed ownership");}else check(shown.isFinishing()&&"UNOWNED".equals(after.optString("code"))&&!after.optBoolean("pending_present"),"Actual parked recovery did not clear fenced output");
            SystemClock.sleep(150);android.graphics.Bitmap frame=getUiAutomation().takeScreenshot();check(frame!=null,"Actual recovery frame unavailable");java.io.File file=new java.io.File(context.getExternalFilesDir(null),base+(refuse?"-refused.png":"-recovered.png"));try(java.io.FileOutputStream stream=new java.io.FileOutputStream(file)){check(frame.compress(android.graphics.Bitmap.CompressFormat.PNG,100,stream),"Recovery PNG encoding");}finally{frame.recycle();}
            report.put(refuse?"live_owner_recovery_refused":"uncertain_output_recovery",new JSONObject().put("before",before).put("after",after).put("both_confirmations_required",true).put("activity_finished",shown.isFinishing()).put("actual_window_screenshot",file.getAbsolutePath()).put("confirmations_screenshot",confirmationFile.getAbsolutePath()));
        }finally{if(activity!=null&&!activity.isFinishing()){Activity done=activity;onMain(done::finish);}}
    }
    private static void collectRecovery(android.view.View view,List<android.widget.CheckBox> boxes,List<android.widget.Button> buttons){if(view instanceof android.widget.CheckBox)boxes.add((android.widget.CheckBox)view);else if(view instanceof android.widget.Button)buttons.add((android.widget.Button)view);if(view instanceof android.view.ViewGroup){android.view.ViewGroup group=(android.view.ViewGroup)view;for(int i=0;i<group.getChildCount();i++)collectRecovery(group.getChildAt(i),boxes,buttons);}}
    private String productionOwnerPackage(Object endpoint)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");return actor.submit(()->{Object owner=read(endpoint,"audio");check(owner!=null,"Actual owner storage missing");Object snapshot=call(owner,"snapshot",SystemClock.elapsedRealtime()),lease=read(snapshot,"owner");return lease!=null&&Boolean.TRUE.equals(read(lease,"ready"))?String.valueOf(read(lease,"packageName")):"";}).get(3,TimeUnit.SECONDS);
    }
    private Object productionEvent(Object endpoint,String session,String id)throws Exception{
        return productionEventAfter(endpoint,session,id,0);
    }
    private Object productionEventAfter(Object endpoint,String session,String id,long after)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");
        return actor.submit(()->{Object journal=read(endpoint,"journal"),view=call(journal,"resume",session,0L,SystemClock.elapsedRealtime());
            for(Object item:(List<?>)view.getClass().getField("events").get(view))if(String.valueOf(item.getClass().getField("warningId").get(item)).endsWith(id)&&String.valueOf(item.getClass().getField("operation").get(item)).equals("ANNOUNCE")&&item.getClass().getField("sequence").getLong(item)>after)return item;
            return null;
        }).get(3,TimeUnit.SECONDS);
    }
    private boolean productionReceiverSynced(Object endpoint,String receiver)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");
        return actor.submit(()->{Map<?,?> registrations=(Map<?,?>)read(endpoint,"registrations");for(Object registration:registrations.values()){
            Object client=read(registration,"client");if(receiver.equals(client.getClass().getField("packageName").get(client))&&Boolean.TRUE.equals(read(registration,"confirmed"))&&Boolean.TRUE.equals(read(registration,"synced")))return true;
        }return false;}).get(3,TimeUnit.SECONDS);
    }
    private JSONArray productionOutcomes(Object endpoint,Set<String> seen)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");
        return actor.submit(()->{Object owner=read(endpoint,"audio");check(owner!=null,"Production owner storage is unavailable");Object snapshot=call(owner,"snapshot",SystemClock.elapsedRealtime()),lease=snapshot.getClass().getField("owner").get(snapshot);JSONArray out=new JSONArray();ownerPresent=lease!=null;pendingPresent=snapshot.getClass().getField("pending").get(snapshot)!=null;
            if(lease!=null){Object client=read(lease,"client");observedConsumerUid=client.getClass().getField("uid").getInt(client);observedConsumerNonce=String.valueOf(client.getClass().getField("consumerNonce").get(client));}
            if(observedConsumerUid>0){for(Object grant:(List<?>)call(owner,"dispositions",observedConsumerUid,observedConsumerNonce,SystemClock.elapsedRealtime())){
                    if(!integratedEventKey.equals(grant.getClass().getField("eventKey").get(grant)))continue;
                    Object outcome=grant.getClass().getField("outcome").get(grant);String state=String.valueOf(outcome),attempt=String.valueOf(grant.getClass().getField("attemptId").get(grant));
                    if(grant.getClass().getField("started").getBoolean(grant))startedObserved=true;
                    Method terminal=grant.getClass().getDeclaredMethod("terminal",outcome.getClass());terminal.setAccessible(true);if(Boolean.TRUE.equals(terminal.invoke(null,outcome))){terminalObserved=true;lastTerminalState=state;if(grant.getClass().getField("started").getBoolean(grant)){startedTerminalObserved=true;lastStartedTerminalState=state;}}
                    if(seen.add(attempt+":"+state))out.put(new JSONObject().put("receiver_uid",observedConsumerUid).put("attempt_id",attempt).put("event_key",read(grant,"eventKey")).put("granted",read(grant,"granted")).put("observed_elapsed_ms",SystemClock.elapsedRealtime()).put("outcome",state).put("started",grant.getClass().getField("started").getBoolean(grant)).put("mode",String.valueOf(grant.getClass().getField("mode").get(grant))));}
            }
            return out;
        }).get(3,TimeUnit.SECONDS);
    }
    private boolean productionOwnerReady(Object endpoint)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");return actor.submit(()->{Object owner=read(endpoint,"audio");if(owner==null)return false;Object snapshot=call(owner,"snapshot",SystemClock.elapsedRealtime()),lease=snapshot.getClass().getField("owner").get(snapshot);return lease!=null&&lease.getClass().getField("ready").getBoolean(lease);}).get(3,TimeUnit.SECONDS);
    }
    private void realEndpointMatrix(JSONObject report)throws Exception{
        Field sink=capture.getDeclaredField("testSink");sink.setAccessible(true);check(sink.get(null)==null,"Matrix must not install a test sink");Object endpoint=capture.getMethod("init",Context.class).invoke(null,context);Object profile=read(endpoint,"profile");check(Boolean.TRUE.equals(profile.getClass().getField("complete").get(profile)),"Production producer coverage incomplete");
        initializeProductionFeed(false);
        String receiver=arguments.getString("receiver_package","com.google.android.apps.maps"),session=String.valueOf(call(endpoint,"sourceSession")),base=arguments.getString("native_id","probe-matrix-"+java.util.UUID.randomUUID()),family=arguments.getString("trigger_family","ordinary"),pattern=arguments.getString("trigger_pattern","single");
        int count=Integer.parseInt(arguments.getString("event_count","1")),limit=Integer.parseInt(arguments.getString("matrix_timeout_seconds","600"));check(count>=1&&count<=100&&limit>=60&&limit<=900,"Invalid bounded native matrix");check(family.equals("ordinary")||family.equals("p0"),"Unknown native family");check(java.util.Arrays.asList("single","update","clear","repeat").contains(pattern),"Unknown native matrix pattern");
        status("production_endpoint_ready",new JSONObject().put("provider_session",session).put("receiver_package",receiver).put("producer_complete",true).put("test_sink_present",false).put("target_classloader_used",true).put("native_id_base",base).put("trigger_family",family).put("trigger_pattern",pattern).put("event_count",count).put("native_id_rule",count==1?"base":"base-001 through base-NNN"));
        awaitTrace(report);
        int startup=Integer.parseInt(arguments.getString("receiver_wait_seconds","120"));check(startup>=30&&startup<=120,"Invalid matrix receiver wait");long startupEnd=SystemClock.elapsedRealtime()+startup*1000L;while(!productionReceiverSynced(endpoint,receiver)&&SystemClock.elapsedRealtime()<startupEnd){assertMuted();SystemClock.sleep(25);}check(productionReceiverSynced(endpoint,receiver),"Matrix real receiver never confirmed/synced");
        Object service=singleton("fc0","S1");clearNativeReports(service);JSONArray rows=new JSONArray();long matrixEnd=SystemClock.elapsedRealtime()+limit*1000L;
        // A real native warning prepares the actual receiver language. Keep its authority
        // separate so cold initialization cannot enter the warm measured distribution.
        String warmupId=base+"-warmup";Object warmupModel=camera("SPEED_50",warmupId);
        onMain(()->{controlledFix();call(service,"J",warmupModel,true);});Object warmupEvent=awaitProductionEvent(endpoint,session,warmupId,0);JSONObject warmup=matrixRow(warmupEvent,0,"ordinary","warmup",false);activateEvent(warmupEvent);JSONArray warmupOutcomes=new JSONArray();Set<String> warmupSeen=new HashSet<>();status("native_event_in_production_journal",warmup.getJSONObject("authority"));warmup.put("source_dispositions",warmupOutcomes);report.put("warmup_record",warmup);awaitTerminal(endpoint,warmupSeen,warmupOutcomes,Math.min(matrixEnd,SystemClock.elapsedRealtime()+20000),false);check("COMPLETED".equals(lastTerminalState),"Genuine native warmup did not complete");warmup.put("source_dispositions",warmupOutcomes).put("source_terminal",lastTerminalState).put("excluded_from_warm_measurements",true);onMain(()->call(service,"J",warmupModel,false));
        long readyEnd=Math.min(matrixEnd,SystemClock.elapsedRealtime()+5000);while(!productionOwnerReady(endpoint)&&SystemClock.elapsedRealtime()<readyEnd){assertMuted();SystemClock.sleep(10);}check(productionOwnerReady(endpoint),"Actual receiver owner not ready after genuine warmup");status("native_matrix_warmup_terminal",warmup);report.put("warmup_record",warmup);
        int noGpsDelay=Integer.parseInt(arguments.getString("post_warmup_no_gps_delay_ms","0"));check(noGpsDelay>=0&&noGpsDelay<=12000,"Invalid bounded post-warmup no-GPS delay");
        if(noGpsDelay>0){
            onMain(()->matrixInput("p0"));long waitStarted=SystemClock.elapsedRealtime();
            status("native_matrix_no_gps_wait_started",new JSONObject().put("elapsed_ms",waitStarted).put("delay_ms",noGpsDelay).put("native_gps_present",type("bza").getField("b").get(null)!=null).put("native_speed",type("bza").getField("h").get(null)));
            while(SystemClock.elapsedRealtime()-waitStarted<noGpsDelay){assertMuted();SystemClock.sleep(20);}
            JSONObject expired=new JSONObject().put("started_elapsed_ms",waitStarted).put("ended_elapsed_ms",SystemClock.elapsedRealtime()).put("requested_delay_ms",noGpsDelay).put("native_gps_present",type("bza").getField("b").get(null)!=null).put("native_speed",type("bza").getField("h").get(null));
            report.put("post_warmup_no_gps_wait",expired);status("native_matrix_no_gps_wait_complete",expired);
        }
        int spacing=Integer.parseInt(arguments.getString("native_spacing_ms","1000"));check(spacing>=1000&&spacing<=5000,"Invalid controlled native input spacing");long previousNative=-1;
        for(int index=1;index<=count;index++){
            assertMuted();
            while(previousNative>=0&&SystemClock.elapsedRealtime()-previousNative<spacing){assertMuted();SystemClock.sleep(10);}
            check(SystemClock.elapsedRealtime()<matrixEnd,"Native matrix overall deadline");String id=count==1?base:base+"-"+String.format(java.util.Locale.ROOT,"%03d",index);Object model=matrixModel(family,id);boolean ready=productionOwnerReady(endpoint);
            previousNative=SystemClock.elapsedRealtime();onMain(()->{matrixInput(family);call(service,"J",model,true);});Object nativeEvent=awaitProductionEvent(endpoint,session,id,0);JSONObject row=matrixRow(nativeEvent,index,family,pattern,ready);JSONArray outcomes=new JSONArray();activateEvent(nativeEvent);Set<String> seen=new HashSet<>();
            status("native_event_in_production_journal",row.getJSONObject("authority"));
            if(pattern.equals("update")){long beforeUpdate=productionHead(endpoint,session);onMain(()->{Location updated=new Location("synthetic-updated-target");updated.setLatitude(52.0012);updated.setLongitude(5);call(model,"setLocation",updated);call(service,stateUpdateMethod(),model);});Object updated=awaitNativeOperation(endpoint,session,String.valueOf(nativeEvent.getClass().getField("warningId").get(nativeEvent)),"UPSERT",beforeUpdate);check(updated.getClass().getField("revision").getLong(updated)>nativeEvent.getClass().getField("revision").getLong(nativeEvent),"Native update did not advance revision");row.put("native_update_called",true).put("native_update",new JSONObject((Map<?,?>)call(updated,"fields")));}
            if(pattern.equals("clear")){
                long until=Math.min(matrixEnd,SystemClock.elapsedRealtime()+15000);while(!startedObserved&&SystemClock.elapsedRealtime()<until){append(outcomes,productionOutcomes(endpoint,seen));assertMuted();SystemClock.sleep(10);}check(startedObserved&&!startedTerminalObserved,"Could not clear a genuinely active started warning");onMain(()->call(service,"J",model,false));row.put("native_clear_after_started",true);
            }
            row.put("source_dispositions",outcomes);rows.put(row);report.put("matrix_records",rows);awaitTerminal(endpoint,seen,outcomes,Math.min(matrixEnd,SystemClock.elapsedRealtime()+20000),pattern.equals("clear"));check(pattern.equals("clear")?("INTERRUPTED".equals(lastTerminalState)||"CANCELLED".equals(lastTerminalState)):"COMPLETED".equals(lastTerminalState),"Native matrix terminal did not match requested behavior: "+lastTerminalState);row.put("source_terminal",lastTerminalState);status("native_matrix_event_terminal",new JSONObject().put("index",index).put("authority",row.getJSONObject("authority")).put("terminal",lastTerminalState));
            if(pattern.equals("repeat")){
                long sequence=nativeEvent.getClass().getField("sequence").getLong(nativeEvent);Object sound=singleton("s6i","f");boolean repeatReady=productionOwnerReady(endpoint);
                if(family.equals("ordinary")){String text=String.valueOf(call(call(model,"getSpeedCamType"),"getLocalizedTTS",context));onMain(()->call(sound,"l",model,true,false,text,null));}
                else{Object type=call(model,"getEarlyWarningTypeEnum");String text=String.valueOf(call(model,"reportTitleText",context));onMain(()->call(sound,"b",type,model,null,text,false,null));}
                Object repeat=awaitProductionEvent(endpoint,session,id,sequence);check(repeat.getClass().getField("announcementIndex").getLong(repeat)>nativeEvent.getClass().getField("announcementIndex").getLong(nativeEvent),"Native repeat reused announcement identity");JSONObject repeatRow=matrixRow(repeat,index,family,"repeat_intent",repeatReady);activateEvent(repeat);JSONArray repeatOutcomes=new JSONArray();Set<String> repeatSeen=new HashSet<>();status("native_event_in_production_journal",repeatRow.getJSONObject("authority"));repeatRow.put("source_dispositions",repeatOutcomes);rows.put(repeatRow);awaitTerminal(endpoint,repeatSeen,repeatOutcomes,Math.min(matrixEnd,SystemClock.elapsedRealtime()+20000),false);check("COMPLETED".equals(lastTerminalState),"Native repeat did not complete");repeatRow.put("source_terminal",lastTerminalState);status("native_matrix_repeat_terminal",repeatRow);
            }
            if(!pattern.equals("clear"))onMain(()->call(service,"J",model,false));check(sink.get(null)==null,"Matrix test sink changed");
        }
        status("native_matrix_complete",new JSONObject().put("provider_session",session).put("distinct_native_models",count).put("native_announcements",rows.length()+1).put("measured_announcements",rows.length()).put("warmup_warning_id","SpeedCam:"+warmupId));
        boolean off=false;Set<String> endSeen=new HashSet<>();long cleanupEnd=SystemClock.elapsedRealtime()+30000;while(SystemClock.elapsedRealtime()<cleanupEnd){productionOutcomes(endpoint,endSeen);if(!ownerPresent&&!pendingPresent&&!((Set<?>)call(endpoint,"capablePackages")).contains(receiver)){off=true;break;}assertMuted();SystemClock.sleep(25);}check(off,"Matrix receiver did not release source ownership/quiesce");
        Object queue=call(singleton("s6i","f"),"d");check(((java.util.Queue<?>)queue.getClass().getField("f").get(queue)).isEmpty(),"Matrix provider queue not empty");report.put("production_endpoint_used",true).put("test_sink_used",false).put("raw_packet_emitted",false).put("coverage_override_used",false).put("provider_native_queue_empty",true).put("receiver_source_off_and_quiescent",off).put("real_terminal_ack_observed",true).put("source_session",session).put("matrix_records",rows).put("distinct_native_models",count).put("native_announcements",rows.length()+1).put("measured_announcements",rows.length()).put("warmup_warning_id","SpeedCam:"+warmupId).put("trigger_family",family).put("trigger_pattern",pattern).put("native_input_spacing_ms",spacing);
    }
    private Object matrixModel(String family,String id)throws Exception{
        if(family.equals("ordinary"))return camera("SPEED_50",id);Object notification=notification("AMBULANCE",id);call(notification,"setFreetext","");int resource=context.getResources().getIdentifier("aa_ew_ambulance","string",context.getPackageName());check(resource!=0,"Native emergency resource missing");call(notification,"setTitle",context.getString(resource));call(notification,"setDescription","[]");return type("nl.flitsmeister.fmcore.models.data.reports.EarlyWarningReport").getConstructor(type(EARLY+"EarlyWarningNotification")).newInstance(notification);
    }
    private void matrixInput(String family)throws Exception{if(family.equals("ordinary"))controlledFix();else{type("bza").getField("b").set(null,null);type("bza").getField("h").set(null,Float.valueOf(0));}}
    private Object awaitProductionEvent(Object endpoint,String session,String id,long after)throws Exception{Object event=null;long until=SystemClock.elapsedRealtime()+3000;while(event==null&&SystemClock.elapsedRealtime()<until){event=productionEventAfter(endpoint,session,id,after);if(event==null)SystemClock.sleep(10);}check(event!=null,"Actual native matrix intent absent from real journal");return event;}
    private long productionHead(Object endpoint,String session)throws Exception{java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");return actor.submit(()->{Object view=call(read(endpoint,"journal"),"resume",session,0L,SystemClock.elapsedRealtime());return view.getClass().getField("headSequence").getLong(view);}).get(3,TimeUnit.SECONDS);}
    private Object awaitNativeOperation(Object endpoint,String session,String id,String operation,long after)throws Exception{
        java.util.concurrent.ExecutorService actor=(java.util.concurrent.ExecutorService)read(endpoint,"actor");Object found=null;long until=SystemClock.elapsedRealtime()+3000;
        while(found==null&&SystemClock.elapsedRealtime()<until){found=actor.submit(()->{Object view=call(read(endpoint,"journal"),"resume",session,after,SystemClock.elapsedRealtime());for(Object event:(List<?>)view.getClass().getField("events").get(view))if(id.equals(event.getClass().getField("warningId").get(event))&&operation.equals(String.valueOf(event.getClass().getField("operation").get(event))))return event;return null;}).get(3,TimeUnit.SECONDS);if(found==null)SystemClock.sleep(10);}
        check(found!=null,"Native "+operation+" absent from real journal");return found;
    }
    private JSONObject matrixRow(Object event,int index,String family,String pattern,boolean ready)throws Exception{return new JSONObject().put("index",index).put("family",family).put("pattern",pattern).put("receiver_owner_ready_before_native",ready).put("authority",new JSONObject((Map<?,?>)call(event,"fields")));}
    private void activateEvent(Object event)throws Exception{Method key=type("nl.johninnl.navigation.alerts.PlaybackGrant").getDeclaredMethod("key",event.getClass());key.setAccessible(true);integratedEventKey=String.valueOf(key.invoke(null,event));terminalObserved=false;startedObserved=false;lastTerminalState=null;startedTerminalObserved=false;lastStartedTerminalState=null;}
    private void awaitTerminal(Object endpoint,Set<String> seen,JSONArray outcomes,long deadline,boolean clear)throws Exception{boolean desired=false;while(!desired&&SystemClock.elapsedRealtime()<deadline){append(outcomes,productionOutcomes(endpoint,seen));desired=clear?startedTerminalObserved&&("CANCELLED".equals(lastStartedTerminalState)||"INTERRUPTED".equals(lastStartedTerminalState)):"COMPLETED".equals(lastTerminalState);assertMuted();if(!desired)SystemClock.sleep(10);}check(desired,"Real receiver did not ACK desired native matrix outcome; observed "+lastTerminalState);if(clear)lastTerminalState=lastStartedTerminalState;}
    private static void append(JSONArray to,JSONArray from)throws Exception{for(int i=0;i<from.length();i++)to.put(from.get(i));}
    private void status(String stage,JSONObject value){Bundle status=new Bundle();status.putString("fm_capture_stage",stage);status.putString("fm_capture_detail",value.toString());sendStatus(1,status);}
    private Class<?> type(String name)throws ClassNotFoundException{return context.getClassLoader().loadClass(nativeName(name));}
    private static Object read(Object object,String field)throws Exception{Field value=object.getClass().getDeclaredField(field);value.setAccessible(true);return value.get(object);}
    private Object camera(String type,String id)throws Exception{Object value=type(REPORTS+"SpeedCam").getConstructor().newInstance();call(value,"setSpeedCamType",enumValue(REPORTS+"SpeedCamType",type));call(value,"setId",id);Location target=new Location("synthetic-target");target.setLatitude(52.001);target.setLongitude(5);call(value,"setLocation",target);return value;}
    private Object notification(String type,String id)throws Exception{Object value=type(EARLY+"EarlyWarningNotification").getConstructor().newInstance();call(value,"setType",enumValue(EARLY+"EarlyWarningTypeEnum",type));call(value,"setName",id);call(value,"setCode",id);call(value,"setDescription","TEST ONLY native description");call(value,"setTitle","TEST ONLY native title");call(value,"setFreetext","TEST ONLY native early instruction");return value;}
    private Object singleton(String type,String field)throws Exception{
        String member=fm15&&type.equals("fc0")&&field.equals("S1")?"N1":fm15&&type.equals("vz2")&&field.equals("x1")?"s1":field;
        AtomicReference<Object> value=new AtomicReference<>();onMain(()->value.set(call(type(type).getField(member).get(null),"getInstance",context)));return value.get();
    }
    private Object enumValue(String cls,String value)throws Exception{for(Object member:type(cls).getEnumConstants())if(((Enum<?>)member).name().equals(value))return member;throw new IllegalArgumentException(value);}
    private int announces(){synchronized(events){int count=0;for(Bundle event:events)if("ANNOUNCE".equals(event.getString("operation")))count++;return count;}}
    private Bundle lastAnnounce(){synchronized(events){for(int i=events.size()-1;i>=0;i--)if("ANNOUNCE".equals(events.get(i).getString("operation")))return events.get(i);}throw new IllegalStateException("Missing ANNOUNCE");}
    private boolean has(String operation,String id){synchronized(events){for(Bundle event:events)if(operation.equals(event.getString("operation"))&&id.equals(event.getString("warning_id")))return true;}return false;}
    private int count(String operation,String id){synchronized(events){int count=0;for(Bundle event:events)if(operation.equals(event.getString("operation"))&&id.equals(event.getString("warning_id")))count++;return count;}}
    private boolean hasMessage(String operation,String id,String text){synchronized(events){for(Bundle event:events)if(operation.equals(event.getString("operation"))&&id.equals(event.getString("warning_id"))&&event.getString("message","").contains(text))return true;}return false;}
    private boolean hasAnyType(String operation,String type){synchronized(events){for(Bundle event:events)if(operation.equals(event.getString("operation"))&&type.equals(event.getString("native_type")))return true;}return false;}
    private Bundle lastType(String type){synchronized(events){for(int i=events.size()-1;i>=0;i--)if(type.equals(events.get(i).getString("native_type")))return events.get(i);}throw new IllegalStateException("Missing type "+type);}
    private JSONArray eventJson()throws Exception{JSONArray result=new JSONArray();synchronized(events){for(Bundle event:events){JSONObject row=new JSONObject();for(String key:event.keySet())row.put(key,event.get(key));result.put(row);}}return result;}
    private interface Action{void run()throws Exception;}
    private void onMain(Action action)throws Exception{AtomicReference<Throwable> error=new AtomicReference<>();runOnMainSync(()->{try{assertMuted();action.run();}catch(Throwable e){error.set(e);}});if(error.get()!=null)throw new IllegalStateException("Actual native entry failed",error.get());}
    private interface Condition{boolean ready();}
    private void waitFor(Condition condition,String message)throws Exception{long until=SystemClock.elapsedRealtime()+10000;while(!condition.ready()&&SystemClock.elapsedRealtime()<until){assertMuted();SystemClock.sleep(20);}check(condition.ready(),message);waitForIdleSync();}
    private final class Completion{
        final AtomicInteger count=new AtomicInteger();final CountDownLatch done=new CountDownLatch(1);final Object proxy;
        Completion()throws Exception{Class<?> api=type("z39");proxy=Proxy.newProxyInstance(api.getClassLoader(),new Class<?>[]{api},(p,m,a)->{
            if(m.getName().equals("invoke")){count.incrementAndGet();done.countDown();return type("tvj").getField("a").get(null);}if(m.getName().equals("hashCode"))return System.identityHashCode(p);if(m.getName().equals("equals"))return p==a[0];return "NativeCaptureCompletion";});}
        void await()throws Exception{check(done.await(10,TimeUnit.SECONDS),"Original native completion did not finish under mute");check(count.get()==1,"Native completion was not exactly once");}
    }
    private static Object call(Object object,String name,Object... args)throws Exception{return invoke(object.getClass(),object,name,args);}
    private static Object invoke(Class<?> cls,Object object,String name,Object... args)throws Exception{
        for(Method method:cls.getMethods())if(method.getName().equals(name)&&method.getParameterTypes().length==args.length){Class<?>[] types=method.getParameterTypes();boolean fits=true;for(int i=0;i<types.length;i++)if(args[i]==null?types[i].isPrimitive():!box(types[i]).isInstance(args[i])){fits=false;break;}if(fits){method.setAccessible(true);return method.invoke(object,args);}}
        throw new NoSuchMethodException(cls.getName()+"."+name);
    }
    private static Class<?> box(Class<?> value){if(!value.isPrimitive())return value;if(value==boolean.class)return Boolean.class;if(value==int.class)return Integer.class;if(value==float.class)return Float.class;if(value==long.class)return Long.class;if(value==double.class)return Double.class;return value;}
    @SuppressWarnings("unchecked") private static void restore(SharedPreferences prefs,Map<String,?> values){SharedPreferences.Editor edit=prefs.edit().clear();for(Map.Entry<String,?> entry:values.entrySet()){String key=entry.getKey();Object value=entry.getValue();if(value instanceof String)edit.putString(key,(String)value);else if(value instanceof Boolean)edit.putBoolean(key,(Boolean)value);else if(value instanceof Integer)edit.putInt(key,(Integer)value);else if(value instanceof Long)edit.putLong(key,(Long)value);else if(value instanceof Float)edit.putFloat(key,(Float)value);else if(value instanceof Set)edit.putStringSet(key,new HashSet<>((Set<String>)value));else throw new IllegalStateException("Unknown preference type");}check(edit.commit(),"Could not restore native preference fixture");}
    private static void check(boolean condition,String message){if(!condition)throw new IllegalStateException(message);}
    private static boolean hasText(String value){return value!=null&&!value.trim().isEmpty();}
}
