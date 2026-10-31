package com.bytedance.sdk.openadsdk.dy;

import android.os.SystemClock;
import android.text.TextUtils;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.CacheDirFactory;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.ry;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.File;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {
    private static volatile dj ycx;

    private dj() {
    }

    public static void dj() {
        ycx("disk_log", false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.7
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                File file = new File(CacheDirFactory.getRootDir());
                long j11 = 0;
                if (file.exists() && file.isDirectory()) {
                    for (File file2 : file.listFiles()) {
                        long jYcx = dj.ycx(file2);
                        j11 += jYcx;
                        jSONObject.put(file2.getName(), jYcx);
                    }
                }
                if (j11 < 524288000) {
                    return null;
                }
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("disk_log").zb(jSONObject.toString());
            }
        });
    }

    private boolean sya(com.bytedance.sdk.openadsdk.dy.ycx.dj djVar) {
        return djVar == null;
    }

    public static dj ycx() {
        if (ycx == null) {
            synchronized (dj.class) {
                try {
                    if (ycx == null) {
                        ycx = new dj();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public static void zb(final tn tnVar) {
        if (oby.ycx(tnVar) == null || TextUtils.isEmpty(tnVar.dw())) {
            return;
        }
        ycx("download_gecko_start", false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.14
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.kh());
                jSONObject.put("channel_name", tnVar.dw());
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("download_gecko_start").ycx(tnVar.tz()).zb(jSONObject.toString());
            }
        });
    }

    public void sya() {
        ycx("blind_mode_status", true, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.5
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("blind_mode_status");
            }
        });
    }

    public void zb(final com.bytedance.sdk.openadsdk.dy.ycx.dj djVar) {
        if (sya(djVar)) {
            return;
        }
        djVar.ycx("show_backup_endcard");
        pmi.lud().ycx(new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.17
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                return djVar;
            }
        });
    }

    public static void ycx(final tn tnVar) {
        if (tnVar == null) {
            return;
        }
        final long jCurrentTimeMillis = System.currentTimeMillis();
        ycx("bidding_receive", false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("reveice_ts", jCurrentTimeMillis);
                if (tnVar.tz() == 3) {
                    jSONObject.put("is_icon_only", tnVar.aeu() ? 1 : 0);
                }
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("bidding_receive").zb(jSONObject.toString());
            }
        });
    }

    public static void zb() {
        yzp.zb(new com.bytedance.sdk.component.fby.zb.sya("showFailLog") { // from class: com.bytedance.sdk.openadsdk.dy.dj.3
            @Override // java.lang.Runnable
            public void run() {
                try {
                    dj.ycx().ycx("show_fail_log", new JSONObject());
                } catch (Throwable th2) {
                    htf.sya("StatsLogManager", th2.getMessage());
                }
            }
        });
    }

    public static void ycx(tn tnVar, final long j11) {
        if (tnVar == null) {
            return;
        }
        ycx("bidding_load", false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.8
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("duration", j11);
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("bidding_load").zb(jSONObject.toString());
            }
        });
    }

    public static void ycx(final String str, final com.bytedance.sdk.openadsdk.dj.lud.zb.ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        ycx(str, false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.13
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObjectSya = ycxVar.sya();
                if (jSONObjectSya == null) {
                    jSONObjectSya = new JSONObject();
                }
                tn tnVarYcx = ycxVar.ycx();
                jSONObjectSya.put("req_id", tnVarYcx.ac());
                com.bytedance.sdk.openadsdk.dj.lud.zb.sya syaVarLud = ycxVar.lud();
                if (syaVarLud != null) {
                    syaVarLud.ycx(jSONObjectSya);
                }
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx(str).ycx(tnVarYcx.tz()).zb(jSONObjectSya.toString());
            }
        });
    }

    public static void ycx(final tn tnVar, final JSONObject jSONObject) {
        if (oby.ycx(tnVar) == null || TextUtils.isEmpty(tnVar.dw())) {
            return;
        }
        ycx("download_gecko_end", false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.15
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, tnVar.kh());
                jSONObject2.put("channel_name", tnVar.dw());
                jSONObject2.put("data", jSONObject);
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("download_gecko_end").ycx(tnVar.tz()).zb(jSONObject2.toString());
            }
        });
    }

    public void ycx(final com.bytedance.sdk.openadsdk.dy.ycx.dj djVar) {
        if (sya(djVar)) {
            return;
        }
        djVar.ycx("express_ad_render");
        pmi.lud().ycx(new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.16
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                return djVar;
            }
        });
    }

    public void ycx(final long j11, final long j12) {
        final long j13 = j12 - j11;
        ycx("general_label", false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.2
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                int i5 = !syc.f26177zb.get() ? 1 : 0;
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("starttime", j11);
                    jSONObject.put("endtime", j12);
                    jSONObject.put("start_type", i5);
                } catch (Throwable unused) {
                }
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("general_label").fby(String.valueOf(j13)).zb(jSONObject.toString());
            }
        });
    }

    public void ycx(final String str, final JSONObject jSONObject) {
        if (str == null || jSONObject == null) {
            return;
        }
        ycx(str, false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.4
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx(str).zb(jSONObject.toString());
            }
        });
    }

    public void ycx(final JSONObject jSONObject) {
        if (jSONObject == null) {
            htf.ycx("adRevenuePangle", "You must pass adRevenue json to pangle");
            return;
        }
        Object objOpt = jSONObject.opt("device_ad_mediation_platform");
        if (!(objOpt instanceof String) || TextUtils.isEmpty((String) objOpt)) {
            htf.ycx("adRevenuePangle", "You must pass device_ad_mediation_platform to pangle");
        } else {
            htf.ycx("adRevenuePangle", "pangle", "You successfully passed the parameters to pangle. The parameters are:", jSONObject);
            ycx("ad_revenue", true, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.6
                @Override // com.bytedance.sdk.openadsdk.dy.zb
                public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                    try {
                        jSONObject.put(DatabaseConstants.EVENT_FIELD, 272);
                        jSONObject.put("uuid", ry.sya(pmi.ycx()));
                        String strYcx = b.f42142b;
                        try {
                            if (ry.ycx(pmi.ycx()) != null) {
                                strYcx = ry.ycx(pmi.ycx());
                            }
                        } catch (Throwable th2) {
                            th2.getMessage();
                        }
                        jSONObject.put("device_id", strYcx);
                        jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android");
                        jSONObject.put("partner", "PangleSDK");
                    } catch (Throwable th3) {
                        th3.getMessage();
                    }
                    return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("ad_revenue").zb(jSONObject.toString());
                }
            });
        }
    }

    public static long ycx(File file) {
        if (file.isFile()) {
            return file.length();
        }
        long jYcx = 0;
        for (File file2 : file.listFiles()) {
            jYcx += ycx(file2);
        }
        return jYcx;
    }

    public static void ycx(String str, boolean z11, zb zbVar) {
        ycx(str, z11, -1, zbVar);
    }

    public static void ycx(String str, boolean z11, int i5, zb zbVar) {
        if (!TextUtils.isEmpty(str) && sya.ycx(str, i5)) {
            pmi.lud().ycx(zbVar, z11);
        }
    }

    public static void ycx(long j11, long j12, final String str, final int i5) {
        if (j11 == 0) {
            return;
        }
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        final long j13 = jElapsedRealtime - j11;
        final long j14 = jElapsedRealtime - j12;
        final long j15 = j12 - j11;
        ycx("ad_show_cost_time", false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.9
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("duration", j13);
                jSONObject.put("renderDuration", j14);
                jSONObject.put("showToRenderDuration", j15);
                jSONObject.put("tag", str);
                jSONObject.put("renderType", i5);
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("ad_show_cost_time").zb(jSONObject.toString());
            }
        });
    }

    public static void ycx(int i5, String str) {
        ycx(i5, str, 0, (String) null);
    }

    public static void ycx(final int i5, final String str, final int i11, final String str2) {
        ycx("ipv6_req", false, new zb<com.bytedance.sdk.openadsdk.dy.ycx.sya>() { // from class: com.bytedance.sdk.openadsdk.dy.dj.10
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                String str3;
                JSONObject jSONObject = new JSONObject();
                int i12 = i5;
                if (i12 == 1) {
                    str3 = "success";
                } else if (i12 == -1) {
                    jSONObject.put("error_code", i11);
                    jSONObject.put("error_msg", str2);
                    str3 = "fail";
                } else {
                    str3 = "start";
                }
                if (!TextUtils.isEmpty(str)) {
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
                }
                jSONObject.put("status", str3);
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("ipv6_req").zb(jSONObject.toString());
            }
        });
    }

    public static void ycx(final String str, final boolean z11) {
        ycx("img_error_param", false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.11
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("is_new", z11 ? 1 : 0);
                    jSONObject.put("msg", str);
                } catch (Throwable unused) {
                }
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("img_error_param").zb(jSONObject.toString());
            }
        });
    }

    public static void ycx(final boolean z11) {
        ycx("web_container_reuse", false, new zb() { // from class: com.bytedance.sdk.openadsdk.dy.dj.12
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("is_hit", z11 ? 1 : 0);
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("web_container_reuse").zb(jSONObject.toString());
            }
        });
    }
}
