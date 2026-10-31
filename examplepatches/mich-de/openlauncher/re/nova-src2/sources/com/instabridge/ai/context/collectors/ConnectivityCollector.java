package com.instabridge.ai.context.collectors;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.telephony.TelephonyManager;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.k;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\u0006\u001a\u00020\u0007H\u0003J\u0012\u0010\n\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\u0017\u0010\u000b\u001a\u0004\u0018\u00010\f2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002¢\u0006\u0002\u0010\rJ\u0012\u0010\u000e\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002J\u0012\u0010\u000f\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0006\u001a\u00020\u0007H\u0002¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/context/collectors/ConnectivityCollector;", b.f42142b, "<init>", "()V", "collect", "Lcom/instabridge/ai/context/collectors/ConnectivityData;", "context", "Landroid/content/Context;", "readNetworkType", b.f42142b, "readWifiSsid", "readWifiSignalStrength", b.f42142b, "(Landroid/content/Context;)Ljava/lang/Integer;", "readCarrier", "readCellularType", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ConnectivityCollector {
    public static final int $stable = 0;

    private final String readCarrier(Context context) {
        String networkOperatorName;
        try {
            Object systemService = context.getSystemService("phone");
            TelephonyManager telephonyManager = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
            if (telephonyManager != null && (networkOperatorName = telephonyManager.getNetworkOperatorName()) != null) {
                if (!k.U0(networkOperatorName)) {
                    return networkOperatorName;
                }
            }
        } catch (Exception unused) {
        }
        return null;
    }

    private final String readCellularType(Context context) {
        return NetworkUtils.INSTANCE.readCellularType(context);
    }

    @SuppressLint({"MissingPermission", "NewApi"})
    private final String readNetworkType(Context context) {
        Network activeNetwork;
        NetworkCapabilities networkCapabilities;
        try {
            Object systemService = context.getSystemService("connectivity");
            ConnectivityManager connectivityManager = systemService instanceof ConnectivityManager ? (ConnectivityManager) systemService : null;
            return (connectivityManager == null || (activeNetwork = connectivityManager.getActiveNetwork()) == null || (networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork)) == null) ? "No connection" : networkCapabilities.hasTransport(1) ? "Wi-Fi" : networkCapabilities.hasTransport(0) ? "Cellular" : networkCapabilities.hasTransport(3) ? "Ethernet" : "Other";
        } catch (Exception unused) {
            return "Unknown";
        }
    }

    private final Integer readWifiSignalStrength(Context context) {
        WifiInfo connectionInfo;
        try {
            Object systemService = context.getApplicationContext().getSystemService("wifi");
            WifiManager wifiManager = systemService instanceof WifiManager ? (WifiManager) systemService : null;
            if (wifiManager != null && (connectionInfo = wifiManager.getConnectionInfo()) != null) {
                return Integer.valueOf(WifiManager.calculateSignalLevel(connectionInfo.getRssi(), 100));
            }
        } catch (Exception unused) {
        }
        return null;
    }

    private final String readWifiSsid(Context context) {
        return NetworkUtils.INSTANCE.readWifiSsid(context);
    }

    @NotNull
    public final ConnectivityData collect(@NotNull Context context) {
        Intrinsics.g(context, "context");
        return new ConnectivityData(readNetworkType(context), readWifiSsid(context), readWifiSignalStrength(context), readCarrier(context), readCellularType(context));
    }
}
