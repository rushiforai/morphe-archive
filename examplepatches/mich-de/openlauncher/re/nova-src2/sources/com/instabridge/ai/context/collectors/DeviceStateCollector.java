package com.instabridge.ai.context.collectors;

import android.annotation.SuppressLint;
import android.app.NotificationManager;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.BatteryManager;
import android.os.Environment;
import android.os.PowerManager;
import android.os.StatFs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u0007\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\u0010\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u0007H\u0003J\u0010\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u0007H\u0003J\u0012\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\u0010\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u0007H\u0003J\u0012\u0010\u0010\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\u0010\u0010\u0011\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u0007H\u0003J\u0010\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\u0010\u0010\u0013\u001a\u00020\t2\u0006\u0010\u0006\u001a\u00020\u0007H\u0003J\u0010\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\u000f\u0010\u0015\u001a\u0004\u0018\u00010\u0016H\u0002¢\u0006\u0002\u0010\u0017¨\u0006\u0018"}, d2 = {"Lcom/instabridge/ai/context/collectors/DeviceStateCollector;", b.f42142b, "<init>", "()V", "collect", "Lcom/instabridge/ai/context/collectors/DeviceStateData;", "context", "Landroid/content/Context;", "readBatteryPercent", b.f42142b, "readIsCharging", b.f42142b, "readWifiConnected", "readWifiSsid", b.f42142b, "readCellularConnected", "readCellularType", "readDndEnabled", "readBluetoothEnabled", "readBluetoothDeviceCount", "readScreenOn", "readStorageAvailable", b.f42142b, "()Ljava/lang/Float;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class DeviceStateCollector {
    public static final int $stable = 0;

    private final int readBatteryPercent(Context context) {
        try {
            Object systemService = context.getSystemService("batterymanager");
            BatteryManager batteryManager = systemService instanceof BatteryManager ? (BatteryManager) systemService : null;
            if (batteryManager != null) {
                return batteryManager.getIntProperty(4);
            }
        } catch (Exception unused) {
        }
        return -1;
    }

    @SuppressLint({"MissingPermission"})
    private final int readBluetoothDeviceCount(Context context) {
        BluetoothAdapter adapter;
        Set<BluetoothDevice> bondedDevices;
        try {
            Object systemService = context.getSystemService("bluetooth");
            BluetoothManager bluetoothManager = systemService instanceof BluetoothManager ? (BluetoothManager) systemService : null;
            if (bluetoothManager != null && (adapter = bluetoothManager.getAdapter()) != null && (bondedDevices = adapter.getBondedDevices()) != null) {
                return bondedDevices.size();
            }
        } catch (Exception unused) {
        }
        return 0;
    }

    private final boolean readBluetoothEnabled(Context context) {
        BluetoothAdapter adapter;
        try {
            Object systemService = context.getSystemService("bluetooth");
            BluetoothManager bluetoothManager = systemService instanceof BluetoothManager ? (BluetoothManager) systemService : null;
            if (bluetoothManager != null && (adapter = bluetoothManager.getAdapter()) != null) {
                if (adapter.isEnabled()) {
                    return true;
                }
            }
        } catch (Exception unused) {
        }
        return false;
    }

    @SuppressLint({"MissingPermission", "NewApi"})
    private final boolean readCellularConnected(Context context) {
        Network activeNetwork;
        NetworkCapabilities networkCapabilities;
        try {
            Object systemService = context.getSystemService("connectivity");
            ConnectivityManager connectivityManager = systemService instanceof ConnectivityManager ? (ConnectivityManager) systemService : null;
            if (connectivityManager == null || (activeNetwork = connectivityManager.getActiveNetwork()) == null || (networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork)) == null) {
                return false;
            }
            return networkCapabilities.hasTransport(0);
        } catch (Exception unused) {
        }
        return false;
    }

    private final String readCellularType(Context context) {
        return NetworkUtils.INSTANCE.readCellularType(context);
    }

    @SuppressLint({"NewApi"})
    private final boolean readDndEnabled(Context context) {
        try {
            Object systemService = context.getSystemService("notification");
            NotificationManager notificationManager = systemService instanceof NotificationManager ? (NotificationManager) systemService : null;
            if (notificationManager != null) {
                if (notificationManager.getCurrentInterruptionFilter() != 1) {
                    return true;
                }
            }
        } catch (Exception unused) {
        }
        return false;
    }

    @SuppressLint({"NewApi"})
    private final boolean readIsCharging(Context context) {
        try {
            Object systemService = context.getSystemService("batterymanager");
            BatteryManager batteryManager = systemService instanceof BatteryManager ? (BatteryManager) systemService : null;
            if (batteryManager != null) {
                return batteryManager.isCharging();
            }
        } catch (Exception unused) {
        }
        return false;
    }

    private final boolean readScreenOn(Context context) {
        try {
            Object systemService = context.getSystemService("power");
            PowerManager powerManager = systemService instanceof PowerManager ? (PowerManager) systemService : null;
            if (powerManager != null) {
                return powerManager.isInteractive();
            }
        } catch (Exception unused) {
        }
        return true;
    }

    private final Float readStorageAvailable() {
        try {
            StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
            return Float.valueOf((statFs.getAvailableBlocksLong() * statFs.getBlockSizeLong()) / 1.0737418E9f);
        } catch (Exception unused) {
            return null;
        }
    }

    @SuppressLint({"MissingPermission", "NewApi"})
    private final boolean readWifiConnected(Context context) {
        Network activeNetwork;
        NetworkCapabilities networkCapabilities;
        try {
            Object systemService = context.getSystemService("connectivity");
            ConnectivityManager connectivityManager = systemService instanceof ConnectivityManager ? (ConnectivityManager) systemService : null;
            if (connectivityManager == null || (activeNetwork = connectivityManager.getActiveNetwork()) == null || (networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork)) == null) {
                return false;
            }
            return networkCapabilities.hasTransport(1);
        } catch (Exception unused) {
        }
        return false;
    }

    private final String readWifiSsid(Context context) {
        return NetworkUtils.INSTANCE.readWifiSsid(context);
    }

    @NotNull
    public final DeviceStateData collect(@NotNull Context context) {
        Intrinsics.g(context, "context");
        return new DeviceStateData(readBatteryPercent(context), readIsCharging(context), readWifiConnected(context), readWifiSsid(context), readCellularConnected(context), readCellularType(context), readDndEnabled(context), readBluetoothEnabled(context), readBluetoothDeviceCount(context), readScreenOn(context), readStorageAvailable());
    }
}
