package com.bytedance.sdk.openadsdk.utils;

import android.os.SystemClock;
import android.text.TextUtils;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class aeu {

    public static final class ycx {
        static final aeu ycx = new aeu();
    }

    public void zb() {
        try {
            final JSONObject jSONObject = (JSONObject) com.bytedance.sdk.openadsdk.dv.lud.ycx("detect_cls_config", (Object) null, com.bytedance.sdk.openadsdk.dv.zb.ycx);
            if (jSONObject.optBoolean("enable", false)) {
                com.bytedance.sdk.openadsdk.core.syc.zb().postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.utils.aeu.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            aeu.this.ycx(jSONObject);
                        } catch (Throwable unused) {
                        }
                    }
                }, jSONObject.optLong("delay", 5000L));
            }
        } catch (Throwable unused) {
        }
    }

    private aeu() {
    }

    public static aeu ycx() {
        return ycx.ycx;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(JSONObject jSONObject) {
        if (jSONObject == null || jSONObject.length() == 0) {
            return;
        }
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            try {
                String next = itKeys.next();
                if (!TextUtils.isEmpty(next) && !"enable".equalsIgnoreCase(next) && !"delay".equalsIgnoreCase(next)) {
                    ycx(next, jSONObject.optJSONArray(next));
                }
            } catch (Throwable unused) {
            }
        }
    }

    private void ycx(String str, JSONArray jSONArray) {
        if (TextUtils.isEmpty(str) || jSONArray == null || jSONArray.length() == 0) {
            return;
        }
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        int length = jSONArray.length();
        boolean z11 = false;
        int i5 = 0;
        boolean z12 = false;
        while (true) {
            if (i5 >= length) {
                z11 = z12;
                break;
            }
            String strOptString = jSONArray.optString(i5);
            if (!TextUtils.isEmpty(strOptString) && !ycx(strOptString)) {
                break;
            }
            if (i5 == length - 1) {
                z12 = true;
            }
            i5++;
        }
        ycx(str, z11, SystemClock.elapsedRealtime() - jElapsedRealtime);
    }

    private void ycx(final String str, final boolean z11, final long j11) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        com.bytedance.sdk.openadsdk.dy.dj.ycx("detect_some_sdk", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.utils.aeu.2
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.putOpt(PendingUpgradeStore.KEY_NAME, str);
                jSONObject.putOpt("duration", Long.valueOf(j11));
                jSONObject.putOpt("exist", Integer.valueOf(z11 ? 1 : 0));
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("detect_some_sdk").zb(jSONObject.toString());
            }
        });
    }

    private static boolean ycx(String str) {
        try {
            Class.forName(str).toString();
            return true;
        } catch (Throwable unused) {
            return false;
        }
    }
}
