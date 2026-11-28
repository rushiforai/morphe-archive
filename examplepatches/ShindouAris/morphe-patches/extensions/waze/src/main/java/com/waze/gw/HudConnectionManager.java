package com.waze.gw;

import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.SystemClock;
import android.util.Log;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/** Owns one transport/session and an explicit, event-aware connection state machine. */
final class HudConnectionManager implements HudSessionListener {
    private static final String TAG = "WazeHudLink";
    enum State {
        DISABLED, PERMISSION_REQUIRED, BLUETOOTH_OFF, IDLE, CONNECTING, HANDSHAKING,
        CONNECTED, RETRY_WAIT, DISCONNECTING, ERROR
    }

    interface Listener { void onStateChanged(State state, String detail); }
    private static final String PREFS = "waze_hud_gw";
    private final Context context;
    private final SharedPreferences prefs;
    private final HudDeviceRepository devices;
    private final Listener listener;
    private final ReconnectPolicy reconnect = new ReconnectPolicy();
    private final ScheduledExecutorService executor =
            Executors.newSingleThreadScheduledExecutor();
    private final Object lifecycleLock = new Object();
    private volatile HudTransport activeTransport;
    private volatile HudProtocolSession session;
    private volatile ScheduledFuture<?> retryFuture;
    private volatile ScheduledFuture<?> tickFuture;
    private volatile boolean stopped;
    private volatile State state = State.IDLE;
    private volatile long generation;

    HudConnectionManager(Context context, Listener listener) {
        this.context = context.getApplicationContext();
        this.prefs = this.context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        this.devices = new HudDeviceRepository(this.context);
        this.listener = listener;
    }

    void start() {
        synchronized (lifecycleLock) {
            if (stopped) return;
            stopped = false;
        }
        enqueue(new Runnable() { @Override public void run() { connectIfNeeded(); }});
    }

    void retryNow() {
        enqueue(new Runnable() {
            @Override public void run() {
                cancelRetry();
                reconnect.reset();
                connectIfNeeded();
            }
        });
    }

    void reconfigure() {
        enqueue(new Runnable() {
            @Override public void run() {
                if (stopped) return;
                generation++;
                cancelRetry();
                reconnect.reset();
                closeActive();
                updateState(State.IDLE, "configuration changed");
                connectIfNeeded();
            }
        });
    }

    void onBluetoothEnvironmentChanged() {
        enqueue(new Runnable() {
            @Override public void run() {
                if (stopped || !enabled()) return;
                if (state == State.BLUETOOTH_OFF || state == State.RETRY_WAIT
                        || state == State.ERROR || state == State.IDLE) {
                    cancelRetry();
                    connectIfNeeded();
                }
            }
        });
    }

    void applyDeviceConfig(final long revision, final Map<String, Object> values) {
        final LinkedHashMap<String, Object> copy = values == null
                ? new LinkedHashMap<String, Object>()
                : new LinkedHashMap<String, Object>(values);
        enqueue(new Runnable() {
            @Override public void run() {
                HudProtocolSession current = session;
                if (stopped || current == null || state != State.CONNECTED
                        || !(current instanceof HudConfigurableSession)
                        || !((HudConfigurableSession) current).applyDeviceConfig(revision, copy)) {
                    HudDeviceConfig.Snapshot snapshot = HudDeviceConfig.snapshot();
                    if (!HudDeviceConfig.Snapshot.APPLYING.equals(snapshot.applyState))
                        HudDeviceConfig.applyFailedCurrent(
                                I18n.tr("hud_link.hud_not_connected_or_the_settings"));
                }
            }
        });
    }

    void stop() {
        synchronized (lifecycleLock) {
            stopped = true;
            generation++;
        }
        cancelRetry();
        ScheduledFuture<?> ticker = tickFuture;
        if (ticker != null) ticker.cancel(true);
        HudTransport transport = activeTransport;
        if (transport != null) transport.disconnect(); // immediately aborts connect/read/write
        HudProtocolSession currentSession = session;
        if (currentSession != null) currentSession.stop();
        activeTransport = null;
        session = null;
        updateState(State.DISABLED, "local shutdown");
        executor.shutdownNow();
    }

    State state() { return state; }

    boolean isConnected() {
        HudTransport transport = activeTransport;
        return !stopped && state == State.CONNECTED && transport != null && transport.isConnected();
    }

    boolean targetsUsbDevice(android.hardware.usb.UsbDevice device) {
        HudTransport transport = activeTransport;
        return transport instanceof UsbSerialHudTransport
                && ((UsbSerialHudTransport) transport).targetsDevice(device);
    }

    private void enqueue(Runnable task) {
        if (stopped) return;
        try { executor.execute(task); }
        catch (RejectedExecutionException error) {
            // A socket/USB/BLE callback may arrive between stop() and executor.shutdownNow().
            if (!stopped) throw error;
        }
    }

    private boolean enabled() { return devices.isActiveEnabled(); }

    private void connectIfNeeded() {
        if (stopped || !enabled()) {
            updateState(State.DISABLED, "disabled");
            return;
        }
        HudTransport existing = activeTransport;
        if (existing != null && (state == State.CONNECTING || state == State.HANDSHAKING
                || existing.isConnected())) return;
        final HudProtocolFamily family = devices.activeFamily();
        final int selectedTransport = devices.effectiveTransport(family);
        if (!devices.hasSelection(family)) {
            updateState(State.IDLE, selectedTransport == HudDeviceRepository.TRANSPORT_WS
                    ? "No WebSocket endpoint configured" : "No device selected");
            return;
        }
        if (!hasRequiredPermissions(selectedTransport)) {
            if (selectedTransport == HudDeviceRepository.TRANSPORT_USB) {
                UsbSerialHudTransport.requestPermission(context, devices);
                updateState(State.PERMISSION_REQUIRED, "USB permission required");
            } else {
                updateState(State.PERMISSION_REQUIRED, "Nearby Devices permission required");
            }
            return;
        }
        if (selectedTransport != HudDeviceRepository.TRANSPORT_WS
                && selectedTransport != HudDeviceRepository.TRANSPORT_USB
                && !isBluetoothEnabled()) {
            updateState(State.BLUETOOTH_OFF, "Bluetooth is off");
            return;
        }
        if (!HudFeatureFlags.isRuntimeEnabled(family)) {
            // A selected VietMap device is retained independently from the legacy HLP slot. Do
            // not retry or fall back to HLP while its protocol is deliberately release-gated.
            updateState(State.IDLE, family.preferenceValue() + " runtime is not enabled");
            return;
        }
        if (!HudProtocolSessionFactory.hasRuntimeSession(family)) {
            updateState(State.IDLE, family.preferenceValue() + " protocol is pending validation");
            return;
        }
        final long attemptGeneration = ++generation;
        final HudTransport transport;
        try {
            transport = createTransport(family);
        } catch (Throwable error) {
            fail("DEVICE_NOT_FOUND", error.getMessage());
            return;
        }
        activeTransport = transport;
        HudProtocolSession newSession = HudProtocolSessionFactory.create(
                context, family, transport, this);
        session = newSession;
        newSession.prepare();
        transport.setListener(listenerFor(transport, attemptGeneration));
        updateState(State.CONNECTING, transport.transportName());
        try {
            transport.connect();
            if (stopped || attemptGeneration != generation || !enabled()) {
                transport.disconnect();
                return;
            }
            updateState(State.HANDSHAKING, transport.transportName());
            newSession.startHandshake();
            if (!transport.isConnected()) {
                fail("REMOTE_DISCONNECT", "transport disconnected during handshake");
                return;
            }
            String detail = transport.transportName();
            if (family == HudProtocolFamily.HLP1 && newSession instanceof HlpProtocol.Session) {
                detail += ((HlpProtocol.Session) newSession).hasPeerActivity()
                        ? " • duplex" : " • one-way/legacy";
            } else detail += " • " + newSession.protocolName();
            updateState(State.CONNECTED, detail);
            scheduleTicker(newSession, attemptGeneration);
            executor.schedule(new Runnable() {
                @Override public void run() {
                    if (!stopped && attemptGeneration == generation
                            && session == newSession && activeTransport == transport
                            && transport.isConnected()) {
                        reconnect.reset();
                    }
                }
            }, 30, TimeUnit.SECONDS);
        } catch (SecurityException e) {
            fail("PERMISSION", e.getMessage());
        } catch (Exception e) {
            fail("CONNECTION_FAILED", e.getMessage());
        }
    }

    private void scheduleTicker(final HudProtocolSession current, final long expectedGeneration) {
        ScheduledFuture<?> old = tickFuture;
        if (old != null) old.cancel(false);
        tickFuture = executor.scheduleAtFixedRate(new Runnable() {
            @Override public void run() {
                if (stopped || expectedGeneration != generation || current != session) return;
                current.tick(SystemClock.elapsedRealtime(), HudCanonicalState.capture(context));
            }
        }, 0, 50, TimeUnit.MILLISECONDS);
    }

    private HudTransport createTransport(HudProtocolFamily family) throws IOException {
        int transport = devices.effectiveTransport(family);
        if (transport == HudDeviceRepository.TRANSPORT_USB) {
            if (family != HudProtocolFamily.HLP1)
                throw new IOException("USB Serial currently supports HLP/1 only");
            return new UsbSerialHudTransport(context, devices);
        }
        if (transport == HudDeviceRepository.TRANSPORT_WS) {
            if (family != HudProtocolFamily.HLP1)
                throw new IOException("Wi-Fi WebSocket currently supports HLP/1 only");
            return new WebSocketHudTransport(context, devices);
        }
        if (transport == HudDeviceRepository.TRANSPORT_BLE
                || (transport == HudDeviceRepository.TRANSPORT_AUTO
                && family != HudProtocolFamily.HLP1)) {
            return new BleGattHudTransport(context, devices,
                    HudProtocolSessionFactory.gattProfile(family), family);
        }
        if (family == HudProtocolFamily.VIETMAP_H50) {
            // H50 capture/recovery covers BLE FFFF only. Do not send this protocol through SPP
            // merely because a similarly named Classic peripheral is paired.
            throw new IOException("VietMap H50 requires its BLE transport");
        }
        return new RfcommHudTransport(context, devices, family);
    }

    private boolean hasRequiredPermissions(int transport) {
        if (transport == HudDeviceRepository.TRANSPORT_WS) return true;
        if (transport == HudDeviceRepository.TRANSPORT_USB)
            return UsbSerialHudTransport.hasPermission(context, devices);
        if (android.os.Build.VERSION.SDK_INT < 31) return true;
        if (context.checkSelfPermission(Manifest.permission.BLUETOOTH_CONNECT)
                != PackageManager.PERMISSION_GRANTED) return false;
        return context.checkSelfPermission(Manifest.permission.BLUETOOTH_SCAN)
                == PackageManager.PERMISSION_GRANTED;
    }

    private boolean isBluetoothEnabled() {
        try {
            BluetoothManager manager = (BluetoothManager)
                    context.getSystemService(Context.BLUETOOTH_SERVICE);
            BluetoothAdapter adapter = manager == null ? null : manager.getAdapter();
            return adapter != null && adapter.isEnabled();
        } catch (SecurityException e) {
            return false;
        }
    }

    private String screenState() {
        try {
            android.os.PowerManager power = (android.os.PowerManager)
                    context.getSystemService(Context.POWER_SERVICE);
            return power != null && power.isInteractive() ? "on" : "off";
        } catch (Throwable ignored) {
            return "?";
        }
    }

    private void fail(String category, String detail) {
        Log.w(TAG, "fail " + category + ": " + (detail == null ? "" : detail)
                + " screen=" + screenState());
        // Invalidate every callback belonging to this attempt before disconnect() itself can emit
        // another error. This collapses the common GATT "disconnect + pending write failed" pair
        // into one retry instead of repeatedly resetting the backoff timer.
        generation++;
        closeActive();
        if ("PERMISSION".equals(category)) {
            updateState(State.PERMISSION_REQUIRED, detail);
            return;
        }
        if ("BLUETOOTH_OFF".equals(category)) {
            updateState(State.BLUETOOTH_OFF, detail);
            return;
        }
        if (stopped || !enabled()) {
            updateState(State.DISABLED, detail);
            return;
        }
        if ("DEVICE_NOT_FOUND".equals(category) || "DEVICE_NOT_BONDED".equals(category)) {
            updateState(State.IDLE, detail);
            return;
        }
        scheduleRetry(category + (detail == null ? "" : ": " + detail));
    }

    private void scheduleRetry(String detail) {
        cancelRetry();
        long delay = reconnect.nextDelayMs();
        Log.i(TAG, "retry in " + delay + " ms: " + detail);
        updateState(State.RETRY_WAIT, detail + " (retry in " + delay + " ms)");
        retryFuture = executor.schedule(new Runnable() {
            @Override public void run() { connectIfNeeded(); }
        }, delay, TimeUnit.MILLISECONDS);
    }

    private void closeActive() {
        ScheduledFuture<?> ticker = tickFuture;
        if (ticker != null) ticker.cancel(false);
        tickFuture = null;
        HudProtocolSession current = session;
        session = null;
        if (current != null) current.stop();
        HudTransport transport = activeTransport;
        activeTransport = null;
        if (transport != null) transport.disconnect();
    }

    private void cancelRetry() {
        ScheduledFuture<?> future = retryFuture;
        retryFuture = null;
        if (future != null) future.cancel(false);
    }

    private void updateState(State value, String detail) {
        Log.i(TAG, "state=" + value + " detail=" + (detail == null ? "" : detail));
        state = value;
        prefs.edit().putString("hud_link_status", value.name())
                .putString("hud_link_error", detail == null ? "" : detail)
                .putLong("hud_link_status_at", SystemClock.elapsedRealtime())
                .apply();
        if (listener != null) listener.onStateChanged(value, detail == null ? "" : detail);
    }

    private HudTransportListener listenerFor(final HudTransport source, final long expectedGeneration) {
        return new HudTransportListener() {
            private boolean isCurrent() {
                return !stopped && activeTransport == source && generation == expectedGeneration;
            }

            @Override public void onTransportBytes(byte[] bytes, int count) {
                if (!isCurrent()) return;
                HudProtocolSession current = session;
                if (current != null) current.accept(bytes, count);
            }

            @Override public void onTransportConnected() {
                // connect() owns the transition; this callback only confirms the link is live.
            }

            @Override public void onTransportDisconnected(final String reason) {
                enqueue(new Runnable() {
                    @Override public void run() {
                        if (isCurrent()) fail("REMOTE_DISCONNECT", reason);
                    }
                });
            }

            @Override public void onTransportError(final String category, final Throwable error) {
                enqueue(new Runnable() {
                    @Override public void run() {
                        if (isCurrent()) {
                            fail(category, error == null ? "" : error.getMessage());
                        }
                    }
                });
            }
        };
    }

    @Override public void onSessionConnected(String transport, int rate) {
        if (stopped || session == null) return;
        prefs.edit().putInt("hud_link_negotiated_rate", rate)
                .putString("hud_link_active_transport", transport).apply();
    }

    @Override public void onSessionDisconnected(final String reason) {
        final HudProtocolSession source = session;
        enqueue(new Runnable() {
            @Override public void run() {
                if (!stopped && source != null && source == session)
                    fail("REMOTE_DISCONNECT", reason);
            }
        });
    }

    @Override public void onSessionError(String category, String detail) {
        final HudProtocolSession source = session;
        final String failureCategory = category;
        final String reason = detail;
        enqueue(new Runnable() {
            @Override public void run() {
                if (!stopped && source != null && source == session)
                    fail(failureCategory, reason);
            }
        });
    }

    @Override public void onSessionWantsDisconnect() {
        final HudProtocolSession source = session;
        enqueue(new Runnable() {
            @Override public void run() {
                if (stopped || source == null || source != session) return;
                generation++;
                closeActive();
                updateState(State.IDLE, "peer requested disconnect");
            }
        });
    }

    @Override public void onSessionPeerActivity(String type, long atElapsedMs) {
        final HudProtocolSession source = session;
        final String peerType = type;
        final long peerAt = atElapsedMs;
        enqueue(new Runnable() {
            @Override public void run() {
                if (stopped || source == null || source != session) return;
                prefs.edit().putBoolean("hud_link_peer_seen", true)
                        .putLong("hud_link_peer_last_at", peerAt)
                        .putString("hud_link_peer_last_type",
                                peerType == null ? "" : peerType).apply();
                if (state == State.CONNECTED && activeTransport != null) {
                    updateState(State.CONNECTED, activeTransport.transportName()
                            + " • duplex • RX "
                            + (peerType == null ? "frame" : peerType));
                }
            }
        });
    }
}
