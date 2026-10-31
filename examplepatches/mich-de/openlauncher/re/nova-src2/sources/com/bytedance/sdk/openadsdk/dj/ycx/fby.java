package com.bytedance.sdk.openadsdk.dj.ycx;

import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.dj.ycx.ycx.ea;
import com.bytedance.sdk.openadsdk.utils.tru;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.tiktok.util.TTConst;
import org.json.JSONObject;

/* loaded from: classes2.dex */
class fby implements com.bytedance.sdk.openadsdk.dy.zb.sya {
    public static final fby ycx = new fby();

    private fby() {
    }

    @Override // com.bytedance.sdk.openadsdk.dy.zb.sya
    public void ycx(com.bytedance.sdk.openadsdk.dy.zb zbVar) {
        ycx(zbVar, false);
    }

    @Override // com.bytedance.sdk.openadsdk.dy.zb.sya
    public void ycx(final com.bytedance.sdk.openadsdk.dy.zb zbVar, final boolean z11) {
        ycx(new com.bytedance.sdk.component.fby.zb.sya("uploadLogEvent") { // from class: com.bytedance.sdk.openadsdk.dj.ycx.fby.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    com.bytedance.sdk.openadsdk.dy.ycx.sya syaVarYcx = zbVar.ycx();
                    if (syaVarYcx == null) {
                        return;
                    }
                    JSONObject jSONObjectYcx = syaVarYcx.ycx();
                    String strYcx = tru.ycx();
                    if (com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.ycx(jSONObjectYcx.optString(TTConst.TRACK_TYPE)) && com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.ycx()) {
                        ea eaVar = new ea(strYcx, ea.ycx(jSONObjectYcx));
                        eaVar.ycx(z11 ? 1 : 0);
                        com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.ycx(eaVar);
                        return;
                    }
                    com.bytedance.sdk.component.lt.ycx.dj.ycx.ycx ycxVar = new com.bytedance.sdk.component.lt.ycx.dj.ycx.ycx(strYcx, jSONObjectYcx);
                    ycxVar.ycx((byte) 0);
                    ycxVar.sya(z11 ? (byte) 2 : (byte) 3);
                    ycxVar.zb((byte) 1);
                    if (com.bytedance.sdk.component.lt.ycx.zb.zb()) {
                        zb.ycx(pmi.ycx());
                    }
                    com.bytedance.sdk.component.lt.ycx.zb.ycx(ycxVar);
                } catch (Throwable unused) {
                }
            }
        });
    }

    private void ycx(com.bytedance.sdk.component.fby.zb.sya syaVar) {
        if (syaVar == null) {
            return;
        }
        if (!yzp.ul()) {
            yzp.zb(syaVar, 5);
        } else {
            syaVar.run();
        }
    }
}
