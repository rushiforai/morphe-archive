package nl.johninnl.navigation.startup;

import android.app.Notification;
import android.app.ActivityManager;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.Log;

/** Private service entered through a provider-owned PendingIntent, never an Activity. */
public abstract class ProviderEngineService extends Service {
    private static final String PREFS = "navigation_startup_lease";
    private static volatile String state = "stopped";
    private static volatile boolean starting;
    private final Handler main = new Handler(Looper.getMainLooper());
    protected abstract boolean enabled();
    protected abstract boolean engineRunning();
    protected abstract void startEngine() throws ReflectiveOperationException;
    protected abstract void stopEngine(long ownership) throws ReflectiveOperationException;
    protected abstract String nativeServiceName();
    protected final void finishOwnedShutdown(long ownership, Runnable action) {
        ProviderLifecycle.shutdownIfExpired(ownership, () -> {
            main.removeCallbacks(tick);
            stopForeground(STOP_FOREGROUND_REMOVE);
            stopSelf();
            action.run();
        });
    }
    protected String integrationStatus(){return "Providing driving data to your selected map";}
    private String notificationStatus;
    private Notification notification(String detail){return new Notification.Builder(this,"navigation_data").setSmallIcon(android.R.drawable.ic_menu_mylocation).setContentTitle("Navigation data sharing").setContentText(detail).setOngoing(true).build();}

    public static void renewLease(Context context) {
        context.getSharedPreferences(PREFS, MODE_PRIVATE).edit()
            .putLong("until", SystemClock.elapsedRealtime() + StartupProtocol.LEASE_MS)
            .putInt("boot", Settings.Global.getInt(context.getContentResolver(), Settings.Global.BOOT_COUNT, -1)).apply();
        ProviderAudio.init(context);
        ProviderLifecycle.renewed(context);
    }
    public static boolean starting() { return starting; }
    public static String lastState() { return state; }
    static void stopFailed() { state = "error"; }
    private boolean nativeServicePresent() {
        try {
            // Android exposes a process's own services here, including a native engine still starting.
            java.util.List<ActivityManager.RunningServiceInfo> services = getSystemService(ActivityManager.class).getRunningServices(128);
            if (services == null) return true; // Absence could not be established; do not acquire ownership.
            for (ActivityManager.RunningServiceInfo service : services)
                if (service.service != null && nativeServiceName().equals(service.service.getClassName())) return true;
            return false;
        } catch (RuntimeException unavailable) { return true; }
    }
    private boolean leased() {
        SharedPreferences prefs = getSharedPreferences(PREFS, MODE_PRIVATE);
        long remaining = prefs.getLong("until", 0) - SystemClock.elapsedRealtime();
        return remaining > 0 && remaining <= StartupProtocol.LEASE_MS
            && prefs.getInt("boot", -2) == Settings.Global.getInt(getContentResolver(), Settings.Global.BOOT_COUNT, -1);
    }
    @Override public final IBinder onBind(Intent intent) { return null; }
    @Override public void onCreate() { super.onCreate(); ProviderLifecycle.install(this); }
    @Override public final int onStartCommand(Intent intent, int flags, int startId) {
        ProviderAudio.init(this);
        main.removeCallbacks(tick);
        String permission = StartupProtocol.state(this, enabled(), false);
        if (!leased() || "disabled".equals(permission) || "permission_required".equals(permission)) {
            state = permission; starting = false; stopSelf(); return START_NOT_STICKY;
        }
        try {
            NotificationManager manager = getSystemService(NotificationManager.class);
            manager.createNotificationChannel(new NotificationChannel("navigation_data", "Navigation data", NotificationManager.IMPORTANCE_LOW));
            notificationStatus=integrationStatus();Notification notification=notification(notificationStatus);
            if (Build.VERSION.SDK_INT >= 29) startForeground(29171, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_LOCATION);
            else startForeground(29171, notification);
            boolean running = engineRunning();
            long ownership = ProviderLifecycle.claim(running || nativeServicePresent());
            starting = !running; state = running ? "running" : "starting";
            ProviderLifecycle.watch(ownership, () -> {
                try { stopEngine(ownership); }
                catch (ReflectiveOperationException error) { throw new ProviderControlService.ReflectiveOperationExceptionWrapper(error); }
            });
            if (!running) startEngine();
            main.post(tick);
            // The receiving map owns recovery. Android must not resurrect an expired API session.
            return START_NOT_STICKY;
        } catch (ReflectiveOperationException | RuntimeException error) {
            Log.w("NavigationStartup", "Silent engine start failed", error);
            state = error instanceof SecurityException || error.getClass().getSimpleName().equals("ForegroundServiceStartNotAllowedException")
                ? "start_blocked" : "error";
            starting = false; stopSelf(); return START_NOT_STICKY;
        }
    }
    private final Runnable tick = new Runnable() {
        @Override public void run() {
            if (!leased() || !enabled()) {
                // A not-yet-ready native initializer owns its deferred shutdown callback.
                // Keep foreground eligibility until that callback rechecks health/takeover.
                if (ProviderLifecycle.stopping()) { main.postDelayed(this, 1000); return; }
                stopSelf(); return;
            }
            try { state = engineRunning() ? "running" : "starting"; }
            catch (RuntimeException error) { state = "error"; }
            String detail=integrationStatus();
            if(!detail.equals(notificationStatus)){notificationStatus=detail;getSystemService(NotificationManager.class).notify(29171,notification(detail));}
            main.postDelayed(this, 5000);
        }
    };
    @Override public void onDestroy() {
        main.removeCallbacksAndMessages(null); starting = false;
        if (!("start_blocked".equals(state) || "error".equals(state))) state = "stopped";
        stopForeground(STOP_FOREGROUND_REMOVE); super.onDestroy();
        // The process-local watchdog survives wrapper destruction and only owns cold API starts.
    }
}
