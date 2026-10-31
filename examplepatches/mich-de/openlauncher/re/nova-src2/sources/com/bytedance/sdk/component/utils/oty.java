package com.bytedance.sdk.component.utils;

import android.content.Context;
import android.os.Build;
import android.text.TextUtils;

/* loaded from: classes2.dex */
public class oty {
    private static volatile String ycx;

    public static String ycx() {
        if (!TextUtils.isEmpty(ycx)) {
            return ycx;
        }
        String str = Build.MODEL;
        ycx = str;
        return str;
    }

    public static int ycx(Context context) {
        if (context == null) {
            return 0;
        }
        try {
            return context.getApplicationInfo().icon;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "b9oMhROVZ8GPf8NUgAI=", "XOs5tBOsZc6DS8NUgx+JK1Tg", 36);
            return 0;
        }
    }
}
