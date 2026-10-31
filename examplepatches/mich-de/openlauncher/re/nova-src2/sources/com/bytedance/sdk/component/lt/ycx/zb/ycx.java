package com.bytedance.sdk.component.lt.ycx.zb;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.lt.ycx.ul;
import com.bytedance.sdk.component.lt.ycx.ycx.lud;

/* loaded from: classes2.dex */
public class ycx {
    public static boolean dj() {
        lud ludVarSya = ul.lt().sya();
        return (ludVarSya == null || TextUtils.isEmpty(ludVarSya.lud())) ? false : true;
    }

    public static boolean lt() {
        lud ludVarSya = ul.lt().sya();
        return (ludVarSya == null || TextUtils.isEmpty(ludVarSya.lt())) ? false : true;
    }

    public static boolean lud() {
        lud ludVarSya = ul.lt().sya();
        return (ludVarSya == null || TextUtils.isEmpty(ludVarSya.sya())) ? false : true;
    }

    public static boolean sya() {
        lud ludVarSya = ul.lt().sya();
        return (ludVarSya == null || TextUtils.isEmpty(ludVarSya.dj())) ? false : true;
    }

    public static long ycx(int i5, Context context) {
        return zb(i5, context);
    }

    private static long zb(int i5, Context context) {
        if (context == null) {
            return i5;
        }
        Runtime runtime = Runtime.getRuntime();
        long jFreeMemory = runtime.freeMemory() / 1048576;
        long jMaxMemory = (runtime.maxMemory() / 1048576) - (runtime.totalMemory() / 1048576);
        if (jMaxMemory <= 0) {
            if (jFreeMemory <= 2) {
                return 1L;
            }
            return jFreeMemory <= 10 ? Math.min(i5, 10) : Math.min((jFreeMemory / 2) * 10, i5);
        }
        long j11 = ((jFreeMemory + jMaxMemory) - 10) / 2;
        if (j11 <= 2) {
            return 1L;
        }
        return j11 <= 10 ? Math.min(i5, 10) : Math.min(j11 * 10, i5);
    }

    public static boolean ycx() {
        lud ludVarSya = ul.lt().sya();
        return (ludVarSya == null || TextUtils.isEmpty(ludVarSya.ycx())) ? false : true;
    }

    public static boolean zb() {
        lud ludVarSya = ul.lt().sya();
        return (ludVarSya == null || TextUtils.isEmpty(ludVarSya.zb())) ? false : true;
    }
}
