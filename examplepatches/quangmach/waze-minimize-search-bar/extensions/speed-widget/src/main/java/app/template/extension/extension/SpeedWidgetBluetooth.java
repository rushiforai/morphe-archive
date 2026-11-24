package app.template.extension.extension;

import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothProfile;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public final class SpeedWidgetBluetooth extends BroadcastReceiver {
    static final long DISCONNECT_GRACE_MS = 15_000;
    private static final long APPEARANCE_TIMEOUT_MS = 4000;
    private static final UUID GAP = UUID.fromString("00001800-0000-1000-8000-00805f9b34fb");
    private static final UUID APPEARANCE = UUID.fromString("00002a01-0000-1000-8000-00805f9b34fb");
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<String, AppearanceRead> reads = new HashMap<>();

    @Override
    public void onReceive(Context context, Intent intent) {
        Context app = context.getApplicationContext();
        if (BluetoothAdapter.ACTION_STATE_CHANGED.equals(intent.getAction())) {
            if (intent.getIntExtra(BluetoothAdapter.EXTRA_STATE, BluetoothAdapter.ERROR) == BluetoothAdapter.STATE_OFF) {
                for (AppearanceRead read : reads.values().toArray(new AppearanceRead[0])) read.finish(null);
                SpeedWidgetAuto.bluetoothOff(app);
            }
            return;
        }
        if (!SpeedWidgetAuto.armed(app) || !SpeedWidgetAuto.granted(app, Manifest.permission.BLUETOOTH_CONNECT)) return;
        BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
        if (device == null) return;
        int transport = intent.getIntExtra("android.bluetooth.device.extra.TRANSPORT", BluetoothDevice.TRANSPORT_AUTO);
        String connection = connectionId(device, transport);
        if (BluetoothDevice.ACTION_ACL_DISCONNECTED.equals(intent.getAction())) {
            AppearanceRead read = reads.get(connection);
            if (read != null) read.finish(null);
            SpeedWidgetAuto.vehicleDisconnected(app, connection);
            if (transport == BluetoothDevice.TRANSPORT_AUTO) {
                SpeedWidgetAuto.vehicleDisconnected(app, connectionId(device, BluetoothDevice.TRANSPORT_BREDR));
                SpeedWidgetAuto.vehicleDisconnected(app, connectionId(device, BluetoothDevice.TRANSPORT_LE));
            } else {
                SpeedWidgetAuto.vehicleDisconnected(app, connectionId(device, BluetoothDevice.TRANSPORT_AUTO));
            }
        } else if (BluetoothDevice.ACTION_ACL_CONNECTED.equals(intent.getAction())) {
            try {
                if (device.getBondState() != BluetoothDevice.BOND_BONDED) return;
                if (isCarAudio(device)) {
                    SpeedWidgetAuto.vehicleConnected(app, connection);
                } else if (transport == BluetoothDevice.TRANSPORT_LE
                        || (transport == BluetoothDevice.TRANSPORT_AUTO && device.getType() == BluetoothDevice.DEVICE_TYPE_LE)) {
                    readAppearance(app, device, connection, goAsync());
                }
            } catch (SecurityException ignored) {
                // Nearby devices access can be revoked while a broadcast is queued.
            }
        }
    }

    private static String connectionId(BluetoothDevice device, int transport) {
        return device.getAddress() + "/" + transport;
    }

    private static boolean isCarAudio(BluetoothDevice device) {
        BluetoothClass type = device.getBluetoothClass();
        return type != null && type.getDeviceClass() == BluetoothClass.Device.AUDIO_VIDEO_CAR_AUDIO;
    }

    static boolean isVehicleAppearance(byte[] value) {
        if (value == null || value.length != 2) return false;
        int appearance = (value[0] & 0xff) | ((value[1] & 0xff) << 8);
        // Bluetooth SIG Appearance category 0x023 identifies motorized vehicles.
        return (appearance >>> 6) == 0x023;
    }

    static void checkConnectedAudio(Context context) {
        if (!SpeedWidgetAuto.armed(context) || !SpeedWidgetAuto.granted(context, Manifest.permission.BLUETOOTH_CONNECT)) return;
        BluetoothManager manager = context.getSystemService(BluetoothManager.class);
        BluetoothAdapter adapter = manager == null ? null : manager.getAdapter();
        if (adapter == null || !adapter.isEnabled()) return;
        for (int profile : new int[] { BluetoothProfile.HEADSET, BluetoothProfile.A2DP }) {
            try {
                adapter.getProfileProxy(context, new BluetoothProfile.ServiceListener() {
                    @Override public void onServiceConnected(int connectedProfile, BluetoothProfile proxy) {
                        try {
                            if (!SpeedWidgetAuto.armed(context)) return;
                            for (BluetoothDevice device : proxy.getConnectedDevices()) {
                                if (isCarAudio(device)) {
                                    SpeedWidgetAuto.vehicleConnected(context, connectionId(device, BluetoothDevice.TRANSPORT_BREDR));
                                }
                            }
                        } catch (SecurityException ignored) {
                            // Nearby devices access changed after requesting the proxy.
                        } finally {
                            adapter.closeProfileProxy(connectedProfile, proxy);
                        }
                    }
                    @Override public void onServiceDisconnected(int disconnectedProfile) {}
                }, profile);
            } catch (SecurityException ignored) {
                // The activity may no longer have Nearby devices access.
            }
        }
    }

    private static void readAppearance(Context context, BluetoothDevice device, String connection, PendingResult broadcast) {
        if (reads.containsKey(connection)) {
            broadcast.finish();
            return;
        }
        AppearanceRead read = new AppearanceRead(context, connection, broadcast);
        reads.put(connection, read);
        try {
            read.gatt = device.connectGatt(context, false, read, BluetoothDevice.TRANSPORT_LE, BluetoothDevice.PHY_LE_1M_MASK, MAIN);
        } catch (SecurityException | IllegalStateException e) {
            read.finish(null);
            return;
        }
        if (read.gatt == null) read.finish(null);
        else MAIN.postDelayed(read.timeout, APPEARANCE_TIMEOUT_MS);
    }

    private static final class AppearanceRead extends BluetoothGattCallback {
        final Context context;
        final String connection;
        final PendingResult broadcast;
        final Runnable timeout = () -> finish(null);
        BluetoothGatt gatt;

        AppearanceRead(Context context, String connection, PendingResult broadcast) {
            this.context = context;
            this.connection = connection;
            this.broadcast = broadcast;
        }

        @Override public void onConnectionStateChange(BluetoothGatt client, int status, int state) {
            if (reads.get(connection) != this) return;
            try {
                if (status != BluetoothGatt.GATT_SUCCESS || state != BluetoothProfile.STATE_CONNECTED || !client.discoverServices()) {
                    finish(null);
                }
            } catch (SecurityException | IllegalStateException e) {
                finish(null);
            }
        }

        @Override public void onServicesDiscovered(BluetoothGatt client, int status) {
            if (reads.get(connection) != this) return;
            BluetoothGattService service = client.getService(GAP);
            BluetoothGattCharacteristic appearance = service == null ? null : service.getCharacteristic(APPEARANCE);
            try {
                if (status != BluetoothGatt.GATT_SUCCESS || appearance == null || !client.readCharacteristic(appearance)) {
                    finish(null);
                }
            } catch (SecurityException | IllegalStateException e) {
                finish(null);
            }
        }

        @Override public void onCharacteristicRead(BluetoothGatt client, BluetoothGattCharacteristic field, byte[] value, int status) {
            finish(status == BluetoothGatt.GATT_SUCCESS && APPEARANCE.equals(field.getUuid()) ? value : null);
        }

        @Override public void onCharacteristicRead(BluetoothGatt client, BluetoothGattCharacteristic field, int status) {
            if (Build.VERSION.SDK_INT < 33) onCharacteristicRead(client, field, field.getValue(), status);
        }

        void finish(byte[] value) {
            if (reads.get(connection) != this) return;
            reads.remove(connection);
            MAIN.removeCallbacks(timeout);
            if (gatt != null) {
                try {
                    gatt.close();
                } catch (SecurityException ignored) {
                    // The system closes the client when its owner loses Bluetooth permission.
                }
            }
            try {
                if (SpeedWidgetAuto.armed(context) && isVehicleAppearance(value)) {
                    SpeedWidgetAuto.vehicleConnected(context, connection);
                }
            } finally {
                broadcast.finish();
            }
        }
    }
}
