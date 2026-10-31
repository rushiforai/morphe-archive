package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.component.ycx.sya;
import com.bytedance.sdk.openadsdk.core.kgy;
import java.lang.ref.WeakReference;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb extends com.bytedance.sdk.component.ycx.sya<JSONObject, JSONObject> {
    private final WeakReference<kgy> ycx;

    public zb(kgy kgyVar) {
        this.ycx = new WeakReference<>(kgyVar);
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, final kgy kgyVar) {
        sycVar.ycx("interstitial_webview_close", new sya.zb() { // from class: com.bytedance.sdk.openadsdk.ok.ycx.zb.1
            @Override // com.bytedance.sdk.component.ycx.sya.zb
            public com.bytedance.sdk.component.ycx.sya ycx() {
                return new zb(kgyVar);
            }
        });
    }

    @Override // com.bytedance.sdk.component.ycx.sya
    public void ycx(JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        com.bytedance.sdk.openadsdk.core.jc.zb().wie();
        kgy kgyVar = this.ycx.get();
        if (kgyVar == null) {
            sya();
        } else {
            kgyVar.jc();
        }
    }
}
