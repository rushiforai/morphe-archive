package nl.johninnl.warningprobe;

import android.app.Instrumentation;
import android.content.Context;
import android.media.AudioTrack;
import android.os.*;
import android.speech.tts.*;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicReference;
import org.json.*;

/** PRIVATE same-signer instrumentation for the ACTUAL patched Vela adapter.
 * Build into the probe APK only; never inject this class into the app extension.
 * Invoke reflectively for adapter_system, adapter_neural or adapter_all.
 * Runs only disposable owned guides/sessions, synthetic text/geometry and in-memory grants.
 * No public road reports, device location injection, volume or settings writes.
 */
public final class VelaAdapterProbe {
    private static final String PREFIX="nl.johninnl.navigation.alerts.";
    private final Instrumentation instrumentation;
    private final Context context;
    private final ClassLoader loader;
    private final List<JSONObject> events=Collections.synchronizedList(new ArrayList<>());
    private final List<String> nativeTexts=Collections.synchronizedList(new ArrayList<>());
    private final ConcurrentMap<String,Set<String>> ttsCallbacks=new ConcurrentHashMap<>();
    private Object guide,adapter,ownedSession,backend,previousGuide,previousSession;
    private Class<?> adapterClass,eventClass,grantClass,listenerClass,modeClass;
    private TextToSpeech engine;
    private UtteranceProgressListener originalListener;
    private boolean wrapperInstalled;
    private long timeout=25000;

    private VelaAdapterProbe(Instrumentation probe){instrumentation=probe;context=probe.getTargetContext();loader=context.getClassLoader();}
    public static JSONObject run(Instrumentation probe,Bundle args)throws Exception{return new VelaAdapterProbe(probe).execute(args==null?new Bundle():args);}

    private JSONObject execute(Bundle args)throws Exception {
        JSONObject report=new JSONObject();JSONArray cases=new JSONArray();String scenario=args.getString("scenario","adapter_all");
        report.put("cases",cases).put("target_package",context.getPackageName()).put("target_apk",context.getApplicationInfo().sourceDir)
                .put("original_reference_sha256","f168bc730568b98ee8132131658d9220ef5be3557af41fd373bdaf104c31b20f")
                .put("scope","Actual patched adapter/native engine API evidence, owned synthetic fixtures; no acoustic or car-routing proof")
                .put("grants_isolated_memory",true).put("global_volume_settings_or_location_modified",false)
                .put("listener_probe_scope","Owned system guide only: wrapper forwards every callback to the SAME installed original vy4 object; normal production listener setup remains unchanged");
        try {
            require("app.vela".equals(context.getPackageName()),"Expected app.vela");
            require(Looper.myLooper()!=Looper.getMainLooper(),"Invoke on instrumentation worker");
            require(Arrays.asList("adapter_all","adapter_system","adapter_neural","adapter_tone").contains(scenario),"Unknown adapter scenario");
            timeout=Math.max(1000,Math.min(45000,args.getLong("case_timeout_ms",25000)));
            setup();
            if(scenario.equals("adapter_all")||scenario.equals("adapter_system")) {
                prepareSystem();
                cases.put(runOutput("system_baseline","Synthetic adapter test. The selected native system voice should complete this test.","en-US",false,false));
                cases.put(runOutput("system_cancel_pending","Synthetic adapter test. Pending output must be fenced before native speech starts.","en-US",true,false));
                cases.put(runOutput("system_cancel_active","Synthetic adapter cancellation test. This deliberately long synthetic phrase lets the probe cancel the active selected system voice and observe its actual terminal callback.","en-US",false,true));
                cases.put(regenerate(false));cases.put(regenerate(true));
            }
            if(scenario.equals("adapter_all")||scenario.equals("adapter_neural")) {
                String language=prepareNeural();
                String text=language.startsWith("nl")?"Synthetische adaptertest. De geselecteerde Vela stem spreekt deze test uit.":"Synthetic adapter test. The selected Vela voice should complete this test.";
                require(language.startsWith("en")||language.startsWith("nl"),"No audited synthetic text fixture for selected neural language "+language);
                cases.put(runOutput("neural_baseline",text,language,false,false));
                cases.put(runOutput("neural_cancel_pending",text,language,true,false));
                String longText=language.startsWith("nl")?"Synthetische annuleringstest. Dit is een langere testzin zodat de actieve geselecteerde Vela stem kan worden gestopt voordat de testzin is afgelopen.":"Synthetic cancellation test. This longer test sentence lets the selected Vela voice begin playback before the probe cancels only its retained output track.";
                cases.put(runOutput("neural_cancel_active",longText,language,false,true));
            }
            if(scenario.equals("adapter_tone")||scenario.equals("adapter_all"))runTones(cases);
            report.put("scenario",scenario).put("probe_status","passed");
        } catch(Throwable failure) {
            report.put("probe_status",failure instanceof MissingModel?"inconclusive":"failed").put("error",android.util.Log.getStackTraceString(unwrap(failure)));
        } finally {
            try{cleanup();}catch(Throwable failure){report.put("probe_status","failed").put("cleanup_error",android.util.Log.getStackTraceString(unwrap(failure)));}
            synchronized(events){report.put("events",new JSONArray(events));}
            report.put("native_prompt_requests",new JSONArray(nativeTexts));
        }
        return report;
    }
    private void setup()throws Exception {
        adapterClass=type("nl.johninnl.vela.VelaWarningSpeaker");eventClass=type(PREFIX+"WarningEvent");grantClass=type(PREFIX+"PlaybackGrant");listenerClass=type("nl.johninnl.vela.VelaWarningSpeaker$Listener");modeClass=type(PREFIX+"WarningAudioOwner$Mode");
        Class<?> runtime=type("nl.johninnl.vela.TelemetryRuntime");
        previousGuide=optionalStatic(runtime,"voice");previousSession=optionalStatic(runtime,"navSession");
        if(previousSession!=null){Object state=call(read(previousSession,"f"),"getValue");require(!(Boolean)read(state,"a"),"Refuse to probe during an active native route");}
        main(()->{
            guide=type("wy4").getConstructor(Context.class).newInstance(context);
            adapter=adapterClass.getConstructor().newInstance();call(adapter,"bind",new Class<?>[]{Object.class},guide);
            // The pinned R8 recorder field is a concrete merged callback class. Leave it intact.
        });
        event("owned_setup",new JSONObject().put("adapter_loader_is_target",adapterClass.getClassLoader()==loader));
    }
    private void prepareSystem()throws Exception {
        main(()->{call(guide,"d",new Class<?>[]{String.class},(Object)null);engine=(TextToSpeech)read(guide,"b");require(engine!=null,"Native system engine missing");
            for(Field field:TextToSpeech.class.getDeclaredFields())if(UtteranceProgressListener.class.isAssignableFrom(field.getType())){field.setAccessible(true);Object value=field.get(engine);if(value!=null){originalListener=(UtteranceProgressListener)value;break;}}
            require(originalListener!=null && originalListener.getClass().getName().equals("vy4"),"Cannot observe actual installed native listener; do not reconstruct/replace it silently");
            require(engine.setOnUtteranceProgressListener(new Forwarder())==TextToSpeech.SUCCESS,"Cannot attach owned observer");wrapperInstalled=true;
        });
        await(()->(Boolean)call(adapter,"isReady",new Class<?>[]{String.class},"en-US"),timeout,"Actual selected system engine readiness");
        event("system_ready",new JSONObject().put("engine",engine.getDefaultEngine()).put("original_listener",originalListener.getClass().getName()));
    }
    private String prepareNeural()throws Exception {
        final Object[] selected=new Object[1];
        main(()->{
            Object application=context.getApplicationContext();Object component=call(read(application,"g"),"b");Object calibration=call(read(component,"f"),"get");
            backend=type("y43").getConstructor(Context.class,type("pt")).newInstance(context,calibration);set(guide,"l",backend);
            call(guide,"d",new Class<?>[]{String.class},"vela.piper");selected[0]=backend;
        });
        try{await(()->read(backend,"d")!=null && !(Boolean)read(backend,"f"),timeout,"Selected installed neural model");}
        catch(Exception unavailable){throw new MissingModel("A real installed selected Vela neural model is required; no fake model or synthesized callback substitutes for this gate",unavailable);}
        String language=(String)call(backend,"b");require(language!=null&&!language.isEmpty(),"Loaded model language missing");
        await(()->(Boolean)call(adapter,"isReady",new Class<?>[]{String.class},language),timeout,"Neural adapter readiness");
        event("neural_ready",new JSONObject().put("model_id",read(backend,"h")).put("language",language).put("speaker",call(backend,"g")).put("worker",read(backend,"c").getClass().getName()));
        return language;
    }
    private JSONObject runOutput(String name,String text,String language,boolean cancelPending,boolean cancelActive)throws Exception {
        return runOutput(name,text,language,cancelPending,cancelActive,"VOICE");
    }
    private JSONObject runOutput(String name,String text,String language,boolean cancelPending,boolean cancelActive,String outputMode)throws Exception {
        Object mode=enumValue(modeClass,outputMode);
        await(()->(Boolean)call(adapter,"isReady",new Class<?>[]{String.class,modeClass},language,mode),timeout,"Idle before "+name);
        Attempt test=new Attempt(name,text,language,outputMode);Object nativeTrackBefore=backend==null?null:read(backend,"e");
        main(()->{
            test.accepted=(Boolean)call(adapter,"speak",new Class<?>[]{eventClass,grantClass,listenerClass},test.event,test.grant,test.listener);
            if(cancelPending){call(adapter,"cancel",new Class<?>[]{grantClass},test.grant);test.cancelAt=SystemClock.elapsedRealtime();}
        });
        require(test.accepted,"Adapter rejected "+name);
        if(cancelActive){await(()->test.started,timeout,"Actual STARTED for "+name);require(!test.quiet,"Output finished before active cancellation could run");
            main(()->{test.track=ownedTrack();call(adapter,"cancel",new Class<?>[]{grantClass},test.grant);test.cancelAt=SystemClock.elapsedRealtime();});}
        await(()->{test.sampleTrack();return test.quiet;},timeout,"Actual quiescent terminal for "+name);
        if(cancelPending){SystemClock.sleep(800);require(!test.started,"Pending cancellation produced STARTED");}
        else if(!cancelActive){require(test.started,"Baseline never observed STARTED");require("COMPLETED".equals(test.terminal),"Baseline ended "+test.terminal);}
        if(cancelActive||cancelPending)require("CANCELLED".equals(test.terminal),"Cancellation ended "+test.terminal);
        await(()->((Number)read(guide,"s")).intValue()==0,3000,"Native focus count balanced after "+name);
        if(engine!=null)await(()->!engine.isSpeaking(),3000,"System engine quiet after "+name);
        if(backend!=null)require(read(backend,"e")==nativeTrackBefore,"External adapter replaced the application's neural player");
        JSONObject result=test.json();event("case_passed",result);return result;
    }
    private void runTones(JSONArray cases)throws Exception {
        if(read(guide,"b")!=null || read(guide,"l")!=null) {
            Object oldGuide=guide,oldAdapter=adapter;
            main(()->{
                call(oldAdapter,"close");call(oldGuide,"n");((Handler)read(oldGuide,"u")).removeCallbacksAndMessages(null);
                if(engine!=null){if(wrapperInstalled)engine.setOnUtteranceProgressListener(originalListener);engine.shutdown();engine=null;wrapperInstalled=false;originalListener=null;}
                guide=type("wy4").getConstructor(Context.class).newInstance(context);adapter=adapterClass.getConstructor().newInstance();call(adapter,"bind",new Class<?>[]{Object.class},guide);
            });
            ((ExecutorService)read(oldAdapter,"tones")).shutdownNow();
        }
        Object tone=enumValue(modeClass,"TONE"),voice=enumValue(modeClass,"VOICE"),silent=enumValue(modeClass,"SILENT");
        require(read(guide,"b")==null && read(guide,"l")==null && !(Boolean)read(guide,"e") && !(Boolean)read(guide,"h"),"Tone-only probe unexpectedly initialized a speech engine");
        require(!(Boolean)call(adapter,"isReady",new Class<?>[]{String.class},"en-US"),"Tone-only probe has no speech readiness");
        require((Boolean)call(adapter,"isReady",new Class<?>[]{String.class,modeClass},"und",tone),"Tone must not depend on a known speech language");
        cases.put(new JSONObject().put("name","tone_without_tts").put("system_engine_absent",true).put("neural_engine_absent",true).put("speech_initialized",false).put("tone_ready",true));
        main(()->{set(guide,"o",true);call(guide,"i",new Class<?>[]{boolean.class},true);});
        require(call(adapter,"effectiveMode",new Class<?>[]{modeClass},voice)==tone,"Alerts-only must cap Voice to Tone");
        cases.put(runOutput("tone_baseline","Synthetic tone baseline","en",false,false,"TONE"));
        cases.put(runOutput("tone_cancel_pending","Synthetic pending tone cancellation","en",true,false,"TONE"));
        cases.put(runOutput("tone_cancel_active","Synthetic active tone cancellation","en",false,true,"TONE"));
        main(()->set(guide,"o",false));
        require(call(adapter,"effectiveMode",new Class<?>[]{modeClass},voice)==silent && call(adapter,"effectiveMode",new Class<?>[]{modeClass},tone)==silent,"Verified full mute must cap external audio to Silent");
        Attempt muted=new Attempt("tone_native_mute_caps","Synthetic muted tone","en","TONE");
        main(()->muted.accepted=(Boolean)call(adapter,"speak",new Class<?>[]{eventClass,grantClass,listenerClass},muted.event,muted.grant,muted.listener));
        require(!muted.accepted,"Fully muted native guide accepted external tone");SystemClock.sleep(300);require(!muted.started && read(adapter,"active")==null,"Muted tone created output");
        main(()->call(guide,"i",new Class<?>[]{boolean.class},false));
        require(call(adapter,"effectiveMode",new Class<?>[]{modeClass},voice)==voice,"Voice-on cap must preserve Voice intent");
        cases.put(new JSONObject().put("name","tone_native_mute_caps").put("alerts_only_voice_cap","TONE").put("fully_muted_cap","SILENT").put("fully_muted_rejected",true).put("fully_muted_started",false).put("voice_on_cap","VOICE"));
        await(()->((Number)read(guide,"s")).intValue()==0 && !(Boolean)read(guide,"t"),3000,"Native tone focus abandonment");
        require(read(guide,"b")==null && read(guide,"l")==null && !(Boolean)read(guide,"e") && !(Boolean)read(guide,"h"),"Tone initialized a speech backend");
        cases.put(new JSONObject().put("name","tone_focus_balance").put("native_count",read(guide,"s")).put("native_focus_held",read(guide,"t")).put("speech_engine_still_absent",true));
    }
    private JSONObject regenerate(boolean passedTurn)throws Exception {
        String name=passedTurn?"system_regenerate_after_passage":"system_regenerate_current_step";
        Object route=fixtureRoute();Object navState=navState(1,new HashSet<>(Arrays.asList(0,1,2)),200d);
        ownedSession=session(route,navState);main(()->call(adapter,"bindSession",new Class<?>[]{Object.class},ownedSession));
        Attempt test=new Attempt(name,"Synthetic regeneration test. This long adapter phrase will be interrupted before a fresh native route update.","en-US");
        main(()->{test.accepted=(Boolean)call(adapter,"speak",new Class<?>[]{eventClass,grantClass,listenerClass},test.event,test.grant,test.listener);});
        require(test.accepted,"Regeneration warning rejected");await(()->test.started,timeout,"Regeneration warning start");
        String held="Synthetic held stale turn. This exact old sentence must never be replayed.";
        main(()->{call(guide,"j",new Class<?>[]{String.class,boolean.class,boolean.class},held,false,false);call(adapter,"cancel",new Class<?>[]{grantClass},test.grant);});
        await(()->test.quiet,timeout,"Regeneration cancellation terminal");require("CANCELLED".equals(test.terminal),"Regeneration warning was not cancelled");
        Object fresh=point(passedTurn?.0020d:0d,passedTurn?.0030d:.0020d);
        main(()->call(ownedSession,"h",new Class<?>[]{type("app.vela.core.model.LatLng"),boolean.class,Double.class,Double.class,Double.class},fresh,false,10d,3d,passedTurn?0d:90d));
        Object state=call(read(ownedSession,"f"),"getValue"),current=read(state,"e");
        List<String> generated=oraclePrompts(route,current,fresh,passedTurn?0d:90d);
        require(!generated.isEmpty(),"Native current-fix generator returned no speech oracle");
        String regenerated=generated.get(0);String expected=passedTurn?"synthetic right":"synthetic left";
        require(regenerated.toLowerCase(Locale.ROOT).contains(expected),"Wrong current-route prompt: "+regenerated);
        String nativeId="vela-"+regenerated.hashCode();await(()->ttsHas(nativeId,"start"),timeout,"Actual regenerated native TTS start");await(()->ttsHas(nativeId,"done"),timeout,"Actual regenerated native TTS completion");
        require(!ttsHas("vela-"+held.hashCode(),"start"),"Held stale sentence was played");
        JSONObject result=new JSONObject().put("name",name).put("synthetic_route",true).put("original_nav_session_used",true)
                .put("fresh_fix_only_native_session_call",true).put("regenerated_text",regenerated).put("native_tts_id",nativeId)
                .put("step_index",read(current,"a")).put("travelled_m",read(current,"i")).put("held_text_started",false);
        event("case_passed",result);return result;
    }
    private List<String> oraclePrompts(Object route,Object current,Object fix,Double bearing)throws Exception {
        Object copy=constructor(type("yo2"),14).newInstance(read(current,"a"),read(current,"b"),read(current,"c"),read(current,"d"),read(current,"e"),read(current,"f"),read(current,"g"),Collections.emptySet(),read(current,"i"),read(current,"j"),read(current,"k"),read(current,"l"),read(current,"m"),read(current,"n"));
        Class<?> mode=type("app.vela.core.model.TravelMode");double corridor=((Number)callStatic(type("rj2"),"L",new Class<?>[]{mode,Double.class},enumValue(mode,"DRIVE"),3d)).doubleValue();
        Object pair=callStatic(type("rj2"),"j0",new Class<?>[]{type("app.vela.core.model.Route"),type("yo2"),type("app.vela.core.model.LatLng"),boolean.class,Double.class,double.class,double.class,double.class,Double.class,type("y74")},route,copy,fix,false,10d,2d,corridor,Math.min(110d,2*corridor),bearing,null);
        List<String> lines=new ArrayList<>();for(Object event:(List<?>)read(pair,"g"))if(event.getClass()==type("ul2"))lines.add((String)read(event,"a"));
        return lines;
    }
    private Object fixtureRoute()throws Exception {
        Object p0=point(0,0),p1=point(0,.003),p2=point(.003,.003),p3=point(.003,.006);
        List<Object> maneuvers=Arrays.asList(maneuver("DEPART","Synthetic start road",p0,333d),maneuver("TURN_LEFT","Turn left onto Synthetic Left Road",p1,333d),maneuver("TURN_RIGHT","Turn right onto Synthetic Right Road",p2,333d),maneuver("ARRIVE","Synthetic destination",p3,0d));
        Object leg=type("app.vela.core.model.RouteLeg").getConstructor(double.class,double.class,Double.class,List.class).newInstance(999d,90d,null,maneuvers);
        Constructor<?> ctor=constructor(type("app.vela.core.model.Route"),21);
        return ctor.newInstance(Arrays.asList(p0,p1,p2,p3),Collections.singletonList(leg),999d,90d,null,"Synthetic probe route",Collections.emptyList(),null,null,false,false,false,true,Collections.emptyList(),null,enumValue(type("app.vela.core.model.RouteSource"),"UNKNOWN"),Collections.emptyMap(),null,"",false,Collections.emptyList());
    }
    private Object maneuver(String kind,String text,Object location,double distance)throws Exception {
        return constructor(type("app.vela.core.model.Maneuver"),15).newInstance(enumValue(type("app.vela.core.model.ManeuverType"),kind),text,location,distance,30d,null,null,null,null,Collections.emptyList(),null,null,Collections.emptyList(),text,Collections.emptyList());
    }
    private Object point(double lat,double lon)throws Exception{return type("app.vela.core.model.LatLng").getConstructor(double.class,double.class).newInstance(lat,lon);}
    private Object navState(int step,Set<Integer> spoken,double travelled)throws Exception{return constructor(type("yo2"),14).newInstance(step,133d,799d,70d,false,0,false,spoken,travelled,0,3,false,-1d,-1);}
    private Object session(Object route,Object nav)throws Exception {
        Class<?> data=type("sz1");require(data.isInterface(),"Native data-source interface changed");
        Object noNetwork=Proxy.newProxyInstance(loader,new Class<?>[]{data},(p,m,a)->{if(m.getDeclaringClass()==Object.class)return objectResult(p,m,a);throw new UnsupportedOperationException("Synthetic probe prohibits network data source calls");});
        Object haptics=type("z81").getConstructor(Context.class).newInstance(context),diag=read(context.getApplicationContext(),"h");
        Object value=constructor(type("xo2"),4).newInstance(noNetwork,guide,haptics,diag);set(value,"E",true);set(value,"F",true);set(value,"G",false);
        Object state=constructor(type("no2"),15).newInstance(true,false,false,route,nav,"Synthetic initial state",799d,70d,null,0d,"Synthetic destination","",999d,0d,null);
        call(read(value,"e"),"j",new Class<?>[]{Object.class},state);return value;
    }
    private final class Attempt {
        final String name;final Object event,grant,listener;final List<JSONObject> callbacks=Collections.synchronizedList(new ArrayList<>());
        volatile boolean accepted,started,quiet;volatile String terminal;volatile long cancelAt;volatile long maximumHead;volatile AudioTrack track;
        Attempt(String name,String text,String language)throws Exception {this(name,text,language,"VOICE");}
        Attempt(String name,String text,String language,String outputMode)throws Exception {
            this.name=name;long now=SystemClock.elapsedRealtime();String session=UUID.randomUUID().toString();Bundle fields=new Bundle();
            fields.putInt("protocol_version",1);fields.putString("provider_session",session);fields.putLong("sequence",1);fields.putString("operation","ANNOUNCE");fields.putString("warning_id",UUID.randomUUID().toString());fields.putLong("revision",1);fields.putLong("announcement_index",1);fields.putString("phase","notice");fields.putString("native_type","SYNTHETIC_TEST");fields.putString("category","test");fields.putInt("priority",1);fields.putString("message",text);fields.putString("language_tag",language);fields.putString("message_origin","native_text");fields.putString("relevance","notice");fields.putString("relationship","unknown");fields.putLong("observed_elapsed_ms",now);fields.putLong("issued_elapsed_ms",now);fields.putLong("announce_until_elapsed_ms",now+10000);fields.putLong("state_until_elapsed_ms",now+30000);
            event=type(PREFIX+"WarningCodec").getMethod("decode",Bundle.class,long.class).invoke(null,fields,now);grant=grant(event,session,fields.getString("warning_id"),now,outputMode);
            listener=Proxy.newProxyInstance(loader,new Class<?>[]{listenerClass},(p,m,a)->{
                if(m.getName().equals("started")){started=true;track=ownedTrack();sampleTrack();callback("STARTED",false);}
                else if(m.getName().equals("finished")){String outcome=String.valueOf(a[1]);boolean done=(Boolean)a[2];callback(outcome,done);if(done){terminal=outcome;quiet=true;}}
                return objectResult(p,m,a);
            });
        }
        void callback(String state,boolean quiescent)throws Exception{JSONObject row=new JSONObject().put("at_ms",SystemClock.elapsedRealtime()).put("state",state).put("quiescent",quiescent);callbacks.add(row);event("adapter_callback",new JSONObject().put("case",name).put("callback",row));}
        void sampleTrack(){try{if(track==null)track=ownedTrack();AudioTrack t=track;if(t!=null)maximumHead=Math.max(maximumHead,Integer.toUnsignedLong(t.getPlaybackHeadPosition()));}catch(RuntimeException ignored){}}
        JSONObject json()throws Exception{return new JSONObject().put("name",name).put("accepted",accepted).put("started",started).put("terminal",terminal).put("quiescent",quiet).put("cancel_at_ms",cancelAt).put("maximum_observed_head",maximumHead).put("callbacks",new JSONArray(callbacks));}
    }
    private Object grant(Object event,String session,String warning,long now,String outputMode)throws Exception {
        Set<String> caps=Collections.singleton("native_text");String digest=String.join("",Collections.nCopies(64,"a"));Class<?> capabilities=type(PREFIX+"WarningCapabilities"),journalClass=type(PREFIX+"WarningJournal"),store=type(PREFIX+"PlaybackStore"),owner=type(PREFIX+"WarningAudioOwner"),client=type(PREFIX+"WarningAudioOwner$Client");
        Object profile=capabilities.getConstructor(String.class,Set.class,boolean.class).newInstance(digest,caps,true),journal=journalClass.getConstructor(String.class).newInstance(session);call(journal,"append",new Class<?>[]{eventClass,long.class},event,now);
        Object memory=Proxy.newProxyInstance(loader,new Class<?>[]{store},(p,m,a)->objectResult(p,m,a));Object source=owner.getConstructor(String.class,String.class,journalClass,store,capabilities).newInstance("boot-count:1",session,journal,memory,profile);
        Object mode=enumValue(modeClass,outputMode),registration=client.getConstructor(int.class,String.class,String.class,String.class,Set.class,Set.class,String.class).newInstance(android.os.Process.myUid(),"app.vela",UUID.randomUUID().toString(),UUID.randomUUID().toString(),caps,Collections.singleton(mode),read(profile,"digest"));
        Object claim=call(source,"claim",new Class<?>[]{int.class,client,modeClass,boolean.class,long.class},android.os.Process.myUid(),registration,mode,true,now),lease=read(claim,"lease");require(lease!=null,"Isolated source claim failed");
        Class<?> phase=type(PREFIX+"WarningEvent$Phase");Object result=call(source,"begin",new Class<?>[]{int.class,client,String.class,long.class,String.class,phase,long.class,long.class,String.class,long.class},android.os.Process.myUid(),registration,read(lease,"token"),read(lease,"epoch"),warning,enumValue(phase,"NOTICE"),1L,1L,UUID.randomUUID().toString(),now);
        Object grant=read(result,"grant");require(grant!=null,"Isolated source grant failed");return grant;
    }
    private final class Forwarder extends UtteranceProgressListener {
        private void observed(String id,String state){if(id!=null)ttsCallbacks.computeIfAbsent(id,k->Collections.newSetFromMap(new ConcurrentHashMap<>())).add(state);try{event("tts_"+state,new JSONObject().put("id",id));}catch(Exception ignored){}}
        @Override public void onStart(String id){observed(id,"start");originalListener.onStart(id);}
        @Override public void onDone(String id){observed(id,"done");originalListener.onDone(id);}
        @Override public void onError(String id){observed(id,"error");originalListener.onError(id);}
        @Override public void onError(String id,int code){observed(id,"error");originalListener.onError(id,code);}
        @Override public void onStop(String id,boolean interrupted){observed(id,"stop");originalListener.onStop(id,interrupted);}
    }
    private void cleanup()throws Exception {
        main(()->{
            if(adapter!=null)call(adapter,"close");
            if(guide!=null){call(guide,"n");((Handler)read(guide,"u")).removeCallbacksAndMessages(null);}
            if(engine!=null){if(wrapperInstalled)engine.setOnUtteranceProgressListener(originalListener);engine.shutdown();}
            Class<?> runtime=type("nl.johninnl.vela.TelemetryRuntime");callStatic(runtime,"bindVoice",new Class<?>[]{Object.class},previousGuide);callStatic(runtime,"bindNavSession",new Class<?>[]{Object.class},previousSession);
        });
        if(adapter!=null)((ExecutorService)read(adapter,"tones")).shutdownNow();
        if(backend!=null){ExecutorService synth=(ExecutorService)read(backend,"c"),players=(ExecutorService)read(backend,"m");synth.shutdownNow();players.shutdownNow();require(synth.awaitTermination(10,TimeUnit.SECONDS)&&players.awaitTermination(10,TimeUnit.SECONDS),"Owned neural workers did not stop; model cannot be safely released");Object model=read(backend,"d");if(model!=null)call(model,"release");}
    }
    private AudioTrack ownedTrack(){try{Object active=read(adapter,"active");return active==null?null:(AudioTrack)read(active,"ownedTrack");}catch(Exception ignored){return null;}}
    private boolean ttsHas(String id,String state){Set<String> phases=ttsCallbacks.get(id);return phases!=null&&phases.contains(state);}
    private void event(String name,JSONObject fields)throws Exception{JSONObject row=fields==null?new JSONObject():new JSONObject(fields.toString());row.put("event",name).put("at_ms",SystemClock.elapsedRealtime());events.add(row);}
    private Class<?> type(String name)throws ClassNotFoundException{return Class.forName(name,true,loader);}
    private static Object enumValue(Class<?> type,String value){return Enum.valueOf((Class)type,value);}
    private static Constructor<?> constructor(Class<?> type,int count){for(Constructor<?> c:type.getDeclaredConstructors())if(c.getParameterTypes().length==count){c.setAccessible(true);return c;}throw new IllegalArgumentException("Native constructor "+type+" / "+count);}
    private static Object objectResult(Object proxy,Method method,Object[] args){if(method.getName().equals("toString"))return "SyntheticVelaProbe";if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);if(method.getName().equals("equals"))return args!=null&&args.length==1&&proxy==args[0];return null;}
    private static Field field(Object target,String name)throws Exception{Class<?> c=target instanceof Class?(Class<?>)target:target.getClass();Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}
    private static Object read(Object target,String name)throws Exception{return field(target,name).get(target);}
    private static void set(Object target,String name,Object value)throws Exception{field(target,name).set(target,value);}
    private static Object optionalStatic(Class<?> type,String name){try{return field(type,name).get(null);}catch(Exception ignored){return null;}}
    private static Object call(Object target,String name)throws Exception{return call(target,name,new Class<?>[0]);}
    private static Object call(Object target,String name,Class<?>[] signature,Object... args)throws Exception{Method m;try{m=target.getClass().getMethod(name,signature);}catch(NoSuchMethodException missing){m=target.getClass().getDeclaredMethod(name,signature);}m.setAccessible(true);return m.invoke(target,args);}
    private static Object callStatic(Class<?> type,String name,Class<?>[] signature,Object... args)throws Exception{Method m=type.getDeclaredMethod(name,signature);m.setAccessible(true);return m.invoke(null,args);}
    private interface Action{void run()throws Exception;}private interface Check{boolean ready()throws Exception;}
    private void main(Action action)throws Exception{AtomicReference<Throwable> failure=new AtomicReference<>();instrumentation.runOnMainSync(()->{try{action.run();}catch(Throwable error){failure.set(error);}});if(failure.get()!=null)throw new Exception(unwrap(failure.get()));}
    private static void await(Check test,long limit,String name)throws Exception{long until=SystemClock.elapsedRealtime()+limit;while(SystemClock.elapsedRealtime()<until){if(test.ready())return;SystemClock.sleep(10);}throw new IllegalStateException("Timed out: "+name);}
    private static void require(boolean condition,String message){if(!condition)throw new IllegalStateException(message);}
    private static Throwable unwrap(Throwable value){while(value instanceof InvocationTargetException&&((InvocationTargetException)value).getCause()!=null)value=((InvocationTargetException)value).getCause();return value;}
    private static final class MissingModel extends Exception{MissingModel(String message,Throwable cause){super(message,cause);}}
}
