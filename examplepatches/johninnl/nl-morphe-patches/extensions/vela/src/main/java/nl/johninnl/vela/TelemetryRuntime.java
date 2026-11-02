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

/** One process-wide consumer shared by the native phone and car UI. No network or GPS requests. */
public final class TelemetryRuntime {
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
    private static void main(Runnable action) { if(Looper.myLooper()==Looper.getMainLooper())action.run();else MAIN.post(action); }

    public static void init(Context context,Runnable onChanged) {
        main(()->{
            if(app!=null)return;
            app=context.getApplicationContext();prefs=app.getSharedPreferences("vela_settings",Context.MODE_PRIVATE);changed=onChanged;
            store.select(prefs.getString("morphe_telemetry_provider",""));
            preferenceListener=(p,key)->{if(key!=null&&(key.startsWith("morphe_")||key.startsWith("flock_")||key.equals("car_speed_on")||key.equals("speed_cam_warn")))main(()->{store.select(prefs.getString("morphe_telemetry_provider",""));publish(true);});};
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
            store.select(provider);warning="";WARNINGS.reset();
            prefs.edit().putString("morphe_telemetry_provider",store.selected()).apply();
            if(!store.selected().isEmpty())request(store.selected());
            publish(true);
        });
    }
    public static boolean carEnabled() { return prefs==null||prefs.getBoolean("morphe_telemetry_car",true); }
    public static boolean spokenEnabled() { return prefs!=null&&prefs.getBoolean("morphe_telemetry_spoken",prefs.getBoolean("speed_cam_warn",false)); }
    public static void setSpokenEnabled(boolean value) { if(prefs!=null)prefs.edit().putBoolean("morphe_telemetry_spoken",value).apply(); }
    public static void setCarEnabled(boolean value) { if(prefs!=null)prefs.edit().putBoolean("morphe_telemetry_car",value).apply(); }
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
    public static boolean showSpeed(boolean nativeValue) { return nativeValue||view().external; }
    public static void phoneState(Object state) {
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
    public static void bindNavSession(Object session) { navSession=session; }
    private static boolean nativeGuidance() { return nativeSessionGuidance(); }
    private static boolean nativeSessionGuidance() {
        if(navSession==null)return false;
        try {
            Object flow=navSession.getClass().getField("f").get(navSession);
            Object state=flow.getClass().getMethod("getValue").invoke(flow);
            return state.getClass().getField("a").getBoolean(state)&&!state.getClass().getField("b").getBoolean(state)&&!state.getClass().getField("c").getBoolean(state);
        }catch(ReflectiveOperationException e){return false;}
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
    public static void setNavigationActive(boolean active) { navigationActive=active; }
    private static boolean voiceAvailable() {
        if(!spokenEnabled()||voice==null)return false;
        try{return !voice.getClass().getField("n").getBoolean(voice)||voice.getClass().getField("o").getBoolean(voice);}catch(ReflectiveOperationException e){return false;}
    }
    public static String providerName() { return TelemetryStore.WAZE.equals(selected())?"De-Waze":TelemetryStore.FLITSMEISTER.equals(selected())?"Flitsmeister":"Vela"; }
    public static String statusText() {
        if(selected().isEmpty())return "Vela";
        TelemetryStore.View v=view();
        if(!v.external)return providerName()+(dutch()?" niet beschikbaar · Vela-gegevens":" unavailable · Vela data");
        return providerName()+((v.currentKmh==null||v.limitKmh==null)?(dutch()?" · Vela waar nodig":" · Vela fallback where needed"):"");
    }
    public static String zoneText() {
        TelemetryStore.View v=view();if(!v.zoneActive)return "";
        String average=v.averageKmh==null?"Average pending":String.format(Locale.getDefault(),"Observed average %.0f km/h",v.averageKmh);
        return average+"\n"+(v.progressEstimated?"Estimated ":"")+String.format(Locale.getDefault(),"%.0f%% · %d m remaining",v.progressPercent,v.remainingMeters);
    }
    public static String warningText() { return warning; }
    public static String compactWarningText() {
        RoadWarningEngine.Warning w=currentWarning;if(w==null)return "";
        String icon;
        switch(w.kind){case "average_speed_zone":icon="⌀";break;case "police":icon="🚓";break;case "camera":case "mobile_camera":icon="📷";break;case "closure":icon="⛔";break;case "jam":icon="↔";break;case "flock":icon="◉";break;default:icon="⚠";}
        return icon+(w.estimated?"≈":"")+NativeUi.distance(w.distanceMeters,NativeUi.imperial()).replace(" ","").replace("\u00a0","");
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
    public static void bindVoice(Object guide) { voice=guide; }
    public static void setCarActive(boolean value) { carActive=value;carAt=value?SystemClock.elapsedRealtime():-10000; }
    public static boolean carActive() { return carActive&&SystemClock.elapsedRealtime()-carAt<=5000; }
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
        TelemetryStore.View v=view();
        long now=SystemClock.elapsedRealtime();Location own=lastFix;
        RoadWarningEngine.Fix fix=own!=null?new RoadWarningEngine.Fix(own.getLatitude(),own.getLongitude(),own.hasBearing()?own.getBearing():Double.NaN,own.hasSpeed()?own.getSpeed():0,fixAt):null;
        RoadWarningEngine.Warning ahead=WARNINGS.update(v,fix,nativeRoute(),now);
        currentWarning=ahead;
        warning=ahead==null?"":warningLabel(ahead);
        if(voiceAvailable()&&(nativeGuidance()||carActive()||now-phoneAt<=5000)&&ahead!=null&&WARNINGS.shouldSpeak(ahead,now))speakWarning(warning);
        String key=selected()+":"+v.currentKmh+":"+v.limitKmh+":"+v.zoneId+":"+v.zoneSession+":"+v.averageKmh+":"+v.progressPercent+":"+v.remainingMeters+":"+v.external+":"+suppressNativeFlock()+":"+carEnabled()+":"+spokenEnabled()+":"+warning+":"+freshNativeSpeed()+":"+(freshNativeSpeed()&&own!=null?own.getSpeed():null)+":"+phoneNativeLimit;
        if(force||!key.equals(lastKey)){lastKey=key;changed.run();CarUi.changed();}
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
    static void resetForTest() {
        MAIN.removeCallbacksAndMessages(null);
        if(app!=null&&receiver!=null)try{app.unregisterReceiver(receiver);}catch(IllegalArgumentException ignored){}
        if(prefs!=null&&preferenceListener!=null)prefs.unregisterOnSharedPreferenceChangeListener(preferenceListener);
        app=null;prefs=null;receiver=null;preferenceListener=null;changed=()->{};store=new TelemetryStore();lastKey="";warning="";lastFix=null;fixAt=-1;voice=null;navSession=null;locationProvider=null;routeReference=null;warningRoute=null;nativeSpeedKnown=false;nativeSpeedAt=-1;carActive=false;navigationActive=false;phoneAt=carAt=-10000;phoneUnknown=false;phoneBrowse=false;phoneNativeLimit=null;currentWarning=null;WARNINGS.reset();
    }
}
