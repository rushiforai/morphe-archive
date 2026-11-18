package nl.johninnl.flitsmeister;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.function.Consumer;
import nl.johninnl.navigation.alerts.FlitsmeisterWarningTypes;
import nl.johninnl.navigation.alerts.WarningCapabilities;
import nl.johninnl.navigation.alerts.WarningEndpoint;
import nl.johninnl.navigation.startup.StartupProtocol;

/** Observes accepted native decisions. Never invokes sound, BLE or eligibility code. */
public final class NativeWarnings {
    private NativeWarnings() {}
    private static final int MAX_WARNINGS=128;
    private static final Map<String,Record> records=new LinkedHashMap<>();
    private static final IdentityHashMap<Object,String> anonymous=new IdentityHashMap<>();
    private static final IdentityHashMap<Object,Long> suppressedProjections=new IdentityHashMap<>();
    private static final IdentityHashMap<Object,String> projectionIds=new IdentityHashMap<>();
    private static final Set<String> notificationControlled=new HashSet<>();
    private static final Map<Object,CountrySample> countrySamples=new java.util.WeakHashMap<>();
    private static final Map<Object,Integer> countryObserved=new java.util.WeakHashMap<>();
    private static Integer previousRoadLimit;
    private static final class CountrySample {
        final int before;final Location fix;final Integer previousGeo;
        CountrySample(int before,Location fix,Integer previousGeo){this.before=before;this.fix=new Location(fix);this.previousGeo=previousGeo;}
    }
    private static String notificationId;
    private static final ThreadLocal<SourceFact> convertingCits=new ThreadLocal<>();
    private static final IdentityHashMap<Object,SourceFact> citsAliases=new IdentityHashMap<>();
    private static final Map<String,SourceFact> citsFacts=new LinkedHashMap<>();
    private static final class SourceFact {
        final String eventId,type;final long until;String warningId;
        final Map<String,String> languages=new LinkedHashMap<>();
        String selectedLanguage="und";
        String selectedTextHash;
        SourceFact(String id,String type){eventId=id;this.type=type;until=SystemClock.elapsedRealtime()+30000;}
    }
    private static final ThreadLocal<Long> citsProjection=new ThreadLocal<>();
    private static Context app;
    private static WarningEndpoint endpoint;
    private static Consumer<Bundle> testSink;
    private static String presentationId;
    private static boolean captureEnabled;
    // State expires independently of native warning identity. Keep accepted
    // announcements distinct for this process/session without retaining expired models.
    private static long announcementCounter;
    private static final class Record {
        Bundle fields; long revision=1,index,emittedAt; boolean listed,visible;
        java.lang.ref.WeakReference<Object> report;
    }
    /** An accepted regular announcement waiting for FM to choose its alert sound (asynchronous BLE callback). */
    private static final class AwaitingSound {
        final Object report;final String phase;final Runnable emit;
        AwaitingSound(Object report,String phase,Runnable emit){this.report=report;this.phase=phase;this.emit=emit;}
    }
    private static final List<AwaitingSound> awaitingSound=new ArrayList<>();
    /** Upper bound for FM's own sound choice; FM Dot and sound-pack paths never report one. */
    static final long SOUND_WAIT_MS=400;
    private static boolean awaitSound=true;
    private static String chosenSound;
    private static android.os.Handler main;
    /** Listed state is renewed well inside its 30s display window while FM keeps the report alerted. */
    static final long STATE_RENEW_MS=10000,DISTANCE_RENEW_MS=3000;static final int DISTANCE_STEP_M=5;
    /** Patch-time original-DEX guards and the matching capture audit pin each native profile. */
    private static int auditedNativeProfile(Context context){
        try{
            android.content.pm.PackageInfo info=context.getPackageManager().getPackageInfo(context.getPackageName(),0);
            long code=info.getLongVersionCode();
            if("14.17".equals(info.versionName)&&code==1287)return 14;
            if("15.0".equals(info.versionName)&&code==1289)return 15;
            return 0;
        }catch(android.content.pm.PackageManager.NameNotFoundException|RuntimeException unavailable){return 0;}
    }
    static boolean supportsEventProtocol(Context context){return auditedNativeProfile(context)!=0;}
    public static synchronized WarningEndpoint init(Context context) {
        if(app==null){app=context.getApplicationContext();captureEnabled=true;}
        if(endpoint==null){int profile=auditedNativeProfile(app);endpoint=new WarningEndpoint(app,uid->{
            String[] packages=app.getPackageManager().getPackagesForUid(uid);
            String configured=NavigationBroadcasts.receiverPackage();
            if(!StartupProtocol.allowed(packages,configured))return null;
            for(String name:packages)if(StartupProtocol.allowed(new String[]{name},configured))return name;
            return null;
        },new WarningCapabilities(profile==15?FlitsmeisterWarningTypes.MANIFEST_DIGEST_15:FlitsmeisterWarningTypes.MANIFEST_DIGEST,FlitsmeisterWarningTypes.required(),profile!=0));}
        return endpoint;
    }
    public static synchronized WarningEndpoint endpoint(){return endpoint;}
    public static synchronized void started(){captureEnabled=true;}
    /** Native request/parser bookkeeping only. Accepted warning hooks remain the publication authority. */
    public static void earlyRequest(Object task,Location fix){try{EarlyWarningGeometry.request(task,fix);}catch(RuntimeException ignored){}}
    public static void earlyResponse(Object task,Object json){try{EarlyWarningGeometry.response(task,json);}catch(RuntimeException ignored){}}
    public static void earlyParsing(Object json){try{EarlyWarningGeometry.parsing(json);}catch(RuntimeException ignored){}}
    public static void earlyParsed(Object model){try{EarlyWarningGeometry.parsed(model);}catch(RuntimeException ignored){}}
    public static void earlyResponseFinished(){EarlyWarningGeometry.finished();}
    /** The native controller's p1 register is reused before its sound decision. */
    public static void maximumSpeedFromController(Object controller){
        Location fix=null;
        if(controller!=null)try{java.lang.reflect.Field field=controller.getClass().getDeclaredField("c");field.setAccessible(true);
            Object value=field.get(controller);if(value instanceof Location)fix=(Location)value;
        }catch(ReflectiveOperationException|RuntimeException unavailable){/* Optional fix metadata stays unknown. */}
        maximumSpeed(fix);
    }
    /** A real native overspeed decision, excluding SignalScreens' settings sound previews. */
    public static void maximumSpeed(Location fix){capture(()->{
        if(!captureEnabled||app==null)return;
        Bundle fields=new Bundle();fields.putString("native_family","MaximumSpeed");fields.putString("native_type","MAXIMUM_SPEED");
        fields.putString("category","maximum_speed");fields.putInt("priority",2);fields.putLong("display_max_age_ms",10000);fields.putBoolean("native_announce_observed",true);
        fields.putString("native_decision_path","road_threshold");fields.putString("native_text_key","fm_maximum_speed_v1");
        if(fix!=null&&fix.hasSpeed()&&Float.isFinite(fix.getSpeed())&&fix.getSpeed()>=0){long at=fix.getElapsedRealtimeNanos()/1000000,now=SystemClock.elapsedRealtime();
            if(at>0&&at<=now&&now-at<=5000){fields.putDouble("current_speed_kmh",fix.getSpeed()*3.6);fields.putLong("current_speed_observed_elapsed_ms",at);fields.putBoolean("current_speed_estimated",false);}}
        // This callback is installed only by the exact FM15 data profile.
        try{int limit=Class.forName("brf").getField("f").getInt(null);
            if(limit>0&&limit<=500){fields.putInt("road_speed_limit_kmh",limit);fields.putLong("road_speed_limit_observed_elapsed_ms",SystemClock.elapsedRealtime());fields.putBoolean("road_speed_limit_estimated",false);}}
        catch(ReflectiveOperationException unavailable){fields.putString("capture_diagnostic","MAXIMUM_SPEED_VALUE_UNAVAILABLE");}
        int resource=app.getResources().getIdentifier("youre_driving_too_fast","string",app.getPackageName());
        boolean dutch=language().toLowerCase(Locale.ROOT).startsWith("nl");String text=resource==0?(dutch?"Je rijdt te hard":"You are driving too fast"):app.getString(resource);
        fields.putString("language_tag",language());if(resource==0)fields.putString("template_id","fm_maximum_speed_v1");
        update("fm/maximum-speed",fields,text,resource==0?"template":"native_resource","notice",true,false,"native_maximum_speed_decision",false);
    });}
    public static void maximumSpeedCleared(){capture(()->{
        Record record=records.get("fm/maximum-speed");
        if(record!=null&&"road_threshold".equals(record.fields.getString("native_decision_path")))clear("fm/maximum-speed");
    });}
    /** Separate native average-zone overspeed intent; never label it ordinary road speeding. */
    public static void averageSpeedWarning(){capture(()->{
        if(!captureEnabled||app==null)return;
        Bundle fields=new Bundle();fields.putString("native_family","AverageSpeedWarning");fields.putString("native_type","AVERAGE_SPEED_WARNING");
        fields.putString("category","average_speed_zone");fields.putInt("priority",1);fields.putBoolean("native_zone_alarm",true);fields.putString("reference_metric","native_average_speed");
        fields.putBoolean("native_announce_observed",true);fields.putLong("display_max_age_ms",10000);fields.putString("native_text_key","fm_average_speed_warning_v1");
        int resource=app.getResources().getIdentifier("youre_driving_too_fast","string",app.getPackageName());boolean dutch=language().toLowerCase(Locale.ROOT).startsWith("nl");
        String text=resource==0?(dutch?"Verlaag je gemiddelde snelheid":"Lower your average speed"):app.getString(resource);fields.putString("language_tag",language());
        if(resource==0)fields.putString("template_id","fm_average_speed_warning_v1");
        update("fm/average-speed-exceeded",fields,text,resource==0?"template":"native_resource","notice",true,false,"native_average_speed_warning",false);
    });}
    public static void averageSpeedCleared(){capture(()->clear("fm/average-speed-exceeded"));}
    /**
     * FM's own average-speed report as the producer tracks it along the report's joined segment geometry:
     * ahead of its start (distance to the start) or inside (remaining distance). FM itself does not always
     * signal the report on the warning path; the identity matches FM's own report warning when it does.
     */
    public static void averageSpeedZone(String reportId,boolean inside,int metres){averageSpeedZone(reportId,inside,metres,Double.NaN,Double.NaN);}
    /**
     * As above, with the control's own road point from the same joined report geometry: its first point
     * while approaching, its last point while inside (contract v1, Geometry, 12 November 2026).
     */
    public static void averageSpeedZone(String reportId,boolean inside,int metres,double latitude,double longitude){capture(()->{
        if(!captureEnabled||app==null||reportId==null||reportId.isEmpty())return;
        Bundle fields=new Bundle();fields.putString("native_family","AvgSpeedCheck");fields.putString("native_type","AVG_SPEED_CHECK");
        fields.putString("category","speed_control");fields.putInt("priority",1);fields.putString("native_zone_source","producer_report_geometry");
        fields.putLong("display_max_age_ms",10000);
        long now=SystemClock.elapsedRealtime();
        if(metres>=0){fields.putInt("distance_m",metres);fields.putLong("distance_observed_elapsed_ms",now);fields.putBoolean("distance_estimated",false);
            fields.putString("native_distance_kind",inside?"remaining_in_segment":"to_segment");}
        zonePoint(fields,inside,latitude,longitude,now);
        int resource=app.getResources().getIdentifier("common_trajectcontrole","string",app.getPackageName());boolean dutch=language().toLowerCase(Locale.ROOT).startsWith("nl");
        String text=resource==0?(dutch?"Trajectcontrole":"Average speed check"):app.getString(resource);fields.putString("language_tag",language());
        if(resource==0)fields.putString("template_id","fm_average_speed_zone_v1");
        update("AvgSpeedCheck:"+reportId,fields,text,resource==0?"template":"native_resource",inside?"enter":"approach",false,false,"producer_zone_state",false);
    });}
    public static void averageSpeedZoneCleared(String reportId){capture(()->{if(reportId!=null&&!reportId.isEmpty())clear("AvgSpeedCheck:"+reportId);});}
    /**
     * FM's own fixed road point of the control, read from its report geometry at [at]: a display point,
     * never an extent. A missing, partial or default (0,0) point ships nothing.
     */
    static void zonePoint(Bundle fields,boolean inside,double latitude,double longitude,long at){
        if(at<0||!Double.isFinite(latitude)||!Double.isFinite(longitude)||Math.abs(latitude)>90||Math.abs(longitude)>180
                ||latitude==0&&longitude==0)return;
        fields.putDouble("latitude",latitude);fields.putDouble("longitude",longitude);fields.putLong("position_observed_elapsed_ms",at);
        fields.putBoolean("position_estimated",false);fields.putString("position_clock_origin","native_report_geometry");
        fields.putBoolean("native_point_target",true);fields.putString("zone_point",inside?"end":"start");
    }
    private static final String[] ZONE_POSITION={"latitude","longitude","position_observed_elapsed_ms","position_estimated","position_clock_origin","native_point_target","zone_point"};
    private static final String[] ZONE_DISTANCE={"distance_m","distance_observed_elapsed_ms","distance_estimated","native_distance_kind"};
    /**
     * FM's own announcement for a tracked control carries no report geometry of its own. It keeps the
     * producer's last zone point and distance with their original clocks, so the marker does not blink.
     */
    private static void keepZoneGeometry(Bundle previous,Bundle next){
        if(!next.containsKey("latitude")&&!next.containsKey("longitude"))
            for(String key:ZONE_POSITION)copy(previous,next,key);
        if(!next.containsKey("distance_m"))for(String key:ZONE_DISTANCE)copy(previous,next,key);
    }
    @SuppressWarnings("deprecation")
    private static void copy(Bundle from,Bundle to,String key){
        Object value=from.get(key);
        if(value instanceof Double)to.putDouble(key,(Double)value);else if(value instanceof Long)to.putLong(key,(Long)value);
        else if(value instanceof Integer)to.putInt(key,(Integer)value);else if(value instanceof Boolean)to.putBoolean(key,(Boolean)value);
        else if(value instanceof String)to.putString(key,(String)value);
    }
    /** Native GPS country detection only: constructor defaults and manual selection are not crossings. */
    public static void countryBegin(Object detector,Location fix){capture(()->{
        countrySamples.remove(detector);if(!captureEnabled||detector==null||fix==null)return;
        try{java.lang.reflect.Field field=detector.getClass().getDeclaredField("s");field.setAccessible(true);
            if(countrySamples.size()>=MAX_WARNINGS)countrySamples.remove(countrySamples.keySet().iterator().next());
            countrySamples.put(detector,new CountrySample(field.getInt(detector),fix,countryObserved.get(detector)));
        }catch(ReflectiveOperationException ignored){}
    });}
    public static void countryEnd(Object detector){capture(()->{
        CountrySample sample=countrySamples.remove(detector);if(sample==null||!captureEnabled||app==null)return;
        try{
            java.lang.reflect.Field field=detector.getClass().getDeclaredField("s");field.setAccessible(true);int after=field.getInt(detector);
            long now=SystemClock.elapsedRealtime(),at=sample.fix.getElapsedRealtimeNanos()/1000000;
            if(after==37||at<=0||at>now||now-at>5000||!sample.fix.hasAccuracy()||!Float.isFinite(sample.fix.getAccuracy())||sample.fix.getAccuracy()<0||sample.fix.getAccuracy()>50
                    ||!Double.isFinite(sample.fix.getLatitude())||Math.abs(sample.fix.getLatitude())>90||!Double.isFinite(sample.fix.getLongitude())||Math.abs(sample.fix.getLongitude())>180){countryObserved.remove(detector);return;}
            if(countryObserved.size()>=MAX_WARNINGS)countryObserved.remove(countryObserved.keySet().iterator().next());countryObserved.put(detector,after);
            if(sample.previousGeo==null||sample.previousGeo!=sample.before||sample.before==after||sample.before==37)return;
            java.lang.reflect.Method country=Class.forName("nl.flitsmeister.fmcore.data.enums.UserCountries").getMethod("getCountryCode",Integer.class);
            String from=string(country.invoke(null,sample.before)).toUpperCase(Locale.ROOT),to=string(country.invoke(null,after)).toUpperCase(Locale.ROOT);
            if(!from.matches("[A-Z]{2}")||!to.matches("[A-Z]{2}")||from.equals(to))return;
            android.os.LocaleList locales=app.getResources().getConfiguration().getLocales();Locale locale=locales.isEmpty()?Locale.getDefault():locales.get(0);
            String name=new Locale("",to).getDisplayCountry(locale);if(name.isEmpty())name=to;
            Bundle fields=new Bundle();fields.putString("native_family","CountryTransition");fields.putString("native_type","BORDER_CROSSING");fields.putString("category","border_crossing");fields.putInt("priority",2);
            fields.putString("country_from",from);fields.putString("country_code",to);fields.putString("country_name",name);fields.putLong("transition_observed_elapsed_ms",at);
            fields.putString("state_origin","native_gps_country_transition");fields.putBoolean("native_visual_only",true);fields.putLong("display_max_age_ms",10000);fields.putString("native_text_key","fm_country_transition_v1");
            fields.putString("language_tag",language());fields.putString("template_id","fm_country_transition_v1");
            update("fm/border-crossing",fields,name,"template","notice",false,false,"native_country_state",false);
        }catch(ReflectiveOperationException ignored){}
    });}
    /** Final native road-limit transitions are visual data, never native sound authority or Hop-hop. */
    public static void roadLimit(int value){capture(()->{
        if(!captureEnabled||app==null)return;Integer before=previousRoadLimit;previousRoadLimit=value>0&&value<=500?value:null;
        if(before==null||previousRoadLimit==null||before.equals(previousRoadLimit))return;
        Bundle fields=new Bundle();fields.putString("native_family","RoadInformation");fields.putString("native_type","ROAD_LIMIT_CHANGE");fields.putString("category","maximum_speed");fields.putInt("priority",2);
        fields.putInt("road_speed_limit_kmh",value);fields.putInt("previous_road_speed_limit_kmh",before);fields.putLong("road_speed_limit_observed_elapsed_ms",SystemClock.elapsedRealtime());fields.putBoolean("road_speed_limit_estimated",false);
        fields.putString("state_origin","native_final_road_limit_transition");fields.putBoolean("native_visual_only",true);fields.putLong("display_max_age_ms",10000);fields.putString("native_text_key","fm_road_limit_transition_v1");
        fields.putString("language_tag",language());fields.putString("template_id","fm_road_limit_transition_v1");
        update("fm/road-limit-change",fields,value+" km/h","template","notice",false,false,"native_road_information",false);
    });}
    /** Observe only scalar source identity around the original pure CITS model conversion. */
    public static void citsSource(Object event){capture(()->{
        convertingCits.remove();if(event!=null){
            SourceFact fact=new SourceFact(citsId(event),event.getClass().getSimpleName());
            try{
                Object values=event.getClass().getField("freeTextsWhere").get(event);int count=0;
                if(values instanceof Collection)for(Object value:(Collection<?>)values){if(++count>32)break;
                    String text=string(value.getClass().getField("freeText").get(value)),language=string(value.getClass().getField("language").get(value));
                    if(!NativeWarningText.useful(text)||text.length()>4096||language.isEmpty())continue;
                    try{new Locale.Builder().setLanguageTag(language);}catch(RuntimeException invalid){continue;}
                    String key=NativeWarningText.hash(text),previous=fact.languages.get(key);
                    fact.languages.put(key,previous==null||previous.equals(language)?language:"und");
                }
            }catch(ReflectiveOperationException ignored){}
            convertingCits.set(fact);
        }
    });}
    public static void citsModel(Object report){capture(()->{
        SourceFact fact=convertingCits.get();convertingCits.remove();if(fact==null||report==null)return;
        Bundle fields=describe(report);String subtype=fields.getString("native_subtype","");
        fact.warningId=isFamily(report,"EarlyWarningReport")?"early/"+subtype+":"+value(report,"getId"):identity(report,fields);
        fact.selectedTextHash=NativeWarningText.hash(NativeWarningText.free(report));String language=fact.languages.get(fact.selectedTextHash);if(language!=null)fact.selectedLanguage=language;
        if(citsFacts.size()>=MAX_WARNINGS&&!citsFacts.containsKey(fact.warningId)){overflow();return;}
        citsFacts.put(fact.warningId,fact);
        if(citsAliases.size()>=MAX_WARNINGS*2){overflow();return;}citsAliases.put(report,fact);
        Object notification=optional(report,"getNotification");if(notification!=null)citsAliases.put(notification,fact);
    });}
    public static void regular(Object sound,Object report,boolean entering,boolean localMuteBypass,String text,Object completion) {
        capture(()->{
            if(!captureEnabled||report==null)return;
            String phase=entering?"enter":"exit";Context context=NativeWarningText.context(app,sound);
            Runnable emit=()->announce(report,null,text,phase,localMuteBypass,"regular",context);
            AwaitingSound stale=takeAwaiting(report,phase);if(stale!=null)stale.emit.run();
            if(!awaitSound||awaitingSound.size()>=MAX_WARNINGS){emit.run();return;}
            AwaitingSound waiting=new AwaitingSound(report,phase,emit);awaitingSound.add(waiting);
            if(main==null)main=new android.os.Handler(android.os.Looper.getMainLooper());
            main.postDelayed(()->capture(()->{if(awaitingSound.remove(waiting))waiting.emit.run();}),SOUND_WAIT_MS);
        });
    }
    /** FM's own per-type alert sound for this announcement; empty when its settings chose silence. */
    public static void sound(Object report,boolean entering,String file){capture(()->{
        AwaitingSound waiting=takeAwaiting(report,entering?"enter":"exit");if(waiting==null)return;
        chosenSound=nl.johninnl.navigation.alerts.ProviderSound.validName(file)?file:null;
        try{waiting.emit.run();}finally{chosenSound=null;}
    });}
    /** FM's regular path chose no alert sound (its per-type sound preference is off). */
    public static void noSound(Object report,boolean entering){sound(report,entering,null);}
    private static AwaitingSound takeAwaiting(Object report,String phase){
        for(java.util.Iterator<AwaitingSound> it=awaitingSound.iterator();it.hasNext();){AwaitingSound value=it.next();
            if(value.report==report&&value.phase.equals(phase)){it.remove();return value;}}
        return null;
    }
    /**
     * FM's own on-screen warning set. Its announcement rules (repeat window, spam filter) do not
     * gate what it shows, so the pill follows this set while speech stays with the signal path.
     */
    public static void visible(Object candidate){capture(()->{
        if(!captureEnabled||app==null)return;
        Object report=candidateReport(candidate);if(report==null||isFamily(report,"AvgSpeedCheck")||isFamily(report,"TrafficJam"))return;
        Bundle fields=describe(report);if("display_only".equals(fields.getString("category")))return;
        String id=identity(report,fields);Record old=records.get(id);
        if(old!=null&&!"CLEAR".equals(old.fields.getString("operation"))&&!"exit".equals(old.fields.getString("phase"))){
            old.visible=true;old.report=new java.lang.ref.WeakReference<>(report);return;
        }
        NativeWarningText.Text text=NativeWarningText.resolve(app,report,"active",null);fields.putString("language_tag",text.language);
        aheadDistance(fields,report,SystemClock.elapsedRealtime());
        update(id,fields,text.value,text.origin,"active",false,false,"visible_state",false);
        Record shown=records.get(id);if(shown!=null){shown.visible=true;shown.report=new java.lang.ref.WeakReference<>(report);}
    });}
    public static void hidden(Object candidate){capture(()->{
        Object report=candidateReport(candidate);if(report==null)return;
        String id=identity(report,describe(report));Record record=records.get(id);if(record==null)return;
        record.visible=false;
        if(!record.listed&&"visible_state".equals(record.fields.getString("capture_path")))clear(id);
    });}
    private static Object candidateReport(Object candidate){
        if(candidate==null)return null;
        try{Object report=candidate.getClass().getField("a").get(candidate);return report!=null&&isFamily(report,"BaseReport")?report:null;}
        catch(ReflectiveOperationException|RuntimeException unavailable){return null;}
    }
    public static void early(Object sound,Object type,Object report,Object notification,String text,boolean localMuteBypass,Object completion) {
        capture(()->{
            if(!captureEnabled)return;
            Object model=notification!=null?notification:report;
            if(model==null)return;
            String effective=notification!=null?value(notification,"getType"):value(report,"getEarlyWarningTypeEnum");
            Bundle fields=describe(model);
            if(!effective.isEmpty())fields.putString("native_subtype",effective);
            fields.putString("native_early_type_argument",string(type));
            if(!effective.isEmpty()&&!string(type).equals(effective))fields.putString("capture_diagnostic","EARLY_TYPE_MISMATCH");
            String id=identity(model,fields);
            if(notificationControlled.contains(id)&&!id.equals(notificationId))return;
            announceFields(model,fields,text,"notice",localMuteBypass,"early",NativeWarningText.context(app,sound));
        });
    }
    /** Called only inside the resumed, accepted VOICE_ONLY arm, before local speech filtering. */
    public static void voiceOnly(Object report){capture(()->announce(report,null,value(report,"getVoiceOnlyText"),"notice",false,"voice_only",app));}
    /** Called only in fc0.x's accepted CitsBaseReport arm. */
    public static void cits(Object report){capture(()->announce(report,null,null,"notice",false,"cits",app));}
    /** Native qh7/category decisions have already accepted this bus publication. */
    public static void notificationState(Object notification){capture(()->{
        if(!captureEnabled)return;
        if(notification==null){if(notificationId!=null)clear(notificationId);notificationId=null;return;}
        Bundle fields=describe(notification);String id=identity(notification,fields);
        if(notificationId!=null&&!notificationId.equals(id))clear(notificationId);
        if(notificationControlled.size()>=MAX_WARNINGS&&!notificationControlled.contains(id)){overflow();return;}
        notificationControlled.add(id);notificationId=id;
        Record old=records.get(id);String supplied=old!=null&&fields.getString("native_text_key").equals(old.fields.getString("native_text_key"))?old.fields.getString("message"):null;
        NativeWarningText.Text text=NativeWarningText.resolve(app,notification,"notice",supplied);
        fields.putString("language_tag",text.language);
        update(id,fields,text.value,text.origin,"notice",false,false,"early_notification_state",false);
    });}
    /** Link the actual UI object to the accepted CITS report; UI redispatch never announces. */
    public static void bindProjection(Object projection,Object report){capture(()->{
        if(!captureEnabled||projection==null||report==null)return;
        Bundle fields=describe(report);String id=identity(report,fields);linkProjection(projection,id);
        Record old=records.get(id);boolean sameText=old!=null&&fields.getString("native_text_key").equals(old.fields.getString("native_text_key"));
        NativeWarningText.Text text;
        if(sameText){
            text=new NativeWarningText.Text(old.fields.getString("message",""),old.fields.getString("message_origin","native_text"),old.fields.getString("language_tag","und"));
            copyNativeTextFields(old.fields,fields);
        }else{
            text=NativeWarningText.resolve(app,report,"notice",null);
            if(old!=null&&old.fields.containsKey("native_announced_text"))text=new NativeWarningText.Text(old.fields.getString("native_announced_text"),"native_text",old.fields.getString("native_announced_language_tag","und"));
            text=citsInstruction(report,fields,text,"notice");
        }
        fields.putString("language_tag",text.language);update(id,fields,text.value,text.origin,"notice",false,false,"cits_projection_state",false);
    });}
    public static void earlyRemoved(Object report){capture(()->{if(report!=null)clear(identity(report,describe(report)));});}
    /** Native ImpactAttenuator feature gate and conversion have already succeeded. */
    public static void impact(Object event,Object projection,Context context){impact(event,projection,context,true);}
    public static void impactUpdate(Object event,Object projection,Context context){impact(event,projection,context,false);}
    private static void impact(Object event,Object projection,Context context,boolean announce){capture(()->{
        if(!captureEnabled||projection==null)return;
        Bundle fields=describe(projection);fields.putString("native_family","ImpactAttenuator");fields.putString("native_type","EARLY_WARNING");
        fields.putString("native_subtype","IMPACT_ATTENUATOR");fields.putString("category","roadworks");fields.putInt("priority",1);
        String id="cits/ImpactAttenuator:"+citsId(event);linkProjection(projection,id);
        String text=join(value(projection,"getTitle"),value(projection,"getSubTitle"));
        fields.putString("language_tag",contextLanguage(context));fields.putBoolean("native_announce_observed",announce);
        update(id,fields,text,"native_resource","notice",announce&&NativeWarningText.useful(text),false,"impact_native",false);
    });}
    public static void impactRemoved(Object event){capture(()->{if(isFamily(event,"ImpactAttenuator"))clear("cits/ImpactAttenuator:"+citsId(event));});}
    /** Accepted traffic-light advice is native display state; it has no speech authority. */
    public static void vriState(Object wrapper){capture(()->{
        if(!captureEnabled||wrapper==null)return;Object report=optional(wrapper,"getSpeedAdvice");if(report==null)return;
        Bundle fields=describe(report);String id=identity(report,fields);
        if(!Boolean.TRUE.equals(optional(wrapper,"getAdded"))){clear(id);return;}
        fields.putString("category","speed_advice");Object speed=optional(report,"getAdviceKph");
        if(speed instanceof Number&&((Number)speed).intValue()>=0)fields.putInt("native_advice_kmh",((Number)speed).intValue());
        Object trafficLight=optional(report,"isTrafficLight");
        if(trafficLight instanceof Boolean)fields.putBoolean("native_is_traffic_light",(Boolean)trafficLight);
        NativeWarningText.Text text=NativeWarningText.resolve(app,report,"active",null);fields.putString("language_tag",text.language);
        update(id,fields,text.value,text.origin,"active",false,false,"vri_state",false);
    });}
    private static String citsId(Object event){try{return string(event.getClass().getField("info").get(event).getClass().getMethod("getEventID").invoke(event.getClass().getField("info").get(event)));}catch(ReflectiveOperationException error){overflow();return "unavailable";}}
    private static void linkProjection(Object object,String id){
        if(projectionIds.size()>=MAX_WARNINGS&&!projectionIds.containsKey(object)){overflow();return;}
        projectionIds.put(object,id);suppressedProjections.put(object,SystemClock.elapsedRealtime()+30000);
    }
    /** The immediately following synchronous CITS UI projection is the same native authority. */
    public static void suppressNextProjection(){citsProjection.set(SystemClock.elapsedRealtime()+1000);}
    /** Pin the actual converted object before CITS publishes it to its UI bus. */
    public static void suppressProjection(Object warning){capture(()->{
        long now=SystemClock.elapsedRealtime();suppressedProjections.entrySet().removeIf(e->e.getValue()<now);
        if(suppressedProjections.size()<MAX_WARNINGS)suppressedProjections.put(warning,now+1000);
    });}
    public static void presentation(Context context,Object warning,boolean announce) {
        capture(()->{
            if(!captureEnabled)return;
            if(app==null&&context!=null)app=context.getApplicationContext();
            if(warning==null){if(presentationId!=null)clear(presentationId);presentationId=null;return;}
            Long until=citsProjection.get();citsProjection.remove();
            if(announce&&until!=null&&SystemClock.elapsedRealtime()<=until)return;
            Long projectedUntil=suppressedProjections.get(warning);
            if(announce&&projectedUntil!=null&&SystemClock.elapsedRealtime()<=projectedUntil)return;
            if(projectionIds.containsKey(warning))return;
            Bundle fields=describe(warning);String text=join(value(warning,"getTitle"),value(warning,"getSubTitle"));
            String id=!announce&&presentationId!=null?presentationId:identity(warning,fields);
            if(presentationId!=null&&!presentationId.equals(id))clear(presentationId);
            presentationId=id;
            fields.putBoolean("native_announce_observed",announce);
            update(id,fields,text,"native_resource","notice",announce&&NativeWarningText.useful(text),false,"early_presentation",false);
        });
    }
    /** Snapshot updates never create announcement authority. */
    public static void reports(Object values) {
        if(!(values instanceof Collection))return;
        capture(()->{
            if(!captureEnabled)return;
            // A partial snapshot cannot authorize clearing an unseen native warning.
            if(((Collection<?>)values).size()>MAX_WARNINGS){overflow();return;}
            Set<String> seen=new HashSet<>();int count=0;
            for(Object entry:(Collection<?>)values){
                if(++count>MAX_WARNINGS){overflow();return;}
                if(!Boolean.TRUE.equals(optional(entry,"isActive")))continue;
                Object report=optional(entry,"getReport");if(report==null)continue;
                Bundle fields=describe(report);String id=identity(report,fields);seen.add(id);
                Record old=records.get(id);
                boolean current=old!=null&&!"CLEAR".equals(old.fields.getString("operation"));
                boolean sameText=current&&java.util.Objects.equals(fields.getString("native_text_key"),old.fields.getString("native_text_key"))
                        &&java.util.Objects.equals(fields.getString("native_type"),old.fields.getString("native_type"))
                        &&java.util.Objects.equals(fields.getString("native_subtype"),old.fields.getString("native_subtype"));
                // A generic UI subtitle may omit the warning kind or format a missing road as
                // "null". State-only arrivals use the same audited model-aware text as speech.
                NativeWarningText.Text initial=sameText?null:NativeWarningText.resolve(app,report,"active",null);
                if(!sameText){
                    if(current&&old.fields.containsKey("native_announced_text"))initial=new NativeWarningText.Text(old.fields.getString("native_announced_text"),"native_text",old.fields.getString("native_announced_language_tag","und"));
                    initial=citsInstruction(report,fields,initial,"active");
                }
                String text=sameText?old.fields.getString("message",""):initial.value;
                String origin=sameText?old.fields.getString("message_origin","native_resource"):initial.origin;
                String phase=!current?"active":old.fields.getString("phase","active");
                if(sameText){
                    fields.putString("language_tag",old.fields.getString("language_tag","und"));
                    copyNativeTextFields(old.fields,fields);
                    for(String key:new String[]{"native_text_key","template_id"})if(old.fields.containsKey(key))fields.putString(key,old.fields.getString(key));
                }else fields.putString("language_tag",initial.language);
                aheadDistance(fields,report,SystemClock.elapsedRealtime());
                update(id,fields,text,origin,phase,false,false,"report_state",true);
                Record listed=records.get(id);if(listed!=null)listed.report=new java.lang.ref.WeakReference<>(report);
            }
            for(String id:new ArrayList<>(records.keySet())){
                Record record=records.get(id);
                if(record.listed&&!seen.contains(id)&&!"exit".equals(record.fields.getString("phase")))clear(id);
            }
        });
    }
    /**
     * Per FM location fix: attach FM's own look-ahead distance (measured along the road it
     * matched ahead) to still-alerted reports and renew their display state. Never announces,
     * clears or changes identity; a report missing from the look-ahead keeps no distance.
     */
    public static void ahead(){capture(()->{
        if(!captureEnabled)return;
        long now=SystemClock.elapsedRealtime();List<?> entries=aheadEntries();
        for(Map.Entry<String,Record> item:new ArrayList<>(records.entrySet())){
            Record record=item.getValue();Bundle old=record.fields;
            if(!(record.listed||record.visible)||old==null||"CLEAR".equals(old.getString("operation"))||"exit".equals(old.getString("phase")))continue;
            Object report=record.report==null?null:record.report.get();if(report==null)continue;
            Bundle fields=new Bundle(old);
            if(!"native_lookahead".equals(fields.getString("distance_origin"))&&fields.containsKey("distance_m"))continue;
            for(String key:new String[]{"distance_m","distance_observed_elapsed_ms","distance_estimated","distance_origin","native_ahead_on_road"})fields.remove(key);
            Double distance=aheadDistance(fields,report,entries,now);
            boolean had=old.containsKey("distance_m")&&"native_lookahead".equals(old.getString("distance_origin"));
            boolean moved=distance!=null&&had&&Math.abs(distance-old.getInt("distance_m"))>=DISTANCE_STEP_M;
            long age=now-record.emittedAt;
            if(!(moved||(distance!=null)!=had||distance!=null&&age>=DISTANCE_RENEW_MS||age>=STATE_RENEW_MS))continue;
            for(String key:new String[]{"protocol_version","provider_session","sequence","issued_elapsed_ms","announce_until_elapsed_ms"})fields.remove(key);
            String path="visible_state".equals(old.getString("capture_path"))?"visible_state":"report_state";
            update(item.getKey(),fields,fields.getString("message",""),fields.getString("message_origin","native_resource"),fields.getString("phase","active"),false,false,path,record.listed);
        }
    });}
    private static void aheadDistance(Bundle fields,Object report,long now){
        if(fields.containsKey("distance_m"))return;
        aheadDistance(fields,report,aheadEntries(),now);
    }
    private static Double aheadDistance(Bundle fields,Object report,List<?> entries,long now){
        if(entries==null||report==null)return null;
        for(Object entry:entries){
            Object base=optional(entry,"getBaseReport");if(base==null||base!=report&&!base.equals(report))continue;
            Object distance=optional(entry,"getDistanceInMeters");if(!(distance instanceof Number))return null;
            double value=((Number)distance).doubleValue();if(!Double.isFinite(value)||value<0||value>1000000)return null;
            fields.putInt("distance_m",(int)Math.round(value));fields.putLong("distance_observed_elapsed_ms",now);fields.putBoolean("distance_estimated",false);
            fields.putString("distance_origin","native_lookahead");
            Object onRoad=optional(entry,"isOnLookAheadPolyline");if(onRoad instanceof Boolean)fields.putBoolean("native_ahead_on_road",(Boolean)onRoad);
            return value;
        }
        return null;
    }
    /** FM15 publishes its road-matched reports ahead through this StateFlow; older FM has none. */
    private static List<?> aheadEntries(){
        try{
            Class<?> bridge=Class.forName("nl.flitsmeister.fmcore.service.lookahead.RelevantReportsAheadBridge");
            Object flow=bridge.getMethod("getRelevantReports").invoke(bridge.getField("INSTANCE").get(null));
            Object value=flow==null?null:flow.getClass().getMethod("getValue").invoke(flow);
            return value instanceof List?(List<?>)value:null;
        }catch(ReflectiveOperationException|RuntimeException unavailable){return null;}
    }
    public static void stopped(){capture(()->{for(AwaitingSound waiting:new ArrayList<>(awaitingSound))waiting.emit.run();awaitingSound.clear();for(String id:new ArrayList<>(records.keySet()))clear(id);captureEnabled=false;anonymous.clear();suppressedProjections.clear();projectionIds.clear();notificationControlled.clear();notificationId=null;presentationId=null;citsProjection.remove();resetCits();EarlyWarningGeometry.clear();});}
    private static synchronized void capture(Runnable action){
        try{
            long now=SystemClock.elapsedRealtime();
            records.entrySet().removeIf(e->now>=e.getValue().fields.getLong("state_until_elapsed_ms"));
            anonymous.entrySet().removeIf(e->!records.containsKey(e.getValue()));
            suppressedProjections.entrySet().removeIf(e->now>e.getValue());
            projectionIds.entrySet().removeIf(e->!records.containsKey(e.getValue()));
            notificationControlled.removeIf(id->!records.containsKey(id));
            citsAliases.entrySet().removeIf(e->now>=e.getValue().until&&!records.containsKey(e.getValue().warningId));citsFacts.entrySet().removeIf(e->now>=e.getValue().until&&!records.containsKey(e.getKey()));
            action.run();
        }catch(RuntimeException error){Log.w("NativeWarnings","Capture unavailable: "+error.getClass().getSimpleName());}
    }
    private static void announce(Object report,Bundle fields,String supplied,String phase,boolean bypass,String path,Context context) {
        if(!captureEnabled||report==null)return;announceFields(report,fields==null?describe(report):fields,supplied,phase,bypass,path,context);
    }
    private static void announceFields(Object report,Bundle fields,String supplied,String phase,boolean bypass,String path,Context context) {
        NativeWarningText.Text text=citsInstruction(report,fields,NativeWarningText.resolve(context,report,phase,supplied),phase);fields.putString("language_tag",text.language);
        SourceFact fact=citsAliases.get(report);
        if(fact!=null&&!fact.selectedLanguage.equals("und")&&text.value.equals(NativeWarningText.free(report)))fields.putString("language_tag",fact.selectedLanguage);
        fields.putBoolean("native_announce_observed",true);
        if(chosenSound!=null)fields.putString("native_sound",chosenSound);
        if(text.origin.equals("template"))fields.putString("template_id","fm_native_exit_v1");
        update(identity(report,fields),fields,text.value,text.origin,phase,NativeWarningText.useful(text.value),bypass,path,false);
    }
    private static NativeWarningText.Text citsInstruction(Object report,Bundle fields,NativeWarningText.Text announced,String phase){
        SourceFact fact=citsAliases.get(report);String instruction=NativeWarningText.free(report);
        if(fact==null||phase.equals("exit")||!NativeWarningText.useful(instruction))return announced;
        fields.putString("native_announced_text",announced.value);fields.putString("native_announced_language_tag",announced.language);
        fields.putString("native_instruction",instruction);fields.putString("native_instruction_language_tag",fact.selectedLanguage);
        return NativeWarningText.withInstruction(announced,instruction,fact.selectedLanguage);
    }
    private static void copyNativeTextFields(Bundle from,Bundle to){
        for(String key:new String[]{"native_announced_text","native_announced_language_tag","native_instruction","native_instruction_language_tag","language_origin"})
            if(from.containsKey(key))to.putString(key,from.getString(key));
    }
    private static void update(String id,Bundle fields,String text,String origin,String phase,boolean announce,boolean bypass,String path,boolean listed) {
        Record record=records.get(id);
        if(record==null){if(records.size()>=MAX_WARNINGS){overflow();return;}record=new Record();records.put(id,record);}
        if(record.fields!=null&&record.fields.containsKey("zone_point")&&!fields.containsKey("zone_point")&&!"exit".equals(phase)
                &&!"producer_zone_state".equals(path)&&"AvgSpeedCheck".equals(fields.getString("native_family")))keepZoneGeometry(record.fields,fields);
        fields.putString("message",text);fields.putString("message_origin",origin);if(!fields.containsKey("language_tag"))fields.putString("language_tag",language());fields.putString("phase",phase);
        SourceFact source=citsFacts.get(id);
        if(source!=null&&!source.selectedLanguage.equals("und")&&NativeWarningText.hash(text).equals(source.selectedTextHash)){
            fields.putString("language_tag",source.selectedLanguage);fields.putString("language_origin","native_free_text_where");
        }
        if(!fields.containsKey("relationship"))fields.putString("relationship","unknown");
        // State refreshes of the same announcement keep FM's chosen sound; receivers speak the latest
        // revision. A new announcement carries only its own choice.
        if(!announce&&record.fields!=null&&!fields.containsKey("native_sound")&&record.fields.containsKey("native_sound"))
            fields.putString("native_sound",record.fields.getString("native_sound"));
        if(record.fields!=null&&semanticChange(record.fields,fields))record.revision++;
        if(announce)record.index=++announcementCounter;
        long now=SystemClock.elapsedRealtime();
        fields.putString("warning_id",id);fields.putLong("revision",record.revision);fields.putLong("announcement_index",record.index);
        fields.putString("phase",phase);fields.putString("operation",announce?"ANNOUNCE":"UPSERT");
        fields.putString("message",text);fields.putString("message_origin",origin);
        fields.putLong("observed_elapsed_ms",now);
        long displayAge=fields.getLong("display_max_age_ms",30000);
        fields.putLong("state_until_elapsed_ms",now+Math.max(1,Math.min(30000,displayAge)));
        fields.putString("capture_path",path);fields.putBoolean("native_local_mute_bypass",bypass);
        fields.putString("relevance",relevance(fields,phase));
        if(!NativeWarningText.useful(text)&&!"display_only".equals(fields.getString("category")))fields.putString("capture_diagnostic","MISSING_NATIVE_TEXT");
        record.fields=new Bundle(fields);record.listed|=listed;record.emittedAt=now;emit(fields);
    }
    private static void clear(String id){
        Record record=records.get(id);if(record==null||"CLEAR".equals(record.fields.getString("operation")))return;
        Bundle fields=new Bundle();fields.putString("operation","CLEAR");fields.putString("warning_id",id);
        fields.putLong("revision",record.revision);fields.putLong("announcement_index",record.index);long now=SystemClock.elapsedRealtime();
        fields.putLong("observed_elapsed_ms",now);fields.putLong("state_until_elapsed_ms",now+30000);
        record.fields=fields;record.listed=false;emit(fields);
    }
    private static void emit(Bundle fields){nl.johninnl.navigation.alerts.IndicatorContract.annotate(fields);if(testSink!=null)testSink.accept(new Bundle(fields));else if(endpoint!=null)endpoint.emit(fields);}
    private static Bundle describe(Object report){
        Bundle b=new Bundle();String family=report.getClass().getSimpleName();
        b.putString("native_family",family);String type=value(report,"getReportType"),sub="";
        if(isFamily(report,"EarlyWarningReport"))sub=value(report,"getEarlyWarningTypeEnum");
        else if(isFamily(report,"EarlyWarningNotification")){type="EARLY_WARNING";sub=value(report,"getType");}
        else if(isFamily(report,"CitsLaneClosed")){
            sub=value(report,"getLaneClosedType");Object lane=optional(report,"getLaneIndex"),count=optional(report,"getNumberOfLanesClosed"),nativeType=optional(report,"getLaneClosedType");
            if(lane instanceof Number&&((Number)lane).intValue()>=0)b.putInt("lane_index",((Number)lane).intValue());
            if(count instanceof Number&&((Number)count).intValue()>=0)b.putInt("number_of_lanes_closed",((Number)count).intValue());
            if(nativeType instanceof Enum)b.putString("native_lane_code",String.valueOf(nativeType));
        }
        else if(isFamily(report,"CitsWeather")){
            for(Class<?> model=report.getClass();model!=null;model=model.getSuperclass())if(model.getSimpleName().equals("CitsWeather"))try{
                java.lang.reflect.Field field=model.getDeclaredField("mWeatherType");field.setAccessible(true);sub=string(field.get(report));break;
            }catch(ReflectiveOperationException unavailable){b.putString("capture_diagnostic","MISSING_NATIVE_WEATHER_TYPE");}
        }
        else if(isFamily(report,"Incident"))sub=value(report,"getIncidentType");
        else if(isFamily(report,"SpeedCam"))sub=value(report,"getSpeedCamType");
        else if(isFamily(report,"ServiceVehicle"))sub=value(report,"getType");
        if(type.isEmpty())type=family;
        b.putString("native_type",type);if(!sub.isEmpty())b.putString("native_subtype",sub);
        if(isFamily(report,"EarlyWarningNotification")||isFamily(report,"EarlyWarningReport")){
            Object notification=isFamily(report,"EarlyWarningReport")?optional(report,"getNotification"):report;
            Object distance=optional(report,"getDistance");
            Object maximum=notification==null?null:optional(notification,"getMaxDistance");
            Object heading=optional(report,"getHeading");
            nativeEarlyGeometry(b,distance,maximum,heading,SystemClock.elapsedRealtime());
        }
        b.putString("native_text_key",NativeWarningText.fingerprint(report,app));
        b.putString("category",category(type,sub));b.putInt("priority",priority(type,sub));
        // This is the native early emergency model, distinct from an ordinary road-service incident.
        if(sub.equals("ROAD_SERVICE")&&(isFamily(report,"EarlyWarningReport")||isFamily(report,"EarlyWarningNotification"))){b.putString("category","emergency_vehicle");b.putInt("priority",0);}
        if(isFamily(report,"CitsRoadWorks")){b.putString("category","roadworks");b.putInt("priority",1);}
        SourceFact fact=citsAliases.get(report);
        if(fact!=null){b.putString("native_source_event",fact.type);
            if(fact.type.equals("StationaryEmergencyVehicle")){b.putString("category","emergency_vehicle");b.putString("native_source_motion","stationary");b.putInt("priority",1);}
            else if(fact.type.equals("IncomingEmergencyVehicle")){b.putString("category","emergency_vehicle");b.putString("native_source_motion","incoming");b.putInt("priority",0);}}
        Object original=optional(report,"getLocation");
        boolean fixedPoint=isFamily(report,"SpeedCam")||isFamily(report,"SpeedTrap")||isFamily(report,"PoliceHotspot")
            ||(isFamily(report,"Incident")&&optional(report,"getGpsPath")==null)
            ||sub.equals("BRIDGE_CLOSED")||sub.equals("RAILWAY_CROSSING")||sub.equals("UNSECURED_RAILWAY_CROSSING")
            ||sub.equals("BE_RAILWAY_CROSSING")||sub.equals("BE_UNSECURED_RAILWAY_CROSSING");
        if(original instanceof Location){Location l=(Location)original;long at=l.getElapsedRealtimeNanos()/1000000,now=SystemClock.elapsedRealtime();
            if(at==0&&fixedPoint){at=now;b.putString("position_clock_origin","native_decision");}
            else if(at>0)b.putString("position_clock_origin","native_geometry");
            if(at>0&&at<=now&&Double.isFinite(l.getLatitude())&&Double.isFinite(l.getLongitude())){
                b.putDouble("latitude",l.getLatitude());b.putDouble("longitude",l.getLongitude());b.putLong("position_observed_elapsed_ms",at);b.putBoolean("position_estimated",false);
                if(fixedPoint)b.putBoolean("native_point_target",true);
            }else b.remove("position_clock_origin");}
        if(isFamily(report,"EarlyWarningNotification")||isFamily(report,"EarlyWarningReport")){
            Object notification=isFamily(report,"EarlyWarningReport")?optional(report,"getNotification"):report;
            if(notification!=null)EarlyWarningGeometry.append(b,notification,optional(report,"getDistance"),optional(notification,"getMaxDistance"),optional(report,"getHeading"),SystemClock.elapsedRealtime());
        }
        return b;
    }
    /** Raw values read at this callback, not a claim about the source measurement time. */
    static void nativeEarlyGeometry(Bundle fields,Object distance,Object maximum,Object heading,long readAt){
        if(readAt<0)return;
        boolean present=false;
        if(distance instanceof Number){double value=((Number)distance).doubleValue();
            if(Double.isFinite(value)&&value>=0&&value<=1000000){fields.putDouble("native_early_distance_m",value);present=true;}}
        if(maximum instanceof Number){double value=((Number)maximum).doubleValue();
            if(Double.isFinite(value)&&value>0&&value<=1000000){fields.putDouble("native_early_max_distance_m",value);present=true;}}
        if(heading instanceof Number){double value=((Number)heading).doubleValue();
            if(Double.isFinite(value)&&value>=0&&value<=360){fields.putDouble("native_early_heading_degrees",value);present=true;}}
        if(present)fields.putLong("native_early_geometry_read_elapsed_ms",readAt);
    }
    private static String identity(Object model,Bundle fields){
        SourceFact alias=citsAliases.get(model);if(alias!=null)return alias.warningId;
        if(isFamily(model,"EarlyWarningNotification")||isFamily(model,"EarlyWarningReport")){
            String id=isFamily(model,"EarlyWarningReport")?value(model,"getId"):value(model,"getName");
            if(id.isEmpty())id=value(model,"getCode");
            if(!id.isEmpty())return "early/"+fields.getString("native_subtype","")+":"+id;
        }
        String id=value(model,"getId");if(id.isEmpty())id=value(model,"getCode");
        if(id.isEmpty()){id=anonymous.get(model);if(id==null){if(anonymous.size()>=MAX_WARNINGS){overflow();return fields.getString("native_family","")+":overflow";}id=fields.getString("native_family","")+":"+UUID.randomUUID().toString();anonymous.put(model,id);}return id;}
        return fields.getString("native_family","")+":"+id;
    }
    private static boolean semanticChange(Bundle old,Bundle next){
        // FM's per-fix look-ahead distance is display geometry; it never re-versions the warning.
        boolean lookahead="native_lookahead".equals(old.getString("distance_origin"))||"native_lookahead".equals(next.getString("distance_origin"));
        for(String key:new String[]{"native_type","native_subtype","native_family","native_text_key","native_advice_kmh","native_is_traffic_light","native_source_event","native_source_motion","native_instruction","native_instruction_language_tag","native_announced_text","lane_index","number_of_lanes_closed","native_early_distance_m","native_early_max_distance_m","native_early_heading_degrees","distance_m","distance_observed_elapsed_ms","range_m","range_observed_elapsed_ms","relative_bearing_degrees","relationship","relationship_observed_elapsed_ms","road_speed_limit_kmh","category","priority","phase","message","message_origin","language_tag","latitude","longitude","position_observed_elapsed_ms","position_estimated","zone_point"})
            if(!(lookahead&&key.startsWith("distance_"))&&!java.util.Objects.equals(old.get(key),next.get(key)))return true;
        return false;
    }
    private static void overflow(){if(endpoint!=null)endpoint.captureOverflow();}
    private static String category(String type,String subtype){
        if(type.equals("BASEREPORT")||type.equals("LBA")||type.equals("CITS_PARKING")||type.equals("FM_OFFICE")
                ||type.equals("PARKED_LOCATION")||type.equals("TOLLING")||type.equals("ENVIRONMENTAL_ZONE"))return "display_only";
        if(type.equals("SPEED_CAM")&&subtype.equals("TRAFFIC_CAMERA"))return "traffic_camera";
        if(type.equals("SPEED_CAM")||type.equals("SPEED_TRAP")||type.equals("AVG_SPEED_CHECK"))return "speed_control";
        if(subtype.equals("AMBULANCE")||subtype.equals("FIRE_DEPARTMENT")||subtype.equals("POLICE"))return "emergency_vehicle";
        if(type.equals("SERVICE_VEHICLE"))return "service_vehicle";
        if(type.equals("SLOW_MOVING_VEHICLE"))return "slow_vehicle";
        if(type.equals("CITS_SPEED_ADVICE"))return "speed_advice";
        if(type.equals("CITS_WEATHER"))return "weather";
        if(type.equals("CITS_BRIDE_CLOSED")||type.equals("CITS_LANE_CLOSED")||subtype.equals("ROAD_CLOSURE")||subtype.equals("CLOSURE_WITH_REROUTE"))return "closure";
        if(subtype.equals("ROADWORKS")||subtype.equals("ROAD_WORKER")||subtype.equals("TEXT_CAR")||subtype.equals("TRAFFIC_CONTROLLER"))return "roadworks";
        if(type.equals("POLICEHOTSPOT")||subtype.equals("CONTROL"))return "police_control";
        if(type.equals("TRAFFIC_JAM"))return "traffic";return "road_danger";
    }
    private static int priority(String type,String subtype){
        if(subtype.equals("WRONG_WAY_DRIVER")||subtype.equals("PERSON_ON_ROAD")||subtype.equals("AMBULANCE")||subtype.equals("FIRE_DEPARTMENT")||subtype.equals("POLICE"))return 0;
        if(type.equals("SPEED_CAM")&&(subtype.equals("TRAFFIC_CAMERA")||subtype.equals("OTHER")))return 2;
        if(type.equals("SPEED_CAM")||type.equals("SPEED_TRAP")||type.equals("AVG_SPEED_CHECK")||type.equals("POLICEHOTSPOT")
                ||type.equals("CITS_BRIDE_CLOSED")||type.equals("CITS_LANE_CLOSED")||type.equals("SERVICE_VEHICLE")||type.equals("SLOW_MOVING_VEHICLE")
                ||subtype.equals("ACCIDENT")||subtype.equals("OBSTACLE")||subtype.equals("CONTROL")||subtype.equals("ROAD_CLOSURE")||subtype.equals("CLOSURE_WITH_REROUTE")
                ||subtype.equals("ROADWORKS")||subtype.equals("ROAD_WORKER")||subtype.equals("TEXT_CAR")||subtype.equals("TRAFFIC_CONTROLLER")
                ||subtype.equals("RAILWAY_CROSSING")||subtype.equals("UNSECURED_RAILWAY_CROSSING")||subtype.equals("BE_RAILWAY_CROSSING")||subtype.equals("BE_UNSECURED_RAILWAY_CROSSING")||subtype.equals("BRIDGE_CLOSED"))return 1;
        return 2;
    }
    private static String relevance(Bundle fields,String phase){
        if(phase.equals("exit"))return "exit";
        String type=fields.getString("native_type",""),sub=fields.getString("native_subtype","");
        if(fields.getString("native_source_motion","").equals("stationary"))return "notice";
        if(fields.getString("category","").equals("emergency_vehicle"))return "moving_emergency";
        if(type.equals("AVG_SPEED_CHECK"))return "zone";
        if(type.equals("SPEED_CAM")||type.equals("SPEED_TRAP")||type.equals("POLICEHOTSPOT"))return "point_ahead";
        if(fields.getBoolean("native_point_target",false))return "point_ahead";
        return "notice";
    }
    private static boolean isFamily(Object object,String name){for(Class<?> c=object.getClass();c!=null;c=c.getSuperclass())if(c.getSimpleName().equals(name))return true;return false;}
    private static Object optional(Object object,String method){if(object==null)return null;try{return object.getClass().getMethod(method).invoke(object);}catch(ReflectiveOperationException ignored){return null;}}
    private static String value(Object object,String method){return string(optional(object,method));}
    private static String string(Object value){return value==null?"":value instanceof Enum?((Enum<?>)value).name():String.valueOf(value);}
    private static String join(String a,String b){return a.isEmpty()?b:b.isEmpty()?a:a+". "+b;}
    private static String language(){if(app!=null){android.os.LocaleList locales=app.getResources().getConfiguration().getLocales();if(!locales.isEmpty())return locales.get(0).toLanguageTag();}return "und";}
    private static String contextLanguage(Context context){if(context!=null){android.os.LocaleList locales=context.getResources().getConfiguration().getLocales();if(!locales.isEmpty())return locales.get(0).toLanguageTag();}return "und";}
    private static void resetCits(){convertingCits.remove();citsAliases.clear();citsFacts.clear();countrySamples.clear();countryObserved.clear();previousRoadLimit=null;}
    /** Tests opt in to FM's asynchronous sound choice; existing tests observe immediate announcements. */
    static synchronized void awaitSoundForTest(boolean value){awaitSound=value;}
    static synchronized void resetForTest(Context context,Consumer<Bundle> sink){app=context;testSink=sink;captureEnabled=true;awaitSound=false;awaitingSound.clear();chosenSound=null;announcementCounter=0;records.clear();anonymous.clear();suppressedProjections.clear();projectionIds.clear();notificationControlled.clear();notificationId=null;presentationId=null;citsProjection.remove();resetCits();EarlyWarningGeometry.clear();}
    static synchronized void setEndpointForTest(WarningEndpoint value){
        EarlyWarningGeometry.clear();
        if(endpoint!=null&&endpoint!=value)endpoint.close();endpoint=value;app=null;testSink=null;captureEnabled=false;awaitSound=true;awaitingSound.clear();chosenSound=null;
        announcementCounter=0;records.clear();anonymous.clear();suppressedProjections.clear();projectionIds.clear();notificationControlled.clear();notificationId=null;presentationId=null;citsProjection.remove();resetCits();
    }
}
