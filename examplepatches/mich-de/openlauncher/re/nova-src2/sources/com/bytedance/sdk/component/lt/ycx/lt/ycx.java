package com.bytedance.sdk.component.lt.ycx.lt;

import com.bytedance.sdk.component.lt.ycx.ul;

/* loaded from: classes2.dex */
public class ycx {
    private static volatile zb ycx;

    public static zb ycx() {
        if (ycx == null) {
            synchronized (zb.class) {
                try {
                    if (ycx == null) {
                        ycx = new sya(ul.lt().lud(), new lt(ul.lt().lud()));
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }
}
