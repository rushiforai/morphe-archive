package com.lampp.wazenmax;

import android.app.Application;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Waze's navigation state → NmaxConnect, as a Bundle with the snapshot keys {@code WazeSnapshot.of} reads (navigating,
 * speed, speed_limit, overspeed, turn, then_turn, turn_distance_m, next_street, eta_clock,
 * eta_minutes, remaining_m, lanes[], alerts[], avg_zone, avg_remaining_m, avg_recommended_speed, avg_percent).
 *
 * Hooks (smali, first line of each method): Waze's native code calls these Java methods by name, so R8 keeps the
 * names: NavigationInfoNativeManagerBase.on*JNI, AlerterNativeManagerBase.updateAlertersRepositoryJNI,
 * LocationNativeManagerBase.onPositionJNI, LocationSensorListenerBase.updateSpeedometerJNI; the lanes come from
 * NavigationInfoNativeManager's one static method taking a NavigationLaneList. The byte[] arguments are Waze's protobuf
 * messages (com.waze.jni.protos.*, names kept too), read here by reflection. A hook never throws into Waze.
 */
public final class WazeNav {
    private static final String TAG = "WazeNmaxNav";
    private static final String LISTENER = "com.lampp.nmaxconnect.waze.IWazeDashListener";
    private static final int ON_UPDATE = IBinder.FIRST_CALL_TRANSACTION + 1;
    private static final long PUSH_MS = 200L; // ≤5 updates a second
    private static final long LOG_MS = 2_000L;
    /** Overspeed: the dash's LIMIT card turns red this far over the limit. */
    private static final int OVER_MARGIN_KMH = 5;
    private static final int MAX_ALERTS = 3;
    private static final Handler WORK;

    static {
        HandlerThread t = new HandlerThread("WazeNmaxNav");
        t.start();
        WORK = new Handler(t.getLooper());
    }

    private static final Bundle STATE = new Bundle();
    private static final List<IBinder> LISTENERS = new ArrayList<>();
    /** Alerts Waze shows now: type, latitude, longitude (micro-degrees), value, and Waze's icon name. */
    private static final List<Alert> ALERTS = new ArrayList<>();
    /** Waze's own picture per alert icon name, ICON_PX at most; null when Waze has none. */
    private static final Map<String, Bitmap> ICON_BITMAPS = new HashMap<>();
    private static final int ICON_PX = 48; // small enough to ride inline in every update
    private static Method iconLoader;
    private static final Set<String> WARNED = new HashSet<>();
    /** Alert icon names seen so far, each logged once (to learn Waze's alert kinds on a ride). */
    private static final Set<String> ICONS = new HashSet<>();
    private static volatile int lat;
    private static volatile int lon;
    private static boolean pushQueued;

    private WazeNav() {
    }

    // --- hooks -------------------------------------------------------------------------------------------------

    /** (navigating, ?): true again on every reroute (Waze clears the destination first); false when the route ends. */
    public static void navState(boolean navigating, int value) {
        Log.i(TAG, "nav state " + navigating + " " + value);
        safe("navState", () -> {
            put("navigating", navigating);
            if (!navigating) clearRoute();
            WazeVehicle.apply();
        });
    }

    public static void initialized(int ignored) {
        safe("initialized", WazeVehicle::apply);
    }

    public static void turn(int code) {
        safe("turn", () -> put("turn", code));
    }

    public static void thenTurn(int code) {
        safe("thenTurn", () -> put("then_turn", code));
    }

    public static void turnDistance(byte[] update) {
        safe("turnDistance", () -> put("turn_distance_m", num(parse("navigate.DistanceUpdate", update), "getRawMeters")));
    }

    public static void remaining(byte[] update) {
        safe("remaining", () -> put("remaining_m", num(parse("navigate.DistanceUpdate", update), "getRawMeters")));
    }

    /** Waze's "current street" update names the next instruction's street (the nav banner's street line). */
    public static void street(byte[] update) {
        safe("street", () -> put("next_street", text(parse("navigate.CurrentStreetNameUpdate", update), "getStreetName")));
    }

    public static void etaClock(String clock) {
        safe("etaClock", () -> put("eta_clock", clock == null ? "" : clock));
    }

    /** (time text, unit text, minutes). */
    public static void etaMinutes(String text, String unit, int minutes) {
        safe("etaMinutes", () -> put("eta_minutes", minutes));
    }

    public static void avgZone(byte[] update) {
        safe("avgZone", () -> {
            Object z = parse("navigate.AverageSpeedCameraZoneUpdate", update);
            synchronized (STATE) {
                STATE.putBoolean("avg_zone", true);
                STATE.putInt("avg_remaining_m", num(z, "getLeftDistance"));
                STATE.putInt("avg_recommended_speed", num(z, "getRecommendedSpeed"));
                STATE.putInt("avg_percent", num(z, "getPercent"));
            }
            push();
        });
    }

    public static void avgZoneClear() {
        safe("avgZoneClear", () -> {
            synchronized (STATE) {
                STATE.putBoolean("avg_zone", false);
                STATE.remove("avg_remaining_m");
                STATE.remove("avg_recommended_speed");
                STATE.remove("avg_percent");
            }
            push();
        });
    }

    /** NavigationLaneList: each lane's angles (degrees, 0 straight, negative left) and whether it is to be used. */
    public static void lanes(Object list) {
        safe("lanes", () -> {
            List<?> lanes = (List<?>) call(list, "getNavigationLaneList");
            if (!lanes.isEmpty()) logAngles(lanes);
            ArrayList<Bundle> out = new ArrayList<>();
            for (Object lane : lanes) {
                int directions = 0;
                int recommended = 0;
                for (Object a : (List<?>) call(lane, "getAngleList")) {
                    int bit = NavRules.laneBit(num(a, "getAngle"));
                    directions |= bit;
                    if ((Boolean) call(a, "getIsSelected")) recommended |= bit;
                }
                Bundle b = new Bundle();
                b.putInt("directions", directions);
                b.putInt("recommended", recommended);
                out.add(b);
            }
            synchronized (STATE) {
                STATE.putParcelableArray("lanes", out.toArray(new Bundle[0]));
            }
            push();
        });
    }

    /** (speed, units, the road's limit, speed in km/h); the limit is in the rider's units, ≤ 0 when unknown. */
    public static void speedometer(int speed, String units, int limit) {
        safe("speedometer", () -> {
            int max = Math.max(limit, 0);
            if (WazeVehicle.isMotorcycle()) max = NavRules.motorbikeCap(max); // the dash only; Waze's own sign stays
            synchronized (STATE) {
                STATE.putInt("speed", speed);
                STATE.putInt("speed_limit", max);
                STATE.putBoolean("overspeed", max > 0 && speed > max + OVER_MARGIN_KMH);
            }
            push();
        });
    }

    /** ProviderPosition: Waze's matched position, for the distance to each alert. */
    public static void position(byte[] update) {
        safe("position", () -> {
            Object p = call(parse("location.ProviderPosition", update), "getPosition");
            lat = num(p, "getLatitude");
            lon = num(p, "getLongitude");
            publishAlerts();
        });
    }

    /** NativeAlertRepositoryUpdate: the alerts Waze shows now (police, cameras, hazards, …). */
    public static void alerts(byte[] update) {
        safe("alerts", () -> {
            List<?> descriptors = (List<?>) call(parse("alerters.NativeAlertRepositoryUpdate", update),
                    "getDescriptorsList");
            List<Alert> now = new ArrayList<>();
            for (Object d : descriptors) {
                Object info = call(d, "getInfo");
                Object p = call(info, "getPosition");
                String icon = text(info, "getIconName");
                now.add(new Alert(NavRules.alertType(icon), num(p, "getLatitude"), num(p, "getLongitude"),
                        NavRules.speedDropLimit(icon), icon));
                synchronized (ICONS) {
                    if (ICONS.add(icon)) Log.i(TAG, "alert icon " + icon + " type " + num(info, "getTypeValue"));
                }
                synchronized (ICON_BITMAPS) {
                    if (!ICON_BITMAPS.containsKey(icon)) ICON_BITMAPS.put(icon, iconBitmap(icon));
                }
            }
            synchronized (ALERTS) {
                ALERTS.clear();
                ALERTS.addAll(now);
            }
            publishAlerts();
        });
    }

    // --- service side ------------------------------------------------------------------------------------------

    static Bundle snapshot() {
        synchronized (STATE) {
            return new Bundle(STATE);
        }
    }

    static void addListener(IBinder l) {
        if (l == null) return;
        synchronized (LISTENERS) {
            if (!LISTENERS.contains(l)) LISTENERS.add(l);
        }
        push();
    }

    static void removeListener(IBinder l) {
        synchronized (LISTENERS) {
            LISTENERS.remove(l);
        }
    }

    // --- internals ---------------------------------------------------------------------------------------------

    private static void clearRoute() {
        synchronized (STATE) {
            for (String k : new String[]{"turn", "then_turn", "turn_distance_m", "next_street", "eta_clock",
                    "eta_minutes", "remaining_m", "lanes"}) {
                STATE.remove(k);
            }
        }
        push();
    }

    private static void publishAlerts() {
        List<Alert> alerts;
        synchronized (ALERTS) {
            alerts = new ArrayList<>(ALERTS);
        }
        int[] distance = new int[alerts.size()];
        for (int i = 0; i < distance.length; i++) {
            Alert a = alerts.get(i);
            distance[i] = NavRules.distanceM(lat, lon, a.lat, a.lon);
        }
        List<Integer> order = new ArrayList<>();
        for (int i = 0; i < distance.length; i++) order.add(i);
        order.sort((x, y) -> Integer.compare(distance[x], distance[y]));
        ArrayList<Bundle> out = new ArrayList<>();
        for (int i : order.subList(0, Math.min(MAX_ALERTS, order.size()))) {
            Alert a = alerts.get(i);
            Bundle b = new Bundle();
            b.putInt("type", a.type);
            b.putInt("distance_m", distance[i]);
            if (a.value > 0) b.putInt("value", a.value);
            Bitmap icon;
            synchronized (ICON_BITMAPS) {
                icon = ICON_BITMAPS.get(a.icon);
            }
            if (icon != null) b.putParcelable("icon", icon);
            out.add(b);
        }
        synchronized (STATE) {
            STATE.putParcelableArray("alerts", out.toArray(new Bundle[0]));
        }
        push();
    }

    private static void put(String key, Object value) {
        synchronized (STATE) {
            if (value instanceof Boolean) STATE.putBoolean(key, (Boolean) value);
            else if (value instanceof Integer) STATE.putInt(key, (Integer) value);
            else STATE.putString(key, (String) value);
        }
        push();
    }

    /** At most one update per {@link #PUSH_MS} to every listener; dead ones are dropped. */
    private static void push() {
        synchronized (LISTENERS) {
            if (LISTENERS.isEmpty() || pushQueued) return;
            pushQueued = true;
        }
        WORK.postDelayed(() -> {
            List<IBinder> to;
            synchronized (LISTENERS) {
                pushQueued = false;
                to = new ArrayList<>(LISTENERS);
            }
            Bundle b = snapshot();
            for (IBinder l : to) if (!send(l, b)) removeListener(l);
            log(b);
        }, PUSH_MS);
    }

    private static String logged = "";
    private static long loggedAt;

    /** The snapshot in the log when it changed, at most every {@link #LOG_MS}: rides away from adb read it back from
     * the phone's log buffer. WORK thread only. */
    private static void log(Bundle b) {
        StringBuilder s = new StringBuilder();
        for (String k : new java.util.TreeSet<>(b.keySet())) {
            Object v = b.get(k);
            s.append(k).append('=');
            if (v instanceof Object[]) {
                s.append('[');
                for (Object o : (Object[]) v) {
                    Bundle e = (Bundle) o;
                    s.append(e.containsKey("type") ? e.getInt("type") + "@" + e.getInt("distance_m") + (e.containsKey("value") ? ":" + e.getInt("value") : "")
                            : e.getInt("directions") + "/" + e.getInt("recommended")).append(' ');
                }
                s.append(']');
            } else {
                s.append(v);
            }
            s.append(' ');
        }
        long now = android.os.SystemClock.elapsedRealtime();
        String line = s.toString();
        if (line.equals(logged) || now - loggedAt < LOG_MS) return;
        logged = line;
        loggedAt = now;
        Log.i(TAG, line);
    }

    /** Lane angles as Waze sends them, logged once per lane strip to check {@link NavRules#laneBit}'s left/right. */
    private static void logAngles(List<?> lanes) throws ReflectiveOperationException {
        StringBuilder s = new StringBuilder("lane angles:");
        for (Object lane : lanes) {
            s.append(" |");
            for (Object a : (List<?>) call(lane, "getAngleList")) {
                s.append(' ').append(num(a, "getAngle")).append((Boolean) call(a, "getIsSelected") ? "*" : "");
            }
        }
        Log.i(TAG, s.toString());
    }

    private static boolean send(IBinder to, Bundle b) {
        Parcel data = Parcel.obtain();
        try {
            data.writeInterfaceToken(LISTENER);
            data.writeInt(1); // AIDL "in Bundle": non-null marker, then the Bundle
            b.writeToParcel(data, 0);
            to.transact(ON_UPDATE, data, null, IBinder.FLAG_ONEWAY);
            return true;
        } catch (RemoteException e) {
            return false;
        } finally {
            data.recycle();
        }
    }

    private static final class Alert {
        final int type;
        final int lat;
        final int lon;
        final int value;
        final String icon;

        Alert(int type, int lat, int lon, int value, String icon) {
            this.type = type;
            this.lat = lat;
            this.lon = lon;
            this.value = value;
            this.icon = icon;
        }
    }

    /**
     * Waze's own picture for an alert icon name, as its alerter shows it: ResourcesNativeManager's static
     * (Resources, String) → Drawable loader (downloaded and skin images first, then the APK's drawables), found by
     * signature since R8 renames it. Scaled to ICON_PX; null when Waze has no picture or the loader moved.
     */
    private static Bitmap iconBitmap(String name) {
        try {
            if (iconLoader == null) {
                Class<?> c = Class.forName("com.waze.resources.ResourcesNativeManager", true,
                        WazeNav.class.getClassLoader());
                for (Method m : c.getDeclaredMethods()) {
                    Class<?>[] p = m.getParameterTypes();
                    if (Modifier.isStatic(m.getModifiers()) && p.length == 2 && p[0] == Resources.class
                            && p[1] == String.class && m.getReturnType() == Drawable.class) {
                        m.setAccessible(true);
                        iconLoader = m;
                    }
                }
                if (iconLoader == null) throw new NoSuchMethodException("ResourcesNativeManager image loader");
            }
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            Drawable d = (Drawable) iconLoader.invoke(null, app.getResources(), name);
            if (d == null) return null;
            int w = Math.max(d.getIntrinsicWidth(), 1);
            int h = Math.max(d.getIntrinsicHeight(), 1);
            float s = ICON_PX / (float) Math.max(w, h);
            Bitmap b = Bitmap.createBitmap(Math.max(Math.round(w * s), 1), Math.max(Math.round(h * s), 1),
                    Bitmap.Config.ARGB_8888);
            d.setBounds(0, 0, b.getWidth(), b.getHeight());
            d.draw(new Canvas(b));
            return b;
        } catch (Throwable t) {
            synchronized (WARNED) {
                if (WARNED.add("icon")) Log.w(TAG, "no Waze alert icons; the dash keeps its own", t);
            }
            return null;
        }
    }

    // --- reflection on Waze's protobuf classes -----------------------------------------------------------------

    private static final Map<String, Method> METHODS = new HashMap<>();

    private static Object parse(String proto, byte[] bytes) throws ReflectiveOperationException {
        return method(Class.forName("com.waze.jni.protos." + proto, true, WazeNav.class.getClassLoader()),
                "parseFrom", byte[].class).invoke(null, (Object) bytes);
    }

    private static Object call(Object target, String name) throws ReflectiveOperationException {
        return method(target.getClass(), name).invoke(target);
    }

    private static int num(Object target, String name) throws ReflectiveOperationException {
        return ((Number) call(target, name)).intValue();
    }

    private static String text(Object target, String name) throws ReflectiveOperationException {
        Object s = call(target, name);
        return s == null ? "" : s.toString();
    }

    private static Method method(Class<?> c, String name, Class<?>... params) throws NoSuchMethodException {
        String key = c.getName() + "." + name;
        synchronized (METHODS) {
            Method m = METHODS.get(key);
            if (m == null) {
                m = c.getMethod(name, params);
                METHODS.put(key, m);
            }
            return m;
        }
    }

    interface Body {
        void run() throws Exception;
    }

    /** A hook's work; any failure is logged once per hook, never thrown into Waze. */
    private static void safe(String hook, Body body) {
        try {
            body.run();
        } catch (Throwable t) {
            synchronized (WARNED) {
                if (WARNED.add(hook)) Log.w(TAG, hook + " failed; Waze goes on", t);
            }
        }
    }

    /** For a field Waze's config keeps (used by {@link WazeVehicle}). */
    static Object staticField(String cls, String name) throws ReflectiveOperationException {
        Field f = Class.forName(cls, true, WazeNav.class.getClassLoader()).getField(name);
        return f.get(null);
    }
}
