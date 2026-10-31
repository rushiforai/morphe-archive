package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.openadsdk.core.kgy;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ry extends com.bytedance.sdk.component.ycx.dj<JSONObject, JSONObject> {
    private final kgy ycx;

    public ry(kgy kgyVar) {
        this.ycx = kgyVar;
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, kgy kgyVar) {
        sycVar.ycx("overlayRenderFinish", new ry(kgyVar));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        this.ycx.syc();
        return null;
    }
}
