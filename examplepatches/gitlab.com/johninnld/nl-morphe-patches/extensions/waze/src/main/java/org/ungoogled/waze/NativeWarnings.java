package org.ungoogled.waze;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.Consumer;
import nl.johninnl.navigation.alerts.WarningCapabilities;
import nl.johninnl.navigation.alerts.WarningEndpoint;
import nl.johninnl.navigation.alerts.WazeWarningTypes;
import nl.johninnl.navigation.startup.ProviderAudio;
import nl.johninnl.navigation.startup.StartupProtocol;

/** Native Waze decisions into the SAME protocol/journal/owner used by FM. No audio/UI actions. */
public final class NativeWarnings {
    private NativeWarnings(){}
    private static final int MAX_WARNINGS=128;
    private static final java.util.Set<String> tileIds=new java.util.HashSet<>();
    private static long tileRevision,tilePublishedAt=-10000,tileEpoch;
    private static final Map<String,Record> records=new LinkedHashMap<>();
    // Current native repository models outlive the bounded display-state cache. A later
    // genuine sound decision can therefore keep its identity without replaying stale speech.
    private static final Map<String,Object> nativeModels=new LinkedHashMap<>();
    private static final Map<String,Long> nativeObservedAt=new LinkedHashMap<>();
    private static final Map<String,String> nativeLinks=new LinkedHashMap<>();
    private static final Set<String> segments=new HashSet<>(),notifications=new HashSet<>();
    private static final Map<Object,ZoneDecision> zones=new WeakHashMap<>();
    private static final ThreadLocal<Object> presentation=new ThreadLocal<>();
    private static Handler retirementMain;
    private static synchronized Handler retirementHandler(){if(retirementMain==null)retirementMain=new Handler(Looper.getMainLooper());return retirementMain;}
    private static final Map<String,Object> retiredZoneRequests=new LinkedHashMap<>();
    private static final Map<Object,Boolean> carSurfaces=new WeakHashMap<>();
    private static Consumer<Object> testRetire;
    public static synchronized void carUiStarted(Object service){carSurfaces.put(service,true);}
    public static synchronized void carUiStopped(Object service){carSurfaces.remove(service);reconcileZoneQueue();}
    public static void reconcileZoneQueue(){Handler main=retirementHandler();main.removeCallbacks(retireZones);main.post(retireZones);}
    private static final Runnable retireZones=NativeWarnings::retireZonesNow;
    private static void retireZonesNow(){capture(()->{
        // Run on the same main looper as Activity/CarAppService lifecycle callbacks.
        if(!managed()||Customization.activityVisible()||!carSurfaces.isEmpty())return;
        for(Map.Entry<String,Object> request:new ArrayList<>(retiredZoneRequests.entrySet())){
            Object model=nativeModels.get(request.getKey());
            if(model!=null){Bundle current=WazeWarningModels.descriptor(app,model);
                if(!"LeftZone".equals(current.getString("native_zone_state"))){retiredZoneRequests.remove(request.getKey());continue;}}
            if(testSink!=null){if(testRetire!=null)testRetire.accept(request.getValue());}
            else try{
                Class<?> type=Class.forName("com.waze.alerters.a.i");
                Object queue=Class.forName("kotlinx.coroutines.a.ab").getMethod("l",Class.class).invoke(null,type);
                if(!queue.getClass().getName().equals("com.waze.alerters.a.aa"))throw new IllegalStateException("WAZE_ZONE_QUEUE_ABI");
                WazeWarningModels.call(queue,"b",request.getValue());
            }catch(ReflectiveOperationException unavailable){throw new IllegalStateException("WAZE_ZONE_QUEUE_ABI",unavailable);}
            retiredZoneRequests.remove(request.getKey());
        }
    });}
    private static void retireZone(String id,Object controller){
        if(retiredZoneRequests.size()>=MAX_WARNINGS&&!retiredZoneRequests.containsKey(id))throw new IllegalArgumentException("ZONE_RETIREMENT_BOUND");
        retiredZoneRequests.put(id,WazeWarningModels.call(controller,"a"));reconcileZoneQueue();
    }
    private static void retireTrackedZone(String id){
        for(Map.Entry<Object,ZoneDecision> entry:new ArrayList<>(zones.entrySet())){Object controller=entry.getKey();if(controller!=null&&entry.getValue().id.equals(id))retireZone(id,controller);}
    }
    private static Context app;
    private static WarningEndpoint endpoint;
    private static Consumer<Bundle> testSink;
    private static long announcementCounter;
    private static boolean repositoryObserved,controllersResolved;
    private static long alertersAt=-1,zonesAt=-1,segmentsAt=-1,routeContextAt=-1,notificationsAt=-1,osmAt=-1,soundAt=-1,zoneSoundAt=-1;
    private static String controllerFailure="waiting_for_engine";
    private static final class Record {Bundle fields;long revision=1,index;}
    private static final class ZoneDecision {final String id,phase;ZoneDecision(String id,String phase){this.id=id;this.phase=phase;}}

    /** Changed to true only after the patch validates/binds the complete original method set. */
    public static boolean bound(){return false;}
    static boolean supportedNativeBuild(String version,long code){
        return "5.26.90.901".equals(version)&&code==1030746
                ||"5.27.0.1".equals(version)&&code==1030748;
    }
    static boolean supportsEventProtocol(Context context){
        if(!bound())return false;
        try{android.content.pm.PackageInfo info=context.getPackageManager().getPackageInfo(context.getPackageName(),0);return supportedNativeBuild(info.versionName,info.getLongVersionCode());}
        catch(android.content.pm.PackageManager.NameNotFoundException unavailable){return false;}
    }
    public static synchronized WarningEndpoint init(Context context){
        app=context.getApplicationContext();
        NativeTileCameras.start(app);
        if(endpoint==null)endpoint=new WarningEndpoint(app,uid->{
            String[] packages=app.getPackageManager().getPackagesForUid(uid);String configured=NavigationBroadcasts.receiverPackage();
            if(!StartupProtocol.allowed(packages,configured))return null;
            for(String name:packages)if(StartupProtocol.allowed(new String[]{name},configured))return name;return null;
        },new WarningCapabilities(WazeWarningTypes.MANIFEST_DIGEST,WazeWarningTypes.required(),bound()));
        // The pinned cohort passed UI-free native capture and lifecycle acceptance.
        // Bare extension code remains incomplete until the native binder sets bound().
        // Live family availability and receiving playback readiness remain independent.
        return endpoint;
    }
    public static synchronized WarningEndpoint endpoint(){return endpoint;}
    static synchronized String controllerState(){return controllersResolved?(repositoryObserved?"native_updates_observed":"waiting_for_native_updates"):controllerFailure;}
    /** Optional product status: native callbacks, controller resolution and output policy are distinct. */
    static synchronized Bundle familyStatus(){
        Bundle result=new Bundle();long now=SystemClock.elapsedRealtime();int[] current=new int[6];
        for(Record record:records.values()){
            Bundle b=record.fields;if(b==null||"CLEAR".equals(b.getString("operation"))||now>=b.getLong("state_until_elapsed_ms"))continue;
            String id=b.getString("warning_id","");
            if(id.startsWith("waze/alerter/")){
                current[b.containsKey("native_zone_state")?1:0]++;
                if(b.getBoolean("native_segment_correlated")){
                    String type=b.getString("native_segment_type","");current[type.equals("HOV_LANE")||type.equals("CARPOOL_LANE")||type.equals("BUS_LANE")?3:2]++;
                }
            }
            else if(id.startsWith("waze/segment/"))current[b.getBoolean("requires_source_route")?3:2]++;
            else if(id.startsWith("waze/notification/"))current[4]++;
            else if(id.startsWith("waze/osm/"))current[5]++;
        }
        String controller=controllersResolved?"singleton_resolved":controllerFailure;
        result.putBundle("alerters",family(alertersAt,soundAt,current[0],controller,"native_sound_request",false));
        result.putBundle("zones",family(zonesAt,zoneSoundAt,current[1],controller,"native_zone_selection",false));
        result.putBundle("segments",family(segmentsAt,-1,current[2],"native_callback_binding","state_only",false));
        result.putBundle("route_context",family(routeContextAt,-1,current[3],"native_callback_binding","state_only",true));
        result.putBundle("notifications",family(notificationsAt,-1,current[4],"native_callback_binding","visual_only",false));
        result.putBundle("osm",family(osmAt,-1,current[5],"optional_layer","patch_owned",false));
        return result;
    }
    private static Bundle family(long observed,long decision,int count,String controller,String output,boolean routeRequired){
        Bundle b=new Bundle();boolean on=enabled();b.putBoolean("supported_capture",bound());b.putBoolean("integration_enabled",on);
        b.putString("controller_state",!bound()?"binding_unproven":!on?"integration_disabled":decision>=0?"native_decision_observed":controller);
        // Neither an empty list nor a resolved singleton proves native category/region/host availability.
        b.putString("source_enabled","unobserved");b.putString("host_filtered","unobserved");
        b.putString("native_available",count>0?"state_present":observed>=0?"no_current_state":"unobserved");
        b.putInt("current_state_count",count);b.putBoolean("requires_source_route",routeRequired);b.putString("output_policy",output);
        b.putString("audio_control",output.equals("visual_only")||output.equals("state_only")||routeRequired?"none":"receiving_map");
        if(observed>=0)b.putLong("observed_elapsed_ms",observed);if(decision>=0)b.putLong("decision_elapsed_ms",decision);
        return b;
    }
    static void prepareControllers(){
        Context context; synchronized(NativeWarnings.class){context=app;if(controllersResolved||context==null||!bound()||!NavigationBroadcasts.isEnabled())return;}
        try{
            if(!NavigationStartup.running())return;
            ClassLoader loader=NativeWarnings.class.getClassLoader();Class<?> lookup=Class.forName("kotlinx.coroutines.a.ab",true,loader);
            Object provider=lookup.getMethod("l",Class.class).invoke(null,Class.forName("com.waze.alerters.b.a",true,loader));
            Object selector=WazeWarningModels.call(provider,"a");
            // These are Waze-owned singleton flows/scopes. Never cancel them or create an Activity.
            if(selector==null||WazeWarningModels.call(selector,"a")==null)throw new IllegalStateException("MISSING_NATIVE_SELECTOR");
            Object zone=lookup.getMethod("l",Class.class).invoke(null,Class.forName("com.waze.navigate.cd",true,loader));
            if(zone==null)throw new IllegalStateException("MISSING_NATIVE_ZONE_CONTROLLER");
            synchronized(NativeWarnings.class){controllersResolved=true;controllerFailure="";}
        }catch(ReflectiveOperationException|RuntimeException unavailable){synchronized(NativeWarnings.class){controllerFailure="binding_unproven";}Log.w("UA","Native warning controllers unavailable");}
    }
    private static boolean enabled(){return testSink!=null||app!=null&&bound()&&NavigationBroadcasts.isEnabled();}
    private static boolean managed(){return testSink!=null||ProviderAudio.muted();}
    private static synchronized void capture(Runnable action){
        if(!enabled())return;
        try{
            long now=SystemClock.elapsedRealtime();records.entrySet().removeIf(e->e.getValue().fields==null||now>=e.getValue().fields.getLong("state_until_elapsed_ms"));
            action.run();
        }catch(RuntimeException unavailable){if(endpoint!=null)endpoint.captureOverflow();Log.w("UA","Native warning capture unavailable: "+unavailable.getClass().getSimpleName());}
    }
    public static void repository(Object update){capture(()->{
        Object values=WazeWarningModels.call(update,"getDescriptorsList");if(!(values instanceof Collection)||((Collection<?>)values).size()>MAX_WARNINGS)throw new IllegalArgumentException("NATIVE_REPOSITORY_BOUND");
        long observed=SystemClock.elapsedRealtime();
        Map<String,Bundle> parsed=new LinkedHashMap<>();Map<String,Object> models=new LinkedHashMap<>();
        for(Object model:(Collection<?>)values){Bundle fields=retainSegment(WazeWarningModels.descriptor(app,model));String id=fields.getString("warning_id");if(parsed.put(id,fields)!=null)throw new IllegalArgumentException("DUPLICATE_NATIVE_ID");models.put(id,model);}
        for(String id:new ArrayList<>(nativeModels.keySet()))if(!models.containsKey(id)){retireTrackedZone(id);clear(id);}
        nativeModels.clear();nativeModels.putAll(models);nativeObservedAt.clear();for(String id:models.keySet())nativeObservedAt.put(id,observed);nativeLinks.clear();repositoryObserved=true;alertersAt=observed;
        if(parsed.values().stream().anyMatch(b->b.containsKey("native_zone_state")))zonesAt=alertersAt;
        for(Bundle fields:parsed.values()){String key=fields.getString("native_link_key"),id=fields.getString("warning_id");String old=nativeLinks.get(key);nativeLinks.put(key,old==null||old.equals(id)?id:"");}
        long now=observed;for(Bundle fields:parsed.values()){
            boolean invalid=!fields.getBoolean("native_valid"),silent=!invalid&&fields.containsKey("native_silent_activation");
            if(invalid||silent){
                Record previous=records.get(fields.getString("warning_id"));
                // Retire prior audible authority once. Re-clearing an unchanged display-only or
                // silently shown model on every native refresh fills the bounded journal with tombstones.
                if(previous!=null&&previous.fields!=null&&!("UPSERT".equals(previous.fields.getString("operation"))
                        &&("display_only".equals(previous.fields.getString("category"))||previous.fields.getBoolean("native_visual_only"))))clear(fields.getString("warning_id"));
                // Waze shows a valid, silently activated alert (familiar, grouped, experiment) without
                // sound: it stays visible state. Only natively invalid alerts are hidden.
                if(silent)fields.putBoolean("native_visual_only",true);
                else{fields.putString("native_category",fields.getString("category"));fields.putString("category","display_only");}
            }
            put(fields,false,now,"native_repository");
        }
    });}
    public static void sound(Object identity){capture(()->{
        String id=WazeWarningModels.identity(identity);Object shown=presentation.get();presentation.remove();
        if(shown!=null&&WazeWarningModels.matchesSoundIdentity(identity,WazeWarningModels.call(shown,"a"))){
            // Either selector or real UI sound may arrive first. Both observations refer to
            // this controller's one accepted entry, rather than independent announcements.
            zoneDecision(shown,"enter","native_zone_sound");return;
        }
        Object model=nativeModels.get(id);
        if(WazeWarningModels.uuid(identity).isEmpty()){
            model=null;
            String key=WazeWarningModels.soundKey(identity),resolved=null;
            if(!key.isEmpty())for(Map.Entry<String,Object> entry:nativeModels.entrySet()){
                if(key.equals(WazeWarningModels.soundKey(WazeWarningModels.call(entry.getValue(),"getAlertId")))){
                    if(resolved!=null)throw new IllegalStateException("AMBIGUOUS_NATIVE_SOUND_ID");resolved=entry.getKey();
                }
            }
            if(resolved!=null){id=resolved;model=nativeModels.get(id);}
        }
        if(model==null)throw new IllegalStateException("UNCORRELATED_NATIVE_SOUND");
        Bundle fields=descriptorFields(id,model);
        if(!fields.getBoolean("native_valid")||fields.containsKey("native_silent_activation")||"display_only".equals(fields.getString("category")))return;
        soundAt=SystemClock.elapsedRealtime();
        if(!managed())return; // Do not replay independent Waze playback into a later receiving session.
        // Managed output uses the receiving map's reviewed choices. Waze's later
        // per-camera speaker/underspeed gates remain local to its own playback.
        fields.putString("announcement_origin","native_sound_intent");fields.putString("local_sound_policy","receiver_owned");
        put(fields,true,SystemClock.elapsedRealtime(),"native_sound");
    });}
    private static Bundle descriptorFields(String id,Object model){
        Bundle fields=retainSegment(WazeWarningModels.descriptor(app,model));Long observed=nativeObservedAt.get(id);
        if(observed==null)throw new IllegalStateException("UNOBSERVED_NATIVE_MODEL");
        if(fields.containsKey("distance_m"))fields.putLong("distance_observed_elapsed_ms",observed);
        if(fields.containsKey("trigger_m"))fields.putLong("trigger_observed_elapsed_ms",observed);
        if(fields.containsKey("latitude")&&!NativeZoneRanges.owns(fields)){fields.putLong("position_observed_elapsed_ms",observed);fields.putString("position_clock_origin","native_repository");}
        if(fields.getBoolean("native_validation_present"))fields.putLong("native_validation_observed_elapsed_ms",observed);
        if(fields.containsKey("native_zone_percent"))fields.putLong("native_zone_observed_elapsed_ms",observed);
        return fields;
    }
    /** Independent native segment observations survive descriptor reads without a new clock. */
    private static Bundle retainSegment(Bundle fields){
        Record previous=records.get(fields.getString("warning_id"));
        if(previous==null||previous.fields==null||!previous.fields.getBoolean("native_segment_correlated")
                ||!java.util.Objects.equals(fields.get("native_type"),previous.fields.get("native_type")))return fields;
        Bundle supplement=new Bundle(previous.fields);
        for(String key:new ArrayList<>(supplement.keySet()))if(!key.startsWith("native_segment_")||fields.containsKey(key))supplement.remove(key);
        fields.putAll(supplement);
        NativeZoneRanges.apply(fields,NativeZoneRanges.decode(NativeTileCameras.zoneSnapshot()),SystemClock.elapsedRealtime());
        return fields;
    }
    private static void restoreNativePoint(Bundle fields){
        if(!NativeZoneRanges.owns(fields))return;
        NativeZoneRanges.remove(fields);
        Object model=nativeModels.get(fields.getString("warning_id"));
        if(model==null)return;
        Bundle original=WazeWarningModels.descriptor(app,model);
        java.util.Set<String> geometry=new HashSet<>(java.util.Arrays.asList("latitude","longitude","relevance","position_estimated"));
        for(String key:geometry)fields.remove(key);
        for(String key:new ArrayList<>(original.keySet()))if(!geometry.contains(key))original.remove(key);
        fields.putAll(original);
        if(fields.containsKey("latitude")){
            fields.putString("position_clock_origin","native_repository");
            fields.putLong("position_observed_elapsed_ms",nativeObservedAt.getOrDefault(fields.getString("warning_id"),0L));
        }
    }
    private static String zonePhase(Object controller){
        try{Field state=controller.getClass().getDeclaredField("b");state.setAccessible(true);Object value=state.get(controller);int ordinal=((Enum<?>)value).ordinal();return ordinal==1?"enter":ordinal==2?"exit":"approach";}
        catch(ReflectiveOperationException|ClassCastException incompatible){throw new IllegalStateException("WAZE_ZONE_STATE_ABI",incompatible);}
    }
    /** Native zone phase decision or selected controller; no native UI acknowledgement is forged. */
    public static void zoneSelected(Object controller){capture(()->zoneDecision(controller,zonePhase(controller),"native_zone_selection"));}
    public static void zonePresented(Object controller){capture(()->{
        presentation.remove();if(zonePhase(controller).equals("enter"))presentation.set(controller);
    });}
    /** Original LeftZone arm before the original native exit-sound callback. */
    public static void zoneExit(Object controller){capture(()->zoneDecision(controller,"exit","native_zone_exit_sound"));}
    private static void zoneDecision(Object controller,String phase,String origin){
        if(!managed()||phase.equals("approach"))return;
        String id=WazeWarningModels.identity(WazeWarningModels.call(controller,"a"));ZoneDecision old=zones.get(controller);
        if(old!=null&&old.id.equals(id)&&old.phase.equals(phase)){if(phase.equals("exit"))retireZone(id,controller);return;}
        Object model=nativeModels.get(id);if(model==null)throw new IllegalStateException("UNCORRELATED_NATIVE_ZONE");
        Bundle fields=descriptorFields(id,model);String expected=phase.equals("enter")?"InZone":"LeftZone";
        if(!expected.equals(fields.getString("native_zone_state"))||fields.containsKey("native_silent_activation")||!fields.getBoolean("native_valid"))return;
        if(zones.size()>=MAX_WARNINGS)throw new IllegalArgumentException("NATIVE_ZONE_BOUND");
        fields.putString("phase",phase);fields.putString("relevance",phase.equals("exit")?"exit":"zone");fields.putString("announcement_origin",origin);
        if(phase.equals("exit")){
            boolean nl=WazeWarningModels.language(app).startsWith("nl");String type=fields.getString("native_type","");
            String message=type.equals("DANGER_ZONE")?(nl?"Einde van de gevarenzone.":"End of danger zone."):
                type.equals("CAMERA")?(nl?"Einde van de controlezone.":"End of control zone."):
                type.equals("GUARDIAN")?(nl?"Einde van de zone met ongevalshistorie.":"End of crash-history zone."):(nl?"Einde van de zone.":"End of zone.");
            fields.putString("message",message);
            fields.putString("message_origin","template");fields.putString("template_id","waze_native_zone_exit_v1");fields.putString("language_tag",nl?"nl":"en");
        }
        zoneSoundAt=SystemClock.elapsedRealtime();put(fields,true,zoneSoundAt,"native_zone");zones.put(controller,new ZoneDecision(id,phase));if(phase.equals("exit"))retireZone(id,controller);
    }
    /** Waze reports one average-speed control as consecutive road segments; keep them one warning. */
    // A direct hand-over (within 2 s) needs no distance; within 10 s the last segment must have ended.
    static final long ZONE_CHAIN_GAP_MS=10_000,ZONE_CHAIN_HANDOVER_MS=2_000;static final int ZONE_CHAIN_END_M=300;
    private static String zoneChainId,zoneChainKey;private static long zoneChainAt=-1;private static int zoneChainLeft=-1;
    static Map<String,Bundle> chainZoneSegments(Map<String,Bundle> parsed,long observed){
        boolean previousPresent=false;
        for(Bundle fields:parsed.values())if(zoneChainKey!=null&&zoneChainKey.equals(fields.getString("native_segment_key")))previousPresent=true;
        Map<String,Bundle> result=new LinkedHashMap<>();
        for(Map.Entry<String,Bundle> entry:parsed.entrySet()){
            Bundle fields=entry.getValue();String id=entry.getKey();
            if("AVERAGE_SPEED_CAMERA".equals(fields.getString("native_type"))&&"WITHIN".equals(fields.getString("native_segment_phase"))){
                String key=fields.getString("native_segment_key","");int left=fields.getInt("distance_m",-1);
                boolean continues=zoneChainId!=null&&!key.equals(zoneChainKey)&&!previousPresent&&zoneChainAt>=0
                        &&(observed-zoneChainAt<=ZONE_CHAIN_HANDOVER_MS||observed-zoneChainAt<=ZONE_CHAIN_GAP_MS&&zoneChainLeft>=0&&(zoneChainLeft<=ZONE_CHAIN_END_M||left>=0&&left<=zoneChainLeft+100))&&!result.containsKey(zoneChainId);
                if(key.equals(zoneChainKey)&&zoneChainId!=null&&!result.containsKey(zoneChainId))id=zoneChainId;
                else if(continues){id=zoneChainId;zoneChainKey=key;previousPresent=true;}
                else{zoneChainId=id;zoneChainKey=key;}
                if(!id.equals(fields.getString("warning_id"))){fields.putString("native_zone_chain_segment_id",fields.getString("warning_id"));fields.putString("warning_id",id);}
                zoneChainAt=observed;zoneChainLeft=left;
            }
            if(result.put(id,fields)!=null)throw new IllegalArgumentException("DUPLICATE_SEGMENT");
        }
        return result;
    }
    public static void segments(Object update){segments(update,NativeTileCameras.zoneSnapshot());}
    static void segments(Object update,long[] nativeRanges){capture(()->{
        Map<String,NativeZoneRanges.Range> rangePoints=NativeZoneRanges.decode(nativeRanges);
        Object values=WazeWarningModels.call(update,"getInfoList");if(!(values instanceof Collection)||((Collection<?>)values).size()>MAX_WARNINGS)throw new IllegalArgumentException("SEGMENT_BOUND");
        Map<String,Bundle> parsed=new LinkedHashMap<>(),correlated=new LinkedHashMap<>();Set<String> seen=new HashSet<>();long observed=SystemClock.elapsedRealtime();boolean routeContext=false;
        for(Object info:(Collection<?>)values){
            Bundle fields=WazeWarningModels.segment(app,info);if(fields.getBoolean("requires_source_route"))routeContext=true;String linked=null;boolean ambiguous=false;
            if(!seen.add(fields.getString("warning_id")))throw new IllegalArgumentException("DUPLICATE_SEGMENT");
            for(int i=0;i<fields.getInt("source_alert_count");i++){
                String candidate=nativeLinks.get(fields.getString("source_alert_"+i+"_link_key"));Record record=candidate==null?null:records.get(candidate);
                if(candidate!=null&&!candidate.isEmpty()&&record!=null&&fields.getString("source_alert_"+i+"_type").equals(record.fields.getString("native_type"))){if(linked!=null&&!linked.equals(candidate))ambiguous=true;else linked=candidate;}
            }
            if(linked!=null&&!ambiguous){
                Bundle nativeFields=new Bundle(records.get(linked).fields);
                nativeFields.putString("native_segment_type",fields.getString("native_type"));nativeFields.putString("native_segment_phase",fields.getString("native_segment_phase"));
                nativeFields.putString("native_segment_key",fields.getString("native_segment_key"));nativeFields.putBoolean("native_segment_correlated",true);
                if(fields.containsKey("distance_m")){nativeFields.putInt("native_segment_distance_m",fields.getInt("distance_m"));nativeFields.putLong("native_segment_observed_ms",observed);}
                correlated.put(linked,nativeFields);
            }else{String id=fields.getString("warning_id");if(parsed.put(id,fields)!=null)throw new IllegalArgumentException("DUPLICATE_SEGMENT");}
        }
        for(Bundle fields:parsed.values())NativeZoneRanges.apply(fields,rangePoints,observed);
        for(Bundle fields:correlated.values()){
            restoreNativePoint(fields);NativeZoneRanges.apply(fields,rangePoints,observed);
        }
        parsed=chainZoneSegments(parsed,observed);
        // Validate the complete native update before emitting even a linked state change.
        for(Map.Entry<String,Record> entry:new ArrayList<>(records.entrySet())){
            Bundle previous=entry.getValue().fields;
            if(previous==null||"CLEAR".equals(previous.getString("operation"))||!previous.getBoolean("native_segment_correlated")||correlated.containsKey(entry.getKey()))continue;
            Bundle fields=new Bundle(previous);
            restoreNativePoint(fields);
            for(String key:new ArrayList<>(fields.keySet()))if(key.startsWith("native_segment_"))fields.remove(key);
            put(fields,false,previous.getLong("observed_elapsed_ms"),"native_segment_removed_state");
        }
        for(Bundle fields:correlated.values())put(fields,false,fields.getLong("observed_elapsed_ms"),"native_segment_correlated_state");
        for(String id:new ArrayList<>(segments))if(!parsed.containsKey(id))clear(id);
        segments.clear();segments.addAll(parsed.keySet());long now=SystemClock.elapsedRealtime();segmentsAt=now;if(routeContext)routeContextAt=now;
        for(Bundle fields:parsed.values())put(fields,false,now,"native_segment_state");
    });}
    public static void notificationAdded(Object notification){capture(()->{
        Bundle fields=WazeWarningModels.notification(app,notification);String id=fields.getString("warning_id");
        if(notifications.size()>=MAX_WARNINGS&&!notifications.contains(id))throw new IllegalArgumentException("NOTIFICATION_BOUND");
        notifications.add(id);notificationsAt=SystemClock.elapsedRealtime();put(fields,false,notificationsAt,"native_notification_state");
    });}
    public static void notificationRemoved(Object identity){capture(()->{String id=WazeWarningModels.notificationIdentity(identity);notifications.remove(id);notificationsAt=SystemClock.elapsedRealtime();clear(id);});}
    static boolean osm(String feature,long id,int subtype,String label,double latitude,double longitude,double distance,double trigger,long observed,boolean announce){boolean[] accepted={false};capture(()->{
        Bundle fields=WazeWarningModels.base("org.ungoogled.waze.OsmCameras",feature.equals("flockCameras")?"FLOCK_CAMERA":"CAMERA",label,"en");
        fields.putString("warning_id","waze/osm/"+WazeWarningModels.hash(feature+":"+id+":"+subtype));fields.putString("native_osm_feature",feature);fields.putString("native_osm_legacy_id","osm:"+feature+":"+id);
        fields.putString("native_subtype",feature.equals("flockCameras")?"PLATE_READER":subtype==1?"CAMERA_TYPE_REDLIGHT":subtype==2?"OSM_AVERAGE_SPEED_CAMERA":subtype==3?"CAMERA_TYPE_ROAD_SAFETY_STOP_SIGN":subtype==0?"CAMERA_TYPE_SPEED":"UNKNOWN_"+subtype);fields.putString("native_subtype_namespace","org.ungoogled.waze.OsmCameras.Kind");
        fields.putString("message_origin","template");fields.putString("template_id","waze_patch_owned_osm_v1");fields.putString("announcement_origin","patch_owned_osm");fields.putString("category","speed_control");fields.putDouble("latitude",latitude);fields.putDouble("longitude",longitude);
        fields.putString("relevance","point_ahead");fields.putInt("distance_m",(int)Math.round(distance));fields.putInt("trigger_m",(int)Math.round(trigger));fields.putBoolean("distance_estimated",true);fields.putBoolean("trigger_estimated",true);fields.putBoolean("position_estimated",false);
        // The existing layer proves its ahead-on-current-motion decision. Its input does not
        // prove equivalence to a native directed-road camera, so never merge merely by radius.
        fields.putString("dedup_status","unresolved_without_directed_road_equivalence");osmAt=observed;if(managed()){put(fields,announce,observed,"patch_owned_osm");accepted[0]=true;}
    });return accepted[0];}
    static void osmSnapshot(String feature,java.util.List<nl.johninnl.navigation.NavigationAlerts.Alert> values){capture(()->{
        Set<String> present=new HashSet<>();for(nl.johninnl.navigation.NavigationAlerts.Alert value:values)present.add(value.id);
        for(Map.Entry<String,Record> value:new ArrayList<>(records.entrySet()))if(feature.equals(value.getValue().fields.getString("native_osm_feature"))&&!present.contains(value.getValue().fields.getString("native_osm_legacy_id")))clear(value.getKey());
    });}
    static void overflow(){capture(()->{throw new IllegalStateException("SOURCE_CAPTURE_BOUND");});}
    /** Called only after Waze records its genuine native shutdown. */
    public static synchronized void engineStopped(){
        NativeTileCameras.clear();
        stopped();
    }
    static synchronized long tileEpoch(){return tileEpoch;}
    static synchronized void stopped(){
        ++tileEpoch;
        for(String id:new ArrayList<>(records.keySet()))clear(id);
        tileIds.clear();tilePublishedAt=-10000;
        nativeModels.clear();nativeObservedAt.clear();nativeLinks.clear();segments.clear();zoneChainId=zoneChainKey=null;zoneChainAt=-1;zoneChainLeft=-1;notifications.clear();zones.clear();retiredZoneRequests.clear();if(retirementMain!=null)retirementMain.removeCallbacksAndMessages(null);presentation.remove();repositoryObserved=false;controllersResolved=false;controllerFailure="waiting_for_engine";
        alertersAt=zonesAt=segmentsAt=routeContextAt=notificationsAt=osmAt=soundAt=zoneSoundAt=-1;
    }
    /** Native tile points are display-only; they never manufacture a native warning/sound decision. */
    static void tilePoints(long[] points){tilePoints(points,tileEpoch());}
    static void tilePoints(long[] points,long sampledEpoch){capture(()->{
        if(sampledEpoch!=tileEpoch)return; // A snapshot sampled before stop cannot republish a cleared pin.
        if(points==null||points.length%5!=0||points.length>32*5)throw new IllegalArgumentException("TILE_SNAPSHOT_BOUND");
        long now=SystemClock.elapsedRealtime();java.util.Set<String> next=new java.util.HashSet<>();
        for(int i=0;i<points.length;i+=5){
            long kind=points[i+2],lon=points[i+3],lat=points[i+4];
            if(kind<69||kind>80||lon < -180000000||lon>180000000||lat < -90000000||lat>90000000||lon==0&&lat==0)
                throw new IllegalArgumentException("TILE_POINT_ABI");
            next.add(tileId(points,i));
        }
        boolean changed=!next.equals(tileIds);
        if(!changed)for(int i=0;i<points.length;i+=5){
            Record previous=records.get(tileId(points,i));
            if(previous==null||previous.fields.getDouble("longitude")!=points[i+3]/1e6||previous.fields.getDouble("latitude")!=points[i+4]/1e6){changed=true;break;}
        }
        for(String id:new ArrayList<>(tileIds))if(!next.contains(id)){clear(id);records.remove(id);tileIds.remove(id);}
        if(!changed&&now-tilePublishedAt<10000)return;
        for(int i=0;i<points.length;i+=5){
            long kind=points[i+2],lon=points[i+3],lat=points[i+4];
            String id=tileId(points,i);if(!records.containsKey(id)&&records.size()>=MAX_WARNINGS)continue;
            Bundle fields=WazeWarningModels.base("waze.insights.native_tile","CAMERA","Camera",WazeWarningModels.language(app));
            fields.putString("warning_id",id);fields.putString("category","display_only");
            fields.putString("message_origin","template");fields.putString("template_id","waze_native_tile_map_v1");
            fields.putInt("native_tile_kind",(int)kind);fields.putString("native_subtype",tileSubtype((int)kind));
            fields.putString("native_subtype_namespace","waze.insights.CameraKind");
            fields.putString("relevance","point_ahead");fields.putDouble("longitude",lon/1e6);fields.putDouble("latitude",lat/1e6);
            fields.putBoolean("position_estimated",false);fields.putBoolean("native_point_target",true);
            fields.putLong("position_observed_elapsed_ms",now);fields.putString("position_clock_origin","native_tile");
            fields.putString("dedup_status","native_tile_identity");
            Record record=records.get(id);if(record==null){record=new Record();records.put(id,record);}
            record.revision=++tileRevision;tileIds.add(id);put(fields,false,now,"native_tile");
        }
        tilePublishedAt=now;
    });}
    private static String tileId(long[] points,int i){return "waze/tile/"+Long.toUnsignedString(points[i])+"/"+Long.toUnsignedString(points[i+1])+"/"+points[i+2];}
    private static String tileSubtype(int kind){
        String[] names={"SPEED","RED_LIGHT","RED_LIGHT_AND_SPEED","DUMMY","SEATBELT","MOBILE_PHONE","STOP","NOISE","DISTANCE","HOV_LANE","BUS_LANE","CARPOOL_LANE"};
        return names[kind-69];
    }
    private static void put(Bundle source,boolean announce,long observed,String path){
        String id=source.getString("warning_id");long now=SystemClock.elapsedRealtime();if(observed<0||observed>now||now-observed>=30000)return;
        if(announce&&source.getString("message","").trim().isEmpty())throw new IllegalArgumentException("MISSING_NATIVE_TEXT");
        Record record=records.get(id);if(record==null){
            if(records.size()>=MAX_WARNINGS&&!id.startsWith("waze/tile/")&&!tileIds.isEmpty()){
                String evicted=tileIds.iterator().next();clear(evicted);records.remove(evicted);tileIds.remove(evicted);
            }
            if(records.size()>=MAX_WARNINGS)throw new IllegalArgumentException("WARNING_BOUND");record=new Record();records.put(id,record);}
        Bundle fields=new Bundle(source);
        if(record.fields!=null&&!sameContent(record.fields,fields))record.revision++;
        if(announce)record.index=++announcementCounter;
        fields.putLong("revision",record.revision);fields.putLong("announcement_index",record.index);fields.putString("operation",announce?"ANNOUNCE":"UPSERT");
        fields.putLong("observed_elapsed_ms",observed);long until=observed+30000;
        if(fields.containsKey("native_timeout_ms")&&fields.getLong("native_timeout_ms")>0)until=observed+Math.min(30000,fields.getLong("native_timeout_ms"));
        fields.putLong("state_until_elapsed_ms",until);fields.putString("capture_path",path);
        if(fields.containsKey("distance_m")&&!fields.containsKey("distance_observed_elapsed_ms"))fields.putLong("distance_observed_elapsed_ms",observed);
        if(fields.containsKey("trigger_m")&&!fields.containsKey("trigger_observed_elapsed_ms"))fields.putLong("trigger_observed_elapsed_ms",observed);
        if(fields.containsKey("native_zone_percent")&&!fields.containsKey("native_zone_observed_elapsed_ms"))fields.putLong("native_zone_observed_elapsed_ms",observed);
        if(fields.containsKey("latitude")){if(!fields.containsKey("position_observed_elapsed_ms"))fields.putLong("position_observed_elapsed_ms",observed);if(!fields.containsKey("position_clock_origin"))fields.putString("position_clock_origin","native_decision");}
        record.fields=new Bundle(fields);emit(fields);
    }
    private static boolean sameContent(Bundle a,Bundle b){
        for(String key:new String[]{"native_type","native_subtype","native_trait","category","priority","phase","message","language_tag","native_valid","native_silent_activation","native_car_title","native_car_body",
                "native_segment_correlated","native_segment_type","native_segment_phase","native_segment_key"})if(!java.util.Objects.equals(a.get(key),b.get(key)))return false;return true;
    }
    private static void clear(String id){Record record=records.get(id);if(record==null||"CLEAR".equals(record.fields.getString("operation")))return;Bundle b=new Bundle();
        if(tileIds.contains(id))for(String key:new String[]{"category","native_type","native_namespace","native_tile_kind","position_clock_origin","native_point_target"}){
            Object value=record.fields.get(key);
            if(value instanceof String)b.putString(key,(String)value);
            else if(value instanceof Integer)b.putInt(key,(Integer)value);
            else if(value instanceof Boolean)b.putBoolean(key,(Boolean)value);
        }
        b.putString("warning_id",id);b.putString("operation","CLEAR");b.putLong("revision",record.revision);b.putLong("announcement_index",record.index);long now=SystemClock.elapsedRealtime();b.putLong("observed_elapsed_ms",now);b.putLong("state_until_elapsed_ms",now+30000);record.fields=b;emit(b);}
    private static void emit(Bundle fields){nl.johninnl.navigation.alerts.IndicatorContract.annotate(fields);if(testSink!=null)testSink.accept(new Bundle(fields));else if(endpoint!=null)endpoint.emit(fields);}
    static synchronized void resetForTest(Context context,Consumer<Bundle> sink){tileIds.clear();tileRevision=0;tilePublishedAt=-10000;app=context;testSink=sink;records.clear();nativeModels.clear();nativeObservedAt.clear();nativeLinks.clear();segments.clear();zoneChainId=zoneChainKey=null;zoneChainAt=-1;zoneChainLeft=-1;notifications.clear();zones.clear();retiredZoneRequests.clear();carSurfaces.clear();testRetire=null;if(retirementMain!=null)retirementMain.removeCallbacksAndMessages(null);presentation.remove();announcementCounter=0;repositoryObserved=false;controllersResolved=false;controllerFailure="waiting_for_engine";alertersAt=zonesAt=segmentsAt=routeContextAt=notificationsAt=osmAt=soundAt=zoneSoundAt=-1;}
}
