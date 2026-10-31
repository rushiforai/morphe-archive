package com.bytedance.sdk.component.adexpress.dynamic.lud;

import com.bytedance.sdk.component.adexpress.zb.ry;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul implements fby {
    private com.bytedance.sdk.component.adexpress.dynamic.lt.zb ycx;

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(ry ryVar) {
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVarYcx;
        try {
            JSONObject jSONObjectSya = ryVar.sya();
            JSONObject jSONObject = new JSONObject(jSONObjectSya.optString("template_Plugin"));
            JSONObject jSONObjectOptJSONObject = jSONObjectSya.optJSONObject("creative");
            fbyVarYcx = new lt(jSONObject, jSONObjectOptJSONObject, jSONObjectSya.optJSONObject("AdSize"), new JSONObject(jSONObjectSya.optString("diff_template_Plugin"))).ycx(ryVar.zb(), ryVar.jc(), jSONObjectOptJSONObject.optDouble("score_exact_i18n"), jSONObjectOptJSONObject.optString("comment_num_i18n"), ryVar);
            try {
                JSONObject jSONObject2 = new JSONObject(jSONObjectOptJSONObject.optString("dynamic_creative"));
                fbyVarYcx.ycx(jSONObject2.optString("color"));
                fbyVarYcx.ycx(jSONObject2.optJSONArray("material_center"));
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "f/cjlA61aumBXt5LiSGhOkjrPw==", "S+8/hgaVZ9OFWNlcgA==", 66);
            }
        } catch (Exception e3) {
            e = e3;
        }
        try {
            this.ycx.ycx(fbyVarYcx);
        } catch (Exception e11) {
            e = e11;
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "f/cjlA61aumBXt5LiSGhOkjrPw==", "S+8/hgaVZ9OFWNlcgA==", 70);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.lud.fby
    public void ycx(com.bytedance.sdk.component.adexpress.dynamic.lt.zb zbVar) {
        this.ycx = zbVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.lud.fby
    public void ycx(final ry ryVar) {
        if (ryVar.ok() == 1) {
            zb(ryVar);
        } else {
            com.bytedance.sdk.component.adexpress.dj.dj.ycx(new com.bytedance.sdk.component.fby.zb.sya("dynamicparse") { // from class: com.bytedance.sdk.component.adexpress.dynamic.lud.ul.1
                @Override // java.lang.Runnable
                public void run() {
                    ul.this.zb(ryVar);
                }
            }, 5);
        }
    }
}
