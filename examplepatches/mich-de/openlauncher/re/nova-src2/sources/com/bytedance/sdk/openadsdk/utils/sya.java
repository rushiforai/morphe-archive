package com.bytedance.sdk.openadsdk.utils;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.util.DisplayMetrics;

/* loaded from: classes2.dex */
public class sya {
    public static int ycx = -1;

    public static int ycx(Context context, int i5, int i11) {
        int iYcx = ycx(context, i11);
        if (iYcx == -1) {
            return ycx;
        }
        return Math.max(Math.min(i5 > 655 ? Math.round((i5 / 728.0f) * 90.0f) : i5 > 632 ? 81 : i5 > 526 ? Math.round((i5 / 468.0f) * 60.0f) : i5 > 432 ? 68 : Math.round((i5 / 320.0f) * 50.0f), Math.min(90, Math.round(iYcx * 0.15f))), 50);
    }

    public static int ycx(Context context, int i5) {
        DisplayMetrics displayMetrics;
        Configuration configuration;
        if (context != null) {
            try {
                if (context.getApplicationContext() != null) {
                    context = context.getApplicationContext();
                }
                Resources resources = context.getResources();
                if (resources != null && (displayMetrics = resources.getDisplayMetrics()) != null && (configuration = resources.getConfiguration()) != null) {
                    int i11 = configuration.orientation;
                    if (i5 == 0) {
                        i5 = i11;
                    }
                    if (i5 == i11) {
                        return Math.round(displayMetrics.heightPixels / displayMetrics.density);
                    }
                    return Math.round(displayMetrics.widthPixels / displayMetrics.density);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "euoshRe1f8KiS9lTiQOTIUHrGIEKsHo=", "XOs5pgCubMKOYtJUixm0HFTKPQ==", 58);
                return ycx;
            }
        }
        return ycx;
    }
}
