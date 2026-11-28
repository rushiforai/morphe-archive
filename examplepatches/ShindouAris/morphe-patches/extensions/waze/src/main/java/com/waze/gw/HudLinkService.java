package com.waze.gw;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;
import android.os.IBinder;
import android.content.pm.ServiceInfo;
import android.util.Log;

import java.util.Map;

/**
 * Long-lived owner for HUD Link. The service deliberately does not promise immortality: Android
 * may still terminate any process, but START_STICKY and a connected-device foreground service make
 * normal screen-off/Doze operation reliable.
 */
public final class HudLinkService extends Service implements HudConnectionManager.Listener {
    private static final String TAG = "WazeHudLink";
    static final String ACTION_STATUS_CHANGED = "com.waze.gw.HUD_LINK_STATUS_CHANGED";
    static final String ACTION_RETRY = "com.waze.gw.HUD_LINK_RETRY";
    static final String ACTION_RECONFIGURE = "com.waze.gw.HUD_LINK_RECONFIGURE";
    private static final String CHANNEL = "waze_hud_link";
    private static final int NOTIFICATION_ID = 0x485544;
    private static volatile boolean running;
    private static volatile HudLinkService activeInstance;
    private HudConnectionManager manager;
    private final android.os.Handler main = new android.os.Handler(android.os.Looper.getMainLooper());
    /**
     * A foreground service keeps the process alive, not the CPU. With the screen off the CPU naps
     * between callbacks, and every write-with-response BLE chunk then waits for the next wake-up
     * (field HUD log: pings delayed ~2 s, state frames arriving only in bursts). Hold a partial
     * wake lock while connected. It carries a timeout and is renewed, so a leak cannot outlive it.
     */
    private static final long CPU_LOCK_MS = 10 * 60_000L;
    private static final long CPU_LOCK_RENEW_MS = 5 * 60_000L;
    private android.os.PowerManager.WakeLock cpuLock;
    private final Runnable renewCpuLock = new Runnable() {
        @Override public void run() { acquireCpuLock(); }
    };

    public static void startFromUser(Context context) {
        Gateway.clearExplicitShutdownForUserAction();
        startWithAction(context, null);
    }

    static void startFromRuntime(Context context) {
        startWithAction(context, null);
    }

    static boolean isConnected() {
        HudLinkService service = activeInstance;
        return running && service != null && service.manager != null && service.manager.isConnected();
    }

    static boolean isRunning() {
        return running;
    }

    static boolean applyDeviceConfig(long revision, Map<String, Object> values) {
        HudLinkService service = activeInstance;
        if (service == null || service.manager == null) return false;
        service.manager.applyDeviceConfig(revision, values);
        return true;
    }

    public static void reconfigure(Context context) {
        // A deliberate tap in Settings proves Waze is alive; a leftover "shutting down" flag (for
        // instance after an Android Auto disconnect that did not end the process) would make this
        // start silently do nothing.
        Gateway.clearExplicitShutdownForUserAction();
        startWithAction(context, ACTION_RECONFIGURE);
    }

    private static void startWithAction(Context context, String action) {
        if (context == null || Gateway.isExplicitShutdownRequested()) return;
        Context app = context.getApplicationContext();
        Intent intent = new Intent(app, HudLinkService.class);
        if (action != null) intent.setAction(action);
        try {
            if (Build.VERSION.SDK_INT >= 26) app.startForegroundService(intent);
            else app.startService(intent);
        } catch (Throwable error) {
            Log.w(TAG, "Unable to start HUD Link service", error);
            try {
                app.getSharedPreferences("waze_hud_gw", Context.MODE_PRIVATE).edit()
                        .putString("hud_link_status", "START_BLOCKED")
                        .putString("hud_link_error", error.getClass().getSimpleName())
                        .apply();
            } catch (Throwable ignored) { }
        }
    }

    public static void stop(Context context) {
        if (context == null) return;
        try { context.getApplicationContext().stopService(
                new Intent(context.getApplicationContext(), HudLinkService.class)); }
        catch (Throwable ignored) { }
    }

    @Override public void onCreate() {
        super.onCreate();
        running = true;
        activeInstance = this;
        Log.i(TAG, "HUD Link service created");
        createChannel();
        manager = new HudConnectionManager(this, this);
        registerStateReceiver();
        registerUsbReceiver();
    }

    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        if (Gateway.isExplicitShutdownRequested()) {
            stopSelf();
            return START_NOT_STICKY;
        }
        if (!new HudDeviceRepository(this).isActiveEnabled()) {
            stopSelf();
            return START_NOT_STICKY;
        }
        try {
            if (Build.VERSION.SDK_INT >= 29) {
                startForeground(NOTIFICATION_ID, notification("Starting HUD Link"),
                        ServiceInfo.FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE);
            } else {
                startForeground(NOTIFICATION_ID, notification("Starting HUD Link"));
            }
            if (intent != null && ACTION_RETRY.equals(intent.getAction())) manager.retryNow();
            else if (intent != null && ACTION_RECONFIGURE.equals(intent.getAction()))
                manager.reconfigure();
            else manager.start();
            return START_STICKY;
        } catch (Throwable error) {
            getSharedPreferences("waze_hud_gw", MODE_PRIVATE).edit()
                    .putString("hud_link_status", "ERROR")
                    .putString("hud_link_error", String.valueOf(error.getMessage())).apply();
            stopSelf();
            return START_NOT_STICKY;
        }
    }

    @Override public void onDestroy() {
        running = false;
        if (activeInstance == this) activeInstance = null;
        Log.i(TAG, "HUD Link service destroyed");
        try { unregisterReceiver(stateReceiver); } catch (Throwable ignored) { }
        try { unregisterReceiver(bluetoothReceiver); } catch (Throwable ignored) { }
        try { unregisterReceiver(usbReceiver); } catch (Throwable ignored) { }
        releaseCpuLock();
        if (manager != null) manager.stop();
        stopForeground(true);
        super.onDestroy();
    }

    @Override public void onTaskRemoved(Intent rootIntent) {
        Log.i(TAG, "Waze task removed; stopping HUD Link and Waze process");
        Gateway.onTaskRemoved();
        super.onTaskRemoved(rootIntent);
    }

    @Override public IBinder onBind(Intent intent) { return null; }

    @Override public void onStateChanged(final HudConnectionManager.State state, String detail) {
        main.post(new Runnable() {
            @Override public void run() {
                if (state == HudConnectionManager.State.CONNECTED) acquireCpuLock();
                else releaseCpuLock();
            }
        });
        try {
            NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
            if (nm != null) {
                String translatedDetail = localizedDetail(detail);
                String text = localizedState(state.name());
                if (translatedDetail.length() > 0) text += ": " + translatedDetail;
                nm.notify(NOTIFICATION_ID, notification(text));
            }
            sendBroadcast(new Intent(ACTION_STATUS_CHANGED).setPackage(getPackageName()));
        } catch (Throwable ignored) { }
    }

    private void acquireCpuLock() {
        try {
            if (cpuLock == null) {
                android.os.PowerManager power = (android.os.PowerManager) getSystemService(POWER_SERVICE);
                if (power == null) return;
                cpuLock = power.newWakeLock(android.os.PowerManager.PARTIAL_WAKE_LOCK, "WazeMod:HudLink");
                cpuLock.setReferenceCounted(false);
            }
            boolean fresh = !cpuLock.isHeld();
            cpuLock.acquire(CPU_LOCK_MS);
            if (fresh) Log.i(TAG, "CPU wake lock held while HUD is connected");
            main.removeCallbacks(renewCpuLock);
            main.postDelayed(renewCpuLock, CPU_LOCK_RENEW_MS);
        } catch (Throwable error) {
            Log.w(TAG, "Unable to hold CPU wake lock", error);
        }
    }

    private void releaseCpuLock() {
        main.removeCallbacks(renewCpuLock);
        try {
            if (cpuLock != null && cpuLock.isHeld()) {
                cpuLock.release();
                Log.i(TAG, "CPU wake lock released");
            }
        } catch (Throwable ignored) { }
    }

    static String localizedState(String state) {
        if ("DISABLED".equals(state)) return I18n.tr("hud_link.off");
        if ("PERMISSION_REQUIRED".equals(state)) return I18n.tr("hud_link.permission_needed_to_connect");
        if ("BLUETOOTH_OFF".equals(state)) return I18n.tr("hud_link.bluetooth_is_off_2");
        if ("IDLE".equals(state)) return I18n.tr("hud_link.waiting");
        if ("CONNECTING".equals(state)) return I18n.tr("hud_link.connecting");
        if ("HANDSHAKING".equals(state)) return I18n.tr("hud_link.establishing_communication");
        if ("CONNECTED".equals(state)) return I18n.tr("hud_link.connected");
        if ("RETRY_WAIT".equals(state)) return I18n.tr("hud_link.waiting_to_reconnect");
        if ("DISCONNECTING".equals(state)) return I18n.tr("hud_link.disconnecting");
        if ("START_BLOCKED".equals(state)) return I18n.tr("hud_link.cant_start_the_connection_yet");
        if ("ERROR".equals(state)) return I18n.tr("hud_link.error");
        return I18n.tr("hud_link.unknown");
    }

    static String localizedDetail(String detail) {
        if (detail == null) return "";
        String value = detail.trim();
        if (value.length() == 0) return "";
        value = value.replace("Nearby Devices permission required", I18n.tr("hud_link.nearby_devices_permission_required"))
                .replace("USB permission required", I18n.tr("hud_link.usb_access_permission_required"))
                .replace("Bluetooth is off", I18n.tr("hud_link.bluetooth_is_off_2"))
                .replace("No device selected", I18n.tr("hud_link.no_device_selected_2"))
                .replace("No WebSocket endpoint configured", I18n.tr("hud_link.hud_wi_fi_address_not_entered"))
                .replace("WebSocket HUD must use a private LAN address",
                        I18n.tr("hud_link.hud_wi_fi_must_use_a"))
                .replace("invalid WebSocket host", I18n.tr("hud_link.invalid_hud_wi_fi_address"))
                .replace("invalid WebSocket path", I18n.tr("hud_link.invalid_websocket_path"))
                .replace("configuration changed", I18n.tr("hud_link.settings_changed"))
                .replace("local shutdown", I18n.tr("hud_link.turned_off_from_the_app"))
                .replace("peer requested disconnect", I18n.tr("hud_link.the_device_asked_to_disconnect"))
                .replace("transport disconnected during handshake", I18n.tr("hud_link.lost_connection_while_establishing"))
                .replace("one-way/legacy", I18n.tr("hud_link.one_way_legacy_mode"))
                .replace("duplex", I18n.tr("hud_link.two_way"))
                .replace("RX pong", I18n.tr("hud_link.response_received"))
                .replace("RX frame", I18n.tr("hud_link.data_received"))
                .replace("CONNECTION_FAILED", I18n.tr("hud_link.connection_failed"))
                .replace("REMOTE_DISCONNECT", I18n.tr("hud_link.the_device_disconnected"))
                .replace("WRITE_FAILED", I18n.tr("hud_link.failed_to_send_data"))
                .replace("HANDSHAKE_TIMEOUT", I18n.tr("hud_link.timed_out_establishing_communication"))
                .replace("PROTOCOL_ERROR", I18n.tr("hud_link.protocol_error"))
                .replace("MALFORMED_JSON", I18n.tr("hud_link.invalid_response_data"))
                .replace("MALFORMED_UTF8", I18n.tr("hud_link.invalid_response_encoding"))
                .replace("FRAME_TOO_LARGE", I18n.tr("hud_link.response_packet_too_large"))
                .replace("USB permission not granted", I18n.tr("hud_link.usb_permission_not_granted"))
                .replace("USB device not found", I18n.tr("hud_link.usb_device_not_found"))
                .replace("USB Host API unavailable", I18n.tr("hud_link.this_device_doesnt_support_usb_host"))
                .replace("No compatible USB serial driver", I18n.tr("hud_link.no_matching_usb_serial_driver_found"))
                .replace("USB read error", I18n.tr("hud_link.usb_read_error"))
                .replace("USB write failed", I18n.tr("hud_link.usb_send_failed"))
                .replace("USB not connected", I18n.tr("hud_link.usb_not_connected"));
        int retry = value.indexOf(" (retry in ");
        if (retry >= 0) {
            int end = value.indexOf(" ms)", retry);
            if (end > retry) {
                String millis = value.substring(retry + 11, end);
                try {
                    long ms = Long.parseLong(millis);
                    value = value.substring(0, retry) + " "
                            + I18n.f("hud_link.retrying_in_0_s", Math.max(1L, (ms + 999L) / 1000L))
                            + value.substring(end + 4);
                } catch (NumberFormatException ignored) { }
            }
        }
        if ("ble".equalsIgnoreCase(value)) return "Bluetooth LE";
        if ("spp".equalsIgnoreCase(value)) return "Bluetooth Classic";
        if ("ws".equalsIgnoreCase(value)) return "Wi-Fi WebSocket";
        if ("usb".equalsIgnoreCase(value)) return "USB Serial";
        if (value.startsWith("ble ")) value = "Bluetooth LE" + value.substring(3);
        if (value.startsWith("spp ")) value = "Bluetooth Classic" + value.substring(3);
        if (value.startsWith("ws ")) value = "Wi-Fi WebSocket" + value.substring(2);
        if (value.startsWith("usb ")) value = "USB Serial" + value.substring(3);
        return value;
    }

    private final BroadcastReceiver stateReceiver = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (manager == null) return;
            String action = intent == null ? "" : intent.getAction();
            if (ACTION_RETRY.equals(action)) {
                manager.retryNow();
            } else if (ACTION_RECONFIGURE.equals(action)) {
                manager.reconfigure();
            }
        }
    };

    private final BroadcastReceiver bluetoothReceiver = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (manager != null && intent != null
                    && BluetoothAdapterActions.isEnvironmentAction(intent.getAction()))
                manager.onBluetoothEnvironmentChanged();
        }
    };

    private void registerStateReceiver() {
        IntentFilter bluetooth = new IntentFilter();
        // These are protected system broadcasts, sent by the Bluetooth system component.
        bluetooth.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        bluetooth.addAction("android.bluetooth.device.action.BOND_STATE_CHANGED");
        bluetooth.addAction("android.bluetooth.device.action.ACL_DISCONNECTED");
        if (Build.VERSION.SDK_INT >= 33) registerReceiver(bluetoothReceiver, bluetooth, RECEIVER_EXPORTED);
        else registerReceiver(bluetoothReceiver, bluetooth);
        IntentFilter internal = new IntentFilter();
        internal.addAction(ACTION_RETRY);
        internal.addAction(ACTION_RECONFIGURE);
        if (Build.VERSION.SDK_INT >= 33) registerReceiver(stateReceiver, internal, RECEIVER_NOT_EXPORTED);
        // Legacy APIs cannot isolate this receiver; controls use explicit service intents.
    }

    private Notification notification(String text) {
        Intent open = new Intent(this, ModSettingsActivity.class);
        int flags = PendingIntent.FLAG_UPDATE_CURRENT;
        if (Build.VERSION.SDK_INT >= 23) flags |= PendingIntent.FLAG_IMMUTABLE;
        PendingIntent pending = PendingIntent.getActivity(this, 884, open, flags);
        Notification.Builder builder = Build.VERSION.SDK_INT >= 26
                ? new Notification.Builder(this, CHANNEL) : new Notification.Builder(this);
        return builder.setContentTitle("Waze HUD Link")
                .setContentText(text == null ? I18n.tr("hud_link.connect_hud") : text)
                .setSmallIcon(android.R.drawable.stat_sys_data_bluetooth)
                .setContentIntent(pending).setOngoing(true).setOnlyAlertOnce(true).build();
    }

    private void createChannel() {
        if (Build.VERSION.SDK_INT < 26) return;
        NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        if (nm != null) nm.createNotificationChannel(new NotificationChannel(
                CHANNEL, "Waze HUD Link", NotificationManager.IMPORTANCE_LOW));
    }

    private static final class BluetoothAdapterActions {
        static boolean isEnvironmentAction(String action) {
            return "android.bluetooth.adapter.action.STATE_CHANGED".equals(action)
                    || "android.bluetooth.device.action.BOND_STATE_CHANGED".equals(action)
                    || "android.bluetooth.device.action.ACL_DISCONNECTED".equals(action);
        }
    }

    // ---- USB device events ----

    private final BroadcastReceiver usbReceiver = new BroadcastReceiver() {
        @Override public void onReceive(Context context, Intent intent) {
            if (manager == null || intent == null) return;
            String action = intent.getAction();
            if (UsbSerialHudTransport.ACTION_USB_PERMISSION.equals(action)) {
                boolean granted = intent.getBooleanExtra(
                        android.hardware.usb.UsbManager.EXTRA_PERMISSION_GRANTED, false);
                Log.i(TAG, "USB permission " + (granted ? "granted" : "denied"));
                if (granted) manager.retryNow();
            } else if (android.hardware.usb.UsbManager.ACTION_USB_DEVICE_ATTACHED.equals(action)) {
                HudDeviceRepository devices = new HudDeviceRepository(context);
                if (devices.isActiveEnabled()
                        && devices.effectiveTransport(devices.activeFamily())
                                == HudDeviceRepository.TRANSPORT_USB) {
                    Log.i(TAG, "USB device attached; retrying connection");
                    manager.retryNow();
                }
            } else if (android.hardware.usb.UsbManager.ACTION_USB_DEVICE_DETACHED.equals(action)) {
                android.hardware.usb.UsbDevice device = intent.getParcelableExtra(
                        android.hardware.usb.UsbManager.EXTRA_DEVICE);
                HudDeviceRepository devices = new HudDeviceRepository(context);
                if (devices.isActiveEnabled()
                        && devices.effectiveTransport(devices.activeFamily())
                                == HudDeviceRepository.TRANSPORT_USB
                        && manager.targetsUsbDevice(device)) {
                    Log.i(TAG, "Selected USB device detached");
                    manager.reconfigure();
                }
            }
        }
    };

    private void registerUsbReceiver() {
        IntentFilter filter = new IntentFilter();
        filter.addAction(UsbSerialHudTransport.ACTION_USB_PERMISSION);
        filter.addAction(android.hardware.usb.UsbManager.ACTION_USB_DEVICE_ATTACHED);
        filter.addAction(android.hardware.usb.UsbManager.ACTION_USB_DEVICE_DETACHED);
        if (Build.VERSION.SDK_INT >= 33) registerReceiver(usbReceiver, filter, RECEIVER_NOT_EXPORTED);
        else registerReceiver(usbReceiver, filter);
    }
}
