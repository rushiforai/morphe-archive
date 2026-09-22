package com.travianpatch.notifier;

import android.app.Activity;
import android.app.Application;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Log;

import androidx.core.app.ActivityCompat;
import androidx.work.Constraints;
import androidx.work.ExistingPeriodicWorkPolicy;
import androidx.work.ExistingWorkPolicy;
import androidx.work.NetworkType;
import androidx.work.OneTimeWorkRequest;
import androidx.work.PeriodicWorkRequest;
import androidx.work.WorkManager;

import java.util.concurrent.TimeUnit;

/**
 * Entry point injected into the patched Activity's onCreate(). On the very
 * first run only, requests the two permissions this feature needs (never
 * asked again afterward, regardless of the user's answer), then schedules
 * the periodic background check.
 *
 * No login screen: NotifierWorker reads the game's own already-logged-in
 * session directly (see TravianSession). No foreground service or
 * persistent notification either — WorkManager runs the check on its own
 * schedule and only a completed build/troop queue ever produces one.
 */
public final class NotifierBootstrap {

    private static final String TAG = "TravianNotifier";
    static final String CHANNEL_ID = "travian_notifier";
    static final String ATTACK_CHANNEL_ID = "travian_attacks";
    private static final String UNIQUE_WORK_NAME = "travian-notifier-check";
    private static final String PREFS_NAME = "travian_notifier_setup";
    private static final String PREF_ASKED_PERMISSIONS = "asked_permissions_v1";
    private static final int POST_NOTIFICATIONS_REQUEST_CODE = 9001;

    private NotifierBootstrap() {
    }

    public static void start(Context ctx) {
        try {
            createChannel(ctx);
            askPermissionsOnce(ctx);
            schedulePeriodicCheck(ctx);
        } catch (Throwable t) {
            Log.e(TAG, "bootstrap failed", t);
        }
    }

    /** Also called by the Travian Tools screens, which can be opened before the game ever was. */
    static void ensureChannels(Context ctx) {
        createChannel(ctx);
    }

    private static void askPermissionsOnce(Context ctx) {
        SharedPreferences prefs = ctx.getApplicationContext()
                .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        if (prefs.getBoolean(PREF_ASKED_PERMISSIONS, false)) {
            return;
        }
        prefs.edit().putBoolean(PREF_ASKED_PERMISSIONS, true).apply();

        if (!(ctx instanceof Activity)) {
            return; // always called from the patched Activity's onCreate, but be defensive
        }
        Activity activity = (Activity) ctx;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU
                && activity.checkSelfPermission("android.permission.POST_NOTIFICATIONS")
                != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(
                    activity, new String[]{"android.permission.POST_NOTIFICATIONS"},
                    POST_NOTIFICATIONS_REQUEST_CODE);
            // Opening the battery screen now would cover the permission dialog, so wait until it's answered.
            askBatteryOptimizationAfterDialog(activity);
        } else {
            askBatteryOptimization(activity);
        }
    }

    /** The game Activity pauses while the permission dialog is up and resumes once it's answered. */
    private static void askBatteryOptimizationAfterDialog(final Activity activity) {
        final Application app = activity.getApplication();
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            private boolean paused = false;

            @Override
            public void onActivityPaused(Activity a) {
                if (a == activity) {
                    paused = true;
                }
            }

            @Override
            public void onActivityResumed(Activity a) {
                if (a == activity && paused) {
                    app.unregisterActivityLifecycleCallbacks(this);
                    askBatteryOptimization(activity);
                }
            }

            @Override
            public void onActivityCreated(Activity a, Bundle savedInstanceState) {
            }

            @Override
            public void onActivityStarted(Activity a) {
            }

            @Override
            public void onActivityStopped(Activity a) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity a, Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(Activity a) {
            }
        });
    }

    private static void askBatteryOptimization(Activity activity) {
        PowerManager pm = (PowerManager) activity.getSystemService(Context.POWER_SERVICE);
        String pkg = activity.getPackageName();
        if (pm != null && !pm.isIgnoringBatteryOptimizations(pkg)) {
            try {
                Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
                intent.setData(Uri.parse("package:" + pkg));
                activity.startActivity(intent);
            } catch (Throwable t) {
                Log.w(TAG, "couldn't request battery optimization exemption", t);
            }
        }
    }

    private static void schedulePeriodicCheck(Context ctx) {
        Constraints constraints = new Constraints.Builder()
                .setRequiredNetworkType(NetworkType.CONNECTED)
                .build();
        long minMinutes = TimeUnit.MILLISECONDS.toMinutes(PeriodicWorkRequest.MIN_PERIODIC_INTERVAL_MILLIS);
        PeriodicWorkRequest request = new PeriodicWorkRequest.Builder(
                NotifierWorker.class, minMinutes, TimeUnit.MINUTES)
                .setConstraints(constraints)
                .build();
        WorkManager workManager = WorkManager.getInstance(ctx.getApplicationContext());
        workManager.enqueueUniquePeriodicWork(UNIQUE_WORK_NAME, ExistingPeriodicWorkPolicy.KEEP, request);

        // Also start the check chain now if it isn't already pending: gives a first check right when
        // the game opens and revives the chain if it ever stopped. KEEP leaves an existing one alone.
        OneTimeWorkRequest startNow = new OneTimeWorkRequest.Builder(NotifierWorker.class)
                .setConstraints(constraints)
                .build();
        workManager.enqueueUniqueWork(NotifierWorker.NEXT_WORK_NAME, ExistingWorkPolicy.KEEP, startNow);
    }

    private static void createChannel(Context ctx) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationManager nm = (NotificationManager) ctx.getSystemService(Context.NOTIFICATION_SERVICE);
            NotificationChannel channel = new NotificationChannel(
                    CHANNEL_ID, "Travian timers", NotificationManager.IMPORTANCE_DEFAULT);
            channel.setDescription("Alerts when a building, upgrade, or troop queue finishes.");
            nm.createNotificationChannel(channel);

            NotificationChannel attacks = new NotificationChannel(
                    ATTACK_CHANNEL_ID, "Incoming attacks", NotificationManager.IMPORTANCE_HIGH);
            attacks.setDescription("Alerts when an attack or raid is heading for one of your villages.");
            nm.createNotificationChannel(attacks);
        }
    }
}
