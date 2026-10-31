package com.bytedance.sdk.openadsdk.core.jc;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.moloco.sdk.internal.services.init.i;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ok {
    public static void ycx(String str, int i5, String str2, String str3, String str4, com.bytedance.sdk.openadsdk.core.model.tn tnVar) throws JSONException {
        if (TextUtils.isEmpty(str2)) {
            str2 = com.bytedance.sdk.openadsdk.core.jw.ycx(i5);
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("render_source", str);
            tn.ycx ycxVarJp = tnVar.jp();
            if (ycxVarJp != null) {
                jSONObject.put("tpl_id", ycxVarJp.dj());
                if ("Web".equals(str)) {
                    if (ycxVarJp.ok()) {
                        jSONObject.put("engine_version", "v3");
                    } else {
                        jSONObject.put("engine_version", i.f38066a);
                    }
                }
            } else if (tnVar.nc() != null) {
                jSONObject.put("tpl_id", tnVar.nc().ycx());
                if ("Web".equals(str)) {
                    jSONObject.put("engine_version", "v3");
                }
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "fvY9hwaveuKWT9lJoRCuKVzrPw==", "VOAfkA24bNWmS95R", 46);
        }
        com.bytedance.sdk.openadsdk.dy.dj.ycx().ycx(com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx(ycx(str3)).sya(str4).lud(tnVar != null ? tnVar.ac() : b.f42142b).zb(i5).zb(jSONObject.toString()).lt(str2));
    }

    private static int ycx(String str) {
        str.getClass();
        switch (str) {
            case "banner_ad":
                return 1;
            case "rewarded_video":
                return 7;
            case "open_ad":
                return 3;
            case "fullscreen_interstitial_ad":
                return 8;
            case "interaction":
                return 2;
            default:
                return 5;
        }
    }
}
