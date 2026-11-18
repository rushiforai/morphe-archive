package com.lampp.wazenmax;

import android.util.Log;

import java.lang.reflect.Method;

/**
 * Turns on Waze's own vehicle picker (Trip overview → Private / Motorcycle / Taxi) through Waze's config, the same keys
 * its server sends: {@code com.waze.ConfigManager} and {@code com.waze.config.ConfigValues} keep their names (native
 * code uses them). Re-applied when Waze starts and on every navigation state change, since a config sync can put the
 * server's values back.
 */
final class WazeVehicle {
    private static final String TAG = "WazeNmaxVehicle";
    private static final String VALUES = "com.waze.config.ConfigValues";
    private static final String PREFIX = "CONFIG_VALUE_TRIP_OVERVIEW_VEHICLE_TYPE_SELECTOR_";
    private static final String OPTIONS = "Private,Motorcycle,Taxi";
    private static boolean warned;

    private WazeVehicle() {
    }

    static void apply() {
        try {
            Object config = Class.forName("com.waze.ConfigManager", true, WazeVehicle.class.getClassLoader())
                    .getMethod("getInstance").invoke(null);
            set(config, "setConfigValueBool", PREFIX + "ENABLED", boolean.class, true);
            Object options = get(config, "getConfigValueString", PREFIX + "OPTIONS");
            if (options == null || !options.toString().contains("Motorcycle")) {
                set(config, "setConfigValueString", PREFIX + "OPTIONS", String.class, OPTIONS);
            }
            set(config, "setConfigValueLong", PREFIX + "SHOWN_NAVIGATIONS_COUNT", long.class, 0L); // keep showing it
        } catch (Throwable t) {
            if (!warned) Log.w(TAG, "vehicle picker not set; Waze goes on", t);
            warned = true;
        }
    }

    private static final long VEHICLE_CHECK_MS = 5_000L;
    private static volatile boolean motorcycle;
    private static volatile String vehicle = "";
    private static volatile long checkedAt = -VEHICLE_CHECK_MS;

    /**
     * Whether the rider's Waze vehicle is Motorcycle: the trip's choice, else the last navigated type (Waze's own config,
     * read at most every {@link #VEHICLE_CHECK_MS}). False when Waze's config can't be read.
     */
    static boolean isMotorcycle() {
        long now = android.os.SystemClock.elapsedRealtime();
        if (now - checkedAt < VEHICLE_CHECK_MS) return motorcycle;
        checkedAt = now;
        try {
            Object config = Class.forName("com.waze.ConfigManager", true, WazeVehicle.class.getClassLoader())
                    .getMethod("getInstance").invoke(null);
            Object choice = get(config, "getConfigValueString", "CONFIG_VALUE_ROUTING_VEHICLE_TYPE_CHOICE");
            Object last = get(config, "getConfigValueString", "CONFIG_VALUE_TRIP_OVERVIEW_LAST_NAVIGATED_VEHICLE_TYPE");
            String seen = "choice=[" + choice + "] last=[" + last + "]";
            if (!seen.equals(vehicle)) Log.i(TAG, "vehicle " + seen);
            vehicle = seen;
            String type = choice == null || choice.toString().trim().isEmpty() ? String.valueOf(last) : choice.toString();
            type = type.trim();
            motorcycle = type.equalsIgnoreCase("MOTORCYCLE");
        } catch (Throwable t) {
            if (!warned) Log.w(TAG, "vehicle type unreadable; no motorbike cap", t);
            warned = true;
            motorcycle = false;
        }
        return motorcycle;
    }

    private static Object get(Object config, String getter, String key) throws ReflectiveOperationException {
        Object k = WazeNav.staticField(VALUES, key);
        return config.getClass().getMethod(getter, k.getClass()).invoke(config, k);
    }

    private static void set(Object config, String setter, String key, Class<?> type, Object value)
            throws ReflectiveOperationException {
        Object k = WazeNav.staticField(VALUES, key);
        Method m = null;
        for (Method c : config.getClass().getMethods()) {
            Class<?>[] p = c.getParameterTypes();
            if (c.getName().equals(setter) && p.length == 2 && p[0].isInstance(k) && p[1] == type) m = c;
        }
        if (m == null) throw new NoSuchMethodException(setter);
        m.invoke(config, k, value);
    }
}
