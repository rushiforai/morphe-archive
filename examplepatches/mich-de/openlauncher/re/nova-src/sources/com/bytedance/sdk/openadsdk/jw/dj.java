package com.bytedance.sdk.openadsdk.jw;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.utils.ifb;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Map;

/* loaded from: classes2.dex */
public final class dj extends ycx {
    public static sya ycx;

    public static String ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, String str) {
        sya syaVarYcx;
        Map map;
        if (!ifb.sya() || (syaVarYcx = zb.ycx("net")) == null || (map = (Map) syaVarYcx.ycx(1, str)) == null) {
            return str;
        }
        String str2 = (String) map.get(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        if (!TextUtils.isEmpty(str2)) {
            str = str2;
        }
        Map map2 = (Map) map.get("header");
        if (map2 != null) {
            for (String str3 : map2.keySet()) {
                syaVar.zb(str3, (String) map2.get(str3));
            }
        }
        return str;
    }
}
