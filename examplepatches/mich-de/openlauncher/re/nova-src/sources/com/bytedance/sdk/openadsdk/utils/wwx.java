package com.bytedance.sdk.openadsdk.utils;

/* loaded from: classes2.dex */
public class wwx {
    public static int ycx() {
        try {
            int iMaxMemory = (int) (Runtime.getRuntime().maxMemory() / 33554432);
            if (iMaxMemory <= 2) {
                return 2;
            }
            if (iMaxMemory >= 5) {
                return 5;
            }
            return iMaxMemory;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "dusgmhGlXNOJRsQ=", "XOs5uAKkSsaDQtI=", 31);
            return 2;
        }
    }
}
