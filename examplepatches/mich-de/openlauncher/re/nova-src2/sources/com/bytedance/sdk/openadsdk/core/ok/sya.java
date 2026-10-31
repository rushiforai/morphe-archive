package com.bytedance.sdk.openadsdk.core.ok;

import android.text.TextUtils;
import android.view.MotionEvent;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.lud;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.pgl.ssdk.ces.out.PglSSManager;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    private static boolean ycx = false;

    public static long dj() {
        if (pmi.dj().duz()) {
            return zb.zb().lt();
        }
        return 0L;
    }

    public static String lt() {
        if (pmi.dj().duz()) {
            return zb.zb().dj();
        }
        return null;
    }

    public static int lud() {
        if (pmi.dj().duz()) {
            return zb.zb().ul();
        }
        return 6;
    }

    public static String sya() {
        return pmi.dj().duz() ? zb.zb().lud() : b.f42142b;
    }

    public static void ycx() {
        if (!ycx && pmi.dj().duz()) {
            zb.zb();
            ycx = zb.zb().sya();
        }
    }

    public static void zb(String str) {
        if (TextUtils.isEmpty(str) || !pmi.dj().duz()) {
            return;
        }
        zb.zb().zb(str);
    }

    public static void zb() {
        if (pmi.dj().duz()) {
            zb.zb().ycx();
        }
    }

    public static void ycx(String str) {
        if (pmi.dj().duz()) {
            zb.zb().ycx(str);
        }
    }

    public static void ycx(Map<String, Object> map) {
        if (pmi.dj().duz()) {
            zb.zb().ycx(map);
        }
    }

    public static void ycx(tn tnVar, String str) {
        long jOptLong;
        long jOptLong2;
        long jOptLong3;
        Object obj;
        if (pmi.dj().duz()) {
            HashMap map = new HashMap();
            map.put("ad_sdk_version", BuildConfig.VERSION_NAME);
            map.put("au_show", str);
            if (tnVar != null) {
                String strAc = tnVar.ac();
                String strOptString = "-1";
                if (!TextUtils.isEmpty(strAc)) {
                    map.put("request_id", strAc);
                } else {
                    map.put("request_id", "-1");
                }
                try {
                    long j11 = -1;
                    if (tnVar.pu() != null) {
                        jOptLong = tnVar.pu().optLong("ad_id", -1L);
                        jOptLong2 = tnVar.pu().optLong("rit", -1L);
                        jOptLong3 = tnVar.pu().optLong("ad_slot_type", -1L);
                        strOptString = tnVar.pu().optString("ad_type", "-1");
                    } else {
                        jOptLong = -1;
                        jOptLong2 = -1;
                        jOptLong3 = -1;
                    }
                    map.put("ad_id", Long.valueOf(jOptLong));
                    map.put("rit", Long.valueOf(jOptLong2));
                    map.put("ad_slot_type", Long.valueOf(jOptLong3));
                    map.put("ad_type", strOptString);
                    Map<String, Object> mapAb = tnVar.ab();
                    if (mapAb != null && (obj = mapAb.get(TTAdConstant.SDK_BIDDING_TYPE)) != null) {
                        j11 = Long.parseLong(obj.toString());
                    }
                    map.put(TTAdConstant.SDK_BIDDING_TYPE, Long.valueOf(j11));
                    zb.zb().ycx(PglSSManager.REPORT_SCENE_ADSHOW, map);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiW", "aOsupge3QcKMWtJPuQWpJA==", "Ses9mhGoWsKDY9lbgw==", 114);
                }
            }
        }
    }

    public static Map<String, String> ycx(String str, String str2) {
        if (pmi.dj().duz()) {
            return zb.zb().ycx(str, str2 != null ? str2.getBytes() : new byte[0]);
        }
        return new HashMap();
    }

    public static void ycx(MotionEvent motionEvent) {
        if (pmi.dj().duz()) {
            zb.zb().ycx(motionEvent);
        }
    }

    public static void ycx(JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            return;
        }
        try {
            if (pmi.dj().duz()) {
                ycx();
                if (lud() == 0) {
                    jSONObject.put("sec_did", zb.zb().dj());
                    String strYcx = lud.ycx(jSONObject.toString());
                    Map<String, String> mapYcx = zb.zb().ycx("https://api16-access-sg.pangle.io/api/ad/union/sdk/get_ads/?aid=1371&device_platform=android&version_code=4250", strYcx != null ? strYcx.getBytes() : new byte[0]);
                    if (mapYcx != null && mapYcx.size() > 0) {
                        for (String str : mapYcx.keySet()) {
                            jSONObject.put(str, mapYcx.get(str));
                        }
                        jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "https://api16-access-sg.pangle.io/api/ad/union/sdk/get_ads/?aid=1371&device_platform=android&version_code=4250");
                        jSONObject.put("pangle_m", strYcx);
                    } else {
                        jSONObject.put("pglx", "8");
                    }
                    jSONObject.put("ec", zb.zb().lt());
                    return;
                }
                jSONObject.put("pglx", String.valueOf(lud()));
                return;
            }
            jSONObject.put("pglx", "6");
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiW", "aOsupge3QcKMWtJPuQWpJA==", "WecpkQqybvOPQdJToQKzLFDdJJIN", 186);
            htf.sya("SecSdkHelperUtil", th2.getMessage());
            try {
                jSONObject.put("pglx", "7");
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiW", "aOsupge3QcKMWtJPuQWpJA==", "WecpkQqybvOPQdJToQKzLFDdJJIN", 190);
            }
        }
    }
}
