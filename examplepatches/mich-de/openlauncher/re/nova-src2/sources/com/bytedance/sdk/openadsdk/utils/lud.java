package com.bytedance.sdk.openadsdk.utils;

import android.os.SystemClock;
import android.text.TextUtils;
import java.lang.ref.WeakReference;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud {
    private static boolean sya;
    private static WeakReference<com.bytedance.sdk.openadsdk.core.model.tn> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static long f27149zb;

    public static boolean sya() {
        WeakReference<com.bytedance.sdk.openadsdk.core.model.tn> weakReference = ycx;
        if (weakReference == null || weakReference.get() == null) {
            return false;
        }
        sya = true;
        return true;
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        com.bytedance.sdk.openadsdk.core.model.lt ltVarZnc = tnVar.znc();
        if (ltVarZnc == null || TextUtils.isEmpty(ltVarZnc.ycx())) {
            return;
        }
        ycx = new WeakReference<>(tnVar);
    }

    private static void zb(final long j11) {
        com.bytedance.sdk.openadsdk.core.model.tn tnVar;
        WeakReference<com.bytedance.sdk.openadsdk.core.model.tn> weakReference = ycx;
        if (weakReference == null || j11 <= 0 || (tnVar = weakReference.get()) == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), tnVar, tnVar.lud(), "store_duration", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.utils.lud.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
            public JSONObject zb() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("duration", j11);
                    return jSONObject;
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "ev49pheze8KvWtJTrhSoKU3nIoc3rmjEi0/FGd0=", "XOs5sBuoQ9SPRA==", 64);
                    return jSONObject;
                }
            }
        });
        ycx = null;
        sya = false;
    }

    public static void ycx(long j11) {
        zb(j11);
    }

    public static void ycx() {
        if (ycx == null || sya) {
            return;
        }
        if (f27149zb > 0) {
            zb(SystemClock.elapsedRealtime() - f27149zb);
        }
        ycx = null;
        f27149zb = 0L;
    }

    public static void zb() {
        if (ycx == null || sya) {
            return;
        }
        f27149zb = SystemClock.elapsedRealtime();
    }
}
