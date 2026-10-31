package com.bytedance.sdk.component.adexpress.dj;

import android.text.TextUtils;

/* loaded from: classes2.dex */
public class lt {
    public static boolean ycx(String str) {
        return TextUtils.equals(str, "fullscreen_interstitial_ad") || TextUtils.equals(str, "rewarded_video");
    }

    public static boolean zb(String str) {
        return com.bytedance.sdk.component.adexpress.dj.zb() && ycx(str);
    }
}
