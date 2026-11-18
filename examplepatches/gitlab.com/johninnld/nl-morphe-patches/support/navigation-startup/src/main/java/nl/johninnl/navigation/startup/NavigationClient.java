package nl.johninnl.navigation.startup;

import android.app.Activity;
import android.app.ActivityOptions;
import android.app.Application;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.os.SystemClock;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Set;
import java.util.Map;
import java.util.HashMap;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Shared Maps/Vela client. All lifecycle state lives on main; synchronous IPC never does. */
public final class NavigationClient implements Application.ActivityLifecycleCallbacks {
    public interface Capabilities {
        /** Runs on the provider's health worker before a cold engine start or running response. */
        boolean prepare(String source, Bundle status, long generation) throws Exception;
        /** Runs on main; enqueue cleanup and cancel local output without remote IPC. */
        void disconnected(long generation);
    }
    private final Application app;
    private final Capabilities capabilities;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Set<Activity> visible = Collections.newSetFromMap(new IdentityHashMap<>());
    private final StartupPolicy recovery = new StartupPolicy();
    // Two supported providers: a wedged IPC to one must not starve the other.
    // Never create replacement threads on each timeout.
    private final Map<String, ThreadPoolExecutor> workers = new HashMap<>();
    private String provider = "", state = "off";
    private boolean navigation, bound, pending, closed, providerMuted;
    private long generation, pollAt, pendingAt, connectionAt;
    private IBinder binder;
    private ServiceConnection connection;

    public NavigationClient(Context context) {
        this(context, null);
    }
    public NavigationClient(Context context, Capabilities capabilities) {
        app = (Application) context.getApplicationContext();
        this.capabilities = capabilities;
        app.registerActivityLifecycleCallbacks(this);
    }
    public String state() { return state; }
    public boolean activeSession(){return active();}
    public Activity foregroundActivity(){return visible.isEmpty()?null:visible.iterator().next();}
    public String statusLabel(boolean dutch) {
        switch (state) {
            case "running": return dutch ? "motor actief" + (providerMuted ? " · bron gedempt" : "") : "engine running" + (providerMuted ? " · provider muted" : "");
            case "starting": return dutch ? "wordt gestart" : "starting";
            case "permission_required": return dutch ? "locatietoegang nodig" : "location permission needed";
            case "disabled": return dutch ? "delen uitgeschakeld in bronapp" : "sharing disabled in provider";
            case "paused": return dutch ? "controle gepauzeerd" : "monitoring paused";
            case "unavailable": case "incompatible": return dutch ? "start-API niet beschikbaar; werk de bronapp bij" : "startup API unavailable; update provider";
            case "not_authorized": return dutch ? "ontvanger niet toegestaan" : "receiver not authorized";
            case "start_blocked": return dutch ? "Android blokkeert starten op de achtergrond" : "Android blocked background startup";
            case "error": return dutch ? "starten van bron mislukt; nieuwe poging volgt" : "provider startup failed; retrying";
            case "off": return dutch ? "uit" : "off";
            default: return dutch ? "verbinding wordt gecontroleerd" : "checking connection";
        }
    }
    public void select(String source, boolean navigating) {
        if (Looper.myLooper() != Looper.getMainLooper()) { main.post(() -> select(source, navigating)); return; }
        if (closed) return;
        String next = StartupProtocol.controlClass(source).isEmpty() ? "" : source;
        if (!next.equals(provider)) { disconnect(); provider = next; recovery.reset(); pollAt = 0; }
        navigation = navigating;
        main.removeCallbacks(tick); tick.run();
    }
    private boolean active() { return !closed && !provider.isEmpty() && (navigation || !visible.isEmpty()); }
    private void disconnect() {
        generation++; pending = false; binder = null;
        if (capabilities != null) capabilities.disconnected(generation);
        if (bound && connection != null) try { app.unbindService(connection); } catch (IllegalArgumentException ignored) { }
        bound = false; connection = null;
        for (ThreadPoolExecutor worker : workers.values()) worker.getQueue().clear();
    }
    private ThreadPoolExecutor worker(String source) {
        ThreadPoolExecutor worker = workers.get(source);
        if (worker == null) {
            worker = new ThreadPoolExecutor(0, 1, 30, TimeUnit.SECONDS, new ArrayBlockingQueue<>(1),
                runnable -> { Thread t = new Thread(runnable, "NavigationHealth-" + source); t.setDaemon(true); return t; },
                new ThreadPoolExecutor.DiscardPolicy());
            workers.put(source, worker);
        }
        return worker;
    }
    private void connect(long now) {
        final String selected = provider;
        final long token = ++generation;
        connectionAt = now;
        ServiceConnection candidate = new ServiceConnection() {
            @Override public void onServiceConnected(ComponentName name, IBinder service) {
                if (token != generation || !active()) return;
                if (name == null || service == null || !selected.equals(name.getPackageName())) {
                    disconnect(); state = "incompatible"; pollAt = SystemClock.elapsedRealtime() + 30000; return;
                }
                binder = service; pollAt = 0; state = "checking";
                main.removeCallbacks(tick); tick.run();
            }
            @Override public void onServiceDisconnected(ComponentName name) {
                if (token == generation) { disconnect(); state = "reconnecting"; pollAt = 0; }
            }
            @Override public void onBindingDied(ComponentName name) {
                if (token == generation) { disconnect(); state = "reconnecting"; pollAt = 0; }
            }
            @Override public void onNullBinding(ComponentName name) {
                if (token == generation) { disconnect(); state = "unavailable"; pollAt = SystemClock.elapsedRealtime() + 30000; }
            }
        };
        connection = candidate;
        state = "connecting";
        try {
            int flags = Context.BIND_AUTO_CREATE;
            // Target-R+ clients must explicitly share their existing while-in-use capabilities.
            // Android still checks both the client's current capability and the provider's grants.
            if (Build.VERSION.SDK_INT >= 29) flags |= Context.BIND_INCLUDE_CAPABILITIES;
            bound = app.bindService(new Intent().setClassName(selected, StartupProtocol.controlClass(selected)), candidate, flags);
            if (!bound) { connection = null; state = "unavailable"; pollAt = now + 30000; }
        } catch (RuntimeException error) { connection = null; bound = false; state = "unavailable"; pollAt = now + 30000; }
    }
    private void poll(long now) {
        final long token = generation;
        final String selected = provider;
        final IBinder service = binder;
        pending = true; pendingAt = now; pollAt = now + StartupProtocol.HEARTBEAT_MS;
        worker(selected).execute(() -> {
            Bundle response = null;
            String failure = "error";
            Parcel input = Parcel.obtain(), output = Parcel.obtain();
            try {
                input.writeInterfaceToken(StartupProtocol.DESCRIPTOR);
                if(capabilities!=null)input.writeInt(1);
                if (!service.transact(StartupProtocol.STATUS, input, output, 0)) failure = "incompatible";
                else {
                    output.readException(); response = output.readBundle(PendingIntent.class.getClassLoader());
                    if (response != null && response.getInt("version") == 1 && capabilities != null
                            && !capabilities.prepare(selected, response, token)) {
                        response = null; failure = "reconnecting";
                    }
                }
            } catch (SecurityException error) { failure = "not_authorized"; }
            catch (Exception error) { failure = "reconnecting"; }
            finally { input.recycle(); output.recycle(); }
            final Bundle result = response;
            final String error = failure;
            main.post(() -> {
                // A late result must never start an old provider or revive a closed session.
                if (token != generation || !selected.equals(provider) || service != binder || !active()) return;
                pending = false;
                if (result == null) { state = error; if ("reconnecting".equals(error)) disconnect(); return; }
                if (result.getInt("version") != 1) { state = "incompatible"; return; }
                state = result.getString("state", "incompatible");
                providerMuted = result.getBoolean("audio_muted", false);
                if ("running".equals(state)) { recovery.reset(); return; }
                long at = SystemClock.elapsedRealtime();
                if (!recovery.shouldStart(at, state)) return;
                PendingIntent start = result.getParcelable("start");
                try {
                    if (start == null || !selected.equals(start.getCreatorPackage())
                            || start.getCreatorUid() != app.getPackageManager().getApplicationInfo(selected, 0).uid
                            || (Build.VERSION.SDK_INT >= 31 && !start.isForegroundService())) { state = "incompatible"; return; }
                    recovery.attempted(at);
                    sendStart(start); state = "starting"; pollAt = at + 2000;
                } catch (Exception denied) { state = "start_blocked"; }
            });
        });
    }
    private void sendStart(PendingIntent start) throws PendingIntent.CanceledException {
        // Modern senders otherwise transfer only FGS-start permission, which does not make
        // the background provider eligible for a location FGS with while-in-use grants.
        // Opt in only through the authenticated foreground-service capability
        // while an actual receiving Activity is resumed; never grant a background sender
        // privileges it does not have. No provider Activity is launched here.
        if (Build.VERSION.SDK_INT >= 34 && !visible.isEmpty()) {
            ActivityOptions options = ActivityOptions.makeBasic();
            options.setPendingIntentBackgroundActivityStartMode(Build.VERSION.SDK_INT >= 36
                ? ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOW_IF_VISIBLE
                : ActivityOptions.MODE_BACKGROUND_ACTIVITY_START_ALLOWED);
            start.send(app, 0, null, null, null, null, options.toBundle());
        } else start.send();
    }
    private final Runnable tick = new Runnable() {
        @Override public void run() {
            if (!active()) {
                if (bound || pending) disconnect();
                state = provider.isEmpty() ? "off" : "paused";
                return;
            }
            long now = SystemClock.elapsedRealtime();
            if (pending && now - pendingAt >= 8000) {
                disconnect(); state = "unresponsive"; pollAt = now + 10000;
            }
            if (bound && binder == null && now - connectionAt >= 10000) {
                disconnect(); state = "unresponsive"; pollAt = now + 10000;
            }
            if (!bound && now >= pollAt) connect(now);
            else if (binder != null && !pending && now >= pollAt) poll(now);
            main.postDelayed(this, 1000);
        }
    };
    public void close() {
        closed = true; disconnect(); main.removeCallbacksAndMessages(null);
        for (ThreadPoolExecutor worker : workers.values()) worker.shutdownNow();
        app.unregisterActivityLifecycleCallbacks(this); visible.clear();
    }
    @Override public void onActivityResumed(Activity activity) { visible.add(activity); select(provider, navigation); }
    @Override public void onActivityPaused(Activity activity) { visible.remove(activity); select(provider, navigation); }
    @Override public void onActivityDestroyed(Activity activity) { visible.remove(activity); select(provider, navigation); }
    @Override public void onActivityCreated(Activity activity, Bundle saved) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle saved) { }
}
