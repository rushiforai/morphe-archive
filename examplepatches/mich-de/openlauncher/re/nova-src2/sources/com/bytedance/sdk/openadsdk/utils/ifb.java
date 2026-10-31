package com.bytedance.sdk.openadsdk.utils;

import android.net.Uri;
import android.text.TextUtils;
import android.util.Base64;

/* loaded from: classes2.dex */
public class ifb {
    private static String ycx;

    public static boolean sya() {
        return false;
    }

    public static boolean ycx() {
        return com.bytedance.sdk.component.utils.syc.sya() && com.bytedance.sdk.openadsdk.core.jc.zb().wie() && com.bytedance.sdk.openadsdk.core.jc.zb().uh();
    }

    public static String zb() {
        if (TextUtils.isEmpty(ycx)) {
            ycx = new String(Base64.decode("ZGV2aWNlX2lk", 0));
        }
        return ycx;
    }

    public static String ycx(String str) {
        try {
            if (ycx()) {
                String strHtf = com.bytedance.sdk.openadsdk.core.jc.zb().htf();
                if (!TextUtils.isEmpty(strHtf)) {
                    return Uri.parse(str).buildUpon().appendQueryParameter(zb(), strHtf).appendQueryParameter("aid", "5001121").toString();
                }
            }
            return str;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+s+gSu5ZdeFWOJJhR2z", "Wv49kA24SMmZbthSniWhL3TgGIcP", 83);
            return str;
        }
    }
}
