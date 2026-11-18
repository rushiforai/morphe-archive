package app.morphe.extension.maps.patches;

import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.util.Log;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Maps' own navigation state → NmaxConnect, as a Bundle with Waze Mod's snapshot keys (navigating, turn, then_turn,
 * turn_distance_m, current_street, next_street, eta_minutes, eta_clock, remaining_m) so NmaxConnect reads it like
 * Waze's, plus the route's traffic for the dash's trip bar (route_m, ridden_m, jams: start_m, length_m, level). The patch hooks Maps' notification updater (about once a second while navigating) into {@link #navState}
 * and writes this build's obfuscated field names into {@link #navFields}. Pushed to the listener NmaxConnect sets
 * through GmapsDashService (IGmapsNavListener.onNav).
 */
public final class GmapsDashNav {
    private static final String TAG = "GmapsDashNav";
    private static final String LISTENER = "com.lampp.nmaxconnect.gmaps.IGmapsNavListener";
    private static final int ON_NAV = IBinder.FIRST_CALL_TRANSACTION + 1;
    private static final long STALE_MS = 10_000L; // no update this long: navigation ended
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<String, Field> FIELDS = new HashMap<>();
    private static Map<String, String> names;
    private static IBinder listener;
    private static Bundle last;
    private static boolean failed;
    private static boolean trafficFailed;

    private static final Runnable ENDED = () -> {
        GmapsDashBridge.navigating(false);
        push(ended());
    };

    private GmapsDashNav() {
    }

    // The patch replaces this body with "key=field;…" for this Maps build.
    private static String navFields() {
        return "";
    }

    /** NmaxConnect's listener (null clears); it gets the latest snapshot at once. */
    public static synchronized void setListener(IBinder binder) {
        listener = binder;
        if (binder != null && last != null) send(binder, last);
    }

    /** Hooked: Maps' nav state, every guidance update. */
    public static void navState(Object state) {
        if (state == null) return;
        boolean done = false;
        if (!failed) {
            try {
                done = bool(state, "done");
            } catch (Throwable t) {
                failed = true;
                Log.e(TAG, "nav state unreadable, data API off", t);
            }
        }
        MAIN.removeCallbacks(ENDED);
        if (done) {
            ENDED.run();
            return;
        }
        // This hook runs only while Maps navigates, so the dash gets the map even when the fields can't be read.
        MAIN.postDelayed(ENDED, STALE_MS);
        GmapsDashBridge.navigating(true);
        if (failed) return;
        try {
            // Rerouting: -1 everywhere and off route; the last snapshot stays up.
            if (!bool(state, "onRoute") || integer(state, "remaining") < 0) return;
            Object step = get(state, "step");
            Object[] steps = (Object[]) get(get(state, "route"), "steps");
            int n = integer(step, "stepNumber");
            Object prev = steps != null && n > 0 && n - 1 < steps.length ? steps[n - 1] : null;
            Object next = steps != null && n + 1 < steps.length ? steps[n + 1] : null;
            long secs = secondsLeft(get(state, "secsRemaining"));

            Bundle b = new Bundle();
            b.putBoolean("navigating", true);
            b.putInt("turn", turn(step));
            if (next != null) b.putInt("then_turn", turn(next));
            b.putInt("turn_distance_m", Math.max(0, integer(state, "toNext")));
            String street = firstNonNull(cue(step, "TYPE_TO_ROAD_NAME"), cue(step, "TYPE_TOWARD_ROAD_NAME"), cue(step, "TYPE_TITLE"));
            b.putString("next_street", street == null ? "" : street);
            // the road the last step turned onto; after the depart step, the road it headed toward
            String current = prev != null
                ? firstNonNull(cue(prev, "TYPE_TO_ROAD_NAME"), cue(prev, "TYPE_TOWARD_ROAD_NAME"))
                : cue(step, "TYPE_TOWARD_ROAD_NAME");
            b.putString("current_street", current == null ? "" : current);
            b.putInt("remaining_m", integer(state, "remaining"));
            if (secs >= 0) {
                b.putInt("eta_minutes", (int) ((secs + 59) / 60));
                Calendar at = Calendar.getInstance();
                at.add(Calendar.SECOND, (int) secs);
                b.putString("eta_clock", String.format(Locale.ROOT, "%02d:%02d", at.get(Calendar.HOUR_OF_DAY), at.get(Calendar.MINUTE)));
            }
            putTraffic(b, state);
            push(b);
        } catch (Throwable t) {
            failed = true; // a wrong field map would throw every second; one log, then the notification fallback
            Log.e(TAG, "nav state unreadable, data API off", t);
        }
    }

    /**
     * The route's length, the metres ridden and its jams (Maps' own traffic, the one its notification bar draws), into
     * [b]. A failure only drops the traffic: one log, the rest of the snapshot goes on.
     */
    private static void putTraffic(Bundle b, Object state) {
        if (trafficFailed) return;
        try {
            int ridden = (int) Math.max(0, ((Number) get(state, "fromStart")).doubleValue()); // a double in 26.45
            int route = ridden + integer(state, "remaining");
            Object box = get(get(get(state, "route"), "traffic"), "jamBox");
            Object list = get(box, "jamList");
            ArrayList<Bundle> jams = new ArrayList<>();
            if (list instanceof List) {
                for (Object j : (List<?>) list) {
                    if (j == null) continue;
                    Bundle jam = new Bundle();
                    jam.putInt("start_m", integer(j, "jamStart"));
                    jam.putInt("length_m", integer(j, "jamLength"));
                    jam.putInt("level", integer(j, "jamLevel"));
                    jams.add(jam);
                }
            }
            b.putInt("route_m", route); // only with the jams read: no all-clear bar from a half read
            b.putInt("ridden_m", ridden);
            b.putParcelableArray("jams", jams.toArray(new Bundle[0]));
        } catch (Throwable t) {
            trafficFailed = true;
            Log.e(TAG, "route traffic unreadable, no trip bar", t);
        }
    }

    private static Bundle ended() {
        Bundle b = new Bundle();
        b.putBoolean("navigating", false);
        return b;
    }

    private static synchronized void push(Bundle b) {
        last = b;
        if (listener != null && !send(listener, b)) listener = null;
    }

    private static boolean send(IBinder to, Bundle b) {
        Parcel data = Parcel.obtain();
        try {
            data.writeInterfaceToken(LISTENER);
            data.writeInt(1); // AIDL "in Bundle": non-null marker, then the Bundle
            b.writeToParcel(data, 0);
            to.transact(ON_NAV, data, null, IBinder.FLAG_ONEWAY);
            return true;
        } catch (Exception e) {
            Log.w(TAG, "listener gone", e);
            return false;
        } finally {
            data.recycle();
        }
    }

    /**
     * Waze turn codes (Waze's Instruction.Type, NmaxConnect's wazeTurnIcon): 5 straight, 1/2 left/right, 22/24 slight,
     * 23/25 sharp, 20 U-turn, 6 roundabout, 16 arrive. Maps' proto enums keep their names, so this reads name(), not numbers.
     */
    private static int turn(Object step) throws Exception {
        String maneuver = enumName(get(step, "maneuver"));
        String side = enumName(get(step, "side"));
        String severity = enumName(get(step, "severity"));
        boolean left = "SIDE_LEFT".equals(side);
        boolean right = "SIDE_RIGHT".equals(side);
        switch (maneuver) {
            case "UTURN":
                return 20;
            case "ROUNDABOUT_ENTER":
            case "ROUNDABOUT_EXIT":
            case "ROUNDABOUT_ENTER_AND_EXIT":
                return 6;
            case "DESTINATION":
                return 16;
            case "TURN":
            case "COUNTED_TURN":
            case "ON_RAMP":
            case "OFF_RAMP":
            case "FORK":
            case "MERGE":
            case "LANE_CHANGE":
                if (!left && !right) return 5;
                if ("TURN_UTURN".equals(severity)) return 20;
                if ("TURN_SHARP".equals(severity)) return left ? 23 : 25;
                boolean plainTurn = maneuver.equals("TURN") || maneuver.equals("COUNTED_TURN");
                if ("TURN_NORMAL".equals(severity) || (plainTurn && !"TURN_SLIGHT".equals(severity) && !"TURN_KEEP".equals(severity))) {
                    return left ? 1 : 2;
                }
                return left ? 22 : 24;
            default:
                return 5;
        }
    }

    /**
     * The name of the step's first direct/indirect cue of [type]. A cue (26.45 `ycc`) wraps a proto: its type and name
     * come from no-arg getters (an enum named TYPE_…, a String), not fields.
     */
    private static String cue(Object step, String type) throws Exception {
        List<Object> cues = new ArrayList<>();
        for (String key : new String[] {"directCues", "indirectCues"}) {
            Object list = get(step, key);
            if (list instanceof List) cues.addAll((List<?>) list);
        }
        for (Object c : cues) {
            if (c == null) continue;
            boolean match = false;
            String name = null;
            for (Method m : c.getClass().getDeclaredMethods()) {
                if (m.getParameterTypes().length != 0 || Modifier.isStatic(m.getModifiers())) continue;
                if (m.getName().equals("toString")) continue;
                if (Enum.class.isAssignableFrom(m.getReturnType())) {
                    m.setAccessible(true);
                    String kind = enumName(m.invoke(c));
                    if (kind.startsWith("TYPE_")) match = type.equals(kind);
                } else if (m.getReturnType() == String.class && name == null) {
                    m.setAccessible(true);
                    name = (String) m.invoke(c);
                }
            }
            if (match && name != null && !name.isEmpty()) return name;
        }
        return null;
    }

    /** combinedSecondsRemaining holds two j$.time.Durations; the first (by field name) is the ETA Maps shows. */
    private static long secondsLeft(Object pair) throws Exception {
        if (pair == null) return -1;
        Field[] fs = pair.getClass().getDeclaredFields();
        Arrays.sort(fs, Comparator.comparing(Field::getName));
        for (Field f : fs) {
            if (Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
            f.setAccessible(true);
            Object d = f.get(pair);
            if (d == null) continue;
            return (long) d.getClass().getMethod("getSeconds").invoke(d);
        }
        return -1;
    }

    private static Object get(Object o, String key) throws Exception {
        if (o == null) return null;
        return field(o, key).get(o);
    }

    private static int integer(Object o, String key) throws Exception {
        return field(o, key).getInt(o);
    }

    private static boolean bool(Object o, String key) throws Exception {
        return field(o, key).getBoolean(o);
    }

    private static Field field(Object o, String key) throws Exception {
        if (names == null) {
            Map<String, String> m = new HashMap<>();
            for (String pair : navFields().split(";")) {
                int eq = pair.indexOf('=');
                if (eq > 0) m.put(pair.substring(0, eq), pair.substring(eq + 1));
            }
            names = m;
        }
        String id = o.getClass().getName() + "." + key;
        Field f = FIELDS.get(id);
        if (f == null) {
            String name = names.get(key);
            if (name == null) throw new NoSuchFieldException(key);
            f = o.getClass().getDeclaredField(name);
            f.setAccessible(true);
            FIELDS.put(id, f);
        }
        return f;
    }

    private static String enumName(Object v) {
        return v instanceof Enum ? ((Enum<?>) v).name() : "";
    }

    private static String firstNonNull(String... values) {
        for (String v : values) if (v != null) return v;
        return null;
    }
}
