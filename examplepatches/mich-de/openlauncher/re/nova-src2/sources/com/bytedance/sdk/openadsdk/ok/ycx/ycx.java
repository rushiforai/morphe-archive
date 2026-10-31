package com.bytedance.sdk.openadsdk.ok.ycx;

import com.bytedance.sdk.component.ycx.sya;
import com.bytedance.sdk.openadsdk.core.kgy;
import java.lang.ref.WeakReference;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.sdk.component.ycx.sya<JSONObject, JSONObject> {
    private final WeakReference<kgy> ycx;

    public ycx(kgy kgyVar) {
        this.ycx = new WeakReference<>(kgyVar);
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, final kgy kgyVar) {
        sycVar.ycx("getNetworkData", new sya.zb() { // from class: com.bytedance.sdk.openadsdk.ok.ycx.ycx.1
            @Override // com.bytedance.sdk.component.ycx.sya.zb
            public com.bytedance.sdk.component.ycx.sya ycx() {
                return new ycx(kgyVar);
            }
        });
    }

    @Override // com.bytedance.sdk.component.ycx.sya
    public void ycx(JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        kgy kgyVar = this.ycx.get();
        if (kgyVar == null) {
            sya();
        } else {
            kgyVar.ycx(jSONObject, new com.bytedance.sdk.openadsdk.ry.dj() { // from class: com.bytedance.sdk.openadsdk.ok.ycx.ycx.2
                @Override // com.bytedance.sdk.openadsdk.ry.dj
                public void ycx(boolean z11, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
                    try {
                        JSONObject jSONObject2 = new JSONObject();
                        if (!z11) {
                            ycx.this.ycx((ycx) jSONObject2);
                        } else {
                            jSONObject2.put("creatives", kgy.ycx(ycxVar));
                            ycx.this.ycx((ycx) jSONObject2);
                        }
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4YCojpS6iqQUfJkwpRC2Fk=", "f+EKkBedbdSmWNhQohS0P1T8JrQQpWfErU/DVYMV5Ho=", "VOAMkS+zaMOFTg==", 76);
                    }
                }
            });
        }
    }
}
