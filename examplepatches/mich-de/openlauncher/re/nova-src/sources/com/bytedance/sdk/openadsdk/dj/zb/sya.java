package com.bytedance.sdk.openadsdk.dj.zb;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya implements zb {
    zb ycx;

    @Override // com.bytedance.sdk.openadsdk.dj.zb.zb
    public void ycx(JSONObject jSONObject, long j11) throws JSONException {
        zb zbVar = this.ycx;
        if (zbVar != null) {
            zbVar.ycx(jSONObject, j11);
        }
        if (j11 <= 0) {
            j11 = System.currentTimeMillis();
        }
        jSONObject.put("event_ts", j11);
    }
}
