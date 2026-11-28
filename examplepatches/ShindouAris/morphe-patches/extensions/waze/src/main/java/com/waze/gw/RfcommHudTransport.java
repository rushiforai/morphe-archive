package com.waze.gw;

import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothSocket;
import android.content.Context;
import android.content.pm.PackageManager;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/** Secure RFCOMM client for the standard Bluetooth Serial Port Profile service. */
final class RfcommHudTransport implements HudTransport {
    private final Context context;
    private final HudDeviceRepository devices;
    private final HudProtocolFamily deviceFamily;
    private volatile BluetoothSocket socket;
    private volatile OutputStream output;
    private volatile boolean connected;
    private volatile boolean stopping;
    private HudTransportListener listener;
    private final Object writeLock = new Object();
    private Thread reader;

    RfcommHudTransport(Context context, HudDeviceRepository devices) {
        this(context, devices, HudProtocolFamily.HLP1);
    }

    RfcommHudTransport(Context context, HudDeviceRepository devices, HudProtocolFamily deviceFamily) {
        this.context = context.getApplicationContext();
        this.devices = devices;
        if (deviceFamily == null) throw new NullPointerException("deviceFamily");
        this.deviceFamily = deviceFamily;
    }

    @Override public synchronized void setListener(HudTransportListener value) {
        listener = value;
    }

    @Override public void connect() throws Exception {
        if (stopping) throw new IOException("local shutdown");
        requirePermission(Manifest.permission.BLUETOOTH_CONNECT);
        requirePermission(Manifest.permission.BLUETOOTH_SCAN);

        BluetoothManager manager = (BluetoothManager)
                context.getSystemService(Context.BLUETOOTH_SERVICE);
        BluetoothAdapter adapter = manager == null ? null : manager.getAdapter();
        if (adapter == null) throw new IOException("Bluetooth Classic unavailable");
        if (!adapter.isEnabled()) throw new IOException("Bluetooth disabled");
        if (deviceFamily == HudProtocolFamily.HLP1) devices.migrateLegacyIfUnambiguous(adapter);
        BluetoothDevice device = devices.selectedClassic(adapter, deviceFamily);
        if (device == null) throw new IOException("selected Classic device is not bonded");

        if (stopping) throw new IOException("local shutdown");
        BluetoothSocket candidate = device.createRfcommSocketToServiceRecord(HlpUuids.SPP);
        try {
            synchronized (this) {
                if (stopping) throw new IOException("local shutdown");
                socket = candidate; // Publish atomically before blocking connect.
            }
            adapter.cancelDiscovery();
            candidate.connect();
            synchronized (this) {
                if (stopping) throw new IOException("local shutdown");
                output = candidate.getOutputStream();
                connected = true;
                startReader(candidate.getInputStream());
                notifyConnected();
            }
        } catch (Exception e) {
            try { candidate.close(); } catch (IOException ignored) { }
            closeCandidate();
            throw e;
        }
    }

    private void startReader(final InputStream input) {
        reader = new Thread(new Runnable() {
            @Override public void run() {
                byte[] buffer = new byte[256];
                try {
                    int n;
                    while (!stopping && (n = input.read(buffer)) >= 0) {
                        if (n > 0) {
                            HudTransportListener l = listener;
                            if (l != null) l.onTransportBytes(buffer, n);
                        }
                    }
                    if (!stopping) notifyDisconnected("remote EOF");
                } catch (IOException e) {
                    if (!stopping) notifyDisconnected(e.getMessage());
                } finally {
                    connected = false;
                }
            }
        }, "hud-rfcomm-rx");
        reader.setDaemon(true);
        reader.start();
    }

    @Override public void sendFrame(byte[] frame) throws IOException {
        if (frame == null) throw new IOException("null frame");
        synchronized (writeLock) {
            OutputStream target = output;
            if (!connected || target == null) throw new IOException("RFCOMM disconnected");
            try {
                target.write(frame);
                target.flush();
            } catch (IOException e) {
                connected = false;
                throw e;
            }
        }
    }

    @Override public boolean isConnected() { return connected; }
    @Override public String transportName() { return "spp"; }

    @Override public synchronized void disconnect() {
        stopping = true;
        connected = false;
        closeCandidate();
        Thread r = reader;
        if (r != null) r.interrupt();
    }

    private synchronized void closeCandidate() {
        BluetoothSocket candidate = socket;
        socket = null;
        output = null;
        if (candidate != null) {
            try { candidate.close(); } catch (IOException ignored) { }
        }
    }

    private void requirePermission(String permission) {
        if (android.os.Build.VERSION.SDK_INT >= 31
                && context.checkSelfPermission(permission) != PackageManager.PERMISSION_GRANTED) {
            throw new SecurityException("Missing " + permission);
        }
    }

    private void notifyConnected() {
        HudTransportListener l = listener;
        if (l != null) l.onTransportConnected();
    }

    private void notifyDisconnected(String reason) {
        HudTransportListener l = listener;
        if (l != null) l.onTransportDisconnected(reason == null ? "RFCOMM disconnected" : reason);
    }

}
