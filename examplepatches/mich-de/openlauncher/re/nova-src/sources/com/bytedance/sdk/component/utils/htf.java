package com.bytedance.sdk.component.utils;

import android.text.TextUtils;
import android.util.Log;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
public class htf {
    private static boolean ycx = false;

    /* renamed from: zb, reason: collision with root package name */
    private static String f24111zb = "";

    public static void sya(String str, String str2) {
        if (ycx && str2 != null) {
            Log.e(zb(str), str2);
        }
    }

    public static void ycx() {
        ycx = true;
    }

    public static void zb() {
        ycx = false;
    }

    public static void ycx(String str, String str2) {
        if (ycx && str2 != null) {
            zb(str);
        }
    }

    public static void zb(String str, String str2) {
        if (ycx && str2 != null) {
            Log.i(zb(str), str2);
        }
    }

    public static void sya(String str, Object... objArr) {
        if (ycx && objArr != null) {
            Log.e(zb(str), ycx(objArr));
        }
    }

    public static void ycx(String str, Object... objArr) {
        if (ycx && objArr != null) {
            zb(str);
            ycx(objArr);
        }
    }

    public static void zb(String str, Object... objArr) {
        if (ycx && objArr != null) {
            Log.i(zb(str), ycx(objArr));
        }
    }

    public static void ycx(String str, String str2, Throwable th2) {
        if (ycx) {
            if (str2 == null && th2 == null) {
                return;
            }
            Log.e(zb(str), str2, th2);
        }
    }

    private static String zb(String str) {
        return TextUtils.isEmpty(f24111zb) ? str : ycx(c0.s(new StringBuilder("["), f24111zb, "]-[", str, "]"));
    }

    public static void ycx(String str) {
        f24111zb = str;
    }

    private static String ycx(Object... objArr) {
        if (objArr != null && objArr.length != 0) {
            StringBuilder sb2 = new StringBuilder();
            for (Object obj : objArr) {
                if (obj != null) {
                    sb2.append(obj.toString());
                } else {
                    sb2.append(" null ");
                }
                sb2.append(" ");
            }
            return sb2.toString();
        }
        return b.f42142b;
    }
}
