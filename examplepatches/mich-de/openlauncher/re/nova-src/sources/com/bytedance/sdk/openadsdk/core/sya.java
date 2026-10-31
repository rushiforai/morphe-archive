package com.bytedance.sdk.openadsdk.core;

/* loaded from: classes2.dex */
public class sya {
    private static volatile sya ycx;

    private sya() {
    }

    public static sya ycx() {
        if (ycx == null) {
            synchronized (sya.class) {
                try {
                    if (ycx == null) {
                        ycx = new sya();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public String zb(String str, String str2) {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.zb("ttopenadsdk", str, str2);
    }

    public int zb(String str, int i5) {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", str, i5);
    }

    public Long zb(String str, long j11) {
        return Long.valueOf(com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", str, j11));
    }

    public void ycx(String str, String str2) {
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", str, str2);
    }

    public void ycx(String str, int i5) {
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", str, Integer.valueOf(i5));
    }

    public void ycx(String str, long j11) {
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", str, Long.valueOf(j11));
    }

    public void ycx(String str) {
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("ttopenadsdk", str);
    }
}
