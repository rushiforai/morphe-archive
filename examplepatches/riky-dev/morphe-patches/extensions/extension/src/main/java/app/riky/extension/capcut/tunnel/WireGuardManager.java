/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 * Copyright (C) 2026 riky-dev (CapCut adaptation)
 *
 * See the included NOTICE / wireguard licenses for terms.
 */

package app.riky.extension.capcut.tunnel;

import android.app.ActivityManager;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.Uri;
import android.net.VpnService;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;

import com.wireguard.android.backend.BackendException;
import com.wireguard.android.backend.GoBackend;
import com.wireguard.android.backend.Statistics;
import com.wireguard.android.backend.Tunnel;
import com.wireguard.config.BadConfigException;
import com.wireguard.config.Config;
import com.wireguard.crypto.Key;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * CapCut-scoped WireGuard runtime. Enabling the Morphe patch is the opt-in;
 * users import their own wg-quick conf (optional baked asset for private builds).
 */
public final class WireGuardManager {
    private static final String TAG = "RikyCapCutTunnel";
    private static final String ASSET_CONFIG = "riky-tunnel/default.conf";
    private static final String PREFS_NAME = "riky_capcut_tunnel_prefs";
    private static final String PREF_DISABLED = "tunnel_disabled";

    public enum State {
        NO_CONFIG, NEEDS_VPN_PERMISSION, DISCONNECTED, CONNECTING, VERIFYING, UNCONFIRMED, CONNECTED, ERROR
    }

    public interface ResultCallback {
        void ok();
        void error(String message);
    }

    private static volatile WireGuardManager instance;
    private final Context context;
    private final WireGuardStorage storage;
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private GoBackend backend;
    private Key[] activePeers = new Key[0];
    private long tunnelStartedAt;
    private boolean active;
    private boolean stopping;
    private boolean started;
    private boolean importPrompted;
    private volatile boolean serviceStarting;
    private volatile boolean serviceStopping;
    private boolean reconnectAfterStop;
    private final AtomicBoolean connectQueued = new AtomicBoolean();
    private volatile Snapshot snapshot = new Snapshot(State.NO_CONFIG, "", false, false);
    private final Tunnel tunnel = new Tunnel() {
        public String getName() { return "riky-capcut"; }
        public void onStateChange(State state) {
            active = state == State.UP;
            if (!active && !stopping) publish(WireGuardManager.State.ERROR, "tunnel_stopped");
        }
    };

    public static final class Snapshot {
        public final State state;
        public final String error;
        public final boolean hasConfig;
        public final boolean active;
        Snapshot(State state, String error, boolean hasConfig, boolean active) {
            this.state = state;
            this.error = error;
            this.hasConfig = hasConfig;
            this.active = active;
        }
    }

    private WireGuardManager(Context context) {
        this.context = context.getApplicationContext();
        storage = new WireGuardStorage(this.context);
    }

    public static synchronized WireGuardManager get(Context context) {
        if (instance == null) instance = new WireGuardManager(context);
        return instance;
    }

    /** Called from ScaffoldApplication.onCreate before any activity. Never throws. */
    public static void initialize(Context context) {
        try {
            String processName = null;
            if (Build.VERSION.SDK_INT >= 28) processName = Application.getProcessName();
            else {
                ActivityManager am = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
                for (ActivityManager.RunningAppProcessInfo process : am.getRunningAppProcesses()) {
                    if (process.pid == Process.myPid()) processName = process.processName;
                }
            }
            if (!context.getPackageName().equals(processName)) return;
            WireGuardManager manager = get(context);
            manager.worker.execute(() -> {
                if (manager.started) return;
                manager.started = true;
                try {
                    manager.seedFromAssets();
                    manager.connectInternal();
                } catch (Exception | LinkageError error) {
                    manager.fail("start_failed");
                }
            });
        } catch (Exception | LinkageError ignored) {
            // A disabled or unavailable VPN must never prevent CapCut startup.
        }
    }

    public Snapshot snapshot() { return snapshot; }
    public boolean hasConfig() { return storage.exists(); }

    private void publish(State state, String error) {
        snapshot = new Snapshot(state, error, storage.exists(), active);
        if (!error.isEmpty()) Log.i(TAG, "state=" + state + " error=" + error);
    }

    private void fail(String error) {
        Log.i(TAG, "WireGuard: " + error);
        publish(State.ERROR, error);
    }

    /** Seeds encrypted storage from baked assets once (optional private builds). */
    private void seedFromAssets() {
        if (storage.exists()) return;
        byte[] bytes = null;
        try (InputStream input = context.getAssets().open(ASSET_CONFIG)) {
            bytes = WireGuardStorage.readBounded(input, WireGuardConfig.MAX_BYTES);
            storage.save(WireGuardConfig.parse(new String(bytes, StandardCharsets.UTF_8), context.getPackageName()));
        } catch (FileNotFoundException ignored) {
            // Expected for normal users — they import via TunnelImportActivity.
        } catch (Exception | LinkageError error) {
            fail("config_seed_failed");
        } finally {
            if (bytes != null) Arrays.fill(bytes, (byte) 0);
        }
    }

    public void permissionDenied() {
        worker.execute(() -> publish(State.NEEDS_VPN_PERMISSION, "permission_denied"));
    }

    public void connect() {
        if (!connectQueued.compareAndSet(false, true)) return;
        worker.execute(() -> {
            try { connectInternal(); }
            finally { connectQueued.set(false); }
        });
    }

    public boolean hasOtherVpn() {
        if (snapshot.active) return false;
        ConnectivityManager connectivity = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        for (Network network : connectivity.getAllNetworks()) {
            NetworkCapabilities caps = connectivity.getNetworkCapabilities(network);
            if (caps != null && caps.hasTransport(NetworkCapabilities.TRANSPORT_VPN)) return true;
        }
        return false;
    }

    /** Opens the import UI (from notification or first-run with no config). */
    public void openImportUi() {
        try {
            Intent intent = new Intent(context, TunnelImportActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Exception error) {
            fail("import_launch_failed");
        }
    }

    private void requestImportUiOnce() {
        if (importPrompted) return;
        importPrompted = true;
        main.post(this::openImportUi);
    }

    private void requestVpnConsent() {
        try {
            Intent intent = new Intent(context, VpnConsentActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Exception error) {
            fail("consent_launch_failed");
        }
    }

    public void importDocument(Uri uri, ResultCallback callback) {
        worker.execute(() -> {
            byte[] bytes = null;
            try (InputStream input = context.getContentResolver().openInputStream(uri)) {
                bytes = WireGuardStorage.readBounded(input, WireGuardConfig.MAX_BYTES);
                saveInternal(WireGuardConfig.parse(new String(bytes, StandardCharsets.UTF_8), context.getPackageName()));
                main.post(callback::ok);
                connectInternal();
            } catch (BadConfigException error) {
                main.post(() -> callback.error(WireGuardConfig.validationError(error)));
            } catch (Exception | LinkageError error) {
                main.post(() -> callback.error("Could not import configuration"));
            } finally {
                if (bytes != null) Arrays.fill(bytes, (byte) 0);
            }
        });
    }

    public void saveText(String text, ResultCallback callback) {
        worker.execute(() -> {
            try {
                saveInternal(WireGuardConfig.parse(text, context.getPackageName()));
                main.post(callback::ok);
                connectInternal();
            } catch (BadConfigException error) {
                main.post(() -> callback.error(WireGuardConfig.validationError(error)));
            } catch (Exception | LinkageError error) {
                main.post(() -> callback.error("Could not save configuration"));
            }
        });
    }

    public boolean isDisabled() {
        return context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                .getBoolean(PREF_DISABLED, false);
    }

    public void setDisabled(boolean disabled) {
        context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                .edit()
                .putBoolean(PREF_DISABLED, disabled)
                .apply();
    }

    public void disableAndDisconnect(ResultCallback callback) {
        worker.execute(() -> {
            setDisabled(true);
            if (!disconnectInternal()) {
                main.post(() -> callback.error("Could not stop tunnel"));
                return;
            }
            main.post(callback::ok);
        });
    }

    public void deleteConfiguration(ResultCallback callback) {
        worker.execute(() -> {
            if (!disconnectInternal()) {
                main.post(() -> callback.error("Could not stop tunnel"));
                return;
            }
            try {
                storage.delete();
                publish(State.NO_CONFIG, "");
                main.post(callback::ok);
            } catch (Exception | LinkageError error) {
                main.post(() -> callback.error("Could not delete configuration"));
            }
        });
    }

    private void saveInternal(Config config) throws Exception {
        // Stop before replace; a malformed conf must not leave a half-written tunnel.
        if (!disconnectInternal()) throw new IOException("Could not stop tunnel");
        setDisabled(false);
        storage.save(config);
        publish(State.DISCONNECTED, "");
    }

    private void connectInternal() {
        if (isDisabled()) {
            publish(State.DISCONNECTED, "");
            return;
        }
        if (active) return;
        if (serviceStopping) { reconnectAfterStop = true; return; }
        try {
            if (!storage.exists()) {
                publish(State.NO_CONFIG, "");
                requestImportUiOnce();
                return;
            }
            if (VpnService.prepare(context) != null) {
                publish(State.NEEDS_VPN_PERMISSION, "needs_permission");
                main.post(this::requestVpnConsent);
                return;
            }
            if (hasOtherVpn()) { fail("vpn_conflict"); return; }
            publish(State.CONNECTING, "");
            Config config;
            try { config = storage.load(); }
            catch (Exception error) { fail("storage_failed"); return; }
            if (backend == null) try {
                backend = new GoBackend(new ContextWrapper(context) {
                    @Override public ComponentName startService(Intent intent) {
                        if (intent.getComponent() != null && intent.getComponent().getClassName()
                                .equals(GoBackend.VpnService.class.getName())) {
                            serviceStarting = true;
                            try {
                                return context.startForegroundService(new Intent(context, WireGuardVpnService.class));
                            } catch (RuntimeException error) {
                                serviceStarting = false;
                                throw error;
                            }
                        }
                        return super.startService(intent);
                    }
                });
            } catch (Exception | LinkageError error) {
                fail("native_failed");
                return;
            }
            active = backend.setState(tunnel, Tunnel.State.UP, config) == Tunnel.State.UP;
            if (active) {
                activePeers = config.getPeers().stream().map(peer -> peer.getPublicKey()).toArray(Key[]::new);
                tunnelStartedAt = SystemClock.elapsedRealtime();
                publish(State.VERIFYING, "");
                verifyConnection();
            } else {
                fail("start_failed");
            }
        } catch (BackendException error) {
            String message = switch (error.getReason()) {
                case VPN_NOT_AUTHORIZED -> "needs_permission";
                case DNS_RESOLUTION_FAILURE -> "dns_failed";
                default -> "start_failed";
            };
            fail(message);
            stopService();
        } catch (LinkageError error) {
            fail("native_failed");
            stopService();
        } catch (Exception error) {
            fail("start_failed");
            stopService();
        }
    }

    private void verifyConnection() {
        if (!active || backend == null || snapshot.state == State.ERROR) return;
        State state;
        try {
            Statistics statistics = backend.getStatistics(tunnel);
            long[] handshakes = new long[activePeers.length];
            for (int i = 0; i < activePeers.length; i++) {
                Statistics.PeerStats peer = statistics.peer(activePeers[i]);
                handshakes[i] = peer == null ? 0 : peer.latestHandshakeEpochMillis();
            }
            state = switch (WireGuardHealth.evaluate(handshakes, System.currentTimeMillis(),
                    SystemClock.elapsedRealtime() - tunnelStartedAt)) {
                case VERIFIED -> State.CONNECTED;
                case WAITING -> State.VERIFYING;
                case UNCONFIRMED -> State.UNCONFIRMED;
            };
        } catch (Exception | LinkageError ignored) {
            state = State.UNCONFIRMED;
        }
        if (state != snapshot.state) publish(state, "");
    }

    public void disconnect() { worker.execute(this::disconnectInternal); }

    private boolean disconnectInternal() {
        reconnectAfterStop = false;
        stopping = true;
        try {
            if (backend != null) backend.setState(tunnel, Tunnel.State.DOWN, null);
            active = false;
            if (!stopService()) return false;
            publish(storage.exists() ? State.DISCONNECTED : State.NO_CONFIG, "");
            return true;
        } catch (Exception | LinkageError error) {
            fail("stop_failed");
            return false;
        } finally {
            stopping = false;
        }
    }

    private boolean stopService() {
        try {
            if (serviceStarting) serviceStopping = true;
            context.stopService(new Intent(context, WireGuardVpnService.class));
            return true;
        } catch (RuntimeException ignored) {
            fail("stop_failed");
            return false;
        }
    }

    void serviceDestroyed(Runnable cleanup) {
        worker.execute(() -> {
            boolean wasActive = active;
            stopping = true;
            try {
                cleanup.run();
                active = false;
            } catch (Exception | LinkageError error) {
                fail("stop_failed");
            } finally {
                stopping = false;
                serviceStarting = false;
                serviceStopping = false;
            }
            if (wasActive) fail("tunnel_stopped");
            if (reconnectAfterStop) {
                reconnectAfterStop = false;
                connectInternal();
            }
        });
    }
}
