package org.ungoogled.waze;

import nl.johninnl.navigation.NavigationState;
import nl.johninnl.navigation.NavigationAlerts;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import nl.johninnl.navigation.NavigationProtocol;

import android.app.Application;
import android.app.BroadcastOptions;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.util.List;
import java.util.UUID;
import java.util.Locale;

/** Versioned local data feed. All state mutation/publication is serialized on the main looper. */
public final class NavigationBroadcasts {
    private NavigationBroadcasts() {}
    public static final String ACTION = "nl.johninnl.waze.NAVIGATION_STATE";
    public static final String REQUEST = "nl.johninnl.waze.NAVIGATION_STATE_REQUEST";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final NavigationState STATE = new NavigationState();
    private static final NavigationAlerts ALERTS = new NavigationAlerts();
    private static final Map<String, List<NavigationAlerts.Alert>> REPORTS = new HashMap<>();
    private static final String SESSION = UUID.randomUUID().toString();
    private static volatile boolean installed;
    private static Application app;
    private static long sequence, lastSent = -5000, lastRequest = -1000;
    private static boolean dirty;

    /** Bound by the patch; blank means implicit local broadcasts for any compatible receiver. */
    public static String receiverPackage() { return ""; }

    static boolean isEnabled() { return installed && Customization.on("navigationBroadcasts"); }

    private static void main(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) action.run(); else MAIN.post(action);
    }

    public static void init(Application application) {
        main(() -> {
            if (installed) return;
            app = application; installed = true;
            IntentFilter filter = new IntentFilter(REQUEST);
            filter.addAction(NavigationProtocol.REQUEST);
            BroadcastReceiver receiver = new BroadcastReceiver() {
                @Override public void onReceive(Context c, Intent in) {
                    long now = SystemClock.elapsedRealtime();
                    if (!(REQUEST.equals(in.getAction()) || NavigationProtocol.REQUEST.equals(in.getAction())) || !isEnabled() || now - lastRequest < 1000) return;
                    lastRequest = now; publish(true);
                }
            };
            if (Build.VERSION.SDK_INT >= 33) app.registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED);
            else app.registerReceiver(receiver, filter);
            switched(isEnabled());
            try {
                // Apply keep-alive when native initialization finishes, even without a server sync.
                Class.forName("com.waze.NativeManager").getMethod("runOnNativeManagerReady", Runnable.class)
                        .invoke(null, (Runnable) () -> { if (isEnabled()) Customization.onConfigSynced(); });
            } catch (ReflectiveOperationException e) { Log.w("UA", "Navigation background initialization", e); }
        });
    }

    static void switched(boolean on) {
        main(() -> {
            if (!installed) return;
            MAIN.removeCallbacks(TICK);
            STATE.reset(on); ALERTS.reset(on); REPORTS.clear(); REPORT_TIMES.clear(); dirty = true; publish(true); // clearing snapshot is sent even on disable
            if (on) MAIN.postDelayed(TICK, 1000);
        });
    }

    /** Called by LocationSensorListener.updateSpeedometer, not a visible speedometer View. */
    public static void speed(String units, int limit, double currentKmh) {
        final long at = SystemClock.elapsedRealtime();
        main(() -> { if (isEnabled()) { STATE.current(currentKmh, at); dirty = true; } });
        speed(units, limit);
    }

    public static void speed(String units, int limit) {
        final long at = SystemClock.elapsedRealtime();
        if (!isEnabled()) return;
        String value = units == null ? "" : units.toLowerCase(Locale.ROOT).replace(" ", "");
        if (!(value.equals("mph") || value.equals("mi/h") || value.equals("km/h") ||
                value.equals("kmh") || value.equals("kph"))) value = configuredUnits();
        final String normalized = value;
        main(() -> {
            if (!isEnabled()) return;
            NavigationState.Snapshot before = STATE.snapshot(at);
            STATE.speed(normalized, limit, at); dirty = true;
            NavigationState.Snapshot after = STATE.snapshot(at);
            publish(!before.roadStatus.equals(after.roadStatus) || Double.compare(before.limitKmh, after.limitKmh) != 0);
        });
    }

    public static void legacy(Object update) {
        final long at = SystemClock.elapsedRealtime();
        main(() -> {
            if (!isEnabled() || update == null) return;
            try {
                long previousSession = STATE.snapshot(at).zoneSession;
                STATE.legacy((Integer) call(update, "getPercent"), (Integer) call(update, "getLeftDistance"), at);
                dirty = true; publish(previousSession != STATE.snapshot(at).zoneSession);
            } catch (ReflectiveOperationException | ClassCastException e) { Log.w("UA", "Navigation legacy data", e); }
        });
    }

    public static void legacyClear() {
        final long at = SystemClock.elapsedRealtime();
        main(() -> { if (isEnabled()) { STATE.clear("legacy", at); dirty = true; publish(true); } });
    }

    public static void insights(Object update) {
        final long at = SystemClock.elapsedRealtime();
        main(() -> {
            if (!isEnabled() || update == null) return;
            try {
                String id = null, approaching = ""; int remaining = -1, distance = -1;
                long previousSession = STATE.snapshot(at).zoneSession;
                Object list = call(update, "getInfoList");
                if (!(list instanceof List)) return;
                for (Object info : (List<?>) list) {
                    Object identity = call(info, "getId");
                    if ((Integer) call(identity, "getSegmentTypeValue") != 7) continue;
                    int position=(Integer)call(info,"getPositionRelativeToSegmentValue");
                    if (position==0 && approaching.isEmpty()) { // Native APPROACHING=0, WITHIN=1 in 5.26.90.901.
                        approaching=(String)call(identity,"getSegmentId"); distance=(Integer)call(info,"getRemainingDistanceMeters");
                    } else if(position==1 && id==null) {
                        id=(String)call(identity,"getSegmentId"); remaining=(Integer)call(info,"getRemainingDistanceMeters");
                    }
                }
                ALERTS.approach(approaching,distance,false,at);
                if (id == null) STATE.clear("insights", at); else STATE.insights(id, remaining, at);
                dirty = true; publish(previousSession != STATE.snapshot(at).zoneSession);
            } catch (ReflectiveOperationException | ClassCastException e) { Log.w("UA", "Navigation insights data", e); }
        });
    }

    /** Native repository reports, independently of the legacy Maps sharing toggle. */
    public static void alerts(Object update) {
        if(update==null || !isEnabled()) return;
        final long at=SystemClock.elapsedRealtime();
        try {
            List<NavigationAlerts.Alert> reports=new ArrayList<>();
            for(Object descriptor:(List<?>)call(update,"getDescriptorsList")) {
                if(reports.size()>=NavigationAlerts.MAX_ALERTS)break;
                Object info=call(descriptor,"getInfo"), position=call(info,"getPosition"), identity=call(descriptor,"getAlertId");
                int type=(Integer)call(info,"getTypeValue"); String kind=kind(type);
                if(kind.isEmpty())continue;
                String id=String.valueOf(call(identity,"getUniqueId"));
                if(id.isEmpty())id=String.valueOf(call(identity,"getUuid"));
                if(id.isEmpty())id=String.valueOf(call(info,"getReportId"));
                reports.add(new NavigationAlerts.Alert(id,kind,String.valueOf(call(info,"getTitle")),-1,
                    (Integer)call(descriptor,"getTriggerDistanceMeters"),(Integer)call(position,"getLatitude")/1e6,
                    (Integer)call(position,"getLongitude")/1e6));
            }
            reports("native",reports,at);
        }catch(ReflectiveOperationException|ClassCastException e){Log.w("UA","Navigation alert source",e);}
    }
    static String kind(int type) {
        switch(type) {
            case 1:return "police"; case 2:return "crash"; case 3:case 32:return "jam";
            case 10:return "camera"; case 12:case 19:return "closure";
            case 4:case 5:case 6:case 7:case 9:case 15:case 16:case 17:case 20:case 21:case 23:case 24:case 25:case 26:return "hazard";
            default:return "";
        }
    }
    static void reports(String source,List<NavigationAlerts.Alert> reports,long at) {
        main(()->{if(!isEnabled() || at<0 || at>SystemClock.elapsedRealtime())return; List<NavigationAlerts.Alert> timed=new ArrayList<>();
            for(NavigationAlerts.Alert a:reports)timed.add(new NavigationAlerts.Alert(a.id,a.kind,a.title,a.distance,a.trigger,a.latitude,a.longitude,at));
            REPORTS.put(source,timed);
            // Each source expires independently; replacing one never refreshes another's observations.
            List<NavigationAlerts.Alert> all=new ArrayList<>();
            REPORT_TIMES.put(source,at);
            for(Map.Entry<String,List<NavigationAlerts.Alert>> e:REPORTS.entrySet())
                if(at-REPORT_TIMES.get(e.getKey())<=NavigationAlerts.TTL_MS)all.addAll(e.getValue());
            ALERTS.reports(all,at);dirty=true;publish(false);
        });
    }
    private static final Map<String,Long> REPORT_TIMES=new HashMap<>();

    private static Object call(Object value, String method) throws ReflectiveOperationException {
        return value.getClass().getMethod(method).invoke(value);
    }

    /** Waze's own nonlocalized unit setting, including its automatic/default selection. */
    private static String configuredUnits() {
        try {
            Class<?> values = Class.forName("com.waze.config.ConfigValues");
            String unit = (String) call(values.getField("CONFIG_VALUE_GENERAL_UNITS").get(null), "a");
            if ("default".equals(unit)) unit = (String) call(values.getField("CONFIG_VALUE_GENERAL_DEFAULT_UNITS").get(null), "a");
            return "metric".equals(unit) || "imperial".equals(unit) ? unit : "";
        } catch (ReflectiveOperationException | ClassCastException e) { return ""; }
    }

    private static final Runnable TICK = new Runnable() {
        @Override public void run() {
            if (!isEnabled()) { switched(false); return; }
            NavigationState.Snapshot n = STATE.snapshot(SystemClock.elapsedRealtime());
            if (dirty || n.currentStatus.equals("valid") || n.roadStatus.equals("valid") || n.zoneStatus.equals("active") || ALERTS.fresh(SystemClock.elapsedRealtime()) ||
                    !ALERTS.status(SystemClock.elapsedRealtime()).equals(lastAlertsStatus) ||
                    !n.roadStatus.equals(lastRoadStatus) || !n.zoneStatus.equals(lastZoneStatus) ||
                    !n.currentStatus.equals(lastCurrentStatus)) publish(false);
            MAIN.postDelayed(this, 1000);
        }
    };

    private static String lastRoadStatus = "", lastZoneStatus = "", lastCurrentStatus = "", lastAlertsStatus = "";
    private static void publish(boolean force) {
        if (app == null) return;
        long now = SystemClock.elapsedRealtime();
        NavigationState.Snapshot n = STATE.snapshot(now);
        boolean transition = !n.roadStatus.equals(lastRoadStatus) || !n.zoneStatus.equals(lastZoneStatus) ||
                    !n.currentStatus.equals(lastCurrentStatus) || !ALERTS.status(now).equals(lastAlertsStatus);
        if (!force && !transition && now - lastSent < (dirty ? 1000 : 5000)) return;
        NavigationProtocol.send(app, snapshot(n, now), receiverPackage());
        lastAlertsStatus=ALERTS.status(now); lastSent = now; lastRoadStatus = n.roadStatus; lastZoneStatus = n.zoneStatus; lastCurrentStatus = n.currentStatus; dirty = false;
    }

    static Intent snapshot(NavigationState.Snapshot n, long now) {
        return ALERTS.append(NavigationProtocol.snapshot(ACTION, app == null ? "com.waze" : app.getPackageName(), SESSION, ++sequence, n, now),now);
    }
}
