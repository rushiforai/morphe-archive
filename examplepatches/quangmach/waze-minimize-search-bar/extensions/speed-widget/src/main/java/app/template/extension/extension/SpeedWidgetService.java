package app.template.extension.extension;

import android.app.ActivityManager;
import android.app.Notification;
import android.app.Application;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.appwidget.AppWidgetManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

public final class SpeedWidgetService extends Service implements LocationListener {
    private static final int NOTIFICATION_ID = 0x514D5701;
    private static final String CHANNEL = "qm_waze_speed_widget";
    static final String STOP = "app.template.extension.extension.STOP_SPEED_WIDGET";
    private static final String START_AUTO = "app.template.extension.extension.START_SPEED_TRIP";
    private static final String UNAVAILABLE = "—";
    private static final long MAX_FIX_AGE_MS = 6000;
    private static final long ENGINE_IDLE_GRACE_MS = 3000;
    private static final float MAX_LIMIT_DISTANCE_METERS = 25;
    private static volatile Reading wazeReading;
    private static SpeedWidgetService running;
    private static Application engineOwner;
    private static final Handler engineHandler = new Handler(Looper.getMainLooper());
    private static final Runnable releaseEngine = () -> {
        Application owner = engineOwner;
        if (running != null || owner == null) return;
        if (hasWazeSession(owner) || owner.stopService(new Intent().setClassName(owner, "com.waze.WazeAppService"))) {
            engineOwner = null;
        }
    };

    private final Handler handler = new Handler(Looper.getMainLooper());
    private final BroadcastReceiver screen = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            stopManualTracking();
        }
    };
    private final Runnable endAutomatic = () -> {
        automatic = false;
        stopIfIdle();
    };
    private final Runnable tick = new Runnable() {
        @Override
        public void run() {
            publish(false);
            handler.postDelayed(this, 1000);
        }
    };
    private LocationManager locationManager;
    private Location gps;
    private String rendered;
    private boolean manual;
    private boolean automatic;
    private int manualWidgetId = AppWidgetManager.INVALID_APPWIDGET_ID;

    private static final class Reading {
        final String unit;
        final int limit;
        final Location fix;
        final long timestamp;

        Reading(String unit, int limit, Location fix) {
            this.unit = unit;
            this.limit = limit;
            this.fix = fix == null ? null : new Location(fix);
            this.timestamp = SystemClock.elapsedRealtime();
        }
    }

    // Called from Waze's JNI-backed speedometer update, with the associated Waze location fix.
    public static void onWazeLimit(String units, int limit, Location location) {
        wazeReading = new Reading(normalizeUnit(units), limit, location);
    }

    static boolean isTracking() {
        return running != null;
    }

    static void useAutoOnly() {
        if (running != null) running.stopManualTracking();
    }

    static void widgetDeleted(int id) {
        SpeedWidgetService service = running;
        if (service != null && service.manualWidgetId == id) {
            service.stopManualTracking();
        }
    }

    static void refresh(Context context) {
        if (running == null) {
            String status = SpeedWidgetAuto.idleHint(context);
            SpeedWidget.render(context, UNAVAILABLE, defaultUnit(), UNAVAILABLE, status, false);
            NavigationWidget.render(context, UNAVAILABLE, defaultUnit(), UNAVAILABLE, status, false, false, true);
        } else {
            running.publish(true);
        }
    }

    static void automaticChanged(Context context, boolean active, long stopDelayMs) {
        SpeedWidgetService service = running;
        if (service != null) {
            service.handler.removeCallbacks(service.endAutomatic);
            if (active) service.automatic = true;
            else if (service.automatic) service.handler.postDelayed(service.endAutomatic, stopDelayMs);
        } else if (active) {
            try {
                context.startForegroundService(new Intent(context, SpeedWidgetService.class).setAction(START_AUTO));
            } catch (SecurityException | IllegalStateException error) {
                Log.w("QmWazeSpeedWidget", "Android could not start automatic widget tracking", error);
            }
        } else {
            refresh(context);
        }
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent != null && STOP.equals(intent.getAction())) {
            SpeedWidgetAuto.pauseTrip(this);
            automatic = false;
            handler.removeCallbacks(endAutomatic);
            stopManualTracking();
            return START_NOT_STICKY;
        }
        boolean fromTrip = intent == null || START_AUTO.equals(intent.getAction());

        try {
            startForeground(NOTIFICATION_ID, notification());
            if (fromTrip) {
                automatic = SpeedWidgetAuto.active(this);
                handler.removeCallbacks(endAutomatic);
            } else {
                int id = intent.getIntExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, AppWidgetManager.INVALID_APPWIDGET_ID);
                if (SpeedWidget.isBound(this, id) && getSystemService(PowerManager.class).isInteractive()) {
                    startManualTracking(id);
                }
            }
            if ((automatic || manual) && !beginTracking()) {
                automatic = false;
                stopManualTracking();
            } else {
                stopIfIdle();
            }
        } catch (IllegalArgumentException | SecurityException | IllegalStateException e) {
            automatic = false;
            stopManualTracking();
        }
        return automatic ? START_STICKY : START_NOT_STICKY;
    }

    private void startManualTracking(int id) {
        if (!manual) {
            IntentFilter filter = new IntentFilter(Intent.ACTION_SCREEN_OFF);
            if (Build.VERSION.SDK_INT >= 33) {
                registerReceiver(screen, filter, Context.RECEIVER_NOT_EXPORTED);
            } else {
                registerReceiver(screen, filter);
            }
            manual = true;
        }
        manualWidgetId = id;
    }

    private boolean beginTracking() {
        if (running == this) return true;
        if (!SpeedWidgetAuto.hasWidgets(this)) {
            return false;
        }
        try {
            locationManager = getSystemService(LocationManager.class);
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 1000L, 0f, this, Looper.getMainLooper());
        } catch (IllegalArgumentException | SecurityException | IllegalStateException e) {
            refresh(this);
            return false;
        }

        running = this;
        tick.run();
        try {
            startWazeEngine(getApplication());
        } catch (RuntimeException | LinkageError e) {
            Log.w("QmWazeSpeedWidget", "Waze could not start for road limits", e);
        }
        return true;
    }

    private void stopManualTracking() {
        if (manual) {
            manual = false;
            manualWidgetId = AppWidgetManager.INVALID_APPWIDGET_ID;
            unregisterReceiver(screen);
        }
        stopIfIdle();
    }

    private void stopIfIdle() {
        if (manual || automatic) return;
        stopForeground(STOP_FOREGROUND_REMOVE);
        endTracking();
        stopSelf();
    }

    private void endTracking() {
        if (running != this) return;
        running = null;
        handler.removeCallbacks(tick);
        locationManager.removeUpdates(this);
        gps = null;
        rendered = null;
        refresh(this);
        scheduleEngineRelease();
    }

    // Morphe inserts the call to Waze's coroutine initializer here.
    private static void startWazeEngine(Application application) {}

    // Morphe binds this to the same regional configuration read by Waze's map.
    private static String readWazeSignStyle() { return null; }

    private static Object newContinuation(Class<?> continuation, Object emptyContext, Application owner) {
        return Proxy.newProxyInstance(continuation.getClassLoader(), new Class<?>[] { continuation },
                new EngineRequest(emptyContext, owner));
    }

    private static final class EngineRequest implements InvocationHandler {
        final Object emptyContext;
        final Application owner;

        EngineRequest(Object emptyContext, Application owner) {
            this.emptyContext = emptyContext;
            this.owner = owner;
        }

        @Override public Object invoke(Object proxy, Method method, Object[] args) {
            switch (method.getName()) {
                case "getContext": return emptyContext;
                case "resumeWith":
                    engineHandler.post(SpeedWidgetService::scheduleEngineRelease);
                    return null;
                case "toString": return "Waze speed widget initializer";
                case "hashCode": return System.identityHashCode(proxy);
                case "equals": return proxy == args[0];
                default: throw new UnsupportedOperationException(method.getName());
            }
        }
    }

    // Called only when a continuation wins Waze's existing atomic startup gate.
    public static void onWazeEngineInitializing(Object continuation) {
        if (continuation != null && Proxy.isProxyClass(continuation.getClass())
                && Proxy.getInvocationHandler(continuation) instanceof EngineRequest) {
            engineOwner = ((EngineRequest) Proxy.getInvocationHandler(continuation)).owner;
        }
    }

    private static void scheduleEngineRelease() {
        if (engineOwner == null) return;
        engineHandler.removeCallbacks(releaseEngine);
        engineHandler.postDelayed(releaseEngine, ENGINE_IDLE_GRACE_MS);
    }

    private static boolean hasWazeSession(Context context) {
        ActivityManager activities = context.getSystemService(ActivityManager.class);
        for (ActivityManager.AppTask task : activities.getAppTasks()) {
            ActivityManager.RecentTaskInfo info = task.getTaskInfo();
            Intent root = info == null || !info.isRunning ? null : info.baseIntent;
            if (root == null || root.getComponent() == null) continue;
            String name = root.getComponent().getClassName();
            if (name.equals("com.waze.MainActivity") || name.equals("com.waze.FreeMapAppActivity")) return true;
        }
        for (ActivityManager.RunningServiceInfo service : activities.getRunningServices(Integer.MAX_VALUE)) {
            String name = service.service.getClassName();
            if (name.equals("com.waze.car_lib.WazeCarAppService") || name.equals("com.waze.sdk.SdkService")
                    || name.equals("com.waze.BoundService") || name.equals("com.waze.AIDLService")) return true;
        }
        return false;
    }

    private Notification notification() {
        Notification.Builder builder;
        if (Build.VERSION.SDK_INT >= 26) {
            NotificationManager manager = getSystemService(NotificationManager.class);
            manager.createNotificationChannel(new NotificationChannel(CHANNEL, "Waze Speedometer", NotificationManager.IMPORTANCE_LOW));
            builder = new Notification.Builder(this, CHANNEL);
        } else {
            builder = new Notification.Builder(this);
        }
        Intent stop = new Intent(this, SpeedWidgetService.class).setAction(STOP);
        PendingIntent stopAction = PendingIntent.getService(this, 0, stop, PendingIntent.FLAG_IMMUTABLE);
        return builder.setSmallIcon(android.R.drawable.ic_menu_compass)
                .setContentTitle("Waze Speedometer")
                .setContentText("Updating the launcher widget")
                .setOngoing(true)
                .addAction(new Notification.Action.Builder(null, "Stop", stopAction).build())
                .build();
    }

    @Override
    public void onLocationChanged(Location location) {
        gps = location;
        publish(false);
    }

    @Override
    public void onProviderDisabled(String provider) {
        gps = null;
        publish(false);
    }

    @Override
    public void onProviderEnabled(String provider) {}

    @Override
    public void onStatusChanged(String provider, int status, Bundle extras) {}

    private void publish(boolean force) {
        long now = SystemClock.elapsedRealtime();
        boolean gpsReady = isFresh(gps, now);
        Reading reading = wazeReading;
        boolean currentLimit = gpsReady && reading != null && now - reading.timestamp <= MAX_FIX_AGE_MS
                && reading.limit > 0 && reading.unit != null && isFresh(reading.fix, now)
                && reading.fix.distanceTo(gps) <= MAX_LIMIT_DISTANCE_METERS;
        String unit = reading == null || reading.unit == null ? defaultUnit() : reading.unit;
        String speed = gpsReady && gps.hasSpeed() && gps.getSpeed() >= 0 && Float.isFinite(gps.getSpeed())
                ? Integer.toString(Math.round(gps.getSpeed() * ("mph".equals(unit) ? 2.2369363f : 3.6f)))
                : UNAVAILABLE;
        boolean useUsSign = false;
        if (currentLimit) {
            try {
                useUsSign = "us".equals(readWazeSignStyle());
            } catch (RuntimeException | LinkageError error) {
                // The engine may be shutting down. Wait for a fresh limit and configuration.
                currentLimit = false;
            }
        }
        String limit = currentLimit ? Integer.toString(reading.limit) : UNAVAILABLE;
        String status = UNAVAILABLE.equals(speed) ? "Waiting for GPS" : "";
        String display = speed + "|" + unit + "|" + limit + "|" + status + "|" + useUsSign;
        if (force || !display.equals(rendered)) {
            rendered = display;
            SpeedWidget.render(this, speed, unit, limit, status, useUsSign);
        }
        NavigationWidget.render(this, speed, unit, limit, status, useUsSign, gpsReady, force);
    }

    private static boolean isFresh(Location fix, long now) {
        if (fix == null || !fix.hasAccuracy() || fix.getAccuracy() > 35) {
            return false;
        }
        long age = now - TimeUnit.NANOSECONDS.toMillis(fix.getElapsedRealtimeNanos());
        return age >= 0 && age <= MAX_FIX_AGE_MS;
    }

    private static String normalizeUnit(String unit) {
        if (unit == null) {
            return null;
        }
        switch (unit.trim().toLowerCase(Locale.ROOT)) {
            case "mph": return "mph";
            case "km/h":
            case "kmh":
            case "kph": return "km/h";
            default: return null;
        }
    }

    private static String defaultUnit() {
        String country = Locale.getDefault().getCountry();
        return "US".equals(country) || "GB".equals(country) ? "mph" : "km/h";
    }

    @Override
    public void onDestroy() {
        if (manual) unregisterReceiver(screen);
        handler.removeCallbacks(endAutomatic);
        endTracking();
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
