package com.bytedance.adsdk.ugeno.fby;

/* loaded from: classes2.dex */
public final class sya {
    public static float ycx(String str, float f11) {
        if (str == null) {
            return f11;
        }
        try {
            return Float.parseFloat(str);
        } catch (Throwable unused) {
            return f11;
        }
    }

    public static int ycx(String str, int i5) {
        if (str == null) {
            return i5;
        }
        try {
            return (int) Float.parseFloat(str);
        } catch (Throwable unused) {
            return i5;
        }
    }

    public static long ycx(String str, long j11) {
        if (str == null) {
            return j11;
        }
        try {
            return Long.parseLong(str);
        } catch (Throwable unused) {
            return j11;
        }
    }

    public static double ycx(String str, double d5) {
        if (str == null) {
            return d5;
        }
        try {
            return Double.parseDouble(str);
        } catch (Throwable unused) {
            return d5;
        }
    }

    public static boolean ycx(String str, boolean z11) {
        if (str == null) {
            return z11;
        }
        try {
            return Boolean.parseBoolean(str);
        } catch (Throwable unused) {
            return z11;
        }
    }
}
