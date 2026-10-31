package com.bytedance.sdk.openadsdk.component.reward.sya;

import com.bytedance.sdk.openadsdk.core.model.hf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.fyber.inneractive.sdk.activities.InneractiveRichMediaVideoPlayerActivityCore;
import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby {

    /* renamed from: dj, reason: collision with root package name */
    private static Integer f24894dj;
    private static Integer sya;
    private static Boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static Integer f24895zb;

    public static int dj() {
        if (sya == null) {
            int i5 = 1;
            int iYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("unify_web_config", "video_preload_type", 1);
            if (iYcx >= 0 && iYcx <= 2) {
                i5 = iYcx;
            }
            sya = Integer.valueOf(i5);
        }
        return sya.intValue();
    }

    public static int fby() {
        if (f24895zb == null) {
            int iYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("unify_web_close_backup_config", "interval", 10000);
            f24895zb = Integer.valueOf(iYcx > 1000 ? iYcx : 10000);
        }
        return f24895zb.intValue();
    }

    public static boolean lt() {
        return dj() == 1;
    }

    public static boolean lud() {
        return dj() == 1 || dj() == 2;
    }

    public static boolean sya() {
        return ycx() == 2;
    }

    public static boolean ul() {
        if (ycx == null) {
            ycx = Boolean.valueOf(com.bytedance.sdk.openadsdk.dv.lud.ycx("unify_web_close_backup_config", "enable", 1) == 1);
        }
        return ycx.booleanValue();
    }

    public static int ycx() {
        if (f24894dj == null) {
            int i5 = 2;
            int iYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("unify_web_refresh", 2);
            if (iYcx >= 0 && iYcx <= 2) {
                i5 = iYcx;
            }
            f24894dj = Integer.valueOf(i5);
        }
        return f24894dj.intValue();
    }

    public static boolean zb() {
        return ycx() == 1;
    }

    public static boolean ycx(tn tnVar) {
        if (tnVar == null) {
            return false;
        }
        boolean z11 = tnVar.aq() == 2;
        boolean z12 = tnVar.tx() == 11;
        boolean zWnd = tnVar.wnd();
        boolean zMu = tnVar.mu();
        hf hfVarLn = tnVar.ln();
        return (!z11 || !z12 || zWnd || zMu || (hfVarLn != null && (hfVarLn.ycx() == 1 || hfVarLn.ycx() == 2))) ? false : true;
    }

    public static void ycx(final int i5, final String str, final tn tnVar, final Map<String, String> map) {
        com.bytedance.sdk.openadsdk.dy.dj.ycx("unify_web_preload_video", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.fby.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("is_cache", i5);
                jSONObject.put(InneractiveRichMediaVideoPlayerActivityCore.VIDEO_URL, str);
                tn tnVar2 = tnVar;
                if (tnVar2 != null) {
                    jSONObject.put("req_id", tnVar2.ac());
                }
                Map map2 = map;
                if (map2 != null && !map2.isEmpty()) {
                    jSONObject.put("range", map.get("Range"));
                }
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("unify_web_preload_video").zb(jSONObject.toString());
            }
        });
    }
}
