package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;

import java.lang.reflect.Method;
import java.lang.ref.WeakReference;

/** Process-local bridge used by injected bytecode and Nuvio's native settings pane. */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class MorpheSettingsRuntime {
    public static final String PREFERENCES_NAME = "morphe_patches";
    public static final String SDH_CLEANUP_MODE_KEY = "subtitles.sdh_cleanup_mode";
    /** Legacy dev.7 Boolean, retained only for one-way preference migration. */
    public static final String REMOVE_SDH_KEY = "subtitles.remove_sdh_annotations";
    public static final int SDH_MODE_OFF = 0;
    public static final int SDH_MODE_KEEP_LYRICS = 1;
    public static final int SDH_MODE_REMOVE_LYRICS = 2;

    private static volatile Application application;
    private static volatile WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private static volatile boolean activityCallbacksRegistered;
    private static volatile SharedPreferences preferences;
    private static volatile int sdhCleanupMode = SDH_MODE_OFF;
    private static volatile boolean subtitlesExpanded;

    private MorpheSettingsRuntime() {}

    /** Reuses Nuvio's hidden EXPERIENCE slot only inside its visibility filter. */
    public static int mapVisibilityOrdinal(int ordinal) {
        return ordinal == 0 ? 4 : ordinal;
    }

    public static void initialize(Context context) {
        Context appContext = context.getApplicationContext();
        if (appContext instanceof Application) {
            application = (Application) appContext;
            registerActivityCallbacks(application);
        }
        if (preferences != null) return;
        synchronized (MorpheSettingsRuntime.class) {
            if (preferences != null) return;
            SharedPreferences prefs = context.getApplicationContext()
                    .getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
            sdhCleanupMode = readSdhCleanupMode(prefs);
            if (!prefs.contains(SDH_CLEANUP_MODE_KEY) && prefs.getBoolean(REMOVE_SDH_KEY, false)) {
                prefs.edit().putString(SDH_CLEANUP_MODE_KEY, "KEEP_LYRICS").commit();
            }
            prefs.registerOnSharedPreferenceChangeListener((sharedPreferences, key) -> {
                if (SDH_CLEANUP_MODE_KEY.equals(key)) {
                    sdhCleanupMode = readSdhCleanupMode(sharedPreferences);
                }
            });
            preferences = prefs;
        }
    }

    /** Called once for every outgoing cue batch; state changes are immediately visible. */
    public static boolean isRemoveSdhEnabled() {
        if (preferences == null) {
            Application application = currentApplication();
            if (application != null) initialize(application);
        }
        return sdhCleanupMode != SDH_MODE_OFF;
    }

    /** Backward-compatible test and migration API. */
    public static void setRemoveSdhEnabled(Context context, boolean enabled) {
        initialize(context);
        persistSdhCleanupMode(enabled ? SDH_MODE_KEEP_LYRICS : SDH_MODE_OFF);
    }

    /** Toggles the preference synchronously and returns the new value. */
    public static boolean toggleRemoveSdhEnabled() {
        if (preferences == null) {
            Application current = currentApplication();
            if (current != null) initialize(current);
        }
        if (preferences == null) {
            throw new IllegalStateException("Morphe settings were not initialized");
        }
        boolean enabled = sdhCleanupMode == SDH_MODE_OFF;
        persistSdhCleanupMode(enabled ? SDH_MODE_KEEP_LYRICS : SDH_MODE_OFF);
        return enabled;
    }

    /** Called once for every outgoing cue batch. */
    public static int sdhCleanupModeOrdinal() {
        if (preferences == null) {
            Application current = currentApplication();
            if (current != null) initialize(current);
        }
        return sdhCleanupMode;
    }

    public static boolean isSdhModeSelected(int mode) {
        return sdhCleanupModeOrdinal() == sanitizeMode(mode);
    }

    public static void setSdhCleanupMode(Context context, int mode) {
        initialize(context);
        persistSdhCleanupMode(mode);
    }

    public static void setSdhCleanupMode(int mode) {
        if (preferences == null) {
            Application current = currentApplication();
            if (current != null) initialize(current);
        }
        if (preferences == null) {
            throw new IllegalStateException("Morphe settings were not initialized");
        }
        persistSdhCleanupMode(mode);
    }

    public static String sdhModeTitle(int mode) {
        switch (sanitizeMode(mode)) {
            case SDH_MODE_KEEP_LYRICS:
                return "Remove SDH, keep lyrics";
            case SDH_MODE_REMOVE_LYRICS:
                return "Full cleanup";
            default:
                return "Off";
        }
    }

    public static String sdhModeDescription(int mode) {
        switch (sanitizeMode(mode)) {
            case SDH_MODE_KEEP_LYRICS:
                return "Remove annotations, sound descriptions and speaker labels while preserving likely song lyrics.";
            case SDH_MODE_REMOVE_LYRICS:
                return "Also remove all text enclosed by normal or misdecoded music-note markers.";
            default:
                return "Do not remove any subtitle text.";
        }
    }

    public static String sdhDialogTitle() {
        return "Remove SDH annotations";
    }

    public static String currentSdhModeTitle() {
        return sdhModeTitle(sdhCleanupModeOrdinal());
    }

    static Activity resumedActivity() {
        Activity activity = resumedActivity.get();
        return activity != null && !activity.isFinishing() && !activity.isDestroyed() ? activity : null;
    }

    public static boolean isSubtitlesExpanded() {
        return subtitlesExpanded;
    }

    public static boolean toggleSubtitlesExpanded() {
        subtitlesExpanded = !subtitlesExpanded;
        return subtitlesExpanded;
    }

    public static String subtitlesExpansionStatus() {
        return subtitlesExpanded ? "Open" : "Closed";
    }

    private static void persistSdhCleanupMode(int mode) {
        int sanitized = sanitizeMode(mode);
        sdhCleanupMode = sanitized;
        // The click must survive an immediate force-stop or device restart.
        preferences.edit().putString(SDH_CLEANUP_MODE_KEY, storedModeName(sanitized)).commit();
    }

    private static int readSdhCleanupMode(SharedPreferences prefs) {
        String stored = prefs.getString(SDH_CLEANUP_MODE_KEY, null);
        if ("KEEP_LYRICS".equals(stored) || "FULL".equals(stored)) return SDH_MODE_KEEP_LYRICS;
        if ("REMOVE_LYRICS".equals(stored)) return SDH_MODE_REMOVE_LYRICS;
        if (stored == null && prefs.getBoolean(REMOVE_SDH_KEY, false)) return SDH_MODE_KEEP_LYRICS;
        return SDH_MODE_OFF;
    }

    private static int sanitizeMode(int mode) {
        return mode >= SDH_MODE_OFF && mode <= SDH_MODE_REMOVE_LYRICS ? mode : SDH_MODE_OFF;
    }

    private static String storedModeName(int mode) {
        switch (sanitizeMode(mode)) {
            case SDH_MODE_KEEP_LYRICS:
                return "KEEP_LYRICS";
            case SDH_MODE_REMOVE_LYRICS:
                return "REMOVE_LYRICS";
            default:
                return "OFF";
        }
    }

    private static Application currentApplication() {
        Application cached = application;
        if (cached != null) return cached;
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method method = activityThread.getDeclaredMethod("currentApplication");
            Application reflected = (Application) method.invoke(null);
            application = reflected;
            return reflected;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void registerActivityCallbacks(Application app) {
        if (activityCallbacksRegistered) return;
        synchronized (MorpheSettingsRuntime.class) {
            if (activityCallbacksRegistered) return;
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityCreated(Activity activity, Bundle state) {}
                @Override public void onActivityStarted(Activity activity) {}
                @Override public void onActivityResumed(Activity activity) {
                    resumedActivity = new WeakReference<>(activity);
                }
                @Override public void onActivityPaused(Activity activity) {
                    Activity current = resumedActivity.get();
                    if (current == activity) resumedActivity = new WeakReference<>(null);
                }
                @Override public void onActivityStopped(Activity activity) {}
                @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
                @Override public void onActivityDestroyed(Activity activity) {}
            });
            activityCallbacksRegistered = true;
        }
    }
}
