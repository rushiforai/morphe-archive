package com.bytedance.sdk.openadsdk.ok.ycx;

import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt extends com.bytedance.sdk.component.ycx.dj<JSONObject, JSONObject> {
    private JSONObject ycx;

    public lt(JSONObject jSONObject) {
        this.ycx = jSONObject;
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, JSONObject jSONObject) {
        sycVar.ycx("getData", new lt(jSONObject));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        return com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(this.ycx, jSONObject);
    }
}
