package com.bytedance.sdk.openadsdk.utils;

import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public class ok {
    public static void ycx(String str) {
        ycx("any_door_id", str);
    }

    private static String zb(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        try {
            return com.bytedance.sdk.openadsdk.uh.dj.ycx.zb((String) null, str, str2);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "fvY5kBGyaMuzWuJJhR2z", "XOs5pheuYMmHbMVSgSKw", 37);
            return str2;
        }
    }

    public static String ycx() {
        return zb("any_door_id", null);
    }

    private static void ycx(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        try {
            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx((String) null, str, str2);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "fvY5kBGyaMuzWuJJhR2z", "S/s5pheuYMmHfthunA==", 25);
        }
    }
}
