package com.waze.gw;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.hardware.usb.UsbDevice;
import android.hardware.usb.UsbDeviceConnection;
import android.hardware.usb.UsbInterface;
import android.hardware.usb.UsbManager;
import android.os.Build;
import android.util.Log;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * USB Serial transport for the HUD Link system. Communicates with external HUD hardware
 * (ESP32, Arduino, STM32, etc.) over a USB serial connection using the Android USB Host API.
 *
 * <p>Uses vendored drivers from usb-serial-for-android (Apache-2.0) to support CDC-ACM,
 * CH340/CH341/CH9102, CP210x, FTDI, and Prolific chips without requiring root access.
 *
 * <p>Key design decisions:
 * <ul>
 *   <li>Never caches {@code UsbDevice} references across connect attempts — always re-queries
 *       {@code UsbManager.getDeviceList()} and matches by saved VID/PID.</li>
 *   <li>Uses {@code SerialInputOutputManager} from the vendored library for safe, threaded I/O.</li>
 *   <li>Protects {@code write()} with a dedicated lock to prevent concurrent bulkTransfer calls.</li>
 *   <li>Wraps all close/disconnect paths in try/catch to survive sudden cable removal.</li>
 * </ul>
 */
final class UsbSerialHudTransport implements HudTransport {
    private static final String TAG = "WazeHudLink-USB";
    static final String ACTION_USB_PERMISSION = "com.waze.gw.USB_PERMISSION";

    private final Context context;
    private final HudDeviceRepository devices;
    private final Object writeLock = new Object();
    private volatile UsbSerialPort port;
    private volatile UsbDeviceConnection connection;
    private volatile SerialInputOutputManager ioManager;
    private volatile boolean connected;
    private volatile boolean stopping;
    private volatile String deviceName;
    private HudTransportListener listener;

    UsbSerialHudTransport(Context context, HudDeviceRepository devices) {
        this.context = context.getApplicationContext();
        this.devices = devices;
    }

    @Override public synchronized void setListener(HudTransportListener value) {
        listener = value;
    }

    @Override public void connect() throws Exception {
        if (stopping) throw new IOException("local shutdown");
        UsbManager usbManager = (UsbManager) context.getSystemService(Context.USB_SERVICE);
        if (usbManager == null) throw new IOException("USB Host API unavailable");

        // Always re-query device list — never use a cached UsbDevice reference.
        UsbDevice device = findDevice(context, devices);
        if (device == null) throw new IOException("USB device not found (VID:PID "
                + String.format("%04X:%04X", devices.usbVid(), devices.usbPid()) + ")");
        deviceName = device.getDeviceName();

        if (!usbManager.hasPermission(device)) {
            throw new IOException("USB permission not granted");
        }

        UsbDeviceConnection conn = usbManager.openDevice(device);
        if (conn == null) throw new IOException("Cannot open USB device");
        connection = conn;

        // Probe for a compatible serial driver.
        UsbSerialProber prober = UsbSerialProber.getDefaultProber();
        UsbSerialDriver driver = prober.probeDevice(device);
        if (driver == null) {
            // Fallback: try CDC-ACM for unrecognized devices (many ESP32/STM32 boards).
            ProbeTable cdcFallback = new ProbeTable();
            cdcFallback.addProduct(device.getVendorId(), device.getProductId(),
                    CdcAcmSerialDriver.class);
            driver = new UsbSerialProber(cdcFallback).probeDevice(device);
        }
        if (driver == null) {
            try { conn.close(); } catch (Throwable ignored) { }
            connection = null;
            throw new IOException("No compatible USB serial driver for this device");
        }

        List<UsbSerialPort> ports = driver.getPorts();
        if (ports.isEmpty()) {
            try { conn.close(); } catch (Throwable ignored) { }
            connection = null;
            throw new IOException("USB device has no serial ports");
        }

        UsbSerialPort serialPort = ports.get(0);
        try {
            serialPort.open(conn);
            int baudRate = devices.usbBaudRate();
            serialPort.setParameters(baudRate, 8, UsbSerialPort.STOPBITS_1, UsbSerialPort.PARITY_NONE);
            try { serialPort.setDTR(true); } catch (Throwable ignored) { }
            try { serialPort.setRTS(true); } catch (Throwable ignored) { }
        } catch (Exception e) {
            try { serialPort.close(); } catch (Throwable ignored) { }
            try { conn.close(); } catch (Throwable ignored) { }
            connection = null;
            throw e;
        }

        port = serialPort;

        if (stopping) {
            closeQuietly();
            throw new IOException("local shutdown");
        }

        // Start I/O manager for reading incoming data on a background thread.
        SerialInputOutputManager manager = new SerialInputOutputManager(serialPort,
                new SerialInputOutputManager.Listener() {
                    @Override public void onNewData(byte[] data) {
                        if (!stopping) {
                            HudTransportListener l = listener;
                            if (l != null) l.onTransportBytes(data, data.length);
                        }
                    }
                    @Override public void onRunError(Exception e) {
                        if (!stopping) {
                            connected = false;
                            HudTransportListener l = listener;
                            if (l != null) l.onTransportDisconnected(
                                    e == null ? "USB read error" : e.getMessage());
                        }
                    }
                });
        ioManager = manager;
        connected = true; // Reader errors must win even while start() is still waiting.
        manager.start();

        if (stopping || !connected || manager.getState() != SerialInputOutputManager.State.RUNNING) {
            connected = false;
            closeQuietly();
            throw new IOException("USB I/O stopped during startup");
        }
        Log.i(TAG, "Connected: " + device.getProductName()
                + " @ " + devices.usbBaudRate() + " baud");

        HudTransportListener l = listener;
        if (l != null) l.onTransportConnected();
    }

    @Override public void disconnect() {
        stopping = true;
        connected = false;
        closeQuietly();
    }

    @Override public boolean isConnected() {
        return connected && port != null;
    }

    boolean targetsDevice(UsbDevice device) {
        String selected = deviceName;
        return device != null && selected != null && selected.equals(device.getDeviceName());
    }

    @Override public void sendFrame(byte[] frame) throws IOException {
        if (!connected || port == null) throw new IOException("USB not connected");
        synchronized (writeLock) {
            try {
                port.write(frame, 1000);
            } catch (Exception e) {
                connected = false;
                throw new IOException("USB write failed: " + e.getMessage(), e);
            }
        }
    }

    @Override public String transportName() {
        return "usb";
    }

    // ---- Static helpers for permission and device lookup ----

    /**
     * Find a USB device matching the VID/PID stored in the device repository.
     * Always re-queries UsbManager — never returns a stale cached reference.
     */
    static UsbDevice findDevice(Context context, HudDeviceRepository devices) {
        UsbManager usbManager = (UsbManager) context.getSystemService(Context.USB_SERVICE);
        if (usbManager == null) return null;
        int targetVid = devices.usbVid();
        int targetPid = devices.usbPid();
        if (!UsbDeviceSelection.hasValidIds(targetVid, targetPid)) return null;
        Map<String, UsbDevice> deviceList = usbManager.getDeviceList();
        if (deviceList == null) return null;
        UsbDevice onlyVidPidMatch = null;
        int matchCount = 0;
        String selectedId = devices.usbDeviceId();
        for (UsbDevice device : deviceList.values()) {
            if (UsbDeviceSelection.isMatch(targetVid, targetPid,
                    device.getVendorId(), device.getProductId())) {
                if (selectedId.equals(device.getDeviceName())) return device;
                onlyVidPidMatch = device;
                matchCount++;
            }
        }
        // Existing selections have no device ID. Keep them working only when VID/PID is unique.
        return matchCount == 1 ? onlyVidPidMatch : null;
    }

    /**
     * Check whether the app has USB permission for the configured device.
     * Always re-queries the device list by VID/PID.
     */
    static boolean hasPermission(Context context, HudDeviceRepository devices) {
        UsbManager usbManager = (UsbManager) context.getSystemService(Context.USB_SERVICE);
        if (usbManager == null) return false;
        UsbDevice device = findDevice(context, devices);
        return device != null && usbManager.hasPermission(device);
    }

    /**
     * Request USB permission for the configured device. Uses FLAG_MUTABLE on API 31+
     * because the system needs to write EXTRA_PERMISSION_GRANTED into the result Intent.
     */
    static void requestPermission(Context context, HudDeviceRepository devices) {
        UsbManager usbManager = (UsbManager) context.getSystemService(Context.USB_SERVICE);
        if (usbManager == null) return;
        UsbDevice device = findDevice(context, devices);
        if (device == null) return;
        int flags = 0;
        if (Build.VERSION.SDK_INT >= 31) flags = PendingIntent.FLAG_MUTABLE;
        PendingIntent permissionIntent = PendingIntent.getBroadcast(
                context, 0, new Intent(ACTION_USB_PERMISSION).setPackage(context.getPackageName()),
                flags);
        usbManager.requestPermission(device, permissionIntent);
    }

    /**
     * List all connected USB serial devices with their VID, PID and name.
     * Used by the ModSettingsActivity device picker.
     */
    static java.util.List<UsbDeviceInfo> listDevices(Context context) {
        java.util.List<UsbDeviceInfo> result = new java.util.ArrayList<UsbDeviceInfo>();
        UsbManager usbManager = (UsbManager) context.getSystemService(Context.USB_SERVICE);
        if (usbManager == null) return result;
        UsbSerialProber prober = UsbSerialProber.getDefaultProber();
        Map<String, UsbDevice> deviceList = usbManager.getDeviceList();
        if (deviceList == null) return result;
        for (UsbDevice device : deviceList.values()) {
            UsbSerialDriver driver = prober.probeDevice(device);
            String driverName;
            if (driver != null) {
                driverName = driver.getClass().getSimpleName()
                        .replace("SerialDriver", "").replace("Serial", "");
            } else {
                // Check if it could be a CDC-ACM device not in the default table.
                if (isCdcDevice(device)) {
                    driverName = "CDC-ACM (?)";
                } else {
                    continue; // Skip devices with no known serial driver
                }
            }
            String name = device.getProductName();
            if (name == null || name.trim().length() == 0) {
                name = String.format("USB %04X:%04X", device.getVendorId(), device.getProductId());
            }
            result.add(new UsbDeviceInfo(device.getVendorId(), device.getProductId(),
                    name, driverName, usbManager.hasPermission(device), device.getDeviceName()));
        }
        return result;
    }

    /** Immutable snapshot of a connected USB serial device for the settings UI. */
    static final class UsbDeviceInfo {
        final int vid;
        final int pid;
        final String name;
        final String driverName;
        final boolean hasPermission;
        final String deviceId;

        UsbDeviceInfo(int vid, int pid, String name, String driverName, boolean hasPermission,
                      String deviceId) {
            this.vid = vid;
            this.pid = pid;
            this.name = name;
            this.driverName = driverName;
            this.hasPermission = hasPermission;
            this.deviceId = deviceId;
        }

        String vidPidLabel() {
            return String.format("%04X:%04X", vid, pid);
        }
    }

    private static boolean isCdcDevice(UsbDevice device) {
        if (device.getDeviceClass() == 2 || device.getDeviceClass() == 0xEF) return true;
        for (int i = 0; i < device.getInterfaceCount(); i++) {
            UsbInterface usbInterface = device.getInterface(i);
            if (usbInterface.getInterfaceClass() == 2
                    || usbInterface.getInterfaceClass() == 10) return true;
        }
        return false;
    }

    // ---- Internal cleanup ----

    private void closeQuietly() {
        SerialInputOutputManager mgr = ioManager;
        ioManager = null;
        if (mgr != null) {
            try { mgr.stop(); } catch (Throwable ignored) { }
        }

        UsbSerialPort p = port;
        port = null;
        if (p != null) {
            try { p.close(); } catch (Throwable ignored) { }
        }

        UsbDeviceConnection conn = connection;
        connection = null;
        if (conn != null) {
            try { conn.close(); } catch (Throwable ignored) { }
        }
    }
}
