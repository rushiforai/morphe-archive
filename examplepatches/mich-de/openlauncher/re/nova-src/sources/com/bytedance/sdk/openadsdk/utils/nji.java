package com.bytedance.sdk.openadsdk.utils;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.BuildConfig;

/* loaded from: classes2.dex */
public final class nji {
    public static String ycx() {
        String strZb = com.bytedance.sdk.openadsdk.uh.dj.ycx.zb("tt_ver", "old", BuildConfig.VERSION_NAME);
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("tt_ver", "old", BuildConfig.VERSION_NAME);
        return TextUtils.isEmpty(strZb) ? BuildConfig.VERSION_NAME : strZb;
    }
}
