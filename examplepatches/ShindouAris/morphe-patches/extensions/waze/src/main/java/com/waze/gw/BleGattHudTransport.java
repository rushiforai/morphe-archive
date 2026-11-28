package com.waze.gw;

import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.SystemClock;
import android.util.Log;

import java.io.IOException;
import java.util.Arrays;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * BLE GATT transport. HLP framing remains byte-stream based; notifications and writes are only
 * packet chunks. All GATT setup calls are serialized by the connect method and writes by writer.
 */
final class BleGattHudTransport implements HudTransport {
    private static final String TAG = "WazeHudLink-BLE";
    /**
     * One write-with-response chunk may legitimately take seconds when the phone's CPU naps with the
     * screen off (a field HUD log shows pings delayed up to ~2.8 s). A genuinely dead link is
     * reported by the stack (onConnectionStateChange) or by the 20 s ping/pong watchdog, so this only
     * guards a lost completion callback and must not tear the session down on an ordinary stall.
     */
    private static final long WRITE_TIMEOUT_MS = 10_000L;
    private static final long SLOW_WRITE_MS = 1_000L;
    private final Context context;
    private final HudDeviceRepository devices;
    private final HudGattProfile profile;
    private final HudProtocolFamily deviceFamily;
    private volatile BluetoothGatt gatt;
    private volatile BluetoothGattCharacteristic tx;
    private volatile boolean connected;
    private volatile boolean stopping;
    private volatile boolean linkLost;
    private volatile int mtu = 23;
    private HudTransportListener listener;
    private final Object writeLock = new Object();
    private volatile CountDownLatch connectedLatch;
    private volatile CountDownLatch servicesLatch;
    private volatile CountDownLatch descriptorLatch;
    private volatile CountDownLatch mtuLatch;
    private volatile CountDownLatch writeLatch;
    private volatile int lastGattStatus = BluetoothGatt.GATT_SUCCESS;
    private volatile int lastWriteStatus = BluetoothGatt.GATT_SUCCESS;
    private volatile long writeSequence;

    BleGattHudTransport(Context context, HudDeviceRepository devices) {
        this(context, devices, HudGattProfile.HLP1);
    }

    BleGattHudTransport(Context context, HudDeviceRepository devices, HudGattProfile profile) {
        this(context, devices, profile, familyForProfile(profile));
    }

    BleGattHudTransport(Context context, HudDeviceRepository devices, HudGattProfile profile,
                         HudProtocolFamily deviceFamily) {
        this.context = context.getApplicationContext();
        this.devices = devices;
        if (profile == null) throw new NullPointerException("profile");
        if (deviceFamily == null) throw new NullPointerException("deviceFamily");
        this.profile = profile;
        this.deviceFamily = deviceFamily;
    }

    @Override public synchronized void setListener(HudTransportListener value) {
        listener = value;
    }

    @Override public void connect() throws Exception {
        if (stopping) throw new IOException("BLE setup interrupted");
        linkLost = false;
        requirePermission(Manifest.permission.BLUETOOTH_CONNECT);
        String address = devices.address(deviceFamily);
        if (address == null || address.length() == 0) throw new IOException("no BLE device selected");

        BluetoothManager manager = (BluetoothManager)
                context.getSystemService(Context.BLUETOOTH_SERVICE);
        BluetoothAdapter adapter = manager == null ? null : manager.getAdapter();
        if (adapter == null || !adapter.isEnabled()) throw new IOException("Bluetooth disabled");

        final BluetoothDevice device = adapter.getRemoteDevice(address);
        Log.i(TAG, "connect address=" + address);
        connectedLatch = new CountDownLatch(1);
        servicesLatch = new CountDownLatch(1);
        descriptorLatch = new CountDownLatch(1);
        synchronized (this) {
            if (stopping) throw new IOException("BLE setup interrupted");
            gatt = device.connectGatt(context, false, callback, BluetoothDevice.TRANSPORT_LE);
            if (gatt == null) throw new IOException("BLE connection failed to start");
        }
        if (!connectedLatch.await(15, TimeUnit.SECONDS)) {
            closeGatt();
            throw new IOException("BLE connection timeout");
        }
        requireActive(gatt);
        if (lastGattStatus != BluetoothGatt.GATT_SUCCESS) {
            closeGatt();
            throw new IOException("BLE connect status " + lastGattStatus);
        }
        BluetoothGatt current = gatt;
        try { current.requestConnectionPriority(BluetoothGatt.CONNECTION_PRIORITY_HIGH); }
        catch (Throwable ignored) { }
        if (current == null || !current.discoverServices()) {
            closeGatt();
            throw new IOException("BLE service discovery failed to start");
        }
        requireActive(current);
        if (!servicesLatch.await(15, TimeUnit.SECONDS)) {
            closeGatt();
            throw new IOException("BLE service discovery timeout");
        }
        requireActive(current);
        if (lastGattStatus != BluetoothGatt.GATT_SUCCESS) {
            closeGatt();
            throw new IOException("BLE service discovery status " + lastGattStatus);
        }
        BluetoothGattService service = current.getService(profile.service);
        tx = service == null ? null : service.getCharacteristic(profile.write);
        BluetoothGattCharacteristic rx = service == null ? null
                : service.getCharacteristic(profile.notify);
        if (tx == null || rx == null) {
            closeGatt();
            // Preserve the existing HLP error text for the legacy constructor while giving
            // experimental profiles a useful family label.
            String family = profile == HudGattProfile.HLP1 ? "HLP" : profile.protocolFamily;
            throw new IOException("BLE " + family + " characteristics missing");
        }
        // ponytail: Fixed 400 ms isolates slow GATT stacks; make conditional only if device logs
        // show this delay is unnecessary on common stacks.
        try { Thread.sleep(400); }
        catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            closeGatt();
            throw error;
        }
        requireActive(current);
        boolean notificationEnabled = current.setCharacteristicNotification(rx, true);
        Log.i(TAG, "setCharacteristicNotification=" + notificationEnabled);
        if (!notificationEnabled) {
            closeGatt();
            throw new IOException("BLE notification setup failed");
        }
        BluetoothGattDescriptor cccd = rx.getDescriptor(profile.cccd);
        if (cccd == null) {
            Log.w(TAG, "CCCD missing rx=" + rx.getUuid() + " uuid=" + profile.cccd);
            closeGatt();
            throw new IOException("BLE RX characteristic has no CCCD");
        }
        cccd.setValue(BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE);
        descriptorLatch = new CountDownLatch(1);
        boolean writeStarted = current.writeDescriptor(cccd);
        Log.i(TAG, "writeDescriptor=" + writeStarted + " uuid=" + cccd.getUuid());
        if (!writeStarted) {
            closeGatt();
            throw new IOException("BLE notification descriptor write rejected");
        }
        requireActive(current);
        if (!descriptorLatch.await(5, TimeUnit.SECONDS)) {
            closeGatt();
            throw new IOException("BLE notification descriptor timeout");
        }
        requireActive(current);
        if (lastGattStatus != BluetoothGatt.GATT_SUCCESS) {
            closeGatt();
            throw new IOException("BLE notification descriptor status " + lastGattStatus);
        }
        try {
            CountDownLatch completion = new CountDownLatch(1);
            mtuLatch = completion;
            boolean mtuRequested = current.requestMtu(profile.requestedMtu);
            requireActive(current);
            if (mtuRequested && !completion.await(3, TimeUnit.SECONDS)) {
                closeGatt();
                throw new IOException("BLE MTU negotiation timeout");
            }
        } finally {
            mtuLatch = null;
        }
        synchronized (this) {
            requireActive(current);
            connected = true;
            Log.i(TAG, "ready mtu=" + mtu + " tx=" + tx.getUuid() + " rx=" + rx.getUuid());
        }
        HudTransportListener l = listener;
        if (l != null) l.onTransportConnected();
    }

    @Override public void sendFrame(byte[] frame) throws IOException {
        if (frame == null) throw new IOException("null frame");
        synchronized (writeLock) {
            BluetoothGatt current = gatt;
            BluetoothGattCharacteristic characteristic = tx;
            if (!connected || current == null || characteristic == null) {
                throw new IOException("BLE disconnected");
            }
            int payload = Math.max(1, mtu - 3);
            for (int offset = 0; offset < frame.length; offset += payload) {
                int end = Math.min(frame.length, offset + payload);
                byte[] chunk = Arrays.copyOfRange(frame, offset, end);
                long sequence = ++writeSequence;
                CountDownLatch completion = new CountDownLatch(1);
                writeLatch = completion;
                lastWriteStatus = Integer.MIN_VALUE;
                // A response-backed write is deliberately used here. Android's GATT client only
                // permits one operation in flight, while WRITE_TYPE_NO_RESPONSE provides no
                // portable credit/completion signal and loses chunks on several vendor stacks.
                characteristic.setWriteType(BluetoothGattCharacteristic.WRITE_TYPE_DEFAULT);
                characteristic.setValue(chunk);
                long startedAt = SystemClock.elapsedRealtime();
                if (!current.writeCharacteristic(characteristic)) {
                    writeLatch = null;
                    connected = false;
                    Log.w(TAG, "write rejected seq=" + sequence + " bytes=" + chunk.length);
                    throw new IOException("BLE characteristic write rejected seq=" + sequence);
                }
                try {
                    if (!completion.await(WRITE_TIMEOUT_MS, TimeUnit.MILLISECONDS)) {
                        connected = false;
                        Log.w(TAG, "write timeout seq=" + sequence + " bytes=" + chunk.length
                                + " frameBytes=" + frame.length + " mtu=" + mtu);
                        throw new IOException("BLE characteristic write timeout seq=" + sequence);
                    }
                    long tookMs = SystemClock.elapsedRealtime() - startedAt;
                    if (tookMs >= SLOW_WRITE_MS) {
                        Log.w(TAG, "slow write seq=" + sequence + " took=" + tookMs + "ms bytes="
                                + chunk.length + " frameBytes=" + frame.length + " mtu=" + mtu);
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    throw new IOException("BLE writer interrupted", e);
                } finally {
                    if (writeLatch == completion) writeLatch = null;
                }
                if (stopping || linkLost || !connected || gatt != current)
                    throw new IOException("BLE disconnected");
                if (lastWriteStatus != BluetoothGatt.GATT_SUCCESS) {
                    connected = false;
                    Log.w(TAG, "write status=" + lastWriteStatus + " seq=" + sequence);
                    throw new IOException("BLE characteristic write status " + lastWriteStatus
                            + " seq=" + sequence);
                }
            }
        }
    }

    @Override public boolean isConnected() { return connected; }
    @Override public String transportName() { return "ble"; }

    @Override public synchronized void disconnect() {
        stopping = true;
        connected = false;
        closeGatt();
    }

    private final BluetoothGattCallback callback = new BluetoothGattCallback() {
        @Override public void onConnectionStateChange(BluetoothGatt value, int status, int state) {
            synchronized (BleGattHudTransport.this) {
                if (value != gatt || stopping) return;
            }
            Log.i(TAG, "connection status=" + status + " state=" + state
                    + " stopping=" + stopping);
            lastGattStatus = status;
            if (state == BluetoothGatt.STATE_CONNECTED && status == BluetoothGatt.GATT_SUCCESS) {
                CountDownLatch latch = connectedLatch;
                if (latch != null) latch.countDown();
            } else {
                synchronized (BleGattHudTransport.this) {
                    linkLost = true;
                    connected = false;
                }
                releaseSetupWaits();
                CountDownLatch pendingWrite = writeLatch;
                if (pendingWrite != null) pendingWrite.countDown();
                CountDownLatch pendingMtu = mtuLatch;
                if (pendingMtu != null) pendingMtu.countDown();
                if (!stopping) notifyDisconnected("BLE status=" + status + " state=" + state);
            }
        }

        @Override public void onServicesDiscovered(BluetoothGatt value, int status) {
            if (value != gatt || stopping || linkLost) return;
            Log.i(TAG, "services status=" + status);
            lastGattStatus = status;
            CountDownLatch latch = servicesLatch;
            if (latch != null) latch.countDown();
        }

        @Override public void onDescriptorWrite(BluetoothGatt value, BluetoothGattDescriptor descriptor,
                                                  int status) {
            if (value != gatt || stopping || linkLost || descriptor == null
                    || !profile.cccd.equals(descriptor.getUuid())) return;
            Log.i(TAG, "descriptor status=" + status + " uuid="
                    + (descriptor == null ? "null" : descriptor.getUuid()));
            lastGattStatus = status;
            CountDownLatch latch = descriptorLatch;
            if (latch != null) latch.countDown();
        }

        @Override public void onCharacteristicWrite(BluetoothGatt value,
                                                       BluetoothGattCharacteristic characteristic,
                                                       int status) {
            if (value != gatt || stopping || linkLost || characteristic == null
                    || !profile.write.equals(characteristic.getUuid())) return;
            lastWriteStatus = status;
            CountDownLatch latch = writeLatch;
            if (latch != null) latch.countDown();
        }

        @Override public void onMtuChanged(BluetoothGatt value, int valueMtu, int status) {
            if (value != gatt || stopping || linkLost) return;
            Log.i(TAG, "mtu status=" + status + " value=" + valueMtu);
            if (status == BluetoothGatt.GATT_SUCCESS && valueMtu >= 23) mtu = valueMtu;
            CountDownLatch latch = mtuLatch;
            if (latch != null) latch.countDown();
        }

        @Override public void onCharacteristicChanged(BluetoothGatt value,
                                                        BluetoothGattCharacteristic characteristic) {
            if (value != gatt || stopping || linkLost) return;
            if (characteristic != null && profile.notify.equals(characteristic.getUuid())) {
                byte[] bytes = characteristic.getValue();
                Log.d(TAG, "rx bytes=" + (bytes == null ? 0 : bytes.length));
                HudTransportListener l = listener;
                if (l != null && bytes != null) l.onTransportBytes(bytes, bytes.length);
            }
        }

        @Override public void onCharacteristicChanged(BluetoothGatt value,
                                                        BluetoothGattCharacteristic characteristic,
                                                        byte[] bytes) {
            if (value != gatt || stopping || linkLost || characteristic == null
                    || !profile.notify.equals(characteristic.getUuid())) return;
            Log.d(TAG, "rx bytes=" + (bytes == null ? 0 : bytes.length));
            HudTransportListener l = listener;
            if (l != null && bytes != null) l.onTransportBytes(bytes, bytes.length);
        }
    };

    private synchronized void closeGatt() {
        Log.i(TAG, "close connected=" + connected + " at=" + SystemClock.elapsedRealtime());
        connected = false;
        linkLost = true;
        CountDownLatch pendingMtu = mtuLatch;
        mtuLatch = null;
        if (pendingMtu != null) pendingMtu.countDown();
        CountDownLatch pendingWrite = writeLatch;
        writeLatch = null;
        if (pendingWrite != null) pendingWrite.countDown();
        BluetoothGatt current = gatt;
        gatt = null;
        tx = null;
        releaseSetupWaits();
        if (current != null) {
            try { current.disconnect(); } catch (Throwable ignored) { }
            try { current.close(); } catch (Throwable ignored) { }
        }
    }

    private void requireActive(BluetoothGatt current) throws IOException {
        if (stopping || linkLost || current == null || gatt != current) {
            closeGatt();
            throw new IOException("BLE setup interrupted");
        }
    }

    private void releaseSetupWaits() {
        CountDownLatch latch = connectedLatch;
        if (latch != null) latch.countDown();
        latch = servicesLatch;
        if (latch != null) latch.countDown();
        latch = descriptorLatch;
        if (latch != null) latch.countDown();
    }

    private void requirePermission(String permission) {
        if (android.os.Build.VERSION.SDK_INT >= 31
                && context.checkSelfPermission(permission) != PackageManager.PERMISSION_GRANTED) {
            throw new SecurityException("Missing " + permission);
        }
    }

    private static HudProtocolFamily familyForProfile(HudGattProfile profile) {
        if (profile == HudGattProfile.VIETMAP_H50) return HudProtocolFamily.VIETMAP_H50;
        if (profile == HudGattProfile.VIETMAP_H1) return HudProtocolFamily.VIETMAP_H1;
        return HudProtocolFamily.HLP1;
    }

    private void notifyDisconnected(String reason) {
        HudTransportListener l = listener;
        if (l != null) l.onTransportDisconnected(reason);
    }
}
