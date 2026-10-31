package com.bytedance.sdk.openadsdk.utils;

import android.text.TextUtils;
import java.util.Iterator;

/* loaded from: classes2.dex */
public class lt {
    public static String ycx(String str) {
        if (!com.bytedance.sdk.component.utils.syc.sya() || TextUtils.isEmpty(str)) {
            return str;
        }
        com.bytedance.sdk.openadsdk.core.model.jc jcVar = new com.bytedance.sdk.openadsdk.core.model.jc(com.bytedance.sdk.openadsdk.core.jc.zb().xkz());
        StringBuilder sb2 = new StringBuilder(str);
        Iterator<String> it = jcVar.zb().iterator();
        while (it.hasNext()) {
            if (sb2.toString().contains(it.next())) {
                if (sb2.toString().contains("?")) {
                    sb2.append("&");
                    sb2.append(jcVar.ycx());
                } else {
                    sb2.append("?");
                    sb2.append(jcVar.ycx());
                }
            }
        }
        return sb2.toString();
    }
}
