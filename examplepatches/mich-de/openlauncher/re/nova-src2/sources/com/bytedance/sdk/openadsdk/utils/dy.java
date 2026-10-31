package com.bytedance.sdk.openadsdk.utils;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.core.model.ok;
import com.bytedance.sdk.openadsdk.oem.IPBroadcastReceiver;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class dy implements com.bytedance.sdk.openadsdk.oem.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private static String f27135dj;

    /* renamed from: lt, reason: collision with root package name */
    private static com.bytedance.sdk.openadsdk.core.syc.dj.zb f27136lt;
    private static boolean lud;
    private static Context sya;

    /* renamed from: ul, reason: collision with root package name */
    private static com.bytedance.sdk.openadsdk.component.reward.sya.zb f27137ul;
    private static final dy ycx = new dy();

    /* renamed from: zb, reason: collision with root package name */
    private static com.bytedance.sdk.openadsdk.core.model.tn f27138zb;

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, Context context, String str, com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar) {
        ycx(tnVar, context, str, zbVar, null);
    }

    public static void zb() {
        lud = true;
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, Context context, String str, com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar) {
        ycx(tnVar, context, str, null, zbVar);
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, Context context, String str, com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar, com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar2) {
        com.bytedance.sdk.openadsdk.core.model.bhi bhiVarOi = tnVar.oi();
        if (bhiVarOi != null) {
            if (bhiVarOi.ul() || bhiVarOi.fby()) {
                f27138zb = tnVar;
                sya = context;
                f27135dj = str;
                f27136lt = zbVar;
                f27137ul = zbVar2;
                IPBroadcastReceiver iPBroadcastReceiverYcx = IPBroadcastReceiver.ycx(context, tnVar);
                if (iPBroadcastReceiverYcx != null) {
                    iPBroadcastReceiverYcx.ycx(ycx);
                }
            }
        }
    }

    public static void ycx() {
        if (f27138zb == null) {
            return;
        }
        IPBroadcastReceiver iPBroadcastReceiverYcx = IPBroadcastReceiver.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx(), f27138zb);
        if (iPBroadcastReceiverYcx != null) {
            iPBroadcastReceiverYcx.ycx();
        }
        lud = false;
        f27138zb = null;
        sya = null;
        f27135dj = null;
        f27136lt = null;
        f27137ul = null;
    }

    @Override // com.bytedance.sdk.openadsdk.oem.ycx
    public void ycx(String str, final int i5) {
        com.bytedance.sdk.openadsdk.core.model.lt ltVarZnc;
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = f27138zb;
        if (tnVar == null || sya == null || (ltVarZnc = tnVar.znc()) == null) {
            return;
        }
        String strSya = ltVarZnc.sya();
        if (TextUtils.isEmpty(strSya) || !strSya.equals(str)) {
            return;
        }
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.utils.dy.1
            @Override // java.lang.Runnable
            public void run() {
                int i11;
                if (dy.f27138zb == null || dy.sya == null || (i11 = i5) <= 0 || i11 > 5) {
                    return;
                }
                boolean z11 = true;
                boolean z12 = i11 == 1;
                if (dy.lud) {
                    if (dy.f27136lt != null) {
                        dy.f27136lt.ui();
                    }
                    if (dy.f27137ul != null) {
                        dy.f27137ul.ycx();
                    }
                    HashMap map = new HashMap();
                    map.put("click_scence", 4);
                    com.bytedance.sdk.openadsdk.dj.sya.ycx(TTEDPEventConstants.EDP_EVENT_NAME_CLICK, dy.f27138zb, new ok.ycx().ycx(), dy.f27135dj, true, (Map<String, Object>) map, 1);
                } else {
                    z11 = z12;
                }
                if (z11) {
                    dy.ycx();
                }
            }
        });
    }
}
