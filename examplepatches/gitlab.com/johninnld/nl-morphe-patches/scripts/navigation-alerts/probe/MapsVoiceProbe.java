package nl.johninnl.warningprobe;

import android.app.Instrumentation;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONObject;

/** Test-only original Maps media lifecycle exercise. No app-wide manager is changed. */
public final class MapsVoiceProbe {
    private static final String ARTIFACT =
            "81506a2c54fc9a8faca34c18af7619d9c9d26cbfbe799b66884a59ac17791004";

    public static JSONObject run(Instrumentation probe, Bundle args) throws Exception {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            throw new IllegalStateException("Run this probe on the instrumentation worker thread");
        }
        if (args != null && "manager".equals(args.getString("scenario"))) {
            return runManager(probe);
        }
        if(args!=null && "production_speech".equals(args.getString("scenario")))return runProductionSpeech(probe,false);
        if(args!=null && "production_tone".equals(args.getString("scenario")))return runProductionSpeech(probe,true);
        if(args!=null && "production_speech_arrival".equals(args.getString("scenario")))return runProductionSpeech(probe,false,true);
        if(args!=null && "production_route".equals(args.getString("scenario")))return runProductionRoute(probe);
        if (args != null && args.getString("scenario", "").startsWith("production")) {
            return runProduction(probe,args);
        }
        JSONObject result = new JSONObject();
        result.put("probe", "MapsVoiceProbe");
        result.put("expected_original_artifact_sha256", ARTIFACT);
        result.put("target_package", probe.getTargetContext().getPackageName());
        result.put("scope", "Original bmsk methods with probe-owned MediaPlayer and synthetic local PCM WAV");
        JSONArray cases = new JSONArray();
        for (String name : new String[]{"natural_completion", "cancel_active", "cancel_before_play"}) {
            cases.put(runCase(probe, name));
        }
        result.put("cases", cases);
        result.put("limitations", new JSONArray(new String[]{
                "Instrumentation uses a re-signed copy; artifact equality must be checked by the runner.",
                "MediaPlayer start success, isPlaying and advancing position are API evidence, not audible output measurement.",
                "The native bmua callback is observed through a proxy; bmth manager queue/focus handling is not exercised.",
                "No live bmrc/bmtl manager is obtained: their app dependencies and active navigation lifecycle are not constructed or replaced.",
                "No proof of pending-job cancellation, dispatch fencing, guidance hold, chained players, mute modes, car routing, focus denial or current-maneuver restoration.",
                "Native constructor may enable LoudnessEnhancer for this player; no stream volume or persisted app preference is changed."
        }));
        return result;
    }

    /** Controlled native TEST_AUDIO only, submitted to the EXISTING product guidance manager. */
    public static final class GuidanceWitness {
        final Object manager;final ManagerItem item;final Trace trace=new Trace();final java.util.Set<Object> known=java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());String regenerated="";long regenerationAt=-1;
        GuidanceWitness(Object manager,ManagerItem item){this.manager=manager;this.item=item;}
    }
    public static GuidanceWitness beginOnActualManager(Instrumentation probe,Object manager)throws Exception{
        ClassLoader loader=probe.getTargetContext().getClassLoader();Trace trace=new Trace();long until=SystemClock.elapsedRealtime()+7000;while(SystemClock.elapsedRealtime()<until&&!managerSnapshot(manager,trace,"actual_route_idle").getBoolean("idle"))SystemClock.sleep(30);if(!managerSnapshot(manager,trace,"actual_route_before_controlled_job").getBoolean("idle"))throw new IllegalStateException("Actual route manager did not become idle");
        ManagerItem item=createManagerItem(probe,loader,"source_driven_route_preemption",10000);GuidanceWitness witness=new GuidanceWitness(manager,item);submitManagerItem(probe,manager,item,loader,witness.trace);if(!item.started.await(5,TimeUnit.SECONDS))throw new IllegalStateException("Actual manager did not start controlled native job");
        until=SystemClock.elapsedRealtime()+2000;while(item.player.getCurrentPosition()<30&&SystemClock.elapsedRealtime()<until)SystemClock.sleep(10);if(item.player.getCurrentPosition()<30)throw new IllegalStateException("Native controlled media did not advance");
        freezeWitnessJobs(witness);JSONObject state=managerSnapshot(manager,witness.trace,"actual_native_guidance_armed");if(!identity(item.job).equals(state.getString("active")))throw new IllegalStateException("Controlled job no longer occupies native manager");return witness;
    }
    private static void freezeWitnessJobs(GuidanceWitness witness)throws Exception{
        CountDownLatch done=new CountDownLatch(1);AtomicReference<Throwable> error=new AtomicReference<>();((Executor)field(witness.manager.getClass(),"j").get(witness.manager)).execute(()->{try{for(String name:new String[]{"p","q","prevJob"}){Object job=field(witness.manager.getClass(),name).get(witness.manager);if(job!=null)witness.known.add(job);}}catch(Throwable failure){error.set(failure);}finally{done.countDown();}});if(!done.await(5,TimeUnit.SECONDS)||error.get()!=null)throw new IllegalStateException("Native job identity freeze failed",error.get());
    }
    public static JSONObject actualManagerWitness(GuidanceWitness witness)throws Exception{
        for(String name:new String[]{"p","q","prevJob"}){Object job=field(witness.manager.getClass(),name).get(witness.manager);if(job==null||witness.known.contains(job))continue;String category=((Enum<?>)field(job.getClass(),"m").get(job)).name();if(category.equals("PULL_GUIDANCE")){witness.regenerated=identity(job);if(witness.regenerationAt<0)witness.regenerationAt=SystemClock.elapsedRealtime();}}
        return witness.item.snapshot().put("controlled_duration_ms",10000).put("native_start_to_stop_ns",witness.item.trace.between("media_start_return","media_stop_enter")).put("new_current_route_pull_job",witness.regenerated).put("regeneration_observed_elapsed_ms",witness.regenerationAt).put("known_jobs_before_external_warning",witness.known.size());
    }
    public static void closeActualManagerWitness(Instrumentation probe,GuidanceWitness witness)throws Exception{
        if(witness==null)return;if(witness.item.job!=null&&witness.item.terminalCount==0){onMain(probe,()->method(witness.manager.getClass(),"l",Class.forName("bmud",false,probe.getTargetContext().getClassLoader())).invoke(witness.manager,witness.item.job));witness.item.terminal.await(3,TimeUnit.SECONDS);}onMain(probe,()->{if(witness.item.player.releases==0)witness.item.player.release();});witness.item.deleted=witness.item.wav.delete();
    }

    /** Use a real app-created route model; missing network/location/route state is a failure, not fabricated. */
    private static JSONObject runProductionRoute(Instrumentation probe)throws Exception {
        JSONObject result=new JSONObject().put("probe","MapsVoiceProbe").put("scenario","production_route")
                .put("scope","Production P0 hold with an app-created current route and a controlled native TEST_AUDIO job");
        ClassLoader loader=probe.getTargetContext().getClassLoader();Class<?> type=Class.forName("org.ungoogled.ui.MapsGuidanceCoordinator",true,loader);Object[] coordinator={null};Object[] manager={null};ManagerItem[] item={null};Trace trace=new Trace();
        try {
            onMain(probe,()-> {
                coordinator[0]=type.getConstructor(android.content.Context.class).newInstance(probe.getTargetContext());
                android.content.Intent navigation=new android.content.Intent(android.content.Intent.ACTION_VIEW,android.net.Uri.parse("google.navigation:q=52.3791,4.9003&mode=d")).setPackage(probe.getTargetContext().getPackageName()).addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                probe.getTargetContext().startActivity(navigation);
            });
            long deadline=SystemClock.elapsedRealtime()+25000;Object route=null;boolean active=false;
            while(SystemClock.elapsedRealtime()<deadline) {
                java.lang.ref.WeakReference<?> reference=(java.lang.ref.WeakReference<?>)field(type,"route").get(null);route=reference.get();
                if(route!=null) {
                    Object controller=field(Class.forName("bmia",false,loader),"c").get(route);active=(Boolean)inheritedMethod(controller.getClass(),"bv").invoke(controller);
                    result.put("route_owner",identity(route)).put("native_navigation_active",active).put("current_route_present",field(Class.forName("bmia",false,loader),"e").get(route)!=null).put("current_step_present",field(Class.forName("bmia",false,loader),"o").get(route)!=null);
                    if(active&&result.getBoolean("current_route_present")&&result.getBoolean("current_step_present"))break;
                }
                SystemClock.sleep(50);
            }
            if(route==null || !active || !result.optBoolean("current_route_present") || !result.optBoolean("current_step_present"))throw new IllegalStateException("No live native route and current step became available; no route object or step was fabricated");
            if(!(Boolean)method(type,"isReady").invoke(coordinator[0]))throw new IllegalStateException("Production coordinator not ready for real route");
            manager[0]=field(type,"manager").get(coordinator[0]);
            long idleUntil=SystemClock.elapsedRealtime()+5000;while(SystemClock.elapsedRealtime()<idleUntil&&!managerSnapshot(manager[0],trace,"route_wait_idle").getBoolean("idle"))SystemClock.sleep(30);
            if(!managerSnapshot(manager[0],trace,"route_before_synthetic").getBoolean("idle"))throw new IllegalStateException("Current native route never provided an idle slot for the controlled job");
            item[0]=createManagerItem(probe,loader,"production_route_active_cancel",10000);submitManagerItem(probe,manager[0],item[0],loader,trace);
            if(!item[0].started.await(5,TimeUnit.SECONDS))throw new IllegalStateException("Controlled native job did not start");
            JSONObject beforeHold=managerSnapshot(manager[0],trace,"route_exact_active_before_hold");result.put("manager_before_hold",beforeHold);
            if(!identity(item[0].job).equals(beforeHold.getString("active")))throw new IllegalStateException("Native route changed the controlled active job before hold; do not attribute another job's cancellation");
            JSONObject hold=acquireHold(probe,coordinator[0],type,loader,"production_route_hold","P0");result.put("hold",hold);
            if(!hold.getBoolean("quiet"))throw new IllegalStateException("P0 current-route hold refused: "+hold);
            if(!item[0].terminal.await(5,TimeUnit.SECONDS))throw new IllegalStateException("P0 cancellation had no native terminal");
            JSONObject media=item[0].snapshot();result.put("cancelled_media",media);
            Object latest=((java.lang.ref.WeakReference<?>)field(type,"route").get(null)).get();
            result.put("route_owner_at_release",identity(latest)).put("current_step_at_release",latest==null?"null":identity(field(Class.forName("bmia",false,loader),"o").get(latest))).put("current_model_at_release",latest==null?"null":identity(field(Class.forName("bmia",false,loader),"e").get(latest)));
            java.util.Set<Object> beforeRelease=java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());
            CountDownLatch known=new CountDownLatch(1);AtomicReference<Throwable> knownFailure=new AtomicReference<>();
            ((Executor)field(manager[0].getClass(),"j").get(manager[0])).execute(()->{try{for(String name:new String[]{"p","q","prevJob"}){Object old=field(manager[0].getClass(),name).get(manager[0]);if(old!=null)beforeRelease.add(old);}}catch(Throwable error){knownFailure.set(error);}finally{known.countDown();}});
            if(!known.await(5,TimeUnit.SECONDS)||knownFailure.get()!=null)throw new IllegalStateException("Could not freeze pre-release native job identities",knownFailure.get());
            result.put("known_jobs_before_release",beforeRelease.size());
            onMain(probe,()->method(type,"release",String.class).invoke(coordinator[0],"production_route_hold"));onMain(probe,()->{});
            result.put("coordinator_fault_after_release",field(type,"fault").getBoolean(coordinator[0]));
            boolean observedPull=false;long pullUntil=SystemClock.elapsedRealtime()+5000;
            while(SystemClock.elapsedRealtime()<pullUntil && !observedPull) {
                for(String name:new String[]{"p","q","prevJob"}) {
                    Object job=field(manager[0].getClass(),name).get(manager[0]);if(job==null||beforeRelease.contains(job))continue;
                    String category=((Enum<?>)field(job.getClass(),"m").get(job)).name();
                    if(category.equals("PULL_GUIDANCE")){result.put("regenerated_job",identity(job)).put("regenerated_category",category);observedPull=true;break;}
                }
                if(!observedPull)SystemClock.sleep(20);
            }
            result.put("current_route_regeneration_job_observed",observedPull);
            long playedNs=item[0].trace.between("media_start_return","media_stop_enter");
            boolean cancelled=((java.util.concurrent.atomic.AtomicBoolean)field(item[0].job.getClass(),"s").get(item[0].job)).get();
            result.put("controlled_duration_ms",10000).put("actual_start_to_stop_ns",playedNs).put("native_cancellation_flag",cancelled)
                    .put("native_terminal_race", "FINISHED_AUDIO".equals(item[0].lastTerminal));
            boolean terminalKnown="CANCELLED".equals(item[0].lastTerminal)||"FINISHED_AUDIO".equals(item[0].lastTerminal);
            boolean passed=item[0].player.starts==1&&item[0].player.stops==1&&item[0].player.releases==1&&item[0].terminalCount==1&&terminalKnown
                    &&cancelled&&playedNs>=0&&playedNs<5000000000L&&item[0].trace.before("media_release_return","native_manager_terminal_callback")
                    &&hold.getBoolean("quiet")&&observedPull&&!result.getBoolean("coordinator_fault_after_release");
            result.put("status",passed?"observed":"inconclusive");
        }catch(Throwable failure){result.put("status","blocked").put("exception",describe(failure));}
        finally {
            if(item[0]!=null){if(item[0].job!=null&&item[0].terminalCount==0)try{onMain(probe,()->method(manager[0].getClass(),"l",Class.forName("bmud",true,loader)).invoke(manager[0],item[0].job));item[0].terminal.await(2,TimeUnit.SECONDS);}catch(Throwable failure){trace.add("route_cleanup_cancel",describe(failure));}try{onMain(probe,()->{if(item[0].player.releases==0)item[0].player.release();});}catch(Throwable ignored){}item[0].wav.delete();}
            if(coordinator[0]!=null)try{onMain(probe,()->method(type,"close").invoke(coordinator[0]));onMain(probe,()->{});}catch(Throwable failure){trace.add("route_cleanup_coordinator",describe(failure));}
            result.put("events",trace.json()).put("limitations",new JSONArray(new String[]{"Uses an actual app-created Amsterdam fixture route if it becomes available; absence is reported as blocked.","The deliberately cancelled active job is synthetic TEST_AUDIO; a regeneration job alone does not prove audio intelligibility, acoustic output or actual car routing."}));
        }
        return result;
    }

    /** Real production speaker with a private synthetic source grant, never a public road report. */
    private static JSONObject runProductionSpeech(Instrumentation probe,boolean toneMode) throws Exception {return runProductionSpeech(probe,toneMode,false);}
    private static JSONObject runProductionSpeech(Instrumentation probe,boolean toneMode,boolean arrivingNative) throws Exception {
        JSONObject result=new JSONObject().put("probe","MapsVoiceProbe").put("scenario",arrivingNative?"production_speech_arrival":toneMode?"production_tone":"production_speech")
                .put("scope",toneMode?"Actual patched Maps tone, native AudioTrack head/drain/release and production durable owner with a private synthetic warning":"Actual patched Maps speaker, real offline TTS PCM/callbacks and production durable owner with a private synthetic warning");
        ClassLoader loader=probe.getTargetContext().getClassLoader();Trace trace=new Trace();
        Class<?> speakerClass=Class.forName("org.ungoogled.ui.MapsWarningSpeaker",true,loader);
        Class<?> ownerClass=Class.forName("nl.johninnl.navigation.alerts.WarningAudioOwner",true,loader),grantClass=Class.forName("nl.johninnl.navigation.alerts.PlaybackGrant",true,loader);
        Class<?> outcomeClass=Class.forName("nl.johninnl.navigation.alerts.PlaybackGrant$Outcome",true,loader),modeClass=Class.forName("nl.johninnl.navigation.alerts.WarningAudioOwner$Mode",true,loader);
        Class<?> eventClass=Class.forName("nl.johninnl.navigation.alerts.WarningEvent",true,loader),clientClass=Class.forName("nl.johninnl.navigation.alerts.WarningAudioOwner$Client",true,loader);
        Object[] speaker={null};Object store=null,owner=null,grant=null,client=null,lease=null;
        CountDownLatch started=new CountDownLatch(1),finished=new CountDownLatch(1);AtomicReference<String> terminal=new AtomicReference<>("");AtomicReference<Boolean> quiet=new AtomicReference<>(false);
        AtomicReference<Object> toneSession=new AtomicReference<>(),toneTrack=new AtomicReference<>();
        AtomicReference<String> pcmId=new AtomicReference<>("");java.io.ByteArrayOutputStream pcm=new java.io.ByteArrayOutputStream();java.util.concurrent.atomic.AtomicInteger rate=new java.util.concurrent.atomic.AtomicInteger(),encoding=new java.util.concurrent.atomic.AtomicInteger(),channels=new java.util.concurrent.atomic.AtomicInteger(),audioOverflow=new java.util.concurrent.atomic.AtomicInteger(),forwardFailures=new java.util.concurrent.atomic.AtomicInteger();
        String nonce=java.util.UUID.randomUUID().toString();boolean ownerCompleted=false;ManagerItem arrival=null;Object arrivalManager=null;
        try {
            onMain(probe,()-> {
                speaker[0]=speakerClass.getConstructor(android.content.Context.class).newInstance(probe.getTargetContext());
                method(speakerClass,"prepare",String.class,modeClass).invoke(speaker[0],"en",enumNamed(modeClass,toneMode?"TONE":"VOICE"));
            });
            long readyUntil=SystemClock.elapsedRealtime()+20000;
            while(SystemClock.elapsedRealtime()<readyUntil && !(Boolean)method(speakerClass,"isReady",String.class,modeClass).invoke(speaker[0],"en",enumNamed(modeClass,toneMode?"TONE":"VOICE")))SystemClock.sleep(30);
            if(!(Boolean)method(speakerClass,"isReady",String.class,modeClass).invoke(speaker[0],"en",enumNamed(modeClass,toneMode?"TONE":"VOICE")))throw new IllegalStateException("Production speaker did not become ready; initialized="+field(speakerClass,"initialized").get(speaker[0])+",language="+field(speakerClass,"preparedLanguage").get(speaker[0]));
            if(toneMode) {
                result.put("tts_initialized",field(speakerClass,"initialized").getBoolean(speaker[0])).put("tts_instance_created",field(speakerClass,"tts").get(speaker[0])!=null);
            } else {
            android.speech.tts.TextToSpeech tts=(android.speech.tts.TextToSpeech)field(speakerClass,"tts").get(speaker[0]);
            android.speech.tts.UtteranceProgressListener original=(android.speech.tts.UtteranceProgressListener)field(speakerClass,"progress").get(speaker[0]);
            onMain(probe,()-> {
                result.put("voice",tts.getVoice().getName()).put("voice_language",tts.getVoice().getLocale().toLanguageTag()).put("voice_requires_network",tts.getVoice().isNetworkConnectionRequired());
                tts.setOnUtteranceProgressListener(new android.speech.tts.UtteranceProgressListener(){
                    private void forward(Runnable action){try{action.run();}catch(Throwable error){forwardFailures.incrementAndGet();}}
                    @Override public void onStart(String id){trace.add("engine_onStart",id);forward(()->original.onStart(id));}
                    @Override public void onDone(String id){trace.add("engine_onDone",id);forward(()->original.onDone(id));}
                    @Override public void onError(String id){trace.add("engine_onError",id);forward(()->original.onError(id));}
                    @Override public void onError(String id,int code){trace.add("engine_onError_code",id+":"+code);forward(()->original.onError(id,code));}
                    @Override public void onStop(String id,boolean interrupted){trace.add("engine_onStop",id);forward(()->original.onStop(id,interrupted));}
                    @Override public void onBeginSynthesis(String id,int sampleRate,int audioFormat,int channelCount){
                        if(id.startsWith("morphe-warning-")){pcmId.set(id);rate.set(sampleRate);encoding.set(audioFormat);channels.set(channelCount);trace.add("engine_onBeginSynthesis",id+",rate="+sampleRate+",format="+audioFormat+",channels="+channelCount);}
                        forward(()->original.onBeginSynthesis(id,sampleRate,audioFormat,channelCount));
                    }
                    @Override public void onAudioAvailable(String id,byte[] data){
                        if(id.startsWith("morphe-warning-"))synchronized(pcm){if(pcm.size()+data.length<=1024*1024)pcm.write(data,0,data.length);else audioOverflow.incrementAndGet();}
                        forward(()->original.onAudioAvailable(id,data));
                    }
                });
            });
            }
            if(arrivingNative){Object guide=field(speakerClass,"guidance").get(speaker[0]);arrivalManager=field(guide.getClass(),"manager").get(guide);arrival=createManagerItem(probe,loader,"arrival_during_external_warning",10000);}
            String session=java.util.UUID.randomUUID().toString(),registration=java.util.UUID.randomUUID().toString();
            Class<?> journalClass=Class.forName("nl.johninnl.navigation.alerts.WarningJournal",true,loader),profileClass=Class.forName("nl.johninnl.navigation.alerts.WarningCapabilities",true,loader),storeClass=Class.forName("nl.johninnl.navigation.alerts.AtomicPlaybackStore",true,loader),storeInterface=Class.forName("nl.johninnl.navigation.alerts.PlaybackStore",true,loader);
            Object journal=journalClass.getConstructor(String.class).newInstance(session);java.util.Set<String> caps=new java.util.HashSet<>();caps.add("native_text");char[] digest=new char[64];java.util.Arrays.fill(digest,'a');
            Object profile=profileClass.getConstructor(String.class,java.util.Set.class,boolean.class).newInstance(new String(digest),caps,true);
            File ledger=new File(probe.getTargetContext().getCacheDir(),"maps-warning-speaker-probe.bin");store=storeClass.getConstructor(File.class).newInstance(ledger);
            String boot=(String)method(storeClass,"bootIdentity",android.content.Context.class).invoke(null,probe.getTargetContext());
            owner=ownerClass.getConstructor(String.class,String.class,journalClass,storeInterface,profileClass).newInstance(boot,session,journal,store,profile);
            Object voice=enumNamed(modeClass,toneMode?"TONE":"VOICE");java.util.Set<Object> modes=new java.util.HashSet<>();modes.add(voice);
            client=clientClass.getConstructor(int.class,String.class,String.class,String.class,java.util.Set.class,java.util.Set.class,String.class)
                    .newInstance(android.os.Process.myUid(),probe.getTargetContext().getPackageName(),registration,nonce,caps,modes,field(profileClass,"digest").get(profile));
            Object claim=method(ownerClass,"claim",int.class,clientClass,modeClass,boolean.class,long.class).invoke(owner,android.os.Process.myUid(),client,voice,true,SystemClock.elapsedRealtime());
            if(!"OK".equals(field(claim.getClass(),"code").get(claim).toString()))throw new IllegalStateException("Private durable source claim: "+field(claim.getClass(),"code").get(claim));
            lease=field(claim.getClass(),"lease").get(claim);
            Bundle event=new Bundle();long now=SystemClock.elapsedRealtime();event.putInt("protocol_version",1);event.putString("provider_session",session);event.putLong("sequence",1);event.putString("warning_id","TEST_AUDIO_PRIVATE");event.putLong("revision",1);event.putLong("announcement_index",1);event.putString("operation","ANNOUNCE");event.putString("phase","notice");event.putInt("priority",0);event.putString("native_type","TestFixture");event.putString("category","road_danger");event.putString("relevance","notice");event.putString("relationship","unknown");event.putString("message","Test warning. Person on road. End of test.");event.putString("language_tag","en");event.putString("message_origin","native_text");event.putLong("observed_elapsed_ms",now);event.putLong("issued_elapsed_ms",now);event.putLong("state_until_elapsed_ms",now+30000);event.putLong("announce_until_elapsed_ms",now+5000);
            Object warning=method(Class.forName("nl.johninnl.navigation.alerts.WarningCodec",true,loader),"decode",Bundle.class,long.class).invoke(null,event,now);
            Object append=method(journalClass,"append",eventClass,long.class).invoke(journal,warning,now);if(!append.toString().equals("ACCEPTED"))throw new IllegalStateException("Private source event rejected: "+append);
            Class<?> phaseClass=Class.forName("nl.johninnl.navigation.alerts.WarningEvent$Phase",true,loader);
            Object attempt=method(ownerClass,"begin",int.class,clientClass,String.class,long.class,String.class,phaseClass,long.class,long.class,String.class,long.class).invoke(owner,android.os.Process.myUid(),client,field(lease.getClass(),"token").get(lease),field(lease.getClass(),"epoch").getLong(lease),"TEST_AUDIO_PRIVATE",enumNamed(phaseClass,"NOTICE"),1L,1L,java.util.UUID.randomUUID().toString(),SystemClock.elapsedRealtime());
            if(!field(attempt.getClass(),"code").get(attempt).toString().equals("GRANTED"))throw new IllegalStateException("Private source did not grant: "+field(attempt.getClass(),"code").get(attempt));
            grant=field(attempt.getClass(),"grant").get(attempt);Object stored=method(storeClass,"load").invoke(store);
            if(stored==null||!field(grantClass,"attemptId").get(grant).equals(field(grantClass,"attemptId").get(stored)))throw new IllegalStateException("Grant not on disk before playback");
            trace.add("durable_grant_observed");result.put("fixture_text",event.getString("message")).put("source_announce_at_ms",now).put("grant_persisted_before_speak",true).put("ledger_path",ledger.getAbsolutePath());
            Class<?> listenerClass=Class.forName("org.ungoogled.ui.MapsWarningSpeaker$Listener",true,loader);
            Object listener=Proxy.newProxyInstance(loader,new Class<?>[]{listenerClass},(proxy,called,values)->{
                if(called.getDeclaringClass()==Object.class){if(called.getName().equals("hashCode"))return System.identityHashCode(proxy);if(called.getName().equals("equals"))return proxy==values[0];return "ProductionMapsSyntheticSpeechListener";}
                if(called.getName().equals("started")){trace.add("production_speaker_started");result.put("speaker_started_at_ms",SystemClock.elapsedRealtime());
                    if(toneMode){Object tone=field(speakerClass,"tone").get(speaker[0]);Object sessionValue=field(tone.getClass(),"active").get(tone);toneSession.set(sessionValue);Object track=field(sessionValue.getClass(),"track").get(sessionValue);toneTrack.set(track);result.put("tone_started_head",method(track.getClass(),"head").invoke(track)).put("tone_started_play_state",method(track.getClass(),"playState").invoke(track)).put("tone_frames",field(sessionValue.getClass(),"frames").getInt(sessionValue));}
                    started.countDown();}
                else if(called.getName().equals("finished")){trace.add("production_speaker_finished",values[1]+",quiet="+values[2]);terminal.set(values[1].toString());quiet.set((Boolean)values[2]);finished.countDown();}
                return null;
            });
            Object accepted=method(speakerClass,"speak",eventClass,grantClass,listenerClass).invoke(speaker[0],warning,grant,listener);
            result.put("adapter_accepted",accepted);if(!(Boolean)accepted)throw new IllegalStateException("Production speaker declined private valid grant");trace.add("adapter_enqueue_return");
            if(!started.await(6,TimeUnit.SECONDS))throw new IllegalStateException("No actual engine start; terminal="+terminal.get());
            Object startAck=method(ownerClass,"outcome",int.class,String.class,grantClass,outcomeClass,boolean.class,long.class).invoke(owner,android.os.Process.myUid(),nonce,grant,enumNamed(outcomeClass,"STARTED"),false,SystemClock.elapsedRealtime());
            result.put("source_started_ack",startAck.toString());
            if(arrivingNative){trace.add("native_arrival_submit_after_warning_start");submitManagerItem(probe,arrivalManager,arrival,loader,trace);}
            while(!finished.await(1500,TimeUnit.MILLISECONDS)) {
                Object renewal=method(ownerClass,"renew",int.class,clientClass,String.class,long.class,modeClass,boolean.class,long.class).invoke(owner,android.os.Process.myUid(),client,field(lease.getClass(),"token").get(lease),field(lease.getClass(),"epoch").getLong(lease),voice,true,SystemClock.elapsedRealtime());
                if(!field(renewal.getClass(),"code").get(renewal).toString().equals("OK"))throw new IllegalStateException("Private source lease renewal failed");
                if(SystemClock.elapsedRealtime()-now>20000)throw new IllegalStateException("Production TTS terminal timeout");
            }
            Object completion=method(ownerClass,"outcome",int.class,String.class,grantClass,outcomeClass,boolean.class,long.class).invoke(owner,android.os.Process.myUid(),nonce,grant,enumNamed(outcomeClass,terminal.get()),quiet.get(),SystemClock.elapsedRealtime());
            ownerCompleted=quiet.get()&&"OK".equals(completion.toString());result.put("source_terminal_ack",completion.toString()).put("speaker_terminal",terminal.get()).put("speaker_terminal_quiescent",quiet.get()).put("ledger_cleared",method(storeClass,"load").invoke(store)==null);
            byte[] bytes;synchronized(pcm){bytes=pcm.toByteArray();}int nonzero=0;for(byte b:bytes)if(b!=0)nonzero++;
            result.put("pcm_bytes",bytes.length).put("pcm_nonzero_bytes",nonzero).put("pcm_rate_hz",rate.get()).put("pcm_encoding",encoding.get()).put("pcm_channels",channels.get()).put("pcm_overflow_chunks",audioOverflow.get()).put("native_callback_forward_failures",forwardFailures.get()).put("pcm_utterance",pcmId.get());
            if(bytes.length>0 && encoding.get()==android.media.AudioFormat.ENCODING_PCM_16BIT) {
                File wav=new File(probe.getTargetContext().getCacheDir(),"maps-production-synthetic-warning.wav");
                try(FileOutputStream out=new FileOutputStream(wav)){out.write(new byte[]{'R','I','F','F'});little(out,36+bytes.length,4);out.write(new byte[]{'W','A','V','E','f','m','t',' '});little(out,16,4);little(out,1,2);little(out,channels.get(),2);little(out,rate.get(),4);little(out,rate.get()*channels.get()*2,4);little(out,channels.get()*2,2);little(out,16,2);out.write(new byte[]{'d','a','t','a'});little(out,bytes.length,4);out.write(bytes);}
                result.put("synthetic_audio_device_path",wav.getAbsolutePath());
            }
            if(arrivingNative){arrival.terminal.await(2,TimeUnit.SECONDS);result.put("native_arrival",arrival.snapshot());}
            boolean outputProven;
            if(toneMode) {
                Object tracked=toneTrack.get(),sessionValue=toneSession.get();
                long head=field(sessionValue.getClass(),"head").getLong(sessionValue);int frames=field(sessionValue.getClass(),"frames").getInt(sessionValue);int state=(Integer)method(tracked.getClass(),"state").invoke(tracked);
                result.put("tone_terminal_head",head).put("tone_released_state",state).put("tone_tts_initialized_after",field(speakerClass,"initialized").getBoolean(speaker[0])).put("tone_tts_instance_after",field(speakerClass,"tts").get(speaker[0])!=null);
                outputProven=result.getLong("tone_started_head")>0&&head==frames&&state==android.media.AudioTrack.STATE_UNINITIALIZED&&!result.getBoolean("tts_initialized")&&!result.getBoolean("tts_instance_created")&&!result.getBoolean("tone_tts_instance_after")&&trace.count("production_speaker_started")==1;
            } else outputProven=bytes.length>1000&&nonzero>100&&audioOverflow.get()==0&&forwardFailures.get()==0&&!result.getBoolean("voice_requires_network")&&trace.before("durable_grant_observed","engine_onStart")&&trace.count("engine_onStart")==1&&trace.count("engine_onDone")==1;
            boolean passed=ownerCompleted&&"COMPLETED".equals(terminal.get())&&result.getBoolean("ledger_cleared")&&"OK".equals(startAck.toString())&&outputProven&&(!arrivingNative||arrival.player.starts==0&&arrival.terminalCount==1&&"NEVER_PLAYED".equals(arrival.lastTerminal));
            Object coordinator=field(speakerClass,"guidance").get(speaker[0]);Class<?> coordinatorType=coordinator.getClass();Object manager=field(coordinatorType,"manager").get(coordinator),mute=field(manager.getClass(),"f").get(manager);
            boolean wasNativeTemporaryMute=field(mute.getClass(),"i").getBoolean(mute);boolean nativeMutePassed=false;
            if(!wasNativeTemporaryMute) {
                try {
                    onMain(probe,()->method(mute.getClass(),"k").invoke(mute));
                    Object silent=method(speakerClass,"effectiveMode",modeClass).invoke(speaker[0],voice);
                    boolean blocked=!(Boolean)method(speakerClass,"isReady",String.class,modeClass).invoke(speaker[0],"en",voice);
                    nativeMutePassed="SILENT".equals(silent.toString())&&blocked;result.put("verified_native_full_mute_mode",silent.toString()).put("verified_native_full_mute_not_ready",blocked);
                }finally{onMain(probe,()->method(mute.getClass(),"f").invoke(mute));}
            }
            field(coordinatorType,"manager").set(coordinator,new Object());
            Object unavailableIntent=method(speakerClass,"effectiveMode",modeClass).invoke(speaker[0],voice);
            boolean unavailableReady=(Boolean)method(speakerClass,"isReady",String.class,modeClass).invoke(speaker[0],"en",voice);
            result.put("injected_di_fault_preserves_intent",unavailableIntent.toString()).put("injected_di_fault_ready",unavailableReady);
            boolean unavailablePassed=voice.toString().equals(unavailableIntent.toString())&&!unavailableReady;
            result.put("status",passed&&nativeMutePassed&&unavailablePassed?"observed":"inconclusive");
        }catch(Throwable failure){result.put("status","blocked").put("exception",describe(failure));trace.add("production_speech_exception",describe(failure));}
        finally {
            if(arrival!=null){final ManagerItem ownedArrival=arrival;final Object nativeManager=arrivalManager;try{if(ownedArrival.job!=null&&ownedArrival.terminalCount==0){onMain(probe,()->method(nativeManager.getClass(),"l",Class.forName("bmud",true,loader)).invoke(nativeManager,ownedArrival.job));ownedArrival.terminal.await(2,TimeUnit.SECONDS);}onMain(probe,()->{if(ownedArrival.player.releases==0)ownedArrival.player.release();});}catch(Throwable failure){trace.add("native_arrival_cleanup",describe(failure));}ownedArrival.wav.delete();}
            if(speaker[0]!=null)try{onMain(probe,()->method(speakerClass,"close").invoke(speaker[0]));onMain(probe,()->{});}catch(Throwable error){trace.add("speaker_cleanup_failure",describe(error));}
            if(owner!=null&&grant!=null&&!ownerCompleted)try{
                boolean positive=finished.getCount()==0&&quiet.get()&&!terminal.get().isEmpty();
                method(ownerClass,"outcome",int.class,String.class,grantClass,outcomeClass,boolean.class,long.class).invoke(owner,android.os.Process.myUid(),nonce,grant,enumNamed(outcomeClass,positive?terminal.get():"UNCERTAIN"),positive,SystemClock.elapsedRealtime());
            }catch(Throwable error){trace.add("uncertain_persist_failure",describe(error));}
            if(store!=null)try{method(store.getClass(),"close").invoke(store);}catch(Throwable error){trace.add("store_cleanup_failure",describe(error));}
            result.put("events",trace.json()).put("limitations",new JSONArray(new String[]{
                    "The source grant/event is a private synthetic fixture, not FM detection and not a cross-UID provider-to-receiver acceptance test.",
                    "A probe observer forwards the production speaker's original progress listener and captures only this receiver-owned test TTS PCM; no microphone or other application audio is recorded.",
                    "Engine PCM plus onStart/onDone prove a nonzero generated speech signal and lifecycle, not acoustic playback, semantic transcription, car routing or interruption of actual route guidance.",
                    "No full/minimal-mute, focus-denial, current-route regeneration or physical phone/car acceptance is established."
            }));
        }
        return result;
    }

    /** Exercise the actual patched coordinator and its final native dispatch fence. */
    private static JSONObject runProduction(Instrumentation probe,Bundle args) throws Exception {
        JSONObject result=new JSONObject().put("probe","MapsVoiceProbe").put("scenario",args.getString("scenario"))
                .put("expected_original_artifact_sha256",ARTIFACT).put("scope","Production coordinator + original manager and synthetic TEST_AUDIO; no fabricated route");
        ClassLoader loader=probe.getTargetContext().getClassLoader();
        Class<?> coordinatorClass=Class.forName("org.ungoogled.ui.MapsGuidanceCoordinator",true,loader);
        Object[] coordinator={null};Object[] manager={null};List<ManagerItem> items=new ArrayList<>();JSONArray cases=new JSONArray();Trace trace=new Trace();
        try {
            onMain(probe,()->coordinator[0]=coordinatorClass.getConstructor(android.content.Context.class).newInstance(probe.getTargetContext()));
            long until=SystemClock.elapsedRealtime()+5000;
            while(SystemClock.elapsedRealtime()<until && !(Boolean)method(coordinatorClass,"isReady").invoke(coordinator[0]))SystemClock.sleep(20);
            if(!(Boolean)method(coordinatorClass,"isReady").invoke(coordinator[0]))throw new IllegalStateException("Production coordinator not ready: bound="+field(coordinatorClass,"bound").get(coordinator[0])+",fault="+field(coordinatorClass,"fault").get(coordinator[0]));
            manager[0]=field(coordinatorClass,"manager").get(coordinator[0]);
            result.put("coordinator_class",coordinator[0].getClass().getName()).put("manager_identity",identity(manager[0]));
            if(!managerSnapshot(manager[0],trace,"production_initial").getBoolean("idle"))throw new IllegalStateException("Production manager not idle");
            ManagerItem natural=createManagerItem(probe,loader,"production_unheld",700);items.add(natural);
            submitManagerItem(probe,manager[0],natural,loader,trace);
            if(!natural.started.await(5,TimeUnit.SECONDS) || !natural.terminal.await(5,TimeUnit.SECONDS))throw new IllegalStateException("Unheld original media did not start/complete");
            JSONObject unheld=natural.snapshot();unheld.put("case","production_unheld_original_lifecycle");
            boolean unheldPassed=natural.player.starts==1&&natural.player.stops==1&&natural.player.releases==1&&natural.terminalCount==1&&"FINISHED_AUDIO".equals(natural.lastTerminal);
            unheld.put("status",unheldPassed?"observed":"inconclusive");cases.put(unheld);
            managerSnapshot(manager[0],trace,"production_after_unheld");
            JSONObject hold=acquireHold(probe,coordinator[0],coordinatorClass,loader,"production_hold","P0");cases.put(hold);
            if(!hold.getBoolean("quiet"))throw new IllegalStateException("Idle production hold denied: "+hold);
            ManagerItem rejected=createManagerItem(probe,loader,"production_late_dispatch",10000);items.add(rejected);
            submitManagerItem(probe,manager[0],rejected,loader,trace);
            if(!rejected.terminal.await(5,TimeUnit.SECONDS))throw new IllegalStateException("Held final dispatch never produced native terminal");
            SystemClock.sleep(100);
            JSONObject fenced=rejected.snapshot();fenced.put("case","production_final_dispatch_fence");
            boolean fencedPassed=rejected.player.starts==0&&rejected.player.stops==1&&rejected.player.releases==1&&rejected.terminalCount==1
                    &&"NEVER_PLAYED".equals(rejected.lastTerminal)
                    &&((java.util.concurrent.atomic.AtomicBoolean)field(rejected.job.getClass(),"s").get(rejected.job)).get()
                    &&(Boolean)field(coordinatorClass,"regenerate").get(coordinator[0]);
            fenced.put("status",fencedPassed?"observed":"inconclusive").put("current_regeneration_requested",field(coordinatorClass,"regenerate").get(coordinator[0]));cases.put(fenced);
            ManagerItem chainFirst=createManagerItem(probe,loader,"production_fenced_chain_first",800,false),chainSecond=createManagerItem(probe,loader,"production_fenced_chain_second",800,false);items.add(chainFirst);items.add(chainSecond);
            Object firstLeaf=chainFirst.alert,secondLeaf=chainSecond.alert;
            onMain(probe,()-> {
                Object children=java.lang.reflect.Array.newInstance(Class.forName("bmuc",true,loader),2);
                java.lang.reflect.Array.set(children,0,firstLeaf);java.lang.reflect.Array.set(children,1,secondLeaf);
                Constructor<?> constructor=Class.forName("bmsh",true,loader).getDeclaredConstructor(children.getClass(),Class.forName("bmub",true,loader),boolean.class);constructor.setAccessible(true);
                chainFirst.alert=constructor.newInstance(children,enumNamed(Class.forName("bmub",true,loader),"LOCAL"),true);
                if(!(Boolean)method(chainFirst.alert.getClass(),"f").invoke(chainFirst.alert))throw new IllegalStateException("Original composite preparation failed");
            });
            submitManagerItem(probe,manager[0],chainFirst,loader,trace);
            if(!chainFirst.terminal.await(5,TimeUnit.SECONDS))throw new IllegalStateException("Fenced composite had no native terminal");SystemClock.sleep(100);
            JSONObject composite=new JSONObject().put("case","production_composite_final_dispatch_fence")
                    .put("first_starts",chainFirst.player.starts).put("second_starts",chainSecond.player.starts)
                    .put("first_releases",chainFirst.player.releases).put("second_releases",chainSecond.player.releases)
                    .put("native_terminal",chainFirst.lastTerminal).put("terminal_count",chainFirst.terminalCount)
                    .put("first_leaf_cleared",field(firstLeaf.getClass(),"a").get(firstLeaf)==null).put("second_leaf_cleared",field(secondLeaf.getClass(),"a").get(secondLeaf)==null);
            boolean compositePassed=chainFirst.player.starts==0&&chainSecond.player.starts==0&&chainFirst.player.releases==1&&chainSecond.player.releases==1
                    &&chainFirst.terminalCount==1&&"NEVER_PLAYED".equals(chainFirst.lastTerminal)&&composite.getBoolean("first_leaf_cleared")&&composite.getBoolean("second_leaf_cleared");
            composite.put("status",compositePassed?"observed":"inconclusive");cases.put(composite);
            JSONObject afterFence=managerSnapshot(manager[0],trace,"production_after_fence");result.put("manager_after_fence",afterFence);
            onMain(probe,()->method(coordinatorClass,"release",String.class).invoke(coordinator[0],"production_hold"));
            onMain(probe,()->{});
            ManagerItem busy=createManagerItem(probe,loader,"production_no_route_busy",10000);items.add(busy);
            submitManagerItem(probe,manager[0],busy,loader,trace);
            if(!busy.started.await(5,TimeUnit.SECONDS))throw new IllegalStateException("Busy-case native player did not start");
            JSONObject busyHold=acquireHold(probe,coordinator[0],coordinatorClass,loader,"production_busy","P0");
            busyHold.put("case","production_p0_without_current_route");
            boolean refused=!busyHold.getBoolean("quiet")&&"GUIDANCE_BUSY".equals(busyHold.optString("reason"))&&busy.player.stops==0&&busy.terminalCount==0;
            busyHold.put("active_job_retained",busy.player.stops==0&&busy.terminalCount==0).put("status",refused?"observed":"inconclusive");cases.put(busyHold);
            result.put("status",unheldPassed&&fencedPassed&&compositePassed&&refused&&afterFence.getBoolean("idle")?"observed":"inconclusive");
        } catch(Throwable failure) {
            result.put("status","blocked").put("exception",describe(failure));trace.add("production_probe_exception",describe(failure));
        } finally {
            for(ManagerItem item:items) {
                if(manager[0]!=null&&item.job!=null&&item.terminalCount==0)try {
                    onMain(probe,()->method(manager[0].getClass(),"l",Class.forName("bmud",true,loader)).invoke(manager[0],item.job));item.terminal.await(2,TimeUnit.SECONDS);
                }catch(Throwable failure){trace.add("cleanup_cancel_failure",describe(failure));}
                try{onMain(probe,()->{if(item.player!=null&&item.player.releases==0){item.trace.add("probe_cleanup_release");item.player.release();}});}catch(Throwable failure){trace.add("cleanup_release_failure",describe(failure));}
                item.deleted=item.wav.delete();
            }
            if(coordinator[0]!=null)try{onMain(probe,()->method(coordinatorClass,"close").invoke(coordinator[0]));onMain(probe,()->{});}catch(Throwable failure){trace.add("cleanup_coordinator_failure",describe(failure));}
            result.put("cases",cases).put("events",trace.json()).put("limitations",new JSONArray(new String[]{
                    "Uses the actual patched production coordinator/final-dispatch hook and original application manager; synthetic TEST_AUDIO jobs are not route guidance.",
                    "No current native route is fabricated. P0 preemption is expected to refuse without a current bmia route/step.",
                    "No current-route regeneration, chained players, warning TTS audio, phone/car routing, full/minimal mute, or focus-denial acceptance is established by this scenario."
            }));
        }
        return result;
    }

    private static JSONObject acquireHold(Instrumentation probe,Object coordinator,Class<?> coordinatorClass,ClassLoader loader,String token,String priority) throws Exception {
        CountDownLatch done=new CountDownLatch(1);JSONObject result=new JSONObject().put("case","production_idle_hold");
        Class<?> ready=Class.forName("org.ungoogled.ui.MapsGuidanceCoordinator$Ready",true,loader);
        Class<?> priorityClass=Class.forName("nl.johninnl.navigation.alerts.WarningEvent$Priority",true,loader);
        Object callback=Proxy.newProxyInstance(loader,new Class<?>[]{ready},(proxy,called,values)->{
            if(called.getDeclaringClass()==Object.class){if(called.getName().equals("hashCode"))return System.identityHashCode(proxy);if(called.getName().equals("equals"))return proxy==values[0];return "MapsProductionHoldCallback";}
            result.put("quiet",values[0]).put("reason",values[1]).put("callback_at_elapsed_ms",SystemClock.elapsedRealtime());done.countDown();return null;
        });
        result.put("request_at_elapsed_ms",SystemClock.elapsedRealtime());
        onMain(probe,()->method(coordinatorClass,"acquire",String.class,priorityClass,long.class,ready).invoke(coordinator,token,enumNamed(priorityClass,priority),SystemClock.elapsedRealtime()+5000,callback));
        if(!done.await(6,TimeUnit.SECONDS))throw new IllegalStateException("Production acquire callback timed out");
        result.put("status",result.optBoolean("quiet")?"observed":"refused");return result;
    }

    /** Exercise the real application's manager with synthetic, explicitly non-route test audio. */
    private static JSONObject runManager(Instrumentation probe) throws Exception {
        JSONObject result = new JSONObject().put("probe", "MapsVoiceProbe").put("scenario", "manager")
                .put("expected_original_artifact_sha256", ARTIFACT)
                .put("scope", "Real app bmrc/bmtl cancellation with synthetic TEST_AUDIO jobs; no route simulation");
        Trace trace = new Trace();
        Object[] manager = new Object[1];
        List<ManagerItem> items = new ArrayList<>();
        ClassLoader loader = probe.getTargetContext().getClassLoader();
        Method[] cancel = new Method[1];
        try {
            onMain(probe, () -> {
                Object application = probe.getTargetContext().getApplicationContext();
                Method componentMethod = inheritedMethod(application.getClass(), "rJ");
                Object component = componentMethod.invoke(application);
                result.put("component_class", component.getClass().getName());
                Object provider = field(component.getClass(), "hU").get(component);
                Object cached = field(provider.getClass(), "c").get(provider);
                boolean existed = cached != null && "bmrc".equals(cached.getClass().getName());
                result.put("manager_previously_cached", existed);
                trace.add("manager_provider_resolve", existed ? "cached" : "lazy_initialization_requested");
                manager[0] = inheritedMethod(provider.getClass(), "a").invoke(provider);
                if (!"bmrc".equals(manager[0].getClass().getName())) {
                    throw new IllegalStateException("Expected original bmrc, got " + manager[0].getClass().getName());
                }
                result.put("manager_created_by_provider", !existed);
                result.put("manager_identity", identity(manager[0]));
            });
            JSONObject initial = managerSnapshot(manager[0], trace, "initial");
            result.put("initial_manager_state", initial);
            if (!initial.getBoolean("idle")) throw new IllegalStateException("Native manager not idle; no test jobs submitted");
            Class<?> jobClass = Class.forName("bmud", true, loader);
            cancel[0] = method(manager[0].getClass(), "l", jobClass);
            ManagerItem active = createManagerItem(probe, loader, "active", 10000);
            items.add(active);
            submitManagerItem(probe, manager[0], active, loader, trace);
            if (!active.started.await(5, TimeUnit.SECONDS)) {
                throw new IllegalStateException("Active native job never reached real MediaPlayer.start; terminal=" + active.lastTerminal);
            }
            SystemClock.sleep(150);
            onMain(probe, () -> {
                result.put("active_playing_before_cancel", active.player.isPlaying());
                result.put("active_position_ms_before_cancel", active.player.getCurrentPosition());
            });
            JSONObject playing = managerSnapshot(manager[0], trace, "active_playing");
            result.put("playing_manager_state", playing);
            if (!identity(active.job).equals(playing.getString("active"))) {
                throw new IllegalStateException("Submitted active job is not native manager p");
            }
            ManagerItem pending = createManagerItem(probe, loader, "pending", 10000);
            items.add(pending);
            submitManagerItem(probe, manager[0], pending, loader, trace);
            JSONObject queued = managerSnapshot(manager[0], trace, "pending_queued");
            result.put("queued_manager_state", queued);
            if (!identity(active.job).equals(queued.getString("active"))
                    || !identity(pending.job).equals(queued.getString("pending"))) {
                throw new IllegalStateException("Expected original native p/q identity pair not observed");
            }
            onMain(probe, () -> {
                trace.add("cancel_pending_call", identity(pending.job));
                cancel[0].invoke(manager[0], pending.job);
                trace.add("cancel_pending_return");
            });
            result.put("after_pending_cancel_serialized", managerSnapshot(manager[0], trace, "after_pending_cancel"));
            if (!pending.terminal.await(5, TimeUnit.SECONDS)) throw new IllegalStateException("Pending native terminal timeout");
            onMain(probe, () -> {
                trace.add("cancel_active_call", identity(active.job));
                cancel[0].invoke(manager[0], active.job);
                trace.add("cancel_active_return");
            });
            result.put("after_active_cancel_serialized", managerSnapshot(manager[0], trace, "after_active_cancel"));
            if (!active.terminal.await(5, TimeUnit.SECONDS)) throw new IllegalStateException("Active native terminal timeout");
            // Native bmth posts further manager work; sample independently after its terminal acknowledgement.
            JSONObject terminalState = managerSnapshot(manager[0], trace, "after_terminal_callbacks");
            result.put("terminal_manager_state", terminalState);
            onMain(probe, () -> {
                result.put("active_media", active.snapshot());
                result.put("pending_media", pending.snapshot());
            });
            boolean passed = "CANCELLED".equals(active.lastTerminal)
                    && "CANCELLED_NEVER_PLAYED".equals(pending.lastTerminal)
                    && active.terminalCount == 1 && pending.terminalCount == 1
                    && active.player.starts == 1 && active.player.stops == 1 && active.player.releases == 1
                    && pending.player.starts == 0 && terminalState.optBoolean("idle")
                    && result.getJSONObject("active_media").optBoolean("native_player_cleared")
                    && result.getJSONObject("active_media").optBoolean("native_job_cancel_flag")
                    && result.optBoolean("active_playing_before_cancel")
                    && result.optInt("active_position_ms_before_cancel") > 0
                    && active.trace.before("native_manager_start_callback", "media_start_enter")
                    && active.trace.before("media_release_return", "native_manager_terminal_callback");
            result.put("status", passed ? "observed" : "inconclusive");
        } catch (Throwable failure) {
            result.put("status", "blocked").put("exception", describe(failure));
            trace.add("manager_probe_exception", describe(failure));
        } finally {
            // Cancel only retained probe identities. Never call native cancel-all on the live manager.
            for (ManagerItem item : items) {
                if (manager[0] != null && cancel[0] != null && item.job != null && item.terminalCount == 0) {
                    try {
                        onMain(probe, () -> cancel[0].invoke(manager[0], item.job));
                        item.terminal.await(2, TimeUnit.SECONDS);
                    } catch (Throwable failure) { trace.add("cleanup_cancel_exception", describe(failure)); }
                }
                try {
                    onMain(probe, () -> {
                        if (item.player != null && item.player.releases == 0) {
                            item.trace.add("probe_cleanup_release", "Pending cancellation does not release supplied media in bmrc.z");
                            item.player.release();
                        }
                    });
                } catch (Throwable failure) { trace.add("cleanup_release_exception", describe(failure)); }
                item.deleted = item.wav.delete();
            }
            JSONArray observations = new JSONArray();
            for (ManagerItem item : items) observations.put(item.snapshot());
            result.put("jobs", observations).put("events", trace.json());
            result.put("limitations", new JSONArray(new String[]{
                    "Original app DI, manager, jobs, focus path and native callbacks are used; prompts are synthetic TEST_AUDIO, not navigation guidance.",
                    "Provider lazy creation may register original native listeners and a locale receiver. No preference or stream volume is changed.",
                    "TEST_AUDIO has its own native eligibility/focus policy; success does not prove GUIDANCE eligibility or route lifecycle behavior.",
                    "B and p/q snapshots are serialized queue observations, not proof that every asynchronous native task is quiescent.",
                    "No generation hold, final dispatch fence, automatic chained-player path, car routing or current-route regeneration is tested.",
                    "Pending native cancellation reports its terminal result without releasing supplied prepared media; remaining probe-owned media is explicitly released during cleanup.",
                    "A re-signed app and instrumentation are used; real start/position/release are API evidence rather than audible output measurement."
            }));
        }
        return result;
    }

    private static ManagerItem createManagerItem(Instrumentation probe, ClassLoader loader,
            String name, int durationMs) throws Exception {
        return createManagerItem(probe,loader,name,durationMs,true);
    }
    private static ManagerItem createManagerItem(Instrumentation probe, ClassLoader loader,
            String name, int durationMs,boolean prepare) throws Exception {
        ManagerItem item = new ManagerItem(name, File.createTempFile("maps-manager-probe-", ".wav",
                probe.getTargetContext().getCacheDir()));
        writeWav(item.wav, durationMs);
        try {
            onMain(probe, () -> {
                item.player = new ObservedPlayer(item.trace, item.started);
                item.player.setDataSource(item.wav.getAbsolutePath());
                Class<?> alertClass = Class.forName("bmsk", true, loader);
                Class<?> loudnessClass = Class.forName("bmur", true, loader);
                Class<?> typeClass = Class.forName("bmub", true, loader);
                Constructor<?> constructor = alertClass.getDeclaredConstructor(MediaPlayer.class,
                        loudnessClass, Executor.class, typeClass);
                constructor.setAccessible(true);
                Handler handler = new Handler(Looper.getMainLooper());
                Executor callbackExecutor = command -> {
                    if (!handler.post(command)) throw new IllegalStateException("Native terminal callback rejected");
                };
                item.alert = constructor.newInstance(item.player, enumNamed(loudnessClass, "NORMAL"),
                        callbackExecutor, enumNamed(typeClass, "LOCAL"));
                if(prepare) {
                    item.trace.add("native_prepare_call");
                    if (!(Boolean) method(alertClass, "f").invoke(item.alert)) {
                        throw new IllegalStateException("Native prepare failed for " + name);
                    }
                    item.trace.add("native_prepare_return");
                }
            });
        } catch (Exception failure) {
            onMain(probe, () -> { if (item.player != null) item.player.release(); });
            item.wav.delete();
            throw failure;
        }
        return item;
    }

    private static void submitManagerItem(Instrumentation probe, Object manager, ManagerItem item,
            ClassLoader loader, Trace trace) throws Exception {
        Class<?> eventClass = Class.forName("bmvk", true, loader);
        Class<?> categoryClass = Class.forName("bmuk", true, loader);
        Class<?> mediaClass = Class.forName("bmuc", true, loader);
        Class<?> listenerClass = Class.forName("bmug", true, loader);
        Class<?> eventType = Class.forName("bmvj", true, loader);
        Constructor<?> eventConstructor = eventClass.getDeclaredConstructor(eventType,
                Class.forName("ybf", true, loader), String.class, String.class,
                Class.forName("xzs", true, loader), Class.forName("cmrs", true, loader), int.class,
                Class.forName("cbgf", true, loader), Class.forName("ciux", true, loader),
                Class.forName("bjil", true, loader), boolean.class);
        eventConstructor.setAccessible(true);
        Object event = eventConstructor.newInstance(enumNamed(eventType, "TEST_NAVIGATION_VOICE"),
                null, "Maps native manager probe " + item.name, null, null, null, -1,
                null, null, null, false);
        Object callback = Proxy.newProxyInstance(loader, new Class<?>[]{listenerClass}, (proxy, called, values) -> {
            if (called.getDeclaringClass() == Object.class) {
                if (called.getName().equals("toString")) return "MapsManagerProbeCallback_" + item.name;
                if (called.getName().equals("hashCode")) return System.identityHashCode(proxy);
                if (called.getName().equals("equals")) return proxy == values[0];
            }
            if (called.getName().equals("b")) {
                item.trace.add("native_manager_start_callback", "durationMs=" + values[0]
                        + ",type=" + ((Enum<?>) values[1]).name());
            } else if (called.getName().equals("a")) {
                item.lastTerminal = ((Enum<?>) values[0]).name();
                item.terminalType = ((Enum<?>) values[1]).name();
                item.terminalCount++;
                item.trace.add("native_manager_terminal_callback", item.lastTerminal + ",type=" + item.terminalType);
                item.terminal.countDown();
            } else throw new UnsupportedOperationException(called.toString());
            return null;
        });
        Object[] future = new Object[1];
        onMain(probe, () -> {
            trace.add("native_manager_submit", item.name);
            future[0] = method(manager.getClass(), "k", eventClass, categoryClass, mediaClass, listenerClass)
                    .invoke(manager, event, enumNamed(categoryClass, "TEST_AUDIO"), item.alert, callback);
        });
        item.job = ((Future<?>) future[0]).get(5, TimeUnit.SECONDS);
        trace.add("native_manager_submit_resolved", item.name + ":" + identity(item.job));
        if (item.job == null || !"bmtl".equals(item.job.getClass().getName())) {
            throw new IllegalStateException("Native submission did not return bmtl: " + identity(item.job)
                    + "; native terminal=" + item.lastTerminal);
        }
    }

    private static JSONObject managerSnapshot(Object manager, Trace trace, String phase) throws Exception {
        AtomicReference<JSONObject> state = new AtomicReference<>();
        AtomicReference<Throwable> failure = new AtomicReference<>();
        CountDownLatch finished = new CountDownLatch(1);
        Executor executor = (Executor) field(manager.getClass(), "j").get(manager);
        executor.execute(() -> {
            try {
                JSONObject snapshot = new JSONObject().put("phase", phase)
                        .put("idle", method(manager.getClass(), "B").invoke(manager))
                        .put("active", identity(field(manager.getClass(), "p").get(manager)))
                        .put("pending", identity(field(manager.getClass(), "q").get(manager)));
                state.set(snapshot);
                trace.add("manager_state", snapshot.toString());
            } catch (Throwable caught) { failure.set(caught); }
            finally { finished.countDown(); }
        });
        if (!finished.await(5, TimeUnit.SECONDS)) throw new IllegalStateException("Manager serialized snapshot timeout: " + phase);
        if (failure.get() != null) throw new Exception("Manager snapshot failed", failure.get());
        return state.get();
    }

    private static final class ManagerItem {
        final String name;
        final File wav;
        final Trace trace = new Trace();
        final CountDownLatch started = new CountDownLatch(1);
        final CountDownLatch terminal = new CountDownLatch(1);
        volatile int terminalCount;
        volatile String lastTerminal = "";
        volatile String terminalType = "";
        ObservedPlayer player;
        Object alert;
        Object job;
        boolean deleted;
        ManagerItem(String name, File wav) { this.name = name; this.wav = wav; }
        JSONObject snapshot() throws Exception {
            JSONObject snapshot = new JSONObject().put("name", name).put("job_identity", identity(job))
                    .put("terminal_count", terminalCount).put("terminal_result", lastTerminal)
                    .put("terminal_type", terminalType).put("starts", player == null ? 0 : player.starts)
                    .put("stops", player == null ? 0 : player.stops)
                    .put("releases", player == null ? 0 : player.releases)
                    .put("wav_deleted", deleted).put("events", trace.json());
            if (alert != null) snapshot.put("native_player_cleared", field(alert.getClass(), "a").get(alert) == null);
            if (job != null && "bmtl".equals(job.getClass().getName())) {
                snapshot.put("native_job_cancel_flag",
                        ((java.util.concurrent.atomic.AtomicBoolean) field(job.getClass(), "s").get(job)).get());
            }
            return snapshot;
        }
    }

    private static String identity(Object value) {
        return value == null ? "null" : value.getClass().getName() + "@" + Integer.toHexString(System.identityHashCode(value));
    }

    private static Field field(Class<?> type, String name) throws Exception {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                Field found = current.getDeclaredField(name);
                found.setAccessible(true);
                return found;
            } catch (NoSuchFieldException missing) { /* Continue through original app inheritance. */ }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }

    private static Method inheritedMethod(Class<?> type, String name) throws Exception {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try { return method(current, name); }
            catch (NoSuchMethodException missing) { /* Continue through original app inheritance. */ }
        }
        throw new NoSuchMethodException(type.getName() + "." + name);
    }

    private static JSONObject runCase(Instrumentation probe, String name) throws Exception {
        Trace trace = new Trace();
        JSONObject result = new JSONObject().put("case", name);
        File wav = File.createTempFile("maps-warning-probe-", ".wav", probe.getTargetContext().getCacheDir());
        ObservedPlayer[] player = new ObservedPlayer[1];
        Object[] alert = new Object[1];
        ClassLoader loader = probe.getTargetContext().getClassLoader();
        AtomicReference<Throwable> asynchronousFailure = new AtomicReference<>();
        CountDownLatch terminal = new CountDownLatch(1);
        CountDownLatch started = new CountDownLatch(1);
        try {
            writeWav(wav, name.equals("natural_completion") ? 700 : 4000);
            Class<?> alertClass = Class.forName("bmsk", true, loader);
            Class<?> loudnessClass = Class.forName("bmur", true, loader);
            Class<?> typeClass = Class.forName("bmub", true, loader);
            Class<?> callbackClass = Class.forName("bmua", true, loader);
            Object normal = enumNamed(loudnessClass, "NORMAL");
            Object local = enumNamed(typeClass, "LOCAL");
            result.put("loudness_enum", normal.toString()).put("media_type_enum", local.toString());
            Method prepare = method(alertClass, "f");
            Method play = method(alertClass, "d", callbackClass);
            Method stop = method(alertClass, "l");
            Method register = method(alertClass, "b", callbackClass);
            Field nativePlayer = alertClass.getDeclaredField("a");
            nativePlayer.setAccessible(true);
            Handler main = new Handler(Looper.getMainLooper());
            Executor executor = command -> {
                trace.add("native_executor_enqueue");
                if (!main.post(() -> {
                    try {
                        trace.add("native_executor_run");
                        command.run();
                    } catch (Throwable failure) {
                        asynchronousFailure.compareAndSet(null, failure);
                        trace.add("native_executor_exception", failure.toString());
                        terminal.countDown();
                    }
                })) throw new IllegalStateException("Main looper rejected native callback");
            };
            Object callback = Proxy.newProxyInstance(loader, new Class<?>[]{callbackClass}, (proxy, called, values) -> {
                if (called.getDeclaringClass() == Object.class) {
                    if (called.getName().equals("toString")) return "MapsVoiceProbeCallback";
                    if (called.getName().equals("hashCode")) return System.identityHashCode(proxy);
                    if (called.getName().equals("equals")) return proxy == values[0];
                }
                if (called.getName().equals("b")) {
                    trace.add("native_start_callback", "isPlaying=" + player[0].isPlaying());
                } else if (called.getName().equals("a")) {
                    trace.add("native_terminal_callback", "nativePlayerNull=" + (nativePlayer.get(alert[0]) == null));
                    terminal.countDown();
                } else {
                    throw new UnsupportedOperationException(called.toString());
                }
                return null;
            });
            Constructor<?> constructor = alertClass.getDeclaredConstructor(MediaPlayer.class,
                    loudnessClass, Executor.class, typeClass);
            constructor.setAccessible(true);
            onMain(probe, () -> {
                player[0] = new ObservedPlayer(trace, started);
                player[0].setDataSource(wav.getAbsolutePath());
                alert[0] = constructor.newInstance(player[0], normal, executor, local);
                trace.add("native_constructed");
                boolean prepared = (Boolean) prepare.invoke(alert[0]);
                trace.add("native_prepare_return", Boolean.toString(prepared));
                if (!prepared) throw new IllegalStateException("Native prepare returned false");
                if (name.equals("cancel_before_play")) {
                    register.invoke(alert[0], callback);
                    trace.add("native_cancel_call");
                    stop.invoke(alert[0]);
                    trace.add("native_cancel_return");
                } else {
                    trace.add("native_play_call");
                    play.invoke(alert[0], callback);
                    trace.add("native_play_return");
                }
            });
            if (!name.equals("cancel_before_play")) {
                if (!started.await(2, TimeUnit.SECONDS)) throw new IllegalStateException("Real MediaPlayer.start did not return");
                SystemClock.sleep(150);
                onMain(probe, () -> {
                    trace.add("playback_sample", "isPlaying=" + player[0].isPlaying()
                            + ",positionMs=" + player[0].getCurrentPosition());
                    result.put("playing_sample", player[0].isPlaying());
                    result.put("position_ms", player[0].getCurrentPosition());
                    if (name.equals("cancel_active")) {
                        trace.add("native_cancel_call");
                        stop.invoke(alert[0]);
                        trace.add("native_cancel_return");
                    }
                });
            }
            if (!terminal.await(6, TimeUnit.SECONDS)) throw new IllegalStateException("Native terminal callback timeout");
            onMain(probe, () -> {
                if (asynchronousFailure.get() != null) throw new Exception(asynchronousFailure.get());
                result.put("native_player_cleared", nativePlayer.get(alert[0]) == null);
                result.put("start_calls", player[0].starts);
                result.put("stop_calls", player[0].stops);
                result.put("release_calls", player[0].releases);
            });
            boolean expectsPlay = !name.equals("cancel_before_play");
            boolean ordering = expectsPlay
                    ? trace.before("native_start_callback", "media_start_enter")
                            && trace.before("media_start_return", "media_stop_return")
                            && trace.before("media_release_return", "native_terminal_callback")
                    : !trace.has("media_start_enter") && trace.before("media_release_return", "native_terminal_callback");
            boolean active = !expectsPlay || (result.optBoolean("playing_sample") && result.optInt("position_ms") > 0);
            boolean passed = ordering && active && result.optBoolean("native_player_cleared")
                    && player[0].stops == 1 && player[0].releases == 1
                    && player[0].starts == (expectsPlay ? 1 : 0)
                    && trace.count("native_terminal_callback") == 1;
            result.put("callback_order_observed", ordering);
            result.put("status", passed ? "observed" : "inconclusive");
        } catch (Throwable failure) {
            result.put("status", "blocked");
            result.put("exception", describe(failure));
            trace.add("case_exception", describe(failure));
        } finally {
            try {
                onMain(probe, () -> {
                    if (player[0] != null && player[0].releases == 0) {
                        trace.add("probe_cleanup_release");
                        player[0].release();
                    }
                });
            } catch (Throwable cleanupFailure) {
                result.put("cleanup_exception", describe(cleanupFailure));
            }
            result.put("wav_deleted", wav.delete());
            result.put("events", trace.json());
        }
        return result;
    }

    private static Object enumNamed(Class<?> type, String name) throws Exception {
        for (Object value : (Object[]) method(type, "values").invoke(null)) {
            if (((Enum<?>) value).name().equals(name)) return value;
        }
        throw new NoSuchFieldException(type.getName() + " enum name " + name);
    }

    private static Method method(Class<?> type, String name, Class<?>... parameters) throws Exception {
        Method method = type.getDeclaredMethod(name, parameters);
        method.setAccessible(true);
        return method;
    }

    private interface MainOperation { void run() throws Exception; }

    private static void onMain(Instrumentation probe, MainOperation operation) throws Exception {
        AtomicReference<Throwable> failure = new AtomicReference<>();
        probe.runOnMainSync(() -> {
            try { operation.run(); } catch (Throwable caught) { failure.set(caught); }
        });
        if (failure.get() != null) throw new Exception("Main-thread operation failed", failure.get());
    }

    private static String describe(Throwable failure) {
        StringBuilder message = new StringBuilder();
        for (int depth = 0; failure != null && depth < 8; depth++, failure = failure.getCause()) {
            if (depth > 0) message.append(" <- ");
            message.append(failure.getClass().getName()).append(": ").append(failure.getMessage());
        }
        return message.toString();
    }

    private static final class ObservedPlayer extends MediaPlayer {
        final Trace trace;
        final CountDownLatch started;
        int starts;
        int stops;
        int releases;
        ObservedPlayer(Trace trace, CountDownLatch started) {
            this.trace = trace;
            this.started = started;
        }
        @Override public void start() {
            trace.add("media_start_enter");
            super.start();
            starts++;
            trace.add("media_start_return", "isPlaying=" + isPlaying());
            started.countDown();
        }
        @Override public void stop() {
            trace.add("media_stop_enter");
            super.stop();
            stops++;
            trace.add("media_stop_return");
        }
        @Override public void release() {
            trace.add("media_release_enter");
            super.release();
            releases++;
            trace.add("media_release_return");
        }
    }

    private static final class Trace {
        final long origin = SystemClock.elapsedRealtimeNanos();
        final List<JSONObject> events = new ArrayList<>();
        synchronized void add(String event) { add(event, ""); }
        synchronized void add(String event, String detail) {
            try {
                long at = SystemClock.elapsedRealtimeNanos();
                events.add(new JSONObject().put("event", event).put("detail", detail)
                        .put("elapsed_ns", at - origin).put("elapsed_realtime_ns", at)
                        .put("thread", Thread.currentThread().getName()));
            } catch (Exception impossible) { throw new IllegalStateException(impossible); }
        }
        synchronized int count(String name) {
            int count = 0;
            for (JSONObject event : events) if (name.equals(event.optString("event"))) count++;
            return count;
        }
        synchronized boolean has(String name) { return count(name) > 0; }
        synchronized boolean before(String first, String second) {
            int left = -1;
            for (int i = 0; i < events.size(); i++) {
                String name = events.get(i).optString("event");
                if (left < 0 && first.equals(name)) left = i;
                if (second.equals(name)) return left >= 0 && left < i;
            }
            return false;
        }
        synchronized JSONArray json() { return new JSONArray(events); }
        synchronized long between(String first,String second) {
            long start=-1;
            for(JSONObject event:events){if(start<0&&first.equals(event.optString("event")))start=event.optLong("elapsed_realtime_ns");if(second.equals(event.optString("event")))return start<0?-1:event.optLong("elapsed_realtime_ns")-start;}
            return -1;
        }
    }

    private static void writeWav(File file, int durationMs) throws Exception {
        int rate = 16000;
        int samples = rate * durationMs / 1000;
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(new byte[]{'R', 'I', 'F', 'F'});
            little(out, 36 + samples * 2, 4);
            out.write(new byte[]{'W', 'A', 'V', 'E', 'f', 'm', 't', ' '});
            little(out, 16, 4); little(out, 1, 2); little(out, 1, 2);
            little(out, rate, 4); little(out, rate * 2, 4);
            little(out, 2, 2); little(out, 16, 2);
            out.write(new byte[]{'d', 'a', 't', 'a'});
            little(out, samples * 2, 4);
            for (int i = 0; i < samples; i++) {
                little(out, (int) (Math.sin(2 * Math.PI * 440 * i / rate) * 1400), 2);
            }
        }
    }

    private static void little(FileOutputStream out, int value, int bytes) throws Exception {
        for (int i = 0; i < bytes; i++) out.write((value >>> (8 * i)) & 255);
    }
}
