package com.bytedance.sdk.openadsdk.core.syc.sya;

import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    public static void ycx(tn tnVar) {
        if (av.zb(tnVar)) {
            com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, "playable_preload", "preload_start", (JSONObject) null);
        }
    }

    public static void ycx(tn tnVar, long j11, long j12) throws JSONException {
        if (tnVar != null) {
            if (av.sya(tnVar) || av.zb(tnVar)) {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("loadzip_success_time", j11);
                    jSONObject.put("unzip_success_time", j12);
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CSRBrMn14xLzlyOHaU=", "a+IsjAK+ZcKlXNJTmA==", "VOAegAC/bNST", 53);
                    htf.ycx("PlayableEvent", "onSuccess json error", e3);
                }
                com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, "playable_preload", "preload_success", jSONObject);
            }
        }
    }

    public static void ycx(tn tnVar, int i5, String str) {
        if (tnVar != null) {
            if (av.sya(tnVar) || av.zb(tnVar)) {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("error_code", i5);
                    jSONObject.put("error_reason", str);
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CSRBrMn14xLzlyOHaU=", "a+IsjAK+ZcKlXNJTmA==", "VOALlAqw", 69);
                    htf.ycx("PlayableEvent", "onFail json error", e3);
                }
                com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, "playable_preload", "preload_fail", jSONObject);
            }
        }
    }
}
