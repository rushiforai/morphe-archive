package com.waze.gw;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

/**
 * Keeps Waze location active independently of the optional cross-app bubble.
 */
public final class BubbleKeepAliveService extends Service implements LocationListener {
    private static final String TAG = "WazeGW-KeepAlive";
    private static final String CHANNEL_ID = "wazemod_bubble_active";
    private static final int NOTIFICATION_ID = 0x475742;
    private static final long WATCHDOG_INTERVAL_MS = 5_000L;
    private static final long NATIVE_STALE_MS = 15_000L;

    private final Handler handler = new Handler(Looper.getMainLooper());
    private LocationManager locationManager;
    private boolean fallbackLocationActive;
    private long lastFallbackLogMs;
    private final Runnable locationWatchdog = new Runnable() {
        @Override public void run() {
            boolean keepRunning = true;
            try {
                if (!requested(BubbleKeepAliveService.this)) {
                    keepRunning = false;
                    Log.w(TAG, "Location watchdog request revoked; stopping service");
                    stopFallbackLocation();
                    stopSelf();
                    return;
                }
                boolean activityForeground = isAppActivityForeground();
                if (!fallbackLocationActive
                        && (!activityForeground
                        || Gateway.wazeLocationAgeMs() >= NATIVE_STALE_MS)) {
                    // Once Waze has gone into the background, keep this listener for the whole
                    // location session. In particular, do not remove it when the Activity resumes:
                    // affected Android builds do not always restart Waze's listener afterwards.
                    startFallbackLocation();
                }
            } catch (Throwable t) {
                Log.w(TAG, "Location watchdog failed safely", t);
            } finally {
                if (keepRunning) handler.postDelayed(this, WATCHDOG_INTERVAL_MS);
            }
        }
    };

    static void sync(Context context) {
        if (context == null) return;
        Context app = context.getApplicationContext();
        Intent intent = new Intent(app, BubbleKeepAliveService.class);
        try {
            if (requested(app)) {
                if (Build.VERSION.SDK_INT >= 26) app.startForegroundService(intent);
                else app.startService(intent);
            } else {
                app.stopService(intent);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to synchronize bubble keep-alive service", t);
        }
    }

    static boolean requested(Context context) {
        return context != null && !Gateway.isExplicitShutdownRequested()
                && Gateway.trustedBuild(context) && hasLocationPermission(context);
    }

    @Override public void onCreate() {
        super.onCreate();
        createChannel();
        locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);
    }

    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        if (!requested(this)) {
            handler.removeCallbacks(locationWatchdog);
            stopFallbackLocation();
            stopForeground(true);
            stopSelf();
            return START_NOT_STICKY;
        }
        try {
            startForeground(NOTIFICATION_ID, notification());
            Log.i(TAG, "GPS keep-alive active");
            handler.removeCallbacks(locationWatchdog);
            handler.postDelayed(locationWatchdog, WATCHDOG_INTERVAL_MS);
            return START_STICKY;
        } catch (Throwable t) {
            Log.e(TAG, "Unable to enter foreground", t);
            stopSelf();
            return START_NOT_STICKY;
        }
    }

    @Override public void onDestroy() {
        handler.removeCallbacks(locationWatchdog);
        stopFallbackLocation();
        Log.i(TAG, "Bubble keep-alive stopped");
        super.onDestroy();
    }

    private static boolean hasLocationPermission(Context context) {
        return Build.VERSION.SDK_INT < 23
                || context.checkSelfPermission("android.permission.ACCESS_FINE_LOCATION")
                == PackageManager.PERMISSION_GRANTED
                || context.checkSelfPermission("android.permission.ACCESS_COARSE_LOCATION")
                == PackageManager.PERMISSION_GRANTED;
    }

    private boolean isAppActivityForeground() {
        try {
            android.app.ActivityManager.RunningAppProcessInfo state =
                    new android.app.ActivityManager.RunningAppProcessInfo();
            android.app.ActivityManager.getMyMemoryState(state);
            return state.importance
                    == android.app.ActivityManager.RunningAppProcessInfo.IMPORTANCE_FOREGROUND;
        } catch (Throwable ignored) {
            return false;
        }
    }

    @SuppressWarnings("MissingPermission")
    private void startFallbackLocation() {
        if (fallbackLocationActive || locationManager == null || !hasLocationPermission(this)) return;
        boolean registered = false;
        try {
            if ((Build.VERSION.SDK_INT < 23
                    || checkSelfPermission("android.permission.ACCESS_FINE_LOCATION")
                    == PackageManager.PERMISSION_GRANTED)
                    && locationManager.getProvider(LocationManager.GPS_PROVIDER) != null) {
                locationManager.requestLocationUpdates(
                        LocationManager.GPS_PROVIDER, 1_000L, 0f, this, Looper.getMainLooper());
                registered = true;
            }
            if (locationManager.getProvider(LocationManager.NETWORK_PROVIDER) != null) {
                locationManager.requestLocationUpdates(
                        LocationManager.NETWORK_PROVIDER, 3_000L, 0f, this,
                        Looper.getMainLooper());
                registered = true;
            }
            fallbackLocationActive = registered;
            if (registered) {
                Log.w(TAG, "Waze GPS stale; fallback location listener started");
            }
        } catch (Throwable t) {
            try { locationManager.removeUpdates(this); } catch (Throwable ignored) { }
            fallbackLocationActive = false;
            Log.w(TAG, "Unable to start fallback location", t);
        }
    }

    private void stopFallbackLocation() {
        if (!fallbackLocationActive || locationManager == null) return;
        try {
            locationManager.removeUpdates(this);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to remove fallback location", t);
        } finally {
            fallbackLocationActive = false;
            Log.i(TAG, "Fallback location listener stopped");
        }
    }

    @Override public void onLocationChanged(Location location) {
        if (location == null || !fallbackLocationActive || !requested(this)) return;
        boolean forwarded = WazeLocationBridge.publish(location);
        // A successful bridge delivery re-enters Gateway through Waze's native location hook.
        // Calling the direct fallback path as well delivered the same speed frame on main and
        // HandlerThread concurrently, racing the shared overspeed audio player.
        if (!forwarded) Gateway.onKeepAliveLocation(location);
        long now = SystemClock.elapsedRealtime();
        if (now - lastFallbackLogMs >= 30_000L) {
            lastFallbackLogMs = now;
            Log.i(TAG, "Fallback GPS fix provider=" + location.getProvider()
                    + " accuracy=" + (location.hasAccuracy() ? location.getAccuracy() : -1f)
                    + " forwarded=" + forwarded);
        }
    }

    @Override public void onProviderEnabled(String provider) { }
    @Override public void onProviderDisabled(String provider) { }
    @Override public void onStatusChanged(String provider, int status, Bundle extras) { }

    /**
     * Removing Waze from Recents is an explicit close request, not the idle/background condition
     * this service is meant to survive. WazeAppService uses stopWithTask=true, so its first shutdown
     * attempt can race ahead of this callback and be rejected by the keep-alive gate. Open the gate
     * here and invoke the same NativeManager shutdown entry point once more.
     */
    @Override public void onTaskRemoved(Intent rootIntent) {
        Log.i(TAG, "Waze task removed; requesting explicit shutdown");
        handler.removeCallbacks(locationWatchdog);
        stopFallbackLocation();
        stopForeground(true);
        stopSelf();
        Gateway.onTaskRemoved();
        super.onTaskRemoved(rootIntent);
    }

    @Override public IBinder onBind(Intent intent) {
        return null;
    }

    private void createChannel() {
        if (Build.VERSION.SDK_INT < 26) return;
        NotificationManager manager = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        if (manager == null) return;
        NotificationChannel channel = new NotificationChannel(
                CHANNEL_ID, I18n.tr("bubble.waze_mod_gps_location"), NotificationManager.IMPORTANCE_LOW);
        channel.setDescription(I18n.tr("bubble.keep_speed_and_alert_data_while"));
        channel.setSound(null, null);
        channel.enableVibration(false);
        channel.setShowBadge(false);
        manager.createNotificationChannel(channel);
    }

    private Notification notification() {
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        PendingIntent content = null;
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            int piFlags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= 23) piFlags |= PendingIntent.FLAG_IMMUTABLE;
            content = PendingIntent.getActivity(this, 0x4757, launch, piFlags);
        }

        int icon = getResources().getIdentifier("notification", "drawable", getPackageName());
        if (icon == 0) icon = getResources().getIdentifier("notification", "drawable", "com.waze");
        if (icon == 0) icon = android.R.drawable.ic_menu_mylocation;

        Notification.Builder builder = Build.VERSION.SDK_INT >= 26
                ? new Notification.Builder(this, CHANNEL_ID) : new Notification.Builder(this);
        builder.setSmallIcon(icon)
                .setContentTitle(I18n.tr("bubble.waze_mod_location_service_is_running"))
                .setContentText(I18n.tr("bubble.waze_mod_is_running_in_the"))
                .setCategory(Notification.CATEGORY_SERVICE)
                .setOngoing(true)
                .setOnlyAlertOnce(true)
                .setShowWhen(false);
        if (content != null) builder.setContentIntent(content);
        if (Build.VERSION.SDK_INT < 26) builder.setPriority(Notification.PRIORITY_LOW);
        return builder.build();
    }
}
