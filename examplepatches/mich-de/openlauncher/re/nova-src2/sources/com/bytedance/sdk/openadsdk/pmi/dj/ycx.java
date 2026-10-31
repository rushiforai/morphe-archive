package com.bytedance.sdk.openadsdk.pmi.dj;

/* loaded from: classes2.dex */
public class ycx {
    public static long ycx() {
        long jCurrentTimeMillis = System.currentTimeMillis();
        return jCurrentTimeMillis - (jCurrentTimeMillis % 86400000);
    }

    public static boolean ycx(long j11) {
        return j11 - (j11 % 86400000) == ycx();
    }
}
