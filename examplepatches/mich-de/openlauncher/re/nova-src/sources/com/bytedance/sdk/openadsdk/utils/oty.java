package com.bytedance.sdk.openadsdk.utils;

import android.os.Build;
import java.util.Locale;

/* loaded from: classes2.dex */
public class oty {
    public static boolean ycx() {
        int i5 = Build.VERSION.SDK_INT;
        if (i5 < 33) {
            return i5 >= 32 && ycx("T", Build.VERSION.CODENAME);
        }
        return true;
    }

    public static boolean ycx(String str, String str2) {
        if ("REL".equals(str2)) {
            return false;
        }
        Locale locale = Locale.ROOT;
        return str2.toUpperCase(locale).compareTo(str.toUpperCase(locale)) >= 0;
    }
}
