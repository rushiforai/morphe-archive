package com.bytedance.sdk.component.utils;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.Log;

/* loaded from: classes2.dex */
public final class wwx {

    /* renamed from: dj, reason: collision with root package name */
    private static String f24113dj = null;

    /* renamed from: lt, reason: collision with root package name */
    private static boolean f24114lt = false;
    private static boolean lud = false;
    private static Resources sya;

    @SuppressLint({"StaticFieldLeak"})
    private static Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static String f24115zb;

    private static String dj(Context context) {
        if (f24113dj == null) {
            f24113dj = context.getPackageName();
        }
        return f24113dj;
    }

    public static int fby(Context context, String str) {
        return ycx(context, str, "color");
    }

    public static int jw(Context context, String str) {
        return ycx(context, str, "anim");
    }

    public static int lt(Context context, String str) {
        return ycx(context, str, "style");
    }

    public static int lud(Context context, String str) {
        return ycx(context, str, "id");
    }

    public static Drawable sya(Context context, String str) {
        try {
            return zb(context).getDrawable(dj(context, str));
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "aes+mhauasKoT9tN", "X/wsggK+ZcK0RQ==", 93);
            return null;
        }
    }

    public static int ul(Context context, String str) {
        return zb(context).getColor(fby(context, str));
    }

    public static void ycx(Context context) {
        ycx = context;
    }

    public static int zb(Context context, String str) {
        return ycx(context, str, "string");
    }

    public static void ycx(String str) {
        f24113dj = str;
    }

    public static Resources zb(Context context) {
        Resources resources = sya;
        if (resources == null) {
            resources = null;
        }
        Context context2 = ycx;
        if (context2 != null) {
            resources = context2.getResources();
        }
        return resources == null ? context.getResources() : resources;
    }

    private static int ycx(Context context, String str, String str2) {
        int identifier = zb(context).getIdentifier(str, str2, dj(context));
        if (identifier != 0) {
            return identifier;
        }
        if (!lud) {
            sya(context);
            return zb(context).getIdentifier(str, str2, dj(context));
        }
        return context.getResources().getIdentifier(str, str2, dj(context));
    }

    public static int dj(Context context, String str) {
        try {
            return ycx(context, str, "drawable");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "aes+mhauasKoT9tN", "X/wsggK+ZcI=", 106);
            return 0;
        }
    }

    public static synchronized void sya(Context context) {
        try {
            if (TextUtils.isEmpty(f24115zb)) {
                return;
            }
            lud = true;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "aes+mhauasKoT9tN", "Vu8mkDOwfMCJROVYnx61OljrPg==", 191);
            Log.e("ResourceHelp", "makePluginResources failed", th2);
        }
    }

    public static String ycx(Context context, String str) {
        return zb(context).getString(zb(context, str));
    }
}
