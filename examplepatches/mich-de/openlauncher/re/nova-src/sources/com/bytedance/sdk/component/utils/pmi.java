package com.bytedance.sdk.component.utils;

import android.content.Context;
import android.text.TextUtils;
import com.tiktok.util.UrlConst;

/* loaded from: classes2.dex */
public class pmi {
    public static boolean dj(Context context) {
        return sya(context) == 4;
    }

    public static boolean fby(Context context) {
        if (context == null) {
            return false;
        }
        int iSya = sya(context);
        return iSya == 2 || iSya == 3 || iSya == 4 || iSya == 5 || iSya == 6;
    }

    public static boolean lt(Context context) {
        return sya(context) == 6;
    }

    public static boolean lud(Context context) {
        return sya(context) == 5;
    }

    public static int sya(Context context) {
        return hf.ycx(context, 60000L);
    }

    public static String ul(Context context) {
        int iSya = sya(context);
        return iSya != 2 ? iSya != 3 ? iSya != 4 ? iSya != 5 ? iSya != 6 ? "mobile" : "5g" : "4g" : "wifi" : "3g" : "2g";
    }

    public static boolean ycx(Context context) {
        return sya(context) != 0;
    }

    public static int zb(Context context) {
        int iSya = sya(context);
        if (iSya == 1) {
            return 0;
        }
        if (iSya == 4) {
            return 1;
        }
        if (iSya == 5) {
            return 4;
        }
        if (iSya != 6) {
            return iSya;
        }
        return 6;
    }

    public static boolean ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return str.startsWith("http://") || str.startsWith(UrlConst.HTTPS);
    }
}
