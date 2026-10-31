package com.bytedance.sdk.component.ul.sya;

import android.text.TextUtils;
import com.tiktok.util.UrlConst;

/* loaded from: classes2.dex */
public class lt {
    public static boolean ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return str.startsWith("http://") || str.startsWith(UrlConst.HTTPS);
    }
}
