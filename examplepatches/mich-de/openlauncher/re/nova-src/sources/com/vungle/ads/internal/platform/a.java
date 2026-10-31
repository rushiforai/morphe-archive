package com.vungle.ads.internal.platform;

import android.content.Context;
import android.telephony.TelephonyManager;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class a {
    public static String a(Context context) {
        Intrinsics.g(context, "context");
        Object systemService = context.getSystemService("phone");
        TelephonyManager telephonyManager = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
        String networkOperatorName = telephonyManager != null ? telephonyManager.getNetworkOperatorName() : null;
        return networkOperatorName == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : networkOperatorName;
    }
}
