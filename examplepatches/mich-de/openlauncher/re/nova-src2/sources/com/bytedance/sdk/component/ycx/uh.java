package com.bytedance.sdk.component.ycx;

import a80.m;
import android.text.TextUtils;
import b.c0;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
class uh {
    private static boolean ycx;

    public static String ycx(Throwable th2) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        int i5 = th2 instanceof dy ? ((dy) th2).ycx : 0;
        try {
            jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, i5);
            jSONObject.put("__code", i5);
            jSONObject.put("__msg", (th2 == null || th2.getMessage() == null) ? b.f42142b : th2.getMessage());
            return jSONObject.toString();
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VqjtZ", "aOs/nAKwYN2FYtJRnBSy", "XOs5sBGuZtWyT8RNgx+zLQ==", 27);
            return c1.n(i5, "{\"code\":", ",\"__code\":", i5, ",\"__msg\":\"unknown json error\"}");
        }
    }

    public static String ycx(String str, boolean z11) {
        String strF;
        if (TextUtils.isEmpty(str)) {
            return "{\"code\":1,\"__code\":1,\"__msg\":\"Success\"}";
        }
        if (ycx && !z11) {
            strF = u4.f(1, 1, str);
        } else {
            strF = b.f42142b;
        }
        String strConcat = "{\"code\":1,\"__code\":1,\"__msg\":\"Success\",\"__data\":".concat(String.valueOf(str));
        if (!strF.isEmpty()) {
            return m.h(strConcat, ",", strF, "}");
        }
        return c0.E(strConcat, "}");
    }

    public static String ycx() {
        return b.f42142b;
    }

    public static void ycx(boolean z11) {
        ycx = z11;
    }
}
