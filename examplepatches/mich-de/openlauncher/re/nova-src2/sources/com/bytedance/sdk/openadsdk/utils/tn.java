package com.bytedance.sdk.openadsdk.utils;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class tn {
    public static final String[] sya = {"api16-access-ttp.tiktokpangle.us", "api16-access-ttp-b.tiktokpangle.us", "api16-access-ttp.tiktokpangle-b.us", "api16-access-ttp-b.tiktokpangle-b.us"};
    public static int ycx = Integer.MIN_VALUE;

    /* renamed from: zb, reason: collision with root package name */
    public static int f27177zb = Integer.MIN_VALUE;

    public static String ycx() {
        if (ycx == Integer.MIN_VALUE) {
            ycx = com.bytedance.sdk.openadsdk.core.jc.lud();
        }
        if (ycx < 0) {
            ycx = 0;
        }
        String[] strArr = sya;
        try {
            return strArr[ycx % strArr.length];
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "des5oBe1ZdQ=", "XOs5uQy/aMukRdpchR8=", 46);
            return strArr[0];
        }
    }

    public static synchronized void zb() {
        if (f27177zb == 0) {
            return;
        }
        f27177zb = 0;
        com.bytedance.sdk.openadsdk.core.jc.zb(0);
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x0016, code lost:
    
        r2 = com.bytedance.sdk.openadsdk.utils.tn.ycx + 1;
        com.bytedance.sdk.openadsdk.utils.tn.ycx = r2;
        com.bytedance.sdk.openadsdk.core.jc.ycx(r2);
     */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0046 A[Catch: all -> 0x0044, TryCatch #1 {all -> 0x0044, blocks: (B:18:0x0033, B:20:0x003b, B:25:0x0046, B:27:0x004c, B:28:0x0052, B:30:0x005b, B:31:0x0078, B:17:0x0025, B:8:0x0009, B:10:0x000e, B:12:0x0016), top: B:36:0x0009, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x004c A[Catch: all -> 0x0044, TryCatch #1 {all -> 0x0044, blocks: (B:18:0x0033, B:20:0x003b, B:25:0x0046, B:27:0x004c, B:28:0x0052, B:30:0x005b, B:31:0x0078, B:17:0x0025, B:8:0x0009, B:10:0x000e, B:12:0x0016), top: B:36:0x0009, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x005b A[Catch: all -> 0x0044, TryCatch #1 {all -> 0x0044, blocks: (B:18:0x0033, B:20:0x003b, B:25:0x0046, B:27:0x004c, B:28:0x0052, B:30:0x005b, B:31:0x0078, B:17:0x0025, B:8:0x0009, B:10:0x000e, B:12:0x0016), top: B:36:0x0009, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static synchronized void ycx(String str) {
        int i5;
        if (str == null) {
            return;
        }
        int i11 = 0;
        while (true) {
            try {
                try {
                    String[] strArr = sya;
                    if (i11 >= strArr.length) {
                        break;
                    } else if (str.contains(strArr[i11])) {
                        break;
                    } else {
                        i11++;
                    }
                } finally {
                    if (!str.contains("/api/ad/union/sdk/settings/")) {
                        if (f27177zb == Integer.MIN_VALUE) {
                        }
                        i5 = f27177zb + 1;
                        f27177zb = i5;
                        if (i5 >= 3) {
                        }
                        com.bytedance.sdk.openadsdk.core.jc.zb(f27177zb);
                    }
                }
            } catch (Throwable th2) {
            }
        }
        if (!str.contains("/api/ad/union/sdk/settings/") || str.contains("/api/ad/union/sdk/strategies/adn")) {
            if (f27177zb == Integer.MIN_VALUE) {
                f27177zb = com.bytedance.sdk.openadsdk.core.jc.lt();
            }
            i5 = f27177zb + 1;
            f27177zb = i5;
            if (i5 >= 3) {
                final String strOby = com.bytedance.sdk.openadsdk.core.settings.ea.zb().oby();
                final int i12 = f27177zb;
                com.bytedance.sdk.openadsdk.core.settings.ea.zb().ag();
                f27177zb = 0;
                com.bytedance.sdk.openadsdk.dy.dj.ycx("clear_domain", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.utils.tn.1
                    @Override // com.bytedance.sdk.openadsdk.dy.zb
                    public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                        JSONObject jSONObject = new JSONObject();
                        try {
                            jSONObject.put("domain", strOby);
                            jSONObject.put("times", i12);
                        } catch (Exception e3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "des5oBe1ZdTEGw==", "XOs5uQy7WtOBXsQ=", 86);
                        }
                        return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("clear_domain").zb(jSONObject.toString());
                    }
                });
            }
            com.bytedance.sdk.openadsdk.core.jc.zb(f27177zb);
        }
    }

    public static void ycx(com.bytedance.sdk.component.jw.fby fbyVar, String str) {
        if (TextUtils.isEmpty(str) || fbyVar == null) {
            return;
        }
        try {
            JSONObject jSONObject = (JSONObject) com.bytedance.sdk.openadsdk.dv.lud.ycx("pag_additional_headers", (Object) null, com.bytedance.sdk.openadsdk.dv.zb.ycx);
            HashMap map = new HashMap();
            boolean zOptBoolean = false;
            if (jSONObject != null) {
                zOptBoolean = jSONObject.optBoolean("enable", false);
                JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("header_value");
                if (jSONObjectOptJSONObject != null) {
                    Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                    while (itKeys.hasNext()) {
                        String next = itKeys.next();
                        String strOptString = jSONObjectOptJSONObject.optString(next);
                        if (!TextUtils.isEmpty(next) && !TextUtils.isEmpty(strOptString)) {
                            map.put(next, strOptString);
                        }
                    }
                }
            }
            if (!zOptBoolean) {
                HashMap map2 = new HashMap();
                map2.put("Referer", TTAdConstant.REQUEST_HEAD_REFERER);
                fbyVar.ycx(str, map2);
            } else if (!map.isEmpty()) {
                fbyVar.ycx(str, map);
            } else {
                fbyVar.a_(str);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "des5oBe1ZdQ=", "V+EskTauZfCJXt9viRelOg==", 160);
            HashMap map3 = new HashMap();
            map3.put("Referer", TTAdConstant.REQUEST_HEAD_REFERER);
            fbyVar.ycx(str, map3);
        }
    }
}
