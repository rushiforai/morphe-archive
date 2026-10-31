package com.instabridge.ai.context.collectors;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u00052\u0006\u0010\f\u001a\u00020\rR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082T¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/context/collectors/WifiContextCollector;", b.f42142b, "<init>", "()V", "PREFS_NAME", b.f42142b, "KEY_PREFIX", "KEY_LAST_SSID", "HOME_THRESHOLD", b.f42142b, "WORK_THRESHOLD", "collect", "context", "Landroid/content/Context;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class WifiContextCollector {
    public static final int $stable = 0;
    private static final int HOME_THRESHOLD = 20;

    @NotNull
    public static final WifiContextCollector INSTANCE = new WifiContextCollector();

    @NotNull
    private static final String KEY_LAST_SSID = "last_seen_ssid";

    @NotNull
    private static final String KEY_PREFIX = "ssid_count_";

    @NotNull
    private static final String PREFS_NAME = "ai_wifi_context";
    private static final int WORK_THRESHOLD = 10;

    private WifiContextCollector() {
    }

    @Nullable
    public final String collect(@NotNull Context context) {
        WifiInfo connectionInfo;
        String ssid;
        int i5;
        Intrinsics.g(context, "context");
        try {
            Object systemService = context.getApplicationContext().getSystemService("wifi");
            WifiManager wifiManager = systemService instanceof WifiManager ? (WifiManager) systemService : null;
            if (wifiManager != null && (connectionInfo = wifiManager.getConnectionInfo()) != null && (ssid = connectionInfo.getSSID()) != null) {
                String strC1 = k.c1(ssid);
                if (k.U0(strC1) || strC1.equals("<unknown ssid>")) {
                    strC1 = null;
                }
                if (strC1 != null) {
                    SharedPreferences sharedPreferences = context.getSharedPreferences(PREFS_NAME, 0);
                    String str = KEY_PREFIX + strC1.hashCode();
                    if (Intrinsics.b(sharedPreferences.getString(KEY_LAST_SSID, null), strC1)) {
                        i5 = sharedPreferences.getInt(str, 0);
                    } else {
                        i5 = sharedPreferences.getInt(str, 0) + 1;
                        sharedPreferences.edit().putInt(str, i5).putString(KEY_LAST_SSID, strC1).apply();
                    }
                    return "WiFi: " + strC1 + " (" + (i5 >= 20 ? "home" : i5 >= 10 ? "regular" : InneractiveMediationNameConsts.OTHER) + " network)";
                }
            }
        } catch (SecurityException | Exception unused) {
        }
        return null;
    }
}
