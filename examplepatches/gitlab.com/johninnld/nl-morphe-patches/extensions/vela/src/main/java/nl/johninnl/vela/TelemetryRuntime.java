package nl.johninnl.vela;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.location.Location;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.Collections;
import java.util.WeakHashMap;
import java.lang.ref.WeakReference;
import java.lang.reflect.Proxy;
import nl.johninnl.navigation.alerts.WarningScheduler;
import nl.johninnl.navigation.alerts.WarningPreferences;
import nl.johninnl.navigation.alerts.WarningEvent;
import nl.johninnl.navigation.alerts.WarningAudioOwner;
import nl.johninnl.navigation.alerts.PlaybackGrant;
import nl.johninnl.navigation.alerts.WarningPassage;
import nl.johninnl.navigation.alerts.WarningStatus;
import nl.johninnl.navigation.alerts.WarningProviders;

/** One process-wide consumer shared by the native phone and car UI. No network or GPS requests. */
public final class TelemetryRuntime {
    private static nl.johninnl.navigation.startup.NavigationClient startup;
    private static nl.johninnl.navigation.alerts.WarningSession semantic;
    private static final nl.johninnl.navigation.alerts.WarningView nativeWarnings=new nl.johninnl.navigation.alerts.WarningView();
    private static final VelaWarningSpeaker nativeSpeaker=new VelaWarningSpeaker();
    private static WarningScheduler scheduler;
    private static WarningPreferences warningPreferences;
    private static boolean changingSource;
    private static boolean eventAudioManaged;
    private static final Runnable SEMANTIC_RENDER=()->publish(true);
    private static void semanticRender(){MAIN.removeCallbacks(SEMANTIC_RENDER);MAIN.post(SEMANTIC_RENDER);}
    private TelemetryRuntime() {}
    public static final String ACTION="nl.johninnl.navigation.NAVIGATION_STATE";
    public static final String REQUEST="nl.johninnl.navigation.NAVIGATION_STATE_REQUEST";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static TelemetryStore store=new TelemetryStore();
    private static Context app;
    private static SharedPreferences prefs;
    private static Runnable changed=()->{};
    private static BroadcastReceiver receiver;
    private static SharedPreferences.OnSharedPreferenceChangeListener preferenceListener;
    private static String lastKey="",warning="";
    private static volatile Location lastFix;
    private static volatile long fixAt=-1;
    private static long phoneAt=-10000,carAt=-10000;
    private static boolean phoneUnknown,phoneBrowse;
    private static final RoadWarningEngine WARNINGS=new RoadWarningEngine();
    private static Object voice;
    private static volatile Object navSession,locationProvider;
    private static Object routeReference;
    private static RoadWarningEngine.Route warningRoute;
    private static volatile boolean nativeSpeedKnown;
    private static volatile long nativeSpeedAt=-1;
    private static volatile Double phoneNativeLimit;
    private static volatile RoadWarningEngine.Warning currentWarning;
    private static boolean carActive,navigationActive;
    private static final Map<Object,Object> carObservers=new WeakHashMap<>();
    private static final Set<Object> visibleCarSessions=Collections.newSetFromMap(new WeakHashMap<>());
    private static void main(Runnable action) { if(Looper.myLooper()==Looper.getMainLooper())action.run();else MAIN.post(action); }

    public static void init(Context context,Runnable onChanged) {
        main(()->{
            if(app!=null)return;
            app=context.getApplicationContext();prefs=app.getSharedPreferences("vela_settings",Context.MODE_PRIVATE);changed=onChanged;
            warningPreferences=new WarningPreferences(prefs,false,warningProvider(prefs.getString("morphe_telemetry_provider","")));
            scheduler=new WarningScheduler(new WarningScheduler.Policy(){
                public boolean active(){return warningPreferences.reviewed()&&WarningProviders.supported(selected())&&(nativeGuidance()||carActive()||SystemClock.elapsedRealtime()-phoneAt<=5000||startup!=null&&startup.activeSession());}
                public WarningAudioOwner.Mode mode(){return warningPreferences.mode();}
                public boolean projected(){return !visibleCarSessions.isEmpty();}
                public boolean enabled(WarningEvent event){return warningPreferences.enabled(event);}
                public boolean passed(WarningEvent event,long now){
                    Boolean guidance=sessionGuidanceState();
                    if(guidance==null)return false;
                    RoadWarningEngine.Route route=nativeRoute();Location fix=lastFix;
                    if(guidance)return route!=null&&fix!=null&&event.latitude!=null&&event.longitude!=null&&WarningPassage.passedOnRoute(event,fix,now,route.passageDistance(fix.getLatitude(),fix.getLongitude(),event.latitude,event.longitude,fix.hasAccuracy()?fix.getAccuracy():Double.NaN));
                    return WarningPassage.passed(event,fix,now);
                }
                public WarningPassage.Relevance relevance(WarningEvent event,long now){
                    return warningRelevance(event,now);
                }
            },new WarningScheduler.Speaker(){
                public void prepare(String language){nativeSpeaker.prepare(language);}
                public void prepare(String language,WarningAudioOwner.Mode mode){nativeSpeaker.prepare(language,mode);}
                public boolean ready(String language,WarningAudioOwner.Mode mode){return nativeSpeaker.isReady(language,mode);}
                public boolean ready(WarningEvent event,WarningAudioOwner.Mode mode){return nativeSpeaker.canSpeak(event,mode);}
                public WarningAudioOwner.Mode effective(WarningAudioOwner.Mode mode){return nativeSpeaker.effectiveMode(mode);}
                public String defaultLanguage(){return WarningScheduler.systemLanguage();}
                public boolean speak(WarningEvent event,PlaybackGrant grant,long deadline,WarningScheduler.Callback callback){return nativeSpeaker.speak(event,grant,deadline,new VelaWarningSpeaker.Listener(){public void started(PlaybackGrant value){callback.started(value);}public void finished(PlaybackGrant value,PlaybackGrant.Outcome outcome,boolean quiet){callback.finished(value,outcome,quiet);}});}
                public void cancel(PlaybackGrant grant){nativeSpeaker.cancel(grant);}
            },new WarningScheduler.Observer(){
                public void changed(String value){if(value.equals("READY")||value.equals("USER_MUTED")||value.equals("STARTED"))eventAudioManaged=true;semanticRender();}
                public void outcome(WarningEvent event,PlaybackGrant.Outcome value){}
            });
            semantic=new nl.johninnl.navigation.alerts.WarningSession(app,new nl.johninnl.navigation.alerts.WarningConnection.Listener(){
                public void snapshot(nl.johninnl.navigation.alerts.WarningConnection.Snapshot value){nl.johninnl.navigation.alerts.WarningSession current=semantic;if(current!=null&&current.consume(value.providerSession,()->{nativeWarnings.snapshot(value);scheduler.connected(current.connection(),value);}))semanticRender();}
                public void events(java.util.List<nl.johninnl.navigation.alerts.WarningEvent> values){for(nl.johninnl.navigation.alerts.WarningEvent value:values)if(value.operation==nl.johninnl.navigation.alerts.WarningEvent.Operation.ANNOUNCE)VelaWarningSpeaker.prefetch(app,value);nl.johninnl.navigation.alerts.WarningSession current=semantic;if(!values.isEmpty()&&current!=null&&current.consume(values.get(0).providerSession,()->{nativeWarnings.events(values);scheduler.events(current.connection(),values);}))semanticRender();}
                public void ownerRevoked(long epoch){scheduler.revoked(epoch);}
                public void disconnected(String reason){nativeWarnings.clear();scheduler.disconnected();semanticRender();}
            });
            startup=new nl.johninnl.navigation.startup.NavigationClient(app,semantic);
            store.select(prefs.getString("morphe_telemetry_provider",""));
            preferenceListener=(p,key)->{if(key!=null&&(key.startsWith("morphe_")||key.startsWith("flock_")||key.equals("car_speed_on")||key.equals("speed_cam_warn")))main(()->{
                if(changingSource)return;
                changingSource=true;
                try{
                    String next=prefs.getString("morphe_telemetry_provider","");
                    if(!next.equals(selected())){
                        store.select(next);eventAudioManaged=false;nativeWarnings.clear();WARNINGS.reset();warning="";semantic.resetEventNegotiation();
                        warningPreferences=new WarningPreferences(prefs,false,warningProvider(store.selected()));
                    }
                    store.select(next);
                }finally{changingSource=false;}
                scheduler.refresh();publish(true);
            });};
            prefs.registerOnSharedPreferenceChangeListener(preferenceListener);
            receiver=new BroadcastReceiver() {
                @Override public void onReceive(Context c,Intent intent) {
                    if(!ACTION.equals(intent.getAction()))return;
                    try {
                        Bundle b=intent.getExtras();if(b==null)return;
                        Map<String,Object> values=new HashMap<>();for(String key:b.keySet())values.put(key,b.get(key));
                        String sender=Build.VERSION.SDK_INT>=34?getSentFromPackage():intent.getStringExtra("source_package");
                        if(Build.VERSION.SDK_INT>=34) {
                            if(sender==null||!TelemetryStore.supported(sender)||getSentFromUid()!=app.getPackageManager().getApplicationInfo(sender,0).uid)return;
                        }
                        if(store.accept(values,sender,SystemClock.elapsedRealtime()))publish(false);
                    } catch(Exception ignored) { /* Malformed extras and absent/uninstalled senders are discarded. */ }
                }
            };
            IntentFilter filter=new IntentFilter(ACTION);
            if(Build.VERSION.SDK_INT>=33)app.registerReceiver(receiver,filter,Context.RECEIVER_EXPORTED);else app.registerReceiver(receiver,filter);
            request(TelemetryStore.WAZE);request(TelemetryStore.FLITSMEISTER);
            publish(true);MAIN.postDelayed(TICK,1000);
        });
    }
    public static Context app() { return app; }
    public static String selected() { return store.selected(); }
    public static TelemetryStore.View view() { return store.view(SystemClock.elapsedRealtime()); }
    public static void select(String provider) {
        main(()->{
            if(prefs==null)return;
            changingSource=true;
            try{
                String previous=store.selected();store.select(provider);
                if(!previous.equals(store.selected())){
                    warningPreferences=new WarningPreferences(prefs,false,warningProvider(store.selected()));warning="";WARNINGS.reset();nativeWarnings.clear();eventAudioManaged=false;
                    if(semantic!=null)semantic.resetEventNegotiation();
                }
                // Publish once the selected profile and its persisted source agree.
                prefs.edit().putString("morphe_telemetry_provider",store.selected()).apply();
            }finally{changingSource=false;}
            if(!store.selected().isEmpty())request(store.selected());
            publish(true);
        });
    }
    public static boolean carEnabled() { return prefs==null||prefs.getBoolean("morphe_telemetry_car",true); }
    public static boolean spokenEnabled() { return prefs!=null&&prefs.getBoolean("morphe_telemetry_spoken",prefs.getBoolean("speed_cam_warn",false)); }
    public static void setSpokenEnabled(boolean value) { if(prefs!=null){prefs.edit().putBoolean("morphe_telemetry_spoken",value).apply();if(warningPreferences!=null&&warningPreferences.reviewed())warningPreferences.mode(value?WarningAudioOwner.Mode.VOICE:WarningAudioOwner.Mode.SILENT);} }
    public static void setCarEnabled(boolean value) { if(prefs!=null)prefs.edit().putBoolean("morphe_telemetry_car",value).apply(); }
    /** Provider alert icons at their native positions, on the phone map and (with car details) on Android Auto. */
    public static boolean markersEnabled() { return prefs==null||prefs.getBoolean("morphe_alert_markers",true); }
    public static void setMarkersEnabled(boolean value) { if(prefs!=null)prefs.edit().putBoolean("morphe_alert_markers",value).apply(); }
    /** The pill selection reduced to contract-qualified native points. Display-only: nothing is renewed. */
    static java.util.List<AlertMarkers.Marker> markers(long now){
        if(app==null||!WarningProviders.supported(selected())||!markersEnabled())return java.util.Collections.emptyList();
        java.util.List<nl.johninnl.navigation.alerts.WarningEvent> mapEvents=new java.util.ArrayList<>(carWarnings());
        mapEvents.addAll(nativeWarnings.mapFeatures(now,event->warningPreferences==null||warningPreferences.enabled(event)));
        return AlertMarkers.select(mapEvents,now,event->warningRelevance(event,now));
    }
    public static boolean suppressNativeFlock() { return store.suppressNativeFlock(SystemClock.elapsedRealtime()); }
    public static Float speedMps(Float fallback) {
        if(selected().isEmpty()){phoneUnknown=false;return fallback;}
        Double external=view().currentKmh;
        phoneUnknown=external==null&&!freshNativeSpeed();
        if(external!=null)return (float)(external/3.6);
        return freshNativeSpeed()&&lastFix!=null?lastFix.getSpeed():null;
    }
    public static double speedMps(double fallback) {
        Double external=view().currentKmh;
        if(external!=null)return external/3.6;
        return !selected().isEmpty()&&freshNativeSpeed()&&lastFix!=null?lastFix.getSpeed():fallback;
    }
    public static Double speedKmh(Double fallback) { Double speed=view().currentKmh;return speed==null?fallback:speed; }
    public static Float phoneSpeedValue() { return speedMps((Float)null); }
    public static Double phoneLimitValue() { return limitKmh(phoneNativeLimit); }
    public static Double phoneLimitKmh(Double fallback) { phoneNativeLimit=fallback;return limitKmh(fallback); }
    public static Double limitKmh(Double fallback) { Double limit=view().limitKmh;return limit==null?fallback:limit; }
    public static double carSpeedMps(double fallback) { return carEnabled()?speedMps(fallback):fallback; }
    public static Double carLimitKmh(Double fallback) { return carEnabled()?limitKmh(fallback):fallback; }
    public static boolean phoneCurrentUnknown() { return phoneUnknown; }
    public static boolean showSpeed(boolean nativeValue) { return nativeValue||view().external||!nativeCarWarningText().isEmpty(); }
    public static void phoneState(Object state) {
        // The guarded outer CornerOverlay hook runs before Compose's skip/visibility gates.
        // Observe here so a warning can create an initially absent native phone slot.
        NativeUi.observe();
        phoneAt=SystemClock.elapsedRealtime();
        try {
            Object nativeSpeed=state.getClass().getField("j").get(state);
            phoneBrowse=!state.getClass().getField("l1").getBoolean(state)&&(nativeSpeed==null||((Number)nativeSpeed).doubleValue()<2);
        }catch(ReflectiveOperationException e){phoneBrowse=true;}
    }
    public static int phoneBottomClearanceDp() { return phoneBrowse?48:0; }
    public static void carFrame(Object renderer) { setCarActive(true); }
    public static void bindLocationProvider(Object provider) { locationProvider=provider; }
    public static String carCurrentLabel(Object renderer,String fallback) {
        if(selected().isEmpty()||!carEnabled()||view().currentKmh!=null)return fallback;
        return freshNativeSpeed()?fallback:"—";
    }
    public static void bindNavSession(Object session) { navSession=session;nativeSpeaker.bindSession(session); }
    private static boolean nativeGuidance() { return nativeSessionGuidance(); }
    private static boolean nativeSessionGuidance() {
        return Boolean.TRUE.equals(sessionGuidanceState());
    }
    /** Null means the native session cannot establish active or inactive route state. */
    private static Boolean sessionGuidanceState() {
        if(navSession==null)return false;
        try {
            Object flow=navSession.getClass().getField("f").get(navSession);
            Object state=flow.getClass().getMethod("getValue").invoke(flow);
            return state.getClass().getField("a").getBoolean(state)&&!state.getClass().getField("b").getBoolean(state)&&!state.getClass().getField("c").getBoolean(state);
        }catch(ReflectiveOperationException|RuntimeException e){return null;}
    }
    /** Reuse Vela's current navigation route; never request another route or position. */
    private static RoadWarningEngine.Route nativeRoute() {
        if(!nativeSessionGuidance()){routeReference=null;warningRoute=null;return null;}
        try {
            Object flow=navSession.getClass().getField("f").get(navSession);
            Object state=flow.getClass().getMethod("getValue").invoke(flow);
            Object route=state.getClass().getField("d").get(state);
            if(route==routeReference)return warningRoute;
            routeReference=route;warningRoute=null;
            if(route==null)return null;
            java.util.List<?> points=(java.util.List<?>)route.getClass().getMethod("getPolyline").invoke(route);
            if(points==null||points.size()<2)return null;
            double[] latitudes=new double[points.size()],longitudes=new double[points.size()];
            java.lang.reflect.Method latitude=points.get(0).getClass().getMethod("getLat"),longitude=points.get(0).getClass().getMethod("getLng");
            for(int i=0;i<points.size();i++){latitudes[i]=((Number)latitude.invoke(points.get(i))).doubleValue();longitudes[i]=((Number)longitude.invoke(points.get(i))).doubleValue();}
            warningRoute=new RoadWarningEngine.Route(latitudes,longitudes);
            return warningRoute;
        }catch(ReflectiveOperationException|RuntimeException e){routeReference=null;warningRoute=null;return null;}
    }
    public static void setNavigationActive(boolean active) { navigationActive=active;if(startup!=null)startup.select(selected(),active||carActive()); }
    private static boolean voiceAvailable() {
        if(!spokenEnabled()||voice==null)return false;
        try{return !voice.getClass().getField("n").getBoolean(voice)||voice.getClass().getField("o").getBoolean(voice);}catch(ReflectiveOperationException e){return false;}
    }
    public static String providerName() { return WarningProviders.supported(selected())?WarningProviders.displayName(selected()):"Vela"; }
    public static void openProviderLocationSettings(){
        android.app.Activity foreground=startup==null?null:startup.foregroundActivity();
        if(!nl.johninnl.navigation.startup.ProviderSettings.openLocation(foreground==null?app:foreground,selected())&&app!=null)
            android.widget.Toast.makeText(app,dutch()?"Kan de Android-appinstellingen niet openen":"Cannot open Android app settings",android.widget.Toast.LENGTH_LONG).show();
    }
    /** Settings health: an engine or telemetry packet alone never proves the warning connection. */
    public static String warningBridgeStatus() {
        return nl.johninnl.navigation.startup.NavigationHealth.warnings(providerName(),
            semantic==null?"off":semantic.state(),semantic!=null&&semantic.advertisesEvents(selected()),
            semantic!=null&&semantic.captureComplete(),startup==null?"off":startup.state(),dutch());
    }
    public static String providerServiceStatus() {
        return nl.johninnl.navigation.startup.NavigationHealth.service(providerName(),startup==null?"off":startup.state(),dutch());
    }
    public static String dataStatus() {
        TelemetryStore.View v=view();
        return nl.johninnl.navigation.startup.NavigationHealth.data(providerName(),"Vela",v.external,
            v.currentKmh==null||v.limitKmh==null,dutch());
    }
    public static String statusText() {
        if(selected().isEmpty())return "Vela";
        String status=providerName()+" · "+warningBridgeStatus()+" · "+providerServiceStatus()+" · "+dataStatus();
        if(WarningProviders.supported(selected())&&warningPreferences!=null)status+=" · "+warningAudioStatus();
        return status;
    }
    public static String zoneText() {
        TelemetryStore.View v=view();if(!v.zoneActive)return "";
        String average=v.averageKmh==null?"Average pending":String.format(Locale.getDefault(),"Observed average %.0f km/h",v.averageKmh);
        if(v.progressPercent==null)return average+"\n"+String.format(Locale.getDefault(),"%d m remaining",v.remainingMeters);
        return average+"\n"+(v.progressEstimated?"Estimated ":"")+String.format(Locale.getDefault(),"%.0f%% · %d m remaining",v.progressPercent,v.remainingMeters);
    }
    public static String warningText() { return warning; }
    public static String compactWarningText() {
        nl.johninnl.navigation.alerts.WarningEvent semanticWarning=nativeWarnings.current(SystemClock.elapsedRealtime(),event->warningPreferences==null||warningPreferences.enabled(event));
        if(semanticWarning!=null)return providerName()+"\n"+nativeWarnings.messages(SystemClock.elapsedRealtime(),event->warningPreferences==null||warningPreferences.enabled(event));
        return compactLegacyWarningText();
    }
    /** Unfiltered provider text is never a fallback for warnings the pill selection withheld. */
    static String compactCarWarningText(){String messages=nativeWarnings.carMessages(SystemClock.elapsedRealtime(),event->warningPreferences==null||warningPreferences.enabled(event));return messages.isEmpty()?compactLegacyWarningText():carWarnings().isEmpty()?"":providerName()+"\n"+messages;}
    static java.util.List<nl.johninnl.navigation.alerts.WarningEvent> carWarnings(){
        long now=SystemClock.elapsedRealtime();return nativeWarnings.carEvents(now,event->{
            if(warningPreferences!=null&&!warningPreferences.enabled(event))return false;
            if(!nl.johninnl.navigation.alerts.WarningGeometry.pointDisplay(event))return true;
            return POINT_PILLS.visible(event.warningId,warningRelevance(event,now),carWarningGeometry(event,now)!=null,now);
        });
    }
    private static final nl.johninnl.navigation.alerts.PointPillGate POINT_PILLS=new nl.johninnl.navigation.alerts.PointPillGate();
    private static WarningPassage.Relevance warningRelevance(WarningEvent event,long now){
        if(!event.relevance.equals("point_ahead"))return WarningPassage.Relevance.RELEVANT;
        Boolean guidance=sessionGuidanceState();if(guidance==null)return WarningPassage.Relevance.CONTEXT_UNVERIFIED;
        Location fix=lastFix;
        if(guidance){
            RoadWarningEngine.Route route=nativeRoute();
            if(route==null||event.latitude==null||event.longitude==null||!WarningPassage.freshFix(fix,now))return WarningPassage.Relevance.CONTEXT_UNVERIFIED;
            return route.warningRelevance(fix.getLatitude(),fix.getLongitude(),event.latitude,event.longitude,fix.getAccuracy());
        }
        return WarningPassage.passed(event,fix,now)?WarningPassage.Relevance.PASSED:WarningPassage.Relevance.RELEVANT;
    }
    static nl.johninnl.navigation.alerts.WarningGeometry carWarningGeometry(WarningEvent event,long now){
        nl.johninnl.navigation.alerts.WarningGeometry nativeValue=nl.johninnl.navigation.alerts.WarningGeometry.fromNative(event,now);
        if(nativeValue!=null)return nativeValue;
        Boolean guidance=sessionGuidanceState();Double distance=null;
        if(Boolean.TRUE.equals(guidance)&&WarningPassage.freshFix(lastFix,now)&&event.latitude!=null&&event.longitude!=null){
            RoadWarningEngine.Route route=nativeRoute();
            if(route!=null)distance=route.passageDistance(lastFix.getLatitude(),lastFix.getLongitude(),event.latitude,event.longitude,lastFix.getAccuracy());
        }
        return nl.johninnl.navigation.alerts.WarningGeometry.display(event,lastFix,now,distance,!Boolean.FALSE.equals(guidance));
    }
    private static String compactLegacyWarningText(){
        RoadWarningEngine.Warning w=currentWarning;if(w==null)return "";
        String icon;
        switch(w.kind){case "average_speed_zone":icon="⌀";break;case "police":icon="🚓";break;case "camera":case "mobile_camera":icon="📷";break;case "closure":icon="⛔";break;case "jam":icon="↔";break;case "flock":icon="◉";break;default:icon="⚠";}
        return icon+(w.estimated?"≈":"")+NativeUi.distance(w.distanceMeters,NativeUi.imperial()).replace(" ","").replace("\u00a0","");
    }
    /** Native semantic warnings only; the independent car layer never promotes legacy estimates. */
    static String nativeCarWarningText() {
        if(!WarningProviders.supported(selected()))return "";
        long now=SystemClock.elapsedRealtime();
        String messages=nativeWarnings.carMessages(now,value->warningPreferences==null||warningPreferences.enabled(value));
        return messages.isEmpty()?"":providerName()+"\n"+messages;
    }
    public static void setWarning(String value) { main(()->{warning=value==null?"":value;publish(false);}); }
    public static void fix(Location original) { nativeSample(original); }
    /** Metadata is captured before native UI-derived values lose hasSpeed/observation age. */
    public static void nativeSample(Location original) {
        if(original==null)return;
        final Location fix=new Location(original);
        final String provider=fix.getProvider();
        if(!"gps".equals(provider)&&!"sim".equals(provider)&&!"replay".equals(provider))return;
        final long received=SystemClock.elapsedRealtime();
        long observed=fix.getElapsedRealtimeNanos()/1000000;
        if(observed<=0) {
            boolean simulation=false;
            try {
                Object nativeProvider=locationProvider;
                simulation=nativeProvider!=null&&("replay".equals(provider)?nativeProvider.getClass().getField("f").getBoolean(nativeProvider):
                    "sim".equals(provider)&&nativeProvider.getClass().getField("e").get(nativeProvider)!=null);
            }catch(ReflectiveOperationException ignored){}
            if(simulation)observed=received;
            else if("gps".equals(provider)) {
                long age=System.currentTimeMillis()-fix.getTime();
                observed=age>=0&&age<=10000?received-age:-1;
            } else observed=-1;
        }
        final long at=observed;
        final boolean quality=at>=0&&at<=received&&received-at<=10000&&
            Double.isFinite(fix.getLatitude())&&Math.abs(fix.getLatitude())<=90&&
            Double.isFinite(fix.getLongitude())&&Math.abs(fix.getLongitude())<=180&&
            (!fix.hasAccuracy()||fix.getAccuracy()<=50);
        main(()->{
            if(!quality||at<fixAt)return;
            lastFix=fix;fixAt=at;
            double speed=fix.getSpeed();
            nativeSpeedKnown=fix.hasSpeed()&&Double.isFinite(speed)&&speed>=0&&speed*3.6<=500;
            nativeSpeedAt=at;
        });
    }
    private static boolean freshNativeSpeed() {
        long now=SystemClock.elapsedRealtime();return nativeSpeedKnown&&nativeSpeedAt>=0&&now>=nativeSpeedAt&&now-nativeSpeedAt<=5000;
    }
    public static Location lastFix() { return lastFix==null?null:new Location(lastFix); }
    public static long fixAt() { return fixAt; }
    public static void bindVoice(Object guide) { voice=guide;nativeSpeaker.bind(guide); }
    public static void setCarActive(boolean value) { carActive=value;carAt=value?SystemClock.elapsedRealtime():-10000; }
    public static boolean carActive() { return !visibleCarSessions.isEmpty()||(carActive&&SystemClock.elapsedRealtime()-carAt<=5000); }
    public static void setCarSessionVisible(Object session,boolean visible) {
        main(()->{if(visible)visibleCarSessions.add(session);else visibleCarSessions.remove(session);publish(true);});
    }
    /** Observe the native car Session independently of map snapshots or the speed overlay. */
    public static void bindCarSession(Object session) {
        main(()->{
            if(carObservers.containsKey(session))return;
            try {
                Class<?> observerType=Class.forName("ze0");
                WeakReference<Object> owner=new WeakReference<>(session);
                Object observer=Proxy.newProxyInstance(observerType.getClassLoader(),new Class<?>[]{observerType},(proxy,method,args)->{
                    switch(method.getName()) {
                        case "hashCode":return System.identityHashCode(proxy);
                        case "equals":return proxy==args[0];
                        case "toString":return "NavigationProviderCarSession";
                        default:
                            Object current=owner.get();if(current==null)return null;
                            // The guarded DefaultLifecycleObserver ABI: c=START, m=RESUME, b=STOP, l=DESTROY.
                            if(method.getName().equals("c")||method.getName().equals("m"))setCarSessionVisible(current,true);
                            else if(method.getName().equals("b")||method.getName().equals("l")) {
                                setCarSessionVisible(current,false);
                                if(method.getName().equals("l"))carObservers.remove(current);
                            }
                            return null;
                    }
                });
                Object lifecycle=session.getClass().getMethod("g").invoke(session);
                carObservers.put(session,observer);
                lifecycle.getClass().getMethod("a",Class.forName("ut1")).invoke(lifecycle,observer);
            }catch(ReflectiveOperationException error){android.util.Log.w("NavigationStartup","Car session lifecycle unavailable",error);}
        });
    }
    public static void speakWarning(String text) {
        if(!spokenEnabled()||voice==null||text==null||text.isEmpty())return;
        try {
            if(voice.getClass().getField("n").getBoolean(voice)) {
                if(!voice.getClass().getField("o").getBoolean(voice))return;
                java.lang.reflect.Constructor<?> note=Class.forName("y03").getConstructor(Object.class,Object.class);
                Object first=note.newInstance(1046.5d,110),second=note.newInstance(1046.5d,110);
                Runnable chime=(Runnable)Class.forName("a9").getConstructor(Object.class,Object.class,byte.class).newInstance(voice,java.util.Arrays.asList(first,second),(byte)26);
                new Thread(chime).start();
            } else voice.getClass().getMethod("j",String.class,boolean.class,boolean.class).invoke(voice,text,false,false);
        }
        catch(ReflectiveOperationException ignored) { /* Target ABI is checked by the patch before injection. */ }
    }
    private static void request(String provider) { if(app!=null)app.sendBroadcast(new Intent(REQUEST).setPackage(provider)); }
    private static void publish(boolean force) {
        if(startup!=null)startup.select(selected(),navigationActive||carActive()||nativeGuidance());
        TelemetryStore.View v=view();
        long now=SystemClock.elapsedRealtime();Location own=lastFix;
        RoadWarningEngine.Fix fix=own!=null?new RoadWarningEngine.Fix(own.getLatitude(),own.getLongitude(),own.hasBearing()?own.getBearing():Double.NaN,own.hasSpeed()?own.getSpeed():0,fixAt):null;
        RoadWarningEngine.Warning ahead=WARNINGS.update(v,fix,nativeRoute(),now);
        currentWarning=ahead;
        warning=ahead==null?"":warningLabel(ahead);
        nl.johninnl.navigation.alerts.WarningEvent semanticWarning=nativeWarnings.current(now,event->warningPreferences==null||warningPreferences.enabled(event));
        if(semanticWarning!=null)warning=providerName()+"\n"+nativeWarnings.messages(now,event->warningPreferences==null||warningPreferences.enabled(event));
        if(semantic!=null&&semantic.advertisesEvents(selected()))eventAudioManaged=true;
        boolean legacyAudio=!eventAudioManaged;
        if(legacyAudio&&voiceAvailable()&&(nativeGuidance()||carActive()||now-phoneAt<=5000)&&ahead!=null&&WARNINGS.shouldSpeak(ahead,now))speakWarning(warningLabel(ahead));
        String key=statusText()+":"+selected()+":"+v.currentKmh+":"+v.limitKmh+":"+v.zoneId+":"+v.zoneSession+":"+v.averageKmh+":"+v.progressPercent+":"+v.remainingMeters+":"+v.external+":"+suppressNativeFlock()+":"+carEnabled()+":"+spokenEnabled()+":"+warning+":"+freshNativeSpeed()+":"+(freshNativeSpeed()&&own!=null?own.getSpeed():null)+":"+phoneNativeLimit;
        if(force||!key.equals(lastKey)){lastKey=key;changed.run();CarUi.changed();}
        CarUi.warningChanged();
        MapMarkers.refresh();
    }
    private static boolean dutch() { return app!=null&&app.getResources().getConfiguration().getLocales().get(0).getLanguage().equals("nl"); }
    private static String warningLabel(RoadWarningEngine.Warning w) {
        boolean nl=dutch();String label;
        switch(w.kind) {
            case "average_speed_zone":label=nl?"Trajectcontrole":"Average speed check";break;
            case "police":label=nl?"Politie":"Police";break;
            case "mobile_camera":label=nl?"Mobiele controle":"Mobile speed check";break;
            case "camera":label=nl?"Flitspaal":"Speed camera";break;
            case "flock":label=nl?"Kentekencamera":"Plate camera";break;
            case "crash":label=nl?"Ongeval":"Crash";break;
            case "jam":label=nl?"File":"Traffic jam";break;
            case "closure":label=nl?"Afgesloten weg":"Road closed";break;
            default:label=nl?"Gevaar":"Road hazard";
        }
        return label+" · "+(w.estimated?"≈":"")+NativeUi.distance(w.distanceMeters,NativeUi.imperial());
    }
    private static final Runnable TICK=new Runnable(){public void run(){if(app==null)return;publish(false);MAIN.postDelayed(this,1000);}};
    private static String warningProvider(String value){return WarningProviders.supported(value)?value:WarningProviders.FLITSMEISTER;}
    public static WarningPreferences warningPreferences(){return warningPreferences;}
    public static void warningChoicesChanged(){if(scheduler!=null)scheduler.refresh();publish(true);}
    public static void previewWarning(){
        android.app.Activity activity=startup==null?null:startup.foregroundActivity();
        boolean parked=!nativeGuidance()&&!(freshNativeSpeed()&&lastFix!=null&&lastFix.hasSpeed()&&lastFix.getSpeed()>.3);
        nl.johninnl.navigation.alerts.WarningPreviewDialog.show(activity,parked,dutch(),()->{
            if(scheduler==null||semantic==null||semantic.connection()==null||!semantic.connection().supportsPreview())return java.util.concurrent.CompletableFuture.completedFuture("INCOMPATIBLE");
            return scheduler.preview(dutch()?"nl":"en");
        });
    }
    public static void recoverWarningAudio(){
        android.app.Activity activity=startup==null?null:startup.foregroundActivity();android.app.PendingIntent action=semantic==null?null:semantic.recoveryAction();
        if(activity==null)return;
        if(action==null){android.widget.Toast.makeText(activity,dutch()?"Verbind eerst een bijgewerkte "+providerName()+"-patch":"Connect an updated "+providerName()+" patch first",android.widget.Toast.LENGTH_LONG).show();return;}
        try{action.send();}catch(android.app.PendingIntent.CanceledException error){android.widget.Toast.makeText(activity,dutch()?"Herstel niet beschikbaar; verbind "+providerName()+" opnieuw":"Recovery unavailable; reconnect "+providerName(),android.widget.Toast.LENGTH_LONG).show();}
    }
    public static String warningAudioStatus(){if(warningPreferences==null||!warningPreferences.reviewed())return dutch()?"Waarschuwingskeuzes controleren":"Review warning categories and output";WarningAudioOwner.Mode requested=warningPreferences.mode();return WarningStatus.output(requested,nativeSpeaker.effectiveMode(requested),"Vela",dutch())+" · "+WarningStatus.label(scheduler==null?"OFF":scheduler.status(),dutch());}
    static void resetForTest() {
        carObservers.clear();visibleCarSessions.clear();
        MapMarkers.resetForTest();
        if(startup!=null){startup.close();startup=null;}
        if(semantic!=null){semantic.close();semantic=null;}nativeWarnings.clear();nativeSpeaker.bind(null);
        if(scheduler!=null){scheduler.disconnected();scheduler=null;}warningPreferences=null;changingSource=false;eventAudioManaged=false;
        MAIN.removeCallbacksAndMessages(null);
        if(app!=null&&receiver!=null)try{app.unregisterReceiver(receiver);}catch(IllegalArgumentException ignored){}
        if(prefs!=null&&preferenceListener!=null)prefs.unregisterOnSharedPreferenceChangeListener(preferenceListener);
        app=null;prefs=null;receiver=null;preferenceListener=null;changed=()->{};store=new TelemetryStore();lastKey="";warning="";lastFix=null;fixAt=-1;voice=null;navSession=null;locationProvider=null;routeReference=null;warningRoute=null;nativeSpeedKnown=false;nativeSpeedAt=-1;carActive=false;navigationActive=false;phoneAt=carAt=-10000;phoneUnknown=false;phoneBrowse=false;phoneNativeLimit=null;currentWarning=null;WARNINGS.reset();
    }
}
