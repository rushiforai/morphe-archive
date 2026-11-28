package com.waze.gw;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.SystemClock;
import android.util.Log;

/**
 * Keeps Waze's "Chọn phương tiện" (Private / Motorcycle / Taxi) tabs in the route preview visible.
 *
 * Waze reads its flags through {@code ConfigValues.<KEY>.a()}, which goes to
 * {@code ConfigManager.getConfigValueBool} in the native config store; this class uses the same
 * calls by reflection (version-agnostic).
 *
 * Findings on a real device (Sony XQ-AS52, Waze 5.23): the server had left both the selector flag
 * and its option list on. What hid the selector was a local, persisted counter of how many route
 * previews already showed it: once it reaches SELECTOR_MAX_SHOWS_* Waze hides the selector for
 * good (trip_overview dx.O()). So the counter is kept at zero, and the flag and option list are
 * only filled in when a server does leave them off. The value Waze had before the first override
 * is remembered so turning the switch off restores it.
 *
 * Share drive was also tried and dropped: it needs Waze's backend, so forcing the flag only
 * exposed a UI that cannot work. {@link #restoreLegacyShareDrive} undoes that experiment.
 *
 * Status lines go to logcat under tag {@code WazeFeature} (captured by DiagnosticsLogger).
 */
final class WazeFeatureOverrides {
    private static final String TAG = "WazeFeature";
    private static final String PREFS = "waze_hud_gw";
    static final String PREF_VEHICLE_SELECTOR = "force_vehicle_selector";
    /** On by default: a stock Waze feature quietly disappearing is not something users want. */
    static final boolean VEHICLE_SELECTOR_DEFAULT = true;

    private static final String VEHICLE_SELECTOR =
            "CONFIG_VALUE_TRIP_OVERVIEW_VEHICLE_TYPE_SELECTOR_ENABLED";
    private static final String VEHICLE_SELECTOR_OPTIONS =
            "CONFIG_VALUE_TRIP_OVERVIEW_VEHICLE_TYPE_SELECTOR_OPTIONS";
    private static final String VEHICLE_SELECTOR_SHOWN_COUNT =
            "CONFIG_VALUE_TRIP_OVERVIEW_VEHICLE_TYPE_SELECTOR_SHOWN_NAVIGATIONS_COUNT";
    private static final String VEHICLE_SELECTOR_MAX_INITIAL =
            "CONFIG_VALUE_TRIP_OVERVIEW_VEHICLE_TYPE_SELECTOR_MAX_SHOWS_INITIAL";
    private static final String VEHICLE_SELECTOR_MAX_EXTENDED =
            "CONFIG_VALUE_TRIP_OVERVIEW_VEHICLE_TYPE_SELECTOR_MAX_SHOWS_EXTENDED";
    private static final String VEHICLE_SELECTOR_USE_EXTENDED =
            "CONFIG_VALUE_TRIP_OVERVIEW_VEHICLE_TYPE_SELECTOR_USE_MAX_SHOWS_EXTENDED";
    private static final String DEFAULT_VEHICLE_OPTIONS = "Private,Motorcycle,Taxi";
    private static final String ROUTING_VEHICLE_TYPES = "CONFIG_VALUE_ROUTING_VEHICLE_TYPES";
    /** Only referenced to undo the earlier Share drive experiment. */
    private static final String LEGACY_SHARE_DRIVE = "CONFIG_VALUE_SHARE_DRIVE_FEATURE_ENABLED";

    private static final long CHECK_INTERVAL_MS = 30000L;

    private static volatile long lastCheckMs;
    private static boolean snapshotLogged;
    private static String lastStatus = "";
    private static boolean readFailureLogged;

    private WazeFeatureOverrides() { }

    /** Hot-path entry (speed callback): does nothing until the interval has elapsed. */
    static void tick() {
        if (SystemClock.elapsedRealtime() - lastCheckMs < CHECK_INTERVAL_MS) return;
        refresh();
    }

    /** Apply the current switch state now (settings change, main screen attach). */
    static synchronized void refresh() {
        lastCheckMs = SystemClock.elapsedRealtime();
        try {
            if (!Gateway.modEnabled()) return;
            SharedPreferences prefs = prefs();
            if (prefs == null) {
                logStatus("no SharedPreferences yet");
                return;
            }
            Boolean selector = readBool(VEHICLE_SELECTOR);
            boolean vehicleOn = prefs.getBoolean(PREF_VEHICLE_SELECTOR, VEHICLE_SELECTOR_DEFAULT);
            logStatus("switch vehicle=" + vehicleOn + " | config vehicleSelector=" + selector);
            if (selector == null) return; // ConfigManager not ready yet, retried on the next tick
            if (!snapshotLogged) {
                snapshotLogged = true;
                logSnapshot("server/default values");
            }
            boolean changed = restoreLegacyShareDrive(prefs);
            changed |= sync(prefs, vehicleOn, VEHICLE_SELECTOR);
            changed |= syncVehicleOptions(prefs, vehicleOn);
            changed |= resetSelectorShownCount(vehicleOn);
            boolean sldAlways = Gateway.prefInt("speed_drop_read_mode", 1) == 1;
            changed |= syncSldThreshold(prefs, sldAlways);
            changed |= sync(prefs, sldAlways, SLD_WHILE_ROAMING);   // TEST: speed-limit-decrease alerts without a route
            changed |= syncAapShutdownDelay(prefs, Gateway.pref("aa_close_on_disconnect", true));
            changed |= syncPinnedConfig(prefs);
            if (changed) logSnapshot("after override");
        } catch (Throwable t) {
            Log.w(TAG, "refresh failed", t);
        }
    }

    /** Logs a status line only when it differs from the previous one, so the 30 s tick stays quiet. */
    private static void logStatus(String status) {
        if (status.equals(lastStatus)) return;
        lastStatus = status;
        Log.i(TAG, "refresh: " + status);
    }

    /**
     * An earlier build offered a "force Share drive" switch. Put the flag back to what Waze had so
     * nobody keeps a Share drive UI that the backend cannot serve. No-op once restored.
     */
    private static boolean restoreLegacyShareDrive(SharedPreferences prefs) {
        String originalKey = "cfg_original_" + LEGACY_SHARE_DRIVE;
        if (!prefs.contains(originalKey)) return false;
        boolean original = prefs.getBoolean(originalKey, false);
        Boolean now = readBool(LEGACY_SHARE_DRIVE);
        if (now == null) return false;
        prefs.edit().remove(originalKey).remove("cfg_forced_" + LEGACY_SHARE_DRIVE)
                .remove("force_share_drive").apply();
        if (now.booleanValue() == original || !writeBool(LEGACY_SHARE_DRIVE, original)) return false;
        Log.i(TAG, LEGACY_SHARE_DRIVE + " experiment removed -> restored " + original);
        return true;
    }

    /** Returns true when a config value was written. */
    private static boolean sync(SharedPreferences prefs, boolean want, String field) {
        String originalKey = "cfg_original_" + field;
        String forcedKey = "cfg_forced_" + field;
        Boolean now = readBool(field);
        if (now == null) return false;

        if (want) {
            if (!prefs.contains(originalKey)) prefs.edit().putBoolean(originalKey, now).apply();
            if (now) return false;
            boolean reverted = prefs.getBoolean(forcedKey, false);
            if (!writeBool(field, true)) return false;
            prefs.edit().putBoolean(forcedKey, true).apply();
            Log.i(TAG, field + " was false -> forced true"
                    + (reverted ? " (a config sync had put it back)" : ""));
            return true;
        }
        if (!prefs.contains(originalKey)) return false;
        boolean original = prefs.getBoolean(originalKey, now);
        prefs.edit().remove(originalKey).remove(forcedKey).apply();
        if (now == original || !writeBool(field, original)) return false;
        Log.i(TAG, field + " override off -> restored " + original);
        return true;
    }

    /**
     * Waze counts every route preview that showed the vehicle selector and hides it for good once
     * the count reaches SELECTOR_MAX_SHOWS_INITIAL/EXTENDED (trip_overview dx.O()). An existing
     * user has long used those up, so keep the persisted counter at zero while the switch is on.
     * The counter is read live on every preview, so this needs no restart.
     */
    private static boolean resetSelectorShownCount(boolean want) {
        if (!want) return false;
        Long shown = readLong(VEHICLE_SELECTOR_SHOWN_COUNT);
        if (shown == null || shown.longValue() == 0L) return false;
        if (!writeLong(VEHICLE_SELECTOR_SHOWN_COUNT, 0L)) return false;
        Log.i(TAG, VEHICLE_SELECTOR_SHOWN_COUNT + " was " + shown + " -> 0"
                + " (max initial=" + readLong(VEHICLE_SELECTOR_MAX_INITIAL)
                + " extended=" + readLong(VEHICLE_SELECTOR_MAX_EXTENDED)
                + " useExtended=" + readBool(VEHICLE_SELECTOR_USE_EXTENDED) + ")");
        return true;
    }

    /**
     * The route-preview selector lists the vehicle types named in a comma-separated option string
     * (Private, Motorcycle, Taxi). When the server leaves it empty the flag alone shows nothing,
     * so fill the default list while the switch is on and put the original back when it is off.
     * A list the server already provides is never replaced.
     */
    private static boolean syncVehicleOptions(SharedPreferences prefs, boolean want) {
        String originalKey = "cfg_original_" + VEHICLE_SELECTOR_OPTIONS;
        String now = Gateway.cfgString(VEHICLE_SELECTOR_OPTIONS);
        if (want) {
            if (now.trim().length() > 0) return false;
            if (!prefs.contains(originalKey)) prefs.edit().putString(originalKey, now).apply();
            if (!writeString(VEHICLE_SELECTOR_OPTIONS, DEFAULT_VEHICLE_OPTIONS)) return false;
            Log.i(TAG, VEHICLE_SELECTOR_OPTIONS + " was empty -> " + DEFAULT_VEHICLE_OPTIONS);
            return true;
        }
        if (!prefs.contains(originalKey)) return false;
        String original = prefs.getString(originalKey, "");
        prefs.edit().remove(originalKey).apply();
        if (now.equals(original) || !writeString(VEHICLE_SELECTOR_OPTIONS, original)) return false;
        Log.i(TAG, VEHICLE_SELECTOR_OPTIONS + " override off -> restored [" + original + "]");
        return true;
    }

    private static final String AAP_SHUTDOWN_DELAY = "CONFIG_VALUE_AAP_SHUTDOWN_DELAY_ON_MAIN_SERVICE_DESTROY_MS";
    /** How long Waze waits after Android Auto's main service is destroyed before it shuts down. */
    private static final long AAP_QUICK_DELAY_MS = 1500L;

    /**
     * "Close the app when Android Auto disconnects": Waze waits a server-set time after the disconnect before it
     * shuts down, which feels slow. While the switch is on shorten that wait; the server value is remembered and put
     * back when the switch is turned off.
     */
    private static boolean syncAapShutdownDelay(SharedPreferences prefs, boolean quick) {
        String originalKey = "cfg_original_" + AAP_SHUTDOWN_DELAY;
        Long now = readLong(AAP_SHUTDOWN_DELAY);
        if (now == null) return false;
        if (quick) {
            if (!prefs.contains(originalKey)) {
                prefs.edit().putLong(originalKey, now.longValue()).apply();
                Log.i(TAG, AAP_SHUTDOWN_DELAY + " server value " + now + " ms");
            }
            if (now.longValue() <= AAP_QUICK_DELAY_MS) return false;
            if (!writeLong(AAP_SHUTDOWN_DELAY, AAP_QUICK_DELAY_MS)) return false;
            Log.i(TAG, AAP_SHUTDOWN_DELAY + " " + now + " -> " + AAP_QUICK_DELAY_MS);
            return true;
        }
        if (!prefs.contains(originalKey)) return false;
        long original = prefs.getLong(originalKey, now.longValue());
        prefs.edit().remove(originalKey).apply();
        if (now.longValue() == original || !writeLong(AAP_SHUTDOWN_DELAY, original)) return false;
        Log.i(TAG, AAP_SHUTDOWN_DELAY + " override off -> restored " + original);
        return true;
    }

    /** Speed limits change in steps of 10, so "any real decrease" is 10; Waze's own default is 35. User range 10..35. */
    private static final int SLD_MIN_THRESHOLD_KPH = 10;
    private static final int SLD_MAX_THRESHOLD_KPH = 35;
    static final int SLD_DEFAULT_THRESHOLD_KPH = 35;

    private static long sldAlwaysThreshold() {
        int chosen = Gateway.prefInt("sld_threshold_kph", SLD_DEFAULT_THRESHOLD_KPH);
        return Math.max(SLD_MIN_THRESHOLD_KPH, Math.min(SLD_MAX_THRESHOLD_KPH, chosen));
    }

    /**
     * "Always show" for speed-limit-decrease alerts: besides the native speed filter (SegmentNative), lower the
     * minimum drop that raises one. The server value is remembered and put back when the mode is switched off.
     */
    private static boolean syncSldThreshold(SharedPreferences prefs, boolean always) {
        String originalKey = "cfg_original_" + SLD_THRESHOLD_KPH;
        Long now = readLong(SLD_THRESHOLD_KPH);
        if (now == null) return false;
        if (always) {
            if (!prefs.contains(originalKey)) prefs.edit().putLong(originalKey, now.longValue()).apply();
            long target = sldAlwaysThreshold();
            if (now.longValue() == target && isConfigLocked(SLD_THRESHOLD_KPH)) return false;
            setConfigLocked(SLD_THRESHOLD_KPH, false);
            boolean written = now.longValue() == target || writeLong(SLD_THRESHOLD_KPH, target);
            setConfigLocked(SLD_THRESHOLD_KPH, true);
            if (!written) return false;
            Log.i(TAG, SLD_THRESHOLD_KPH + " " + now + " -> " + target + " (locked)");
            return now.longValue() != target;
        }
        if (!prefs.contains(originalKey)) return false;
        long original = prefs.getLong(originalKey, now.longValue());
        prefs.edit().remove(originalKey).apply();
        setConfigLocked(SLD_THRESHOLD_KPH, false);
        if (now.longValue() == original || !writeLong(SLD_THRESHOLD_KPH, original)) return false;
        Log.i(TAG, SLD_THRESHOLD_KPH + " override off -> restored " + original);
        return true;
    }

    private static void logSnapshot(String label) {
        Log.i(TAG, "config (" + label + "): vehicleSelector=" + readBool(VEHICLE_SELECTOR)
                + " selectorOptions=[" + Gateway.cfgString(VEHICLE_SELECTOR_OPTIONS) + "]"
                + " routingVehicleTypes=[" + Gateway.cfgString(ROUTING_VEHICLE_TYPES) + "]"
                + " selectorShown=" + readLong(VEHICLE_SELECTOR_SHOWN_COUNT)
                + "/" + readLong(VEHICLE_SELECTOR_MAX_INITIAL)
                + "/" + readLong(VEHICLE_SELECTOR_MAX_EXTENDED));
        Log.i(TAG, "config SLD: localEnabled=" + readBool(SLD_LOCAL_ENABLED)
                + " whileRoaming=" + readBool(SLD_WHILE_ROAMING)
                + " thresholdKph=" + readLong(SLD_THRESHOLD_KPH)
                + " distanceM=" + readLong(SLD_DISTANCE_M)
                + " onRouteNotif=" + readBool(SLD_ON_ROUTE_NOTIF));
    }

    private static final String SLD_LOCAL_ENABLED = "CONFIG_VALUE_ALERTS_SLD_LOCAL_ENABLED";
    private static final String SLD_WHILE_ROAMING = "CONFIG_VALUE_ALERTS_SLD_WHILE_ROAMING_ENABLED";
    private static final String SLD_THRESHOLD_KPH = "CONFIG_VALUE_ALERTS_SLD_THRESHOLD_KPH";
    private static final String SLD_DISTANCE_M = "CONFIG_VALUE_ALERTS_SPEED_LIMIT_DECREASE_ALERT_DISTANCE_METERS";
    private static final String SLD_ON_ROUTE_NOTIF = "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_SPEED_LIMIT_DECREASE";

    // ---------------- Waze configuration pinned by switches in Settings ----------------

    /**
     * Alert distances: pref key, Waze config value, default metres, slider min, slider max. The Settings page lists
     * them in this order. Each is always pinned to its pref value.
     */
    static final String[][] ALERT_DISTANCES = {
            {"alert_dist_police", "CONFIG_VALUE_ALERTS_POLICE_ALERT_DISTANCE_METERS", "1000", "200", "3000"},
            {"alert_dist_camera", "CONFIG_VALUE_ALERTS_ALERTER_ALERT_DISTANCE", "1000", "200", "3000"},
            {"alert_dist_hazard", "CONFIG_VALUE_ALERTS_HAZARD_ALERT_DISTANCE_METERS", "600", "200", "3000"},
            {"alert_dist_accident", "CONFIG_VALUE_ALERTS_ACCIDENT_ALERT_DISTANCE_METERS", "1000", "200", "3000"},
            {"alert_dist_traffic", "CONFIG_VALUE_ALERTS_HEAVY_TRAFFIC_ALERT_DISTANCE_METERS", "1000", "200", "3000"},
            {"alert_dist_blocked_lane", "CONFIG_VALUE_ALERTS_BLOCKED_LANE_ALERT_DISTANCE", "600", "200", "3000"},
            {"alert_dist_zone_street", "CONFIG_VALUE_ALERTS_ENFORCEMENT_ALERTS_DISTANCE_STREETS", "700", "200", "3000"},
            {"alert_dist_zone_highway", "CONFIG_VALUE_ALERTS_ENFORCEMENT_ALERTS_DISTANCE_HIGHWAY", "1000", "200", "3000"},
            {"alert_dist_zone_freeway", "CONFIG_VALUE_ALERTS_ENFORCEMENT_ALERTS_DISTANCE_FREEWAY", "1500", "200", "3000"},
            {"alert_dist_between", "CONFIG_VALUE_ALERTS_DISTANCE_BETWEEN_ALERTS", "200", "100", "1000"},
    };

    private static final String CAMERA_SOUND_ANY_SPEED = "CONFIG_VALUE_ALERTS_PLAY_SPEED_CAMERA_SOUND_BELOW_SPEED_LIMIT";
    /**
     * Cameras that catch phone use and cameras that check the following distance, always held on: show on the map,
     * notify on the route, play the sound.
     */
    private static final String[] CAMERAS_ALWAYS_ON = {
            "CONFIG_VALUE_MAP_SHOW_MOBILE_PHONE_CAMERAS",
            "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_MOBILE_PHONE_CAMERAS",
            "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_MOBILE_PHONE_CAMERAS_SOUND_ENABLED",
            "CONFIG_VALUE_MAP_SHOW_SAFE_DISTANCE_CAMERAS",
            "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_SAFE_DISTANCE_CAMERAS",
            "CONFIG_VALUE_NOTIFICATIONS_ON_ROUTE_SAFE_DISTANCE_CAMERAS_SOUND_ENABLED",
    };
    private static final String ALERT_MAX_TRIGGER_TIME ="CONFIG_VALUE_ALERTS_MAX_TRIGGER_TIME_ENABLED";
    private static final String BACKGROUND_TIMEOUT_MS = "CONFIG_VALUE_POWER_BACKGROUND_TIMEOUT_MS";

    /** Sponsored pins, in-car ads, ad tracking and the promotional splash screens Waze's server can switch on. */
    private static final Object[][] ADS_OFF = {
            {"CONFIG_VALUE_GOOGLE_ADS_FEATURE_ENABLED", Boolean.FALSE},
            {"CONFIG_VALUE_GOOGLE_ADS_IN_CAR_ENABLED", Boolean.FALSE},
            {"CONFIG_VALUE_GOOGLE_ADS_DISCOVERY_PINS_ENABLED", Boolean.FALSE},
            {"CONFIG_VALUE_GOOGLE_ADS_MAX_CONCURRENT_PINS", Long.valueOf(0L)},
            {"CONFIG_VALUE_GOOGLE_ADS_IN_CAR_MAX_CONCURRENT_PINS", Long.valueOf(0L)},
            {"CONFIG_VALUE_ZSPEED_MIN_TAKEOVER_REQUEST_INTERVAL_SEC", Long.valueOf(2000000000L)},
            {"CONFIG_VALUE_ADS_INVENTORY_PREDICTION_ENABLED", Boolean.FALSE},
            {"CONFIG_VALUE_AD_EVENTS_FEATURE_ENABLED", Boolean.FALSE},
            {"CONFIG_VALUE_ADS_ALLOW_PROFILE_TARGETING_DEFAULT", Boolean.FALSE},
            {"CONFIG_VALUE_ADS_ALLOW_PROFILE_TARGETING", Boolean.FALSE},
            {"CONFIG_VALUE_EXTERNALPOI_MAX_POIS_DISPLAY", Long.valueOf(0L)},
            {"CONFIG_VALUE_APP_LAUNCH_DYNAMIC_SPLASH_SCREEN_SHOW_FREQUENCY", "OFF"},
    };

    /** Crash reports, usage and performance statistics. Live traffic and route data use a different channel. */
    private static final String[] TELEMETRY_OFF = {
            "CONFIG_VALUE_GENERAL_ANDROID_CRASHLYTICS_ENABLED",
            "CONFIG_VALUE_GENERAL_CRASHLYTICS_LOG_ENABLED",
            "CONFIG_VALUE_ANALYTICS_FIREBASE_PERFORMANCE_ENABLED",
            "CONFIG_VALUE_ANALYTICS_ANDROID_MAIN_THREAD_RESPONSIVENESS_MONITORING",
            "CONFIG_VALUE_ANALYTICS_ANDROID_CPP_THREAD_RESPONSIVENESS_MONITORING",
            "CONFIG_VALUE_MAP_PERFORMANCE_FRAME_RATE_MEASURE_ENABLED",
            "CONFIG_VALUE_MAP_PERFORMANCE_OBJECT_DENSITY_SAMPLER_ENABLED",
            "CONFIG_VALUE_MAP_PERFORMANCE_OBJECT_SNAPSHOT_SAMPLER_ENABLED",
            "CONFIG_VALUE_CONFIG_REPORT_PREFERENCES_STAT_ENABLED",
            "CONFIG_VALUE_ANDROID_AUTO_LOG_ON_GET_TEMPLATE_DELAY_TO_FIREBASE",
            "CONFIG_VALUE_GOOGLE_ADS_TRUSTLESS_TOKEN_LOGGING_ENABLED",
            "CONFIG_VALUE_SIGNUP_STATS_UNAUTHENTICATED_MODULE_ON",
    };

    /** Applies every switch below; returns true when a config value was written. */
    private static boolean syncPinnedConfig(SharedPreferences prefs) {
        boolean changed = false;
        for (String[] entry : ALERT_DISTANCES) {
            changed |= pinConfig(prefs, true, entry[1],
                    Long.valueOf(Gateway.prefInt(entry[0], Integer.parseInt(entry[2]))));
        }
        // With it on the server limits an alert to what the car drives in ~22 s, so longer distances never show.
        changed |= pinConfig(prefs, true, ALERT_MAX_TRIGGER_TIME, Boolean.FALSE);
        changed |= pinConfig(prefs, Gateway.pref("camera_sound_any_speed", false), CAMERA_SOUND_ANY_SPEED, Boolean.TRUE);
        for (String field : CAMERAS_ALWAYS_ON) changed |= pinConfig(prefs, true, field, Boolean.TRUE);
        changed |= pinConfig(prefs, Gateway.pref("keep_background_long", false), BACKGROUND_TIMEOUT_MS,
                Long.valueOf(Gateway.prefInt("background_minutes", 30) * 60000L));
        boolean ads = Gateway.pref("block_ads", false);
        for (Object[] entry : ADS_OFF) changed |= pinConfig(prefs, ads, (String) entry[0], entry[1]);
        boolean telemetry = Gateway.pref("block_telemetry", false);
        for (String field : TELEMETRY_OFF) changed |= pinConfig(prefs, telemetry, field, Boolean.FALSE);
        return changed;
    }

    /**
     * While {@code on}, holds the Waze config value {@code field} at {@code value} (Boolean, Long or String): unlock,
     * write, lock again, because Waze's native config refuses a server update to a locked value. When it goes
     * off, the value seen before the first override is written back and left unlocked.
     * Returns true when a value was written; false also when ConfigManager is not ready yet (retried on the next tick).
     */
    private static boolean pinConfig(SharedPreferences prefs, boolean on, String field, Object value) {
        String originalKey = "cfg_original_" + field;
        if (!on && !prefs.contains(originalKey)) return false;   // nothing was overridden: no need to read the value
        Object now = readConfig(field, value);
        if (now == null) return false;
        if (on) {
            if (!prefs.contains(originalKey)) prefs.edit().putString(originalKey, String.valueOf(now)).apply();
            if (now.equals(value) && isConfigLocked(field)) return false;
            setConfigLocked(field, false);
            boolean written = now.equals(value) || writeConfig(field, value);
            setConfigLocked(field, true);
            if (!written) return false;
            Log.i(TAG, field + " " + now + " -> " + value + " (locked)");
            return !now.equals(value);
        }
        String text = prefs.getString(originalKey, null);
        prefs.edit().remove(originalKey).apply();
        setConfigLocked(field, false);
        Object original = text == null ? null
                : value instanceof Boolean ? (Object) Boolean.valueOf(text)
                : value instanceof Long ? (Object) parseLong(text) : text;
        if (original == null || original.equals(now) || !writeConfig(field, original)) return false;
        Log.i(TAG, field + " override off -> restored " + original);
        return true;
    }

    private static Long parseLong(String text) {
        try { return Long.valueOf(text); } catch (NumberFormatException e) { return null; }
    }

    private static Object readConfig(String field, Object kind) {
        if (kind instanceof Boolean) return readBool(field);
        if (kind instanceof Long) return readLong(field);
        return readString(field);
    }

    private static boolean writeConfig(String field, Object value) {
        if (value instanceof Boolean) return writeBool(field, ((Boolean) value).booleanValue());
        if (value instanceof Long) return writeLong(field, ((Long) value).longValue());
        return writeString(field, String.valueOf(value));
    }

    /** The native config id of a ConfigValues entry (com.waze.config.f.e()), or null. */
    private static Integer configId(String field) {
        try {
            Object key = configKey(field);
            Object id = key.getClass().getMethod("e").invoke(key);
            return id instanceof Integer ? (Integer) id : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean isConfigLocked(String field) {
        try {
            Integer id = configId(field);
            Object manager = configManager();
            if (id == null || manager == null) return false;
            Object locked = manager.getClass().getMethod("isConfigValueLockedNTV", int.class).invoke(manager, id);
            return Boolean.TRUE.equals(locked);
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * ConfigManager.setConfigValue* only queues the write on Waze's native thread. A lock taken right after it would
     * run first and make the native layer refuse the write, so the value stayed at the server's. Locking therefore
     * goes through the same queue, behind the write; unlocking stays immediate so it precedes the write.
     */
    private static void setConfigLocked(final String field, final boolean locked) {
        if (locked && postToNative(new Runnable() {
            @Override public void run() { applyConfigLock(field, true); }
        })) return;
        applyConfigLock(field, locked);
    }

    private static boolean postToNative(Runnable task) {
        try {
            Object queued = Class.forName("com.waze.NativeManager").getMethod("Post", Runnable.class)
                    .invoke(null, task);
            return Boolean.TRUE.equals(queued);
        } catch (Throwable t) {
            return false;
        }
    }

    private static void applyConfigLock(String field, boolean locked) {
        try {
            Integer id = configId(field);
            Object manager = configManager();
            if (id == null || manager == null) return;
            manager.getClass().getMethod("setConfigValueLockedNTV", int.class, boolean.class)
                    .invoke(manager, id, locked);
        } catch (Throwable t) {
            Log.w(TAG, "lock " + field + " failed", t);
        }
    }

    // ---------------- Waze config access (reflection) ----------------
    private static Object configManager() throws Exception {
        return Class.forName("com.waze.ConfigManager").getMethod("getInstance").invoke(null);
    }

    private static Object configKey(String field) throws Exception {
        return Class.forName("com.waze.config.ConfigValues").getField(field).get(null);
    }

    /** Null when the flag or ConfigManager is unavailable, so callers can retry later. */
    private static Boolean readBool(String field) {
        try {
            Object manager = configManager();
            Object key = configKey(field);
            if (manager == null || key == null) return null;
            Object value = manager.getClass().getMethod("getConfigValueBool", key.getClass())
                    .invoke(manager, key);
            return value instanceof Boolean ? (Boolean) value : null;
        } catch (Throwable t) {
            if (!readFailureLogged) {
                readFailureLogged = true;
                Log.w(TAG, "read " + field + " failed", t);
            }
            return null;
        }
    }

    /** Null when the value or ConfigManager is unavailable. */
    private static Long readLong(String field) {
        try {
            Object manager = configManager();
            Object key = configKey(field);
            if (manager == null || key == null) return null;
            Object value = manager.getClass().getMethod("getConfigValueLong", key.getClass())
                    .invoke(manager, key);
            return value instanceof Long ? (Long) value : null;
        } catch (Throwable t) {
            return null;
        }
    }

    /** Null when the value or ConfigManager is unavailable. */
    private static String readString(String field) {
        try {
            Object manager = configManager();
            Object key = configKey(field);
            if (manager == null || key == null) return null;
            Object value = manager.getClass().getMethod("getConfigValueString", key.getClass())
                    .invoke(manager, key);
            return value instanceof String ? (String) value : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean writeLong(String field, long value) {
        try {
            Object manager = configManager();
            Object key = configKey(field);
            if (manager == null || key == null) return false;
            manager.getClass().getMethod("setConfigValueLong", key.getClass(), long.class)
                    .invoke(manager, key, Long.valueOf(value));
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "setConfigValueLong " + field + " failed", t);
            return false;
        }
    }

    private static boolean writeString(String field, String value) {
        try {
            Object manager = configManager();
            Object key = configKey(field);
            if (manager == null || key == null) return false;
            manager.getClass().getMethod("setConfigValueString", key.getClass(), String.class)
                    .invoke(manager, key, value);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "setConfigValueString " + field + " failed", t);
            return false;
        }
    }

    private static boolean writeBool(String field, boolean value) {
        try {
            Object manager = configManager();
            Object key = configKey(field);
            if (manager == null || key == null) return false;
            manager.getClass().getMethod("setConfigValueBool", key.getClass(), boolean.class)
                    .invoke(manager, key, Boolean.valueOf(value));
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "setConfigValueBool " + field + " failed", t);
            return false;
        }
    }

    private static SharedPreferences prefs() {
        try {
            Context app = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke((Object) null);
            return app == null ? null : app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        } catch (Throwable t) {
            return null;
        }
    }
}
