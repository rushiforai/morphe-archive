/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.samsung.dailyboard;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.PowerManager;
import android.provider.Settings;

public final class DreamSettingsPatch {
    private static final String PREFERENCES = "morphe_daily_board";
    private static final String KEY_ANGLE_SUSPENDED = "morphe_angle_suspended";
    private static final String DREAM_COMPONENT =
            "com.samsung.android.homemode/" +
                    "com.samsung.android.homemode.ui.dream.HomeModeDreamService";

    private DreamSettingsPatch() {
    }

    public static void enable(Context context) {
        clearAngleSuspension(context);
        update(context, true);
    }

    public static void disable(Context context) {
        clearAngleSuspension(context);
        update(context, false);
    }

    static boolean suspendForAngle(Context context) {
        if (!canWriteSecureSettings(context) || !isDailyBoardSelected(context)) return false;
        try {
            boolean updated = Settings.Secure.putInt(
                    context.getContentResolver(),
                    "screensaver_enabled",
                    0
            );
            if (!updated) return false;
            context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                    .edit()
                    .putBoolean(KEY_ANGLE_SUSPENDED, true)
                    .apply();
            return true;
        } catch (SecurityException ignored) {
            return false;
        }
    }

    static boolean resumeAfterAngle(Context context) {
        if (!isAngleSuspended(context) || !canWriteSecureSettings(context)) return false;
        // Android settings may have selected another screen saver while we were suspended.
        if (!isDailyBoardSelected(context)) {
            clearAngleSuspension(context);
            return false;
        }
        try {
            boolean componentUpdated = Settings.Secure.putString(
                    context.getContentResolver(),
                    "screensaver_components",
                    DREAM_COMPONENT
            );
            boolean enabledUpdated = Settings.Secure.putInt(
                    context.getContentResolver(),
                    "screensaver_enabled",
                    1
            );
            if (!componentUpdated || !enabledUpdated) return false;
            clearAngleSuspension(context);
            wakeForDreamReevaluation(context);
            return true;
        } catch (SecurityException ignored) {
            return false;
        }
    }

    static void recoverIfSuspended(Context context) {
        resumeAfterAngle(context);
    }

    private static boolean isAngleSuspended(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .getBoolean(KEY_ANGLE_SUSPENDED, false);
    }

    private static void clearAngleSuspension(Context context) {
        context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .edit()
                .remove(KEY_ANGLE_SUSPENDED)
                .apply();
    }

    private static boolean isDailyBoardSelected(Context context) {
        return DREAM_COMPONENT.equals(Settings.Secure.getString(
                context.getContentResolver(), "screensaver_components"
        ));
    }

    private static boolean canWriteSecureSettings(Context context) {
        return context.checkSelfPermission(Manifest.permission.WRITE_SECURE_SETTINGS) ==
                PackageManager.PERMISSION_GRANTED;
    }

    @SuppressWarnings("deprecation")
    private static void wakeForDreamReevaluation(Context context) {
        PowerManager powerManager = context.getSystemService(PowerManager.class);
        if (powerManager == null || powerManager.isInteractive()) return;
        PowerManager.WakeLock wakeLock = powerManager.newWakeLock(
                PowerManager.SCREEN_DIM_WAKE_LOCK | PowerManager.ACQUIRE_CAUSES_WAKEUP,
                "Morphe:DailyBoardAngleGate"
        );
        wakeLock.acquire(1_000L);
        wakeLock.release();
    }

    private static void update(Context context, boolean enabled) {
        if (!enabled && !isDailyBoardSelected(context)) return;
        try {
            Settings.Secure.putInt(
                    context.getContentResolver(),
                    "screensaver_enabled",
                    enabled ? 1 : 0
            );
            Settings.Secure.putString(
                    context.getContentResolver(),
                    "screensaver_components",
                    enabled ? DREAM_COMPONENT : null
            );
        } catch (SecurityException ignored) {
            // An ordinary install remains usable; ADB can grant this declared permission.
        }
    }
}
