package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.openadsdk.core.kgy;
import java.lang.ref.WeakReference;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul extends com.bytedance.sdk.component.ycx.dj<JSONObject, JSONObject> {
    private final WeakReference<kgy> ycx;

    public ul(kgy kgyVar) {
        this.ycx = new WeakReference<>(kgyVar);
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, kgy kgyVar) {
        sycVar.ycx("instantPageLoad", new ul(kgyVar));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        kgy kgyVar = this.ycx.get();
        if (kgyVar != null) {
            kgyVar.ycx();
        }
        return new JSONObject();
    }
}
