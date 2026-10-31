package com.bytedance.sdk.openadsdk.core.ry;

import android.text.TextUtils;
import b.u4;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.tiktok.util.UrlConst;

/* loaded from: classes2.dex */
public class lud {
    public static String ycx(String str) {
        return TextUtils.isEmpty(str) ? str : ycx(ea.zb().uh(), str);
    }

    public static String ycx(String str, String str2) {
        if (TextUtils.isEmpty(str2) || str2.startsWith("http://") || str2.startsWith(UrlConst.HTTPS)) {
            return str2;
        }
        if (!TextUtils.isEmpty(str) && !str.endsWith("/")) {
            return u4.m(str, "/static/", str2);
        }
        return u4.m(str, "static/", str2);
    }
}
