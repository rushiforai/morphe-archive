/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.shared.patches;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.util.Log;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.List;

import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.utils.StringRef;
import app.morphe.extension.shared.utils.Utils;

/** Guards only startup snapshots that can change feature flags. No per-flag-read work is added. */
@SuppressLint("ApplySharedPref")
public final class FeatureFlagsStartupGuard implements Application.ActivityLifecycleCallbacks {
    private static final String TAG = "revanced: FeatureFlags";
    private static final String STARTS_KEY = "morphe_feature_flags_unconfirmed_starts";
    private static final String NOTICE_KEY = "morphe_feature_flags_startup_reset_notice";
    private static final long CONFIRM_DELAY_MILLIS = 5000;
    private static volatile FeatureFlagsStartupGuard currentGuard;

    private final Application application;
    private final SharedPreferences preferences;
    private final FeatureFlagsStartupState.Start start;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final Runnable confirmation = this::confirmStartup;
    private WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private WeakReference<Activity> mainActivity = new WeakReference<>(null);
    private boolean watching;

    private FeatureFlagsStartupGuard(Application application, SharedPreferences preferences,
                                     FeatureFlagsStartupState.Start start) {
        this.application = application;
        this.preferences = preferences;
        this.start = start;
    }

    /** Called once, before the startup override map is constructed. */
    public static boolean beforeOverrides() {
        try {
            boolean active = !SharedYouTubeSettings.DISABLED_FEATURE_FLAGS.get().isBlank()
                    || !SharedYouTubeSettings.FORCED_FEATURE_FLAGS.get().isBlank()
                    || !SharedYouTubeSettings.FEATURE_FLAGS_BISECT.get().isBlank();
            SharedPreferences preferences = Setting.preferences.preferences;
            int previousStarts = preferences.getInt(STARTS_KEY, 0);
            boolean pendingNotice = preferences.getBoolean(NOTICE_KEY, false);
            if (!active && previousStarts == 0 && !pendingNotice) return true;

            Context context = Utils.getContext();
            if (context == null || !(context.getApplicationContext() instanceof Application application)) {
                throw new IllegalStateException("Application context is unavailable");
            }
            // Background service processes do not resume the main activity and must not count as failed starts.
            if (!isMainProcess(application)) return true;

            FeatureFlagsStartupState.Start start = FeatureFlagsStartupState.begin(previousStarts, active);
            if (start.resetOverrides) {
                clearOverrides(preferences);
                pendingNotice = true;
            } else if ((active || previousStarts != 0) && !preferences.edit()
                    .putInt(STARTS_KEY, start.unconfirmedStarts).commit()) {
                throw new IllegalStateException("Could not persist the startup counter");
            }

            if (active || pendingNotice) {
                currentGuard = new FeatureFlagsStartupGuard(application, preferences, start);
            }
            return !start.resetOverrides;
        } catch (Throwable ex) {
            Log.w(TAG, "Feature flag startup guard failed; skipping overrides for this process", ex);
            return false;
        }
    }

    private static boolean isMainProcess(Application application) {
        String processName = null;
        if (Build.VERSION.SDK_INT >= 28) {
            processName = Application.getProcessName();
        } else {
            ActivityManager manager = application.getSystemService(ActivityManager.class);
            List<ActivityManager.RunningAppProcessInfo> processes = manager == null
                    ? null : manager.getRunningAppProcesses();
            if (processes != null) {
                int pid = Process.myPid();
                for (ActivityManager.RunningAppProcessInfo process : processes) {
                    if (process.pid == pid) {
                        processName = process.processName;
                        break;
                    }
                }
            }
        }
        if (processName == null) throw new IllegalStateException("Could not identify the app process");
        return application.getPackageName().equals(processName);
    }

    private static void clearOverrides(SharedPreferences preferences) {
        // Cancel the search outright: a startup crash is not an answer about the behavior being investigated.
        boolean saved = preferences.edit()
                .remove(SharedYouTubeSettings.DISABLED_FEATURE_FLAGS.key)
                .remove(SharedYouTubeSettings.FORCED_FEATURE_FLAGS.key)
                .remove(SharedYouTubeSettings.FEATURE_FLAGS_BISECT.key)
                .putInt(STARTS_KEY, 0)
                .putBoolean(NOTICE_KEY, true)
                .commit();
        SharedYouTubeSettings.DISABLED_FEATURE_FLAGS.resetToDefault();
        SharedYouTubeSettings.FORCED_FEATURE_FLAGS.resetToDefault();
        SharedYouTubeSettings.FEATURE_FLAGS_BISECT.resetToDefault();
        if (!saved) Log.w(TAG, "Feature flag reset could not be saved to disk");
        Log.w(TAG, "Feature flag overrides reset after two unconfirmed starts");
    }

    /**
     * Called synchronously at the start of the resolved main activity's onCreate.
     * Register before its first resume, not from a posted callback that can miss that resume.
     */
    public static void onMainActivityCreated(Activity activity) {
        FeatureFlagsStartupGuard guard = currentGuard;
        if (guard == null) return;

        try {
            guard.handler.removeCallbacks(guard.confirmation);
            guard.resumedActivity.clear();
            guard.mainActivity = new WeakReference<>(activity);
            if (!guard.watching) {
                guard.application.registerActivityLifecycleCallbacks(guard);
                guard.watching = true;
            }
        } catch (Throwable ex) {
            Log.w(TAG, "Could not watch feature flag startup", ex);
        }
    }

    @Override
    public void onActivityResumed(Activity activity) {
        try {
            if (activity != mainActivity.get()) return;
            resumedActivity = new WeakReference<>(activity);
            handler.removeCallbacks(confirmation);
            if (!handler.postDelayed(confirmation, CONFIRM_DELAY_MILLIS)) {
                Log.w(TAG, "Could not schedule feature flag startup confirmation");
            }
        } catch (Throwable ex) {
            Log.w(TAG, "Could not schedule feature flag startup confirmation", ex);
        }
    }

    private void confirmStartup() {
        try {
            Activity activity = resumedActivity.get();
            if (activity == null || activity != mainActivity.get() || activity.isFinishing()
                    || activity.isDestroyed()) return;

            boolean pendingNotice = preferences.getBoolean(NOTICE_KEY, false);
            if (!preferences.edit().putInt(STARTS_KEY, start.confirmed().unconfirmedStarts)
                    .remove(NOTICE_KEY).commit()) {
                Log.w(TAG, "Feature flag startup confirmation could not be saved");
            }
            if (pendingNotice) {
                Toast.makeText(activity, StringRef.str("morphe_debug_feature_flags_manager_startup_reset"),
                        Toast.LENGTH_LONG).show();
            }
            Log.i(TAG, "Feature flag startup confirmed after 5 seconds resumed");
            application.unregisterActivityLifecycleCallbacks(this);
            watching = false;
            if (currentGuard == this) currentGuard = null;
            mainActivity.clear();
            resumedActivity.clear();
        } catch (Throwable ex) {
            Log.w(TAG, "Could not confirm feature flag startup", ex);
        }
    }

    private void stopConfirmation(Activity activity) {
        try {
            if (resumedActivity.get() != activity) return;
            resumedActivity.clear();
            handler.removeCallbacks(confirmation);
        } catch (Throwable ex) {
            Log.w(TAG, "Could not stop feature flag startup confirmation", ex);
        }
    }

    @Override public void onActivityPaused(Activity activity) { stopConfirmation(activity); }
    @Override public void onActivityDestroyed(Activity activity) { stopConfirmation(activity); }
    @Override public void onActivityCreated(Activity activity, Bundle state) {}
    @Override public void onActivityStarted(Activity activity) {}
    @Override public void onActivityStopped(Activity activity) {}
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
}
