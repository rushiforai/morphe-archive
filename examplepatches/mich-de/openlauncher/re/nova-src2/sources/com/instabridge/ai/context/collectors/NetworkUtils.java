package com.instabridge.ai.context.collectors;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.telephony.TelephonyManager;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\u0012\u0010\b\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0007¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/context/collectors/NetworkUtils;", b.f42142b, "<init>", "()V", "readWifiSsid", b.f42142b, "context", "Landroid/content/Context;", "readCellularType", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class NetworkUtils {
    public static final int $stable = 0;

    @NotNull
    public static final NetworkUtils INSTANCE = new NetworkUtils();

    private NetworkUtils() {
    }

    @SuppressLint({"MissingPermission"})
    @Nullable
    public final String readCellularType(@NotNull Context context) {
        Intrinsics.g(context, "context");
        try {
            Object systemService = context.getSystemService("phone");
            TelephonyManager telephonyManager = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
            Integer numValueOf = telephonyManager != null ? Integer.valueOf(telephonyManager.getNetworkType()) : null;
            if (numValueOf != null && numValueOf.intValue() == 13) {
                return "LTE";
            }
            if (numValueOf != null && numValueOf.intValue() == 20) {
                return "5G";
            }
            if (numValueOf != null && numValueOf.intValue() == 8) {
                return "3G";
            }
            if (numValueOf != null && numValueOf.intValue() == 9) {
                return "3G";
            }
            if (numValueOf != null && numValueOf.intValue() == 10) {
                return "3G";
            }
            if (numValueOf != null && numValueOf.intValue() == 2) {
                return "2G";
            }
            if (numValueOf != null) {
                if (numValueOf.intValue() == 1) {
                    return "2G";
                }
            }
            return null;
        } catch (Exception unused) {
            return null;
        }
    }

    @Nullable
    public final String readWifiSsid(@NotNull Context context) {
        String strB1;
        WifiInfo connectionInfo;
        String ssid;
        Intrinsics.g(context, "context");
        try {
            Object systemService = context.getApplicationContext().getSystemService("wifi");
            WifiManager wifiManager = systemService instanceof WifiManager ? (WifiManager) systemService : null;
            strB1 = (wifiManager == null || (connectionInfo = wifiManager.getConnectionInfo()) == null || (ssid = connectionInfo.getSSID()) == null) ? null : k.b1(k.a1(ssid, "\""), "\"");
        } catch (Exception unused) {
        }
        if (Intrinsics.b(strB1, "<unknown ssid>") || strB1 == null) {
            return null;
        }
        return strB1;
    }
}
