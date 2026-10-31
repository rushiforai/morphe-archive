package com.bytedance.sdk.openadsdk.dj;

import android.os.SystemClock;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc {
    /* JADX INFO: Access modifiers changed from: private */
    public static JSONObject zb(tn tnVar, String str, int i5, JSONObject jSONObject) {
        JSONObject jSONObject2 = new JSONObject();
        try {
            if (!TextUtils.isEmpty(str)) {
                jSONObject2.put("error_msg", str);
            }
            int i11 = 1;
            jSONObject2.put("ad_show_order", i5 + 1);
            jSONObject2.put("interaction_method", tnVar.dqs());
            jSONObject2.put("real_interaction_method", tnVar.iq());
            jSONObject2.put("give_up_reward", tnVar.wie() ? 1 : 2);
            if (!tnVar.dc()) {
                i11 = 2;
            }
            jSONObject2.put("has_reward", i11);
            if (jSONObject != null && jSONObject.length() > 0) {
                Iterator<String> itKeys = jSONObject.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    try {
                        jSONObject2.put(next, jSONObject.get(next));
                    } catch (JSONException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "eO8hmQG9asymX9lTiR2BJlriNI8Grg==", "WfskmQeMaMCjRcVYpgKvJg==", 140);
                    }
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "eO8hmQG9asymX9lTiR2BJlriNI8Grg==", "WfskmQeMaMCjRcVYpgKvJg==", 145);
        }
        return jSONObject2;
    }

    public static void ycx(tn tnVar, String str, String str2, String str3) {
        ycx(tnVar, str, str2, str3, null);
    }

    public static void ycx(tn tnVar, String str, String str2, String str3, JSONObject jSONObject) {
        ycx(tnVar, str, str2, str3, jSONObject, 0);
    }

    public static void ycx(final tn tnVar, String str, String str2, final String str3, final JSONObject jSONObject, final int i5) {
        if (tnVar == null || TextUtils.isEmpty(str)) {
            return;
        }
        sya.ycx(System.currentTimeMillis(), tnVar, str2, str, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.dj.jc.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject ycx() {
                return jc.zb(tnVar, str3, i5, jSONObject);
            }

            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() throws JSONException {
                if (jSONObject == null) {
                    return super.zb();
                }
                long jPmi = tnVar.pmi();
                if (jPmi < 0) {
                    long jJw = tnVar.jw();
                    if (jJw > 0) {
                        long jElapsedRealtime = SystemClock.elapsedRealtime() - jJw;
                        if (jElapsedRealtime > 0) {
                            jPmi = jElapsedRealtime;
                        }
                    }
                }
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jSONObject2.put("duration", jPmi);
                    return jSONObject2;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "eO8hmQG9asymX9lTiR2BJlriNI8Gri2W", "XOs5sBuoQ9SPRA==", 94);
                    htf.sya(e3.getMessage(), new Object[0]);
                    return jSONObject2;
                }
            }
        });
    }

    public static void ycx(String str, boolean z11, boolean z12, tn tnVar) {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("has_close_invoke", z11 ? 1 : 2);
            jSONObject.put("has_show_invoke", z12 ? 1 : 2);
            ycx(tnVar, str, tnVar != null ? tnVar.lud() : null, null, jSONObject);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "eO8hmQG9asymX9lTiR2BJlriNI8Grg==", "Ses9mhGoWs+PXfhPrx2vO14=", Sdk.SDKError.Reason.AD_IS_LOADING_VALUE);
        }
    }

    public static void ycx(tn tnVar, String str, int i5) {
        ycx(tnVar, n.f39150d.equals(str) ? "close_listen_empty" : "show_listen_empty", tnVar != null ? tnVar.lud() : null, null, null, i5);
    }
}
