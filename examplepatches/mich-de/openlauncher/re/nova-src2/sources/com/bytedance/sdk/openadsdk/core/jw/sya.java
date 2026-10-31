package com.bytedance.sdk.openadsdk.core.jw;

import com.bytedance.sdk.component.ul.zb.dj;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.tn;
import com.tiktok.util.TTConst;
import java.io.IOException;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    public static void ycx(String str, long j11) throws JSONException {
        JSONObject jSONObjectZb = zb(str, j11);
        dj djVarZb = com.bytedance.sdk.openadsdk.htf.zb.zb().sya().zb();
        djVarZb.sya(oby.dj("/api/ad/union/sdk/stats/"));
        djVarZb.lud(jSONObjectZb.toString());
        djVarZb.ycx(6);
        djVarZb.zb("uploadFrequentEvent");
        djVarZb.zb(new com.bytedance.sdk.component.ul.ycx.ycx() { // from class: com.bytedance.sdk.openadsdk.core.jw.sya.1
            @Override // com.bytedance.sdk.component.ul.ycx.ycx
            public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, com.bytedance.sdk.component.ul.zb zbVar) {
            }

            @Override // com.bytedance.sdk.component.ul.ycx.ycx
            public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, IOException iOException) {
                iOException.getMessage();
                if (syaVar != null) {
                    tn.ycx(syaVar.lt());
                }
            }
        });
    }

    private static JSONObject zb(String str, long j11) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(TTConst.TRACK_TYPE, "over_freq");
            jSONObject.put("rit", str);
            jSONObject.put("ad_sdk_version", BuildConfig.VERSION_NAME);
            jSONObject.put("timestamp", j11);
            return jSONObject;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V6D+QEqlsyYNT", "ffwohBa5Z9OjS9tRqQelJk/GKJkTuXs=", "WfskmQeMZtSUaNhZlQ==", 78);
            return jSONObject;
        }
    }
}
