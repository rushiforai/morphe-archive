package app.template.extension.extension;

import android.Manifest;
import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.util.Log;

import com.google.android.gms.common.GooglePlayServicesUtilLight;
import com.google.android.gms.location.ActivityRecognition;
import com.google.android.gms.location.ActivityRecognitionClient;
import com.google.android.gms.location.ActivityTransition;
import com.google.android.gms.location.ActivityTransitionEvent;
import com.google.android.gms.location.ActivityTransitionRequest;
import com.google.android.gms.location.ActivityTransitionResult;
import com.google.android.gms.location.DetectedActivity;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public final class SpeedWidgetAuto extends BroadcastReceiver {
    private static final String TAG = "QmWazeSpeedWidget";
    private static final String MOTION = "app.template.extension.extension.SPEED_TRIP_TRANSITION";
    private static final String PREFS = "qm_speed_widget_auto";
    private static final String ENABLED = "enabled";
    private static final String VEHICLES = "connected_vehicles";
    private static final String IN_VEHICLE = "motion_trip";
    private static final String PROJECTION = "android_auto";
    private static final String PAUSED = "paused_for_trip";
    private static boolean observingMotion;

    static boolean granted(Context context, String permission) {
        return context.checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED;
    }

    static boolean enabled(Context context) {
        return prefs(context).getBoolean(ENABLED, true);
    }

    static boolean hasWidgets(Context context) {
        return AppWidgetManager.getInstance(context).getAppWidgetIds(SpeedWidget.component(context)).length != 0
                || NavigationWidget.ids(context).length != 0;
    }

    static boolean available(Context context) {
        return granted(context, Manifest.permission.ACCESS_FINE_LOCATION)
                && granted(context, Manifest.permission.ACCESS_BACKGROUND_LOCATION);
    }

    static boolean hasAllPermissions(Context context) {
        return available(context) && granted(context, Manifest.permission.BLUETOOTH_CONNECT)
                && granted(context, Manifest.permission.ACTIVITY_RECOGNITION);
    }

    static boolean armed(Context context) {
        return hasWidgets(context) && enabled(context) && available(context);
    }

    static boolean active(Context context) {
        return armed(context) && !prefs(context).getBoolean(PAUSED, false) && tripDetected(context);
    }

    static void enable(Context context) {
        prefs(context).edit().putBoolean(ENABLED, true).apply();
        startMonitoring(context);
    }

    static void startMonitoring(Context context) {
        SpeedWidgetProjection.checkConnection(context);
        observe(context);
        SpeedWidgetBluetooth.checkConnectedAudio(context.getApplicationContext());
        SpeedWidgetService.refresh(context);
    }

    static void disable(Context context) {
        prefs(context).edit().putBoolean(ENABLED, false).apply();
        removeWatchers(context);
    }

    static void removeWatchers(Context context) {
        SpeedWidgetProjection.remove(context);
        clearTrip(context);
        observingMotion = false;
        PendingIntent intent = motionIntent(context, PendingIntent.FLAG_NO_CREATE);
        if (intent != null) {
            try {
                activityClient(context).removeActivityTransitionUpdates(intent);
            } catch (RuntimeException | LinkageError e) {
                Log.w(TAG, "Could not remove the activity transition subscription", e);
            }
            intent.cancel();
        }
        SpeedWidgetService.automaticChanged(context, false, 0);
    }

    static void pauseTrip(Context context) {
        if (tripDetected(context)) prefs(context).edit().putBoolean(PAUSED, true).apply();
    }

    static String idleHint(Context context) {
        if (!enabled(context)) return "Tap to start";
        if (!available(context)) return "Allow auto access";
        if (prefs(context).getBoolean(PAUSED, false)) return "Paused for this trip";
        return "";
    }

    static void observe(Context context) {
        SpeedWidgetProjection.observe(context);
        if (!armed(context) || observingMotion || !granted(context, Manifest.permission.ACTIVITY_RECOGNITION)) return;
        try {
            ActivityTransitionRequest request = new ActivityTransitionRequest(Arrays.asList(
                    transition(ActivityTransition.ACTIVITY_TRANSITION_ENTER),
                    transition(ActivityTransition.ACTIVITY_TRANSITION_EXIT)));
            observingMotion = true;
            activityClient(context).requestActivityTransitionUpdates(request, motionIntent(context, 0))
                    .addOnFailureListener(error -> {
                        observingMotion = false;
                        Log.w(TAG, "Could not subscribe to vehicle motion", error);
                    })
                    .addOnSuccessListener(ignored -> Log.i(TAG, "Vehicle motion subscription active"));
        } catch (RuntimeException | LinkageError e) {
            observingMotion = false;
            Log.w(TAG, "Vehicle motion is unavailable", e);
        }
    }

    private static ActivityTransition transition(int type) {
        return new ActivityTransition.Builder().setActivityType(DetectedActivity.IN_VEHICLE)
                .setActivityTransition(type).build();
    }

    private static ActivityRecognitionClient activityClient(Context context) {
        // The isolated client uses its own SDK version. Waze's manifest metadata
        // belongs to the Google Play services client bundled by Waze.
        GooglePlayServicesUtilLight.enableUsingApkIndependentContext();
        return ActivityRecognition.getClient(context);
    }

    private static PendingIntent motionIntent(Context context, int flags) {
        return PendingIntent.getBroadcast(context, 0, new Intent(context, SpeedWidgetAuto.class).setAction(MOTION),
                PendingIntent.FLAG_MUTABLE | flags);
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        if (Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction()) || Intent.ACTION_MY_PACKAGE_REPLACED.equals(intent.getAction())) {
            clearTrip(context);
            SpeedWidgetService.refresh(context);
            observe(context);
            if (armed(context)) SpeedWidgetBluetooth.checkConnectedAudio(context.getApplicationContext());
            return;
        }
        if (!MOTION.equals(intent.getAction()) || !armed(context)
                || !granted(context, Manifest.permission.ACTIVITY_RECOGNITION)) return;
        ActivityTransitionResult result = ActivityTransitionResult.extractResult(intent);
        if (result == null) return;

        Boolean inVehicle = null;
        for (ActivityTransitionEvent event : result.getTransitionEvents()) {
            if (event.getActivityType() == DetectedActivity.IN_VEHICLE) {
                inVehicle = event.getTransitionType() == ActivityTransition.ACTIVITY_TRANSITION_ENTER;
            }
        }
        if (inVehicle != null) motionChanged(context, inVehicle);
    }

    static void motionChanged(Context context, boolean inVehicle) {
        if (armed(context) && !hasVehicleBluetooth(context) && prefs(context).getBoolean(IN_VEHICLE, false) != inVehicle) {
            prefs(context).edit().putBoolean(IN_VEHICLE, inVehicle).apply();
            tripChanged(context, 0);
        }
    }

    static boolean hasVehicleBluetooth(Context context) {
        return granted(context, Manifest.permission.BLUETOOTH_CONNECT) && !vehicles(context).isEmpty();
    }

    static void projectionChanged(Context context, boolean connected) {
        if (!armed(context)) return;
        SharedPreferences settings = prefs(context);
        boolean changed = settings.getBoolean(PROJECTION, false) != connected;
        if (changed) {
            settings.edit().putBoolean(PROJECTION, connected).apply();
            Log.i(TAG, "Android Auto projection " + (connected ? "connected" : "disconnected"));
        }
        if (changed || (connected && !SpeedWidgetService.isTracking())) tripChanged(context, 0);
    }

    static void vehicleConnected(Context context, String connection) {
        Set<String> connected = vehicles(context);
        connected.add(connection);
        prefs(context).edit().putStringSet(VEHICLES, connected).putBoolean(IN_VEHICLE, false).apply();
        tripChanged(context, 0);
    }

    static void vehicleDisconnected(Context context, String connection) {
        Set<String> connected = vehicles(context);
        if (connected.remove(connection)) {
            prefs(context).edit().putStringSet(VEHICLES, connected).apply();
            tripChanged(context, SpeedWidgetBluetooth.DISCONNECT_GRACE_MS);
        }
    }

    static void bluetoothOff(Context context) {
        if (!hasVehicleBluetooth(context)) return;
        prefs(context).edit().remove(VEHICLES).apply();
        tripChanged(context, 0);
    }

    private static void tripChanged(Context context, long delay) {
        if (!tripDetected(context)) prefs(context).edit().remove(PAUSED).apply();
        SpeedWidgetService.automaticChanged(context, active(context), delay);
    }

    private static boolean tripDetected(Context context) {
        return prefs(context).getBoolean(PROJECTION, false) || hasVehicleBluetooth(context)
                || (granted(context, Manifest.permission.ACTIVITY_RECOGNITION) && prefs(context).getBoolean(IN_VEHICLE, false));
    }

    private static void clearTrip(Context context) {
        prefs(context).edit().remove(PROJECTION).remove(VEHICLES).remove(IN_VEHICLE).remove(PAUSED).apply();
    }

    private static Set<String> vehicles(Context context) {
        return new HashSet<>(prefs(context).getStringSet(VEHICLES, Collections.emptySet()));
    }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
