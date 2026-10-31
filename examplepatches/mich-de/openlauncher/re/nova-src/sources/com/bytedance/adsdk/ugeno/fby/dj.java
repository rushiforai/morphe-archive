package com.bytedance.adsdk.ugeno.fby;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;

/* loaded from: classes2.dex */
public final class dj {

    @SuppressLint({"StaticFieldLeak"})
    private static Context sya;
    private static String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static Resources f22283zb;

    public static void ycx(String str) {
        ycx = str;
    }

    public static int zb(Context context, String str) {
        return ycx(context, str, "drawable");
    }

    private static String ycx(Context context) {
        if (ycx == null) {
            ycx = context.getPackageName();
        }
        return ycx;
    }

    private static int ycx(Context context, String str, String str2) {
        if (f22283zb == null) {
            f22283zb = context.getResources();
        }
        return f22283zb.getIdentifier(str, str2, ycx(context));
    }

    public static int ycx(Context context, String str) {
        return ycx(context, str, "raw");
    }
}
