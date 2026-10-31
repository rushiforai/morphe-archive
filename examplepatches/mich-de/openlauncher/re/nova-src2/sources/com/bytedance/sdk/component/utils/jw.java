package com.bytedance.sdk.component.utils;

import android.os.Handler;
import android.os.Looper;

/* loaded from: classes2.dex */
public class jw {
    private static volatile Handler ycx;

    public static Handler ycx() {
        return com.bytedance.sdk.component.fby.ycx.ycx.ycx().zb();
    }

    public static Handler zb() {
        if (ycx == null) {
            synchronized (jw.class) {
                try {
                    if (ycx == null) {
                        ycx = new Handler(Looper.getMainLooper());
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }
}
