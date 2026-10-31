package com.bytedance.sdk.openadsdk.common;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public class sya {
    private static String ycx;

    public static int dj() {
        return BuildConfig.VERSION_CODE;
    }

    public static String fby() {
        return com.bytedance.sdk.component.utils.pmi.ul(com.bytedance.sdk.openadsdk.core.pmi.ycx());
    }

    public static String jw() {
        try {
            if (!TextUtils.isEmpty(ycx)) {
                return ycx;
            }
            String strYcx = com.bytedance.sdk.openadsdk.core.jc.ycx("sdk_app_sha1", 259200000L);
            ycx = strYcx;
            if (ycx(strYcx)) {
                return ycx;
            }
            String strYcx2 = com.bytedance.sdk.component.utils.sya.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx());
            ycx = strYcx2;
            if (!ycx(strYcx2)) {
                return b.f42142b;
            }
            String upperCase = ycx.toUpperCase();
            ycx = upperCase;
            com.bytedance.sdk.openadsdk.core.jc.ycx("sdk_app_sha1", upperCase);
            return ycx;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "ev49vA26Zg==", "XOs5pgu9OA==", Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE);
            return b.f42142b;
        }
    }

    public static String lt() {
        return oby.fby();
    }

    public static long lud() {
        return oby.jc(BuildConfig.VERSION_NAME);
    }

    public static String sya() {
        return BuildConfig.VERSION_NAME;
    }

    public static String ul() {
        return com.bytedance.sdk.openadsdk.core.jc.zb().fby();
    }

    public static String ycx() {
        return "open_news";
    }

    public static String zb() {
        return "1371";
    }

    public static String ycx(Context context) {
        return com.bytedance.sdk.openadsdk.core.ry.ycx(context);
    }

    private static boolean ycx(String str) {
        String[] strArrSplit;
        if (!TextUtils.isEmpty(str) && (strArrSplit = str.split(":")) != null && strArrSplit.length >= 20) {
            for (String str2 : strArrSplit) {
                if (!"00".equals(str2)) {
                    return true;
                }
            }
        }
        return false;
    }
}
