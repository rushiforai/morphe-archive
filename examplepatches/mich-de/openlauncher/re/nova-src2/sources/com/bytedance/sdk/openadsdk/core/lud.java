package com.bytedance.sdk.openadsdk.core;

import com.tiktok.util.TTConst;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud {
    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, String str, int i5, JSONObject jSONObject) {
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        try {
            jSONObject.put(TTConst.TRACK_TYPE, i5);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "eOEjgwauffOSS9RWiQM=", "VOAIgwayfQ==", 27);
        }
        com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, str, "convert_track", jSONObject);
    }
}
