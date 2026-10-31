package com.bytedance.sdk.openadsdk.utils;

import android.content.Context;

/* loaded from: classes2.dex */
public class hf {
    public static String ycx(Context context) {
        int iYcx = com.bytedance.sdk.component.utils.hf.ycx(context, 0L);
        return iYcx != 2 ? iYcx != 3 ? iYcx != 4 ? iYcx != 5 ? iYcx != 6 ? "mobile" : "5g" : "4g" : "wifi" : "3g" : "2g";
    }
}
