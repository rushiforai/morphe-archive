package com.bytedance.sdk.openadsdk.core.settings;

import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.settings.jc;
import com.bytedance.sdk.openadsdk.core.settings.lud;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx extends jc {
    public ycx() {
        super(new jc.ycx() { // from class: com.bytedance.sdk.openadsdk.core.settings.ycx.1
            @Override // com.bytedance.sdk.openadsdk.core.settings.jc.ycx
            public void ycx() {
            }

            @Override // com.bytedance.sdk.openadsdk.core.settings.jc.ycx
            public void zb() {
            }
        });
    }

    @Override // com.bytedance.sdk.openadsdk.core.settings.jc
    public String ycx() {
        try {
            if (pmi.ycx() == null || thx.ycx(pmi.ycx())) {
                return "tt_set_apm.prop";
            }
            return "tt_set_apm_" + thx.sya(pmi.ycx()) + ".prop";
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "et4Apgaofc6OTcQ=", "XOs5uQy/aMumQ9tYohCtLQ==", 38);
            return "tt_set_apm";
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.settings.lud
    public void ycx(JSONObject jSONObject) {
        lud.ycx ycxVarZb = zb();
        if (jSONObject.has("apm_url")) {
            ycxVarZb.ycx("apm_url", jSONObject.optString("apm_url"));
        }
        if (jSONObject.has("perf_con")) {
            try {
                JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("perf_con");
                if (jSONObjectOptJSONObject != null && jSONObjectOptJSONObject.has("perf_con_apm")) {
                    ycxVarZb.ycx("perf_con_apm", jSONObjectOptJSONObject.optInt("perf_con_apm"));
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "et4Apgaofc6OTcQ=", "SO87kDC5e9GFWPNcmBA=", 63);
            }
        }
        ycxVarZb.ycx();
        lud();
    }
}
