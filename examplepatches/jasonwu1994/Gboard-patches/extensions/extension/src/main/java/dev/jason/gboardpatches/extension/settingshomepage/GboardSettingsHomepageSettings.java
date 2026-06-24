package dev.jason.gboardpatches.extension.settingshomepage;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Method;

public final class GboardSettingsHomepageSettings {
    private static final String TAG = "GboardPatches";
    public static final String PREF_FILE = "gboard_settings_homepage";
    public static final String PREF_KEY_MODE = "pref_settings_homepage_mode";
    public static final String PREF_KEY_FORCE_NEW_GUARD_PENDING =
            "pref_settings_homepage_force_new_guard_pending";
    public static final String PREF_KEY_FORCE_NEW_GUARD_PENDING_AT =
            "pref_settings_homepage_force_new_guard_pending_at";
    public static final String PREF_KEY_FORCE_NEW_GUARD_RECOVERED =
            "pref_settings_homepage_force_new_guard_recovered";
    public static final String PREF_KEY_FORCE_NEW_TRIAL_ARMED =
            "pref_settings_homepage_force_new_trial_armed";
    public static final String PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT =
            "pref_settings_homepage_force_new_trial_expires_at";
    public static final String PREF_KEY_FORCE_NEW_TRIAL_EXPIRED =
            "pref_settings_homepage_force_new_trial_expired";

    public static final String MODE_AUTO = "auto";
    public static final String MODE_FORCE_NEW = "force_new";
    public static final String MODE_FORCE_LEGACY = "force_legacy";

    public static final String LABEL_NEW = "New";
    public static final String LABEL_LEGACY = "Legacy";
    private static final long FORCE_NEW_SELECTION_WINDOW_MS = 10_000L;
    private static final long FORCE_NEW_GUARD_SUCCESS_DELAY_MS = 2500L;

    private static volatile long activeForceNewGuardAttemptAt;
    private static volatile long activeForceNewTrialExpiresAt;

    private GboardSettingsHomepageSettings() {
    }

    public static SharedPreferences preferences(Context context) {
        Context applicationContext = context.getApplicationContext();
        Context lookupContext = applicationContext != null ? applicationContext : context;
        return lookupContext.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
    }

    public static void ensureDefaults(Context context) {
        if (context == null) {
            return;
        }
        ensureDefaults(preferences(context));
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        String storedMode = preferences.getString(PREF_KEY_MODE, MODE_AUTO);
        String sanitizedMode = sanitizeMode(storedMode);
        if (!preferences.contains(PREF_KEY_MODE) || !sanitizedMode.equals(storedMode)) {
            preferences.edit().putString(PREF_KEY_MODE, sanitizedMode).apply();
        }
    }

    public static String readMode(Context context) {
        SharedPreferences preferences = preferences(context);
        ensureDefaults(preferences);
        return readMode(preferences);
    }

    public static String readMode(SharedPreferences preferences) {
        if (preferences == null) {
            return MODE_AUTO;
        }
        return sanitizeMode(preferences.getString(PREF_KEY_MODE, MODE_AUTO));
    }

    public static void writeMode(Context context, String mode) {
        if (context == null) {
            return;
        }
        SharedPreferences preferences = preferences(context);
        writeMode(preferences, mode);
        String sanitizedMode = sanitizeMode(mode);
        if (MODE_FORCE_NEW.equals(sanitizedMode)) {
            long expiresAt = readLongPreference(preferences, PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT,
                    0L);
            if (expiresAt > 0L) {
                scheduleForceNewTrialExpiry(context, expiresAt);
            }
        } else {
            activeForceNewTrialExpiresAt = 0L;
        }
    }

    private static void writeMode(SharedPreferences preferences, String mode) {
        if (preferences == null) {
            return;
        }
        String sanitizedMode = sanitizeMode(mode);
        SharedPreferences.Editor editor = preferences.edit()
                .putString(PREF_KEY_MODE, sanitizedMode);
        clearForceNewGuard(editor);
        if (MODE_FORCE_NEW.equals(sanitizedMode)) {
            long expiresAt = System.currentTimeMillis() + FORCE_NEW_SELECTION_WINDOW_MS;
            armForceNewTrial(editor, expiresAt);
            activeForceNewTrialExpiresAt = expiresAt;
        } else {
            clearForceNewTrial(editor);
            activeForceNewTrialExpiresAt = 0L;
        }
        editor.apply();
        activeForceNewGuardAttemptAt = 0L;
    }

    public static boolean isAutoMode(Context context) {
        return MODE_AUTO.equals(readMode(context));
    }

    public static String currentHomepageLabel(Context context) {
        return isCurrentHomepageNew(context) ? LABEL_NEW : LABEL_LEGACY;
    }

    public static boolean isCurrentHomepageNew(Context context) {
        String mode = readMode(context);
        if (MODE_FORCE_NEW.equals(mode)) {
            SharedPreferences preferences = preferences(context);
            ensureDefaults(preferences);
            return !isForceNewCrashRecoveryActive(preferences)
                    && !isForceNewTrialExpired(preferences)
                    && !isForceNewTrialWindowExpired(preferences);
        }
        if (MODE_FORCE_LEGACY.equals(mode)) {
            return false;
        }
        return resolveAutoUseNew(context);
    }

    public static boolean shouldUseNewSettingsStyle(Context context) {
        String mode = readMode(context);
        if (MODE_FORCE_NEW.equals(mode)) {
            SharedPreferences preferences = preferences(context);
            ensureDefaults(preferences);
            return resolveForceNewSettingsStyle(context, preferences);
        }
        if (MODE_FORCE_LEGACY.equals(mode)) {
            return false;
        }
        return resolveAutoUseNew(context);
    }

    public static boolean isForceNewSupported(Context context) {
        if (context == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
            return false;
        }
        if (hasExpressiveAconfigRuntime(context)) {
            return true;
        }
        return readExpressiveSystemProperty(context);
    }

    public static boolean isForceNewCrashRecoveryActive(SharedPreferences preferences) {
        return readBooleanPreference(preferences, PREF_KEY_FORCE_NEW_GUARD_RECOVERED, false);
    }

    public static void recoverForceNewFailure(Context context, String reason,
            Throwable throwable) {
        if (context == null) {
            return;
        }
        try {
            SharedPreferences preferences = preferences(context);
            ensureDefaults(preferences);
            if (MODE_FORCE_NEW.equals(readMode(preferences))
                    || isForceNewTrialArmed(preferences)
                    || readBooleanPreference(preferences, PREF_KEY_FORCE_NEW_GUARD_PENDING,
                            false)) {
                markForceNewCrashRecovery(preferences);
            }
            if (throwable != null) {
                Log.w(TAG, reason, throwable);
            } else {
                Log.w(TAG, reason);
            }
        } catch (Throwable ignored) {
            // Never let recovery logic crash Gboard.
        }
    }

    public static boolean isForceNewTrialArmed(SharedPreferences preferences) {
        return readBooleanPreference(preferences, PREF_KEY_FORCE_NEW_TRIAL_ARMED, false);
    }

    public static boolean isForceNewTrialExpired(SharedPreferences preferences) {
        return readBooleanPreference(preferences, PREF_KEY_FORCE_NEW_TRIAL_EXPIRED, false);
    }

    public static boolean isForceNewTrialWindowExpired(SharedPreferences preferences) {
        if (!isForceNewTrialArmed(preferences)) {
            return false;
        }
        long expiresAt = readLongPreference(preferences, PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT,
                0L);
        return expiresAt > 0L && System.currentTimeMillis() > expiresAt;
    }

    public static boolean expireForceNewTrialIfNeeded(SharedPreferences preferences) {
        if (!isForceNewTrialWindowExpired(preferences)) {
            return false;
        }
        markForceNewTrialExpired(preferences);
        return true;
    }

    public static long readForceNewTrialRemainingMs(SharedPreferences preferences) {
        if (!isForceNewTrialArmed(preferences)) {
            return 0L;
        }
        long expiresAt = readLongPreference(preferences, PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT,
                0L);
        if (expiresAt <= 0L) {
            return 0L;
        }
        return Math.max(0L, expiresAt - System.currentTimeMillis());
    }

    public static long readForceNewTrialRemainingSeconds(SharedPreferences preferences) {
        long remainingMs = readForceNewTrialRemainingMs(preferences);
        if (remainingMs <= 0L) {
            return 0L;
        }
        return (remainingMs + 999L) / 1000L;
    }

    private static String sanitizeMode(String value) {
        if (MODE_FORCE_NEW.equals(value)) {
            return MODE_FORCE_NEW;
        }
        if (MODE_FORCE_LEGACY.equals(value)) {
            return MODE_FORCE_LEGACY;
        }
        return MODE_AUTO;
    }

    private static boolean resolveAutoUseNew(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) {
            return false;
        }

        if (readExpressiveSystemProperty(context)) {
            return true;
        }
        return readExpressiveAconfigFlag(context);
    }

    private static boolean readExpressiveSystemProperty(Context context) {
        try {
            Class<?> systemPropertiesClass = Class.forName(
                    "android.os.SystemProperties",
                    false,
                    context.getClassLoader());
            Method method = systemPropertiesClass.getMethod(
                    "getBoolean",
                    String.class,
                    Boolean.TYPE);
            Object value = method.invoke(null, "is_expressive_design_enabled", false);
            return value instanceof Boolean booleanValue && booleanValue.booleanValue();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean resolveForceNewSettingsStyle(Context context,
            SharedPreferences preferences) {
        if (isForceNewCrashRecoveryActive(preferences)) {
            return false;
        }
        if (isForceNewTrialExpired(preferences)) {
            return false;
        }
        if (isForceNewTrialWindowExpired(preferences)) {
            markForceNewTrialExpired(preferences);
            Log.w(TAG, "Recovered settings homepage to legacy after force-new trial timed out");
            return false;
        }

        if (isForceNewTrialArmed(preferences)) {
            long expiresAt = readLongPreference(
                    preferences,
                    PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT,
                    0L);
            if (expiresAt <= 0L) {
                markForceNewTrialExpired(preferences);
                Log.w(TAG, "Recovered settings homepage to legacy after force-new trial lost its deadline");
                return false;
            }
        }

        long pendingAttemptAt = readLongPreference(
                preferences,
                PREF_KEY_FORCE_NEW_GUARD_PENDING_AT,
                0L);
        boolean pending = readBooleanPreference(
                preferences,
                PREF_KEY_FORCE_NEW_GUARD_PENDING,
                false);
        if (pending) {
            if (pendingAttemptAt != 0L && pendingAttemptAt == activeForceNewGuardAttemptAt) {
                return true;
            }
            markForceNewCrashRecovery(preferences);
            Log.w(TAG, "Recovered settings homepage to legacy after a previous force-new crash");
            return false;
        }

        armForceNewGuard(context, preferences);
        return true;
    }

    private static void armForceNewGuard(Context context, SharedPreferences preferences) {
        long attemptAt = System.currentTimeMillis();
        preferences.edit()
                .putBoolean(PREF_KEY_FORCE_NEW_GUARD_PENDING, true)
                .putLong(PREF_KEY_FORCE_NEW_GUARD_PENDING_AT, attemptAt)
                .putBoolean(PREF_KEY_FORCE_NEW_GUARD_RECOVERED, false)
                .apply();
        activeForceNewGuardAttemptAt = attemptAt;
        scheduleForceNewGuardClear(context, attemptAt);
    }

    private static void scheduleForceNewGuardClear(Context context, long attemptAt) {
        Context applicationContext = context != null ? context.getApplicationContext() : null;
        Context lookupContext = applicationContext != null ? applicationContext : context;
        if (lookupContext == null) {
            return;
        }
        try {
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                SharedPreferences currentPreferences = preferences(lookupContext);
                long currentAttemptAt = readLongPreference(
                        currentPreferences,
                        PREF_KEY_FORCE_NEW_GUARD_PENDING_AT,
                        0L);
                if (currentAttemptAt != attemptAt) {
                    return;
                }
                currentPreferences.edit()
                        .putBoolean(PREF_KEY_FORCE_NEW_GUARD_PENDING, false)
                        .putLong(PREF_KEY_FORCE_NEW_GUARD_PENDING_AT, 0L)
                        .putBoolean(PREF_KEY_FORCE_NEW_TRIAL_ARMED, false)
                        .putLong(PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT, 0L)
                        .apply();
                if (activeForceNewGuardAttemptAt == attemptAt) {
                    activeForceNewGuardAttemptAt = 0L;
                }
            }, FORCE_NEW_GUARD_SUCCESS_DELAY_MS);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to schedule force-new settings guard clear", throwable);
        }
    }

    private static void markForceNewCrashRecovery(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        SharedPreferences.Editor editor = preferences.edit();
        clearForceNewGuard(editor);
        editor.putBoolean(PREF_KEY_FORCE_NEW_GUARD_RECOVERED, true);
        editor.apply();
        activeForceNewGuardAttemptAt = 0L;
    }

    private static void scheduleForceNewTrialExpiry(Context context, long expiresAt) {
        Context applicationContext = context != null ? context.getApplicationContext() : null;
        Context lookupContext = applicationContext != null ? applicationContext : context;
        if (lookupContext == null || expiresAt <= 0L) {
            return;
        }
        activeForceNewTrialExpiresAt = expiresAt;
        long delayMs = Math.max(0L, expiresAt - System.currentTimeMillis());
        try {
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                try {
                    SharedPreferences currentPreferences = preferences(lookupContext);
                    long currentExpiresAt = readLongPreference(currentPreferences,
                            PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT, 0L);
                    if (currentExpiresAt != expiresAt
                            || activeForceNewTrialExpiresAt != expiresAt
                            || !isForceNewTrialArmed(currentPreferences)) {
                        return;
                    }
                    markForceNewTrialExpired(currentPreferences);
                    Log.w(TAG, "Recovered settings homepage to legacy after scheduled force-new trial timeout");
                } catch (Throwable throwable) {
                    Log.w(TAG, "Failed to persist scheduled force-new trial timeout", throwable);
                }
            }, delayMs + 50L);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to schedule force-new trial timeout", throwable);
        }
    }

    private static void clearForceNewGuard(SharedPreferences.Editor editor) {
        editor.putBoolean(PREF_KEY_FORCE_NEW_GUARD_PENDING, false);
        editor.putLong(PREF_KEY_FORCE_NEW_GUARD_PENDING_AT, 0L);
        editor.putBoolean(PREF_KEY_FORCE_NEW_GUARD_RECOVERED, false);
    }

    private static void armForceNewTrial(SharedPreferences.Editor editor, long expiresAt) {
        editor.putBoolean(PREF_KEY_FORCE_NEW_TRIAL_ARMED, true);
        editor.putLong(PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT, expiresAt);
        editor.putBoolean(PREF_KEY_FORCE_NEW_TRIAL_EXPIRED, false);
    }

    private static void markForceNewTrialExpired(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        SharedPreferences.Editor editor = preferences.edit();
        clearForceNewGuard(editor);
        editor.putBoolean(PREF_KEY_FORCE_NEW_TRIAL_ARMED, false);
        editor.putLong(PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT, 0L);
        editor.putBoolean(PREF_KEY_FORCE_NEW_TRIAL_EXPIRED, true);
        editor.apply();
        activeForceNewGuardAttemptAt = 0L;
        activeForceNewTrialExpiresAt = 0L;
    }

    private static void clearForceNewTrial(SharedPreferences.Editor editor) {
        editor.putBoolean(PREF_KEY_FORCE_NEW_TRIAL_ARMED, false);
        editor.putLong(PREF_KEY_FORCE_NEW_TRIAL_EXPIRES_AT, 0L);
        editor.putBoolean(PREF_KEY_FORCE_NEW_TRIAL_EXPIRED, false);
        activeForceNewTrialExpiresAt = 0L;
    }

    private static boolean hasExpressiveAconfigRuntime(Context context) {
        try {
            ClassLoader classLoader = context != null ? context.getClassLoader() : null;
            Class<?> aconfigPackageClass = Class.forName(
                    "android.os.flagging.AconfigPackage",
                    false,
                    classLoader);
            Method loadMethod = aconfigPackageClass.getMethod("load", String.class);
            Object aconfigPackage = loadMethod.invoke(
                    null,
                    "com.android.settingslib.widget.theme.flags");
            return aconfigPackage != null;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean readExpressiveAconfigFlag(Context context) {
        try {
            ClassLoader classLoader = context != null ? context.getClassLoader() : null;
            Class<?> aconfigPackageClass = Class.forName(
                    "android.os.flagging.AconfigPackage",
                    false,
                    classLoader);
            Method loadMethod = aconfigPackageClass.getMethod("load", String.class);
            Object aconfigPackage = loadMethod.invoke(
                    null,
                    "com.android.settingslib.widget.theme.flags");
            Method getBooleanFlagValueMethod = aconfigPackageClass.getMethod(
                    "getBooleanFlagValue",
                    String.class,
                    Boolean.TYPE);
            Object value = getBooleanFlagValueMethod.invoke(
                    aconfigPackage,
                    "is_expressive_design_enabled",
                    false);
            return value instanceof Boolean booleanValue && booleanValue.booleanValue();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean readBooleanPreference(SharedPreferences preferences, String key,
            boolean defaultValue) {
        if (preferences == null) {
            return defaultValue;
        }
        Object value = preferences.getAll().get(key);
        if (value instanceof Boolean booleanValue) {
            return booleanValue;
        }
        if (value instanceof String stringValue) {
            return Boolean.parseBoolean(stringValue);
        }
        return defaultValue;
    }

    private static long readLongPreference(SharedPreferences preferences, String key,
            long defaultValue) {
        if (preferences == null) {
            return defaultValue;
        }
        Object value = preferences.getAll().get(key);
        if (value instanceof Number number) {
            return number.longValue();
        }
        if (value instanceof String stringValue) {
            try {
                return Long.parseLong(stringValue);
            } catch (NumberFormatException ignored) {
                return defaultValue;
            }
        }
        return defaultValue;
    }
}
