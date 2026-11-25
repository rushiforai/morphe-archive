package nl.johninnl.navigation.startup;

import android.app.Activity;
import android.app.Application;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.Log;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.WeakHashMap;

/** Process-local ownership: an API start never acquires a pre-existing or user-adopted engine. */
public final class ProviderLifecycle extends ContentProvider implements Application.ActivityLifecycleCallbacks {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Set<Activity> activities = Collections.newSetFromMap(new IdentityHashMap<>());
    private static final Set<Object> cars = Collections.newSetFromMap(new WeakHashMap<>());
    private static Application app;
    private static ProviderLifecycle observer;
    private static long sequence, owner;
    private static Runnable shutdown;
    private static boolean pendingShutdown, unsafeCarLifecycle;

    public static synchronized void install(Context context) {
        Application application = (Application) context.getApplicationContext();
        if (app == application) return;
        if (app != null && observer != null) app.unregisterActivityLifecycleCallbacks(observer);
        MAIN.removeCallbacks(EXPIRE); activities.clear(); cars.clear(); owner = 0;
        shutdown = null; pendingShutdown = false; unsafeCarLifecycle = false; app = application;
        observer = new ProviderLifecycle(); app.registerActivityLifecycleCallbacks(observer);
    }
    @Override public boolean onCreate() { install(getContext()); return true; }

    static synchronized long claim(boolean alreadyRunning) {
        if (owner == 0 && !alreadyRunning && !unsafeCarLifecycle && activities.isEmpty() && cars.isEmpty()) owner = ++sequence;
        return owner;
    }
    static synchronized void watch(long token, Runnable request) {
        if (token == 0 || token != owner) return;
        shutdown = request; MAIN.post(ProviderLifecycle::schedule);
    }
    static void renewed(Context context) { install(context); MAIN.post(ProviderLifecycle::schedule); }
    private static long remaining() {
        if (app == null) return 0;
        android.content.SharedPreferences prefs = app.getSharedPreferences("navigation_startup_lease", Context.MODE_PRIVATE);
        long left = prefs.getLong("until", 0) - SystemClock.elapsedRealtime();
        return left > 0 && left <= StartupProtocol.LEASE_MS
            && prefs.getInt("boot", -2) == Settings.Global.getInt(app.getContentResolver(), Settings.Global.BOOT_COUNT, -1) ? left : 0;
    }
    private static synchronized void schedule() {
        MAIN.removeCallbacks(EXPIRE);
        if (owner != 0 && shutdown != null && !pendingShutdown) MAIN.postDelayed(EXPIRE, remaining());
    }
    private static final Runnable EXPIRE = () -> {
        Runnable request;
        synchronized (ProviderLifecycle.class) {
            if (owner == 0 || shutdown == null || pendingShutdown) return;
            if (remaining() > 0) { schedule(); return; }
            pendingShutdown = true; request = shutdown;
        }
        try { request.run(); }
        catch (RuntimeException failure) {
            Log.w("NavigationStartup", "Owned provider shutdown failed", failure);
            synchronized (ProviderLifecycle.class) { adopt(); }
            ProviderEngineService.stopFailed();
        }
    };

    /** Recheck ownership and the latest heartbeat when an asynchronous native initializer becomes ready. */
    public static void shutdownIfExpired(long token, Runnable action) {
        if (Looper.myLooper() != Looper.getMainLooper()) { MAIN.post(() -> shutdownIfExpired(token, action)); return; }
        synchronized (ProviderLifecycle.class) {
            if (token == 0 || token != owner) return;
            pendingShutdown = false;
            if (remaining() > 0 || !activities.isEmpty() || !cars.isEmpty()) { schedule(); return; }
            try { action.run(); }
            catch (RuntimeException failure) {
                Log.w("NavigationStartup", "Owned native shutdown failed", failure);
                ProviderEngineService.stopFailed();
            } finally { adopt(); }
        }
    }
    private static void adopt() {
        owner = 0; shutdown = null; pendingShutdown = false; MAIN.removeCallbacks(EXPIRE);
    }
    static synchronized boolean stopping() { return owner != 0 && pendingShutdown; }
    static synchronized boolean apiStarted() { return owner != 0; }
    private static synchronized void carEvent(Object session, String event) {
        if ("ON_START".equals(event) || "ON_RESUME".equals(event)) { cars.add(session); adopt(); }
        else if ("ON_STOP".equals(event) || "ON_DESTROY".equals(event)) cars.remove(session);
    }
    /** Attach to public CAL lifecycle, so metadata-only service binds do not count as user takeover. */
    public static void observeCarSession(Object session) {
        try {
            Object lifecycle = session.getClass().getMethod("getLifecycle").invoke(session);
            ClassLoader loader = session.getClass().getClassLoader();
            Class<?> eventObserver = Class.forName("androidx.lifecycle.LifecycleEventObserver", false, loader);
            Class<?> lifecycleObserver = Class.forName("androidx.lifecycle.LifecycleObserver", false, loader);
            Object proxy = Proxy.newProxyInstance(loader, new Class<?>[]{eventObserver}, (self, method, args) -> {
                switch (method.getName()) {
                    case "onStateChanged": carEvent(session, String.valueOf(args[1])); return null;
                    case "hashCode": return System.identityHashCode(self);
                    case "equals": return self == args[0];
                    case "toString": return "NavigationProviderOwnership";
                    default: throw new UnsupportedOperationException(method.getName());
                }
            });
            lifecycle.getClass().getMethod("addObserver", lifecycleObserver).invoke(lifecycle, proxy);
        } catch (ReflectiveOperationException | RuntimeException failure) {
            // Preserve a possible user session if the public lifecycle ABI is unavailable.
            synchronized (ProviderLifecycle.class) { unsafeCarLifecycle = true; adopt(); }
            Log.w("NavigationStartup", "Cannot observe provider car lifecycle", failure);
        }
    }
    @Override public void onActivityCreated(Activity activity, Bundle saved) { synchronized (ProviderLifecycle.class) { activities.add(activity); adopt(); } }
    @Override public void onActivityStarted(Activity activity) { synchronized (ProviderLifecycle.class) { activities.add(activity); adopt(); } }
    @Override public void onActivityResumed(Activity activity) { synchronized (ProviderLifecycle.class) { activities.add(activity); adopt(); } }
    @Override public void onActivityStopped(Activity activity) { synchronized (ProviderLifecycle.class) { activities.remove(activity); } }
    @Override public void onActivityDestroyed(Activity activity) { synchronized (ProviderLifecycle.class) { activities.remove(activity); } }
    @Override public void onActivityPaused(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle saved) { }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
