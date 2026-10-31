package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.component.ycx.sya;
import com.bytedance.sdk.openadsdk.core.kgy;
import java.lang.ref.WeakReference;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya extends com.bytedance.sdk.component.ycx.sya<JSONObject, JSONObject> {
    private final WeakReference<kgy> ycx;

    public sya(kgy kgyVar) {
        this.ycx = new WeakReference<>(kgyVar);
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, final kgy kgyVar) {
        sycVar.ycx("newClickEvent", new sya.zb() { // from class: com.bytedance.sdk.openadsdk.ok.ycx.sya.1
            @Override // com.bytedance.sdk.component.ycx.sya.zb
            public com.bytedance.sdk.component.ycx.sya ycx() {
                return new sya(kgyVar);
            }
        });
    }

    @Override // com.bytedance.sdk.component.ycx.sya
    public void ycx(JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        kgy kgyVar = this.ycx.get();
        if (kgyVar == null) {
            sya();
        } else {
            kgyVar.ul(jSONObject);
        }
    }
}
