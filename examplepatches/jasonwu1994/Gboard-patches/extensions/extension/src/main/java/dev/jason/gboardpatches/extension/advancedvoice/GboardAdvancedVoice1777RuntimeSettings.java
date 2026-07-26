package dev.jason.gboardpatches.extension.advancedvoice;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicInteger;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

public final class GboardAdvancedVoice1777RuntimeSettings {
    private static final String TAG = "GboardPatches";
    private static final String LOG_PREFIX = "[gboard-advanced-voice-settings] ";
    private static final Object SNAPSHOT_LOCK = new Object();
    private static final AtomicInteger FAILURE_LOG_COUNT = new AtomicInteger();

    private static volatile Snapshot cachedSnapshot;
    private static volatile Boolean enabledOverrideForTest;
    private static volatile Boolean zhTwPunctuationEnabledOverrideForTest;
    private static volatile Context applicationContext;

    private GboardAdvancedVoice1777RuntimeSettings() {
    }

    public static boolean isEnabled() {
        Boolean override = enabledOverrideForTest;
        if (override != null) {
            return override.booleanValue();
        }
        try {
            return snapshot().enabled;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean isZhTwPunctuationInterventionEnabled() {
        try {
            Boolean enabledOverride = enabledOverrideForTest;
            Boolean punctuationOverride = zhTwPunctuationEnabledOverrideForTest;
            Snapshot current = enabledOverride == null || punctuationOverride == null
                    ? snapshot()
                    : null;
            boolean enabled = enabledOverride != null
                    ? enabledOverride.booleanValue()
                    : current.enabled;
            boolean punctuationEnabled = punctuationOverride != null
                    ? punctuationOverride.booleanValue()
                    : current.zhTwPunctuationEnabled;
            return enabled && punctuationEnabled;
        } catch (Throwable ignored) {
            return false;
        }
    }

    static Snapshot snapshot() {
        Snapshot cached = cachedSnapshot;
        if (cached != null) {
            return cached;
        }
        synchronized (SNAPSHOT_LOCK) {
            Snapshot current = cachedSnapshot;
            if (current != null) {
                return current;
            }
            Snapshot loaded = loadSnapshot();
            cachedSnapshot = loaded;
            return loaded;
        }
    }

    static Snapshot snapshotFromPreferences(SharedPreferences preferences) {
        if (preferences == null) {
            return defaultSnapshot("defaults");
        }
        try {
            return new Snapshot(
                    GboardAdvancedVoiceSettings.readEnabled(preferences),
                    GboardAdvancedVoiceSettings.readZhTwPunctuationEnabled(preferences),
                    "local");
        } catch (Throwable failure) {
            logFailure("failed to parse settings", failure);
            return defaultSnapshot("local-error");
        }
    }

    public static void setEnabledOverrideForTest(boolean enabled) {
        enabledOverrideForTest = Boolean.valueOf(enabled);
    }

    public static void setZhTwPunctuationEnabledOverrideForTest(boolean enabled) {
        zhTwPunctuationEnabledOverrideForTest = Boolean.valueOf(enabled);
    }

    public static void clearEnabledOverrideForTest() {
        enabledOverrideForTest = null;
        zhTwPunctuationEnabledOverrideForTest = null;
        cachedSnapshot = null;
        applicationContext = null;
        FAILURE_LOG_COUNT.set(0);
    }

    private static Snapshot loadSnapshot() {
        Context context = resolveContext();
        if (context == null) {
            return defaultSnapshot("defaults");
        }
        try {
            SharedPreferences preferences = GboardPatchesSettings.preferences(context);
            GboardAdvancedVoiceSettings.ensureDefaults(preferences);
            return snapshotFromPreferences(preferences);
        } catch (Throwable failure) {
            logFailure("failed to read local settings", failure);
            return defaultSnapshot("local-error");
        }
    }

    private static Snapshot defaultSnapshot(String source) {
        return new Snapshot(false, false, source);
    }

    private static Context resolveContext() {
        Context cached = applicationContext;
        if (cached != null) {
            return cached;
        }
        Context resolved = reflectedApplicationContext(
                "android.app.ActivityThread", "currentApplication");
        if (resolved == null) {
            resolved = reflectedApplicationContext(
                    "android.app.AppGlobals", "getInitialApplication");
        }
        applicationContext = resolved;
        return resolved;
    }

    private static Context reflectedApplicationContext(String className, String methodName) {
        try {
            Class<?> owner = Class.forName(className);
            Method method = owner.getMethod(methodName);
            Object value = method.invoke(null);
            if (!(value instanceof Application)) {
                return null;
            }
            Context context = (Context) value;
            Context app = context.getApplicationContext();
            return app != null ? app : context;
        } catch (Throwable failure) {
            logFailure("failed to resolve application context via " + className, failure);
            return null;
        }
    }

    private static void logFailure(String message, Throwable failure) {
        if (FAILURE_LOG_COUNT.getAndIncrement() >= 6) {
            return;
        }
        try {
            Log.w(TAG, LOG_PREFIX + message, failure);
        } catch (Throwable ignored) {
            // Logging must not affect Gboard.
        }
    }

    static final class Snapshot {
        final boolean enabled;
        final boolean zhTwPunctuationEnabled;
        final String source;

        Snapshot(boolean enabled, boolean zhTwPunctuationEnabled, String source) {
            this.enabled = enabled;
            this.zhTwPunctuationEnabled = zhTwPunctuationEnabled;
            this.source = source == null ? "unknown" : source;
        }

        boolean isZhTwPunctuationInterventionEnabled() {
            return enabled && zhTwPunctuationEnabled;
        }
    }
}
