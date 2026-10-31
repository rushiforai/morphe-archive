package com.bytedance.adsdk.ugeno.lud.zb;

import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.Map;

/* loaded from: classes2.dex */
public class dj extends ycx {
    public dj(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
        super(syaVar, str, ycxVar);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void ycx() {
        Object obj;
        com.bytedance.adsdk.ugeno.zb.sya syaVar;
        com.bytedance.adsdk.ugeno.zb.sya syaVarZb;
        com.bytedance.adsdk.ugeno.zb.sya syaVarFby;
        com.bytedance.adsdk.ugeno.ycx.ycx ycxVarOk;
        Map<String, Object> map = this.f22485lt;
        if (map == null || map.size() <= 0 || (obj = this.f22485lt.get(PendingUpgradeStore.KEY_NAME)) == null) {
            return;
        }
        String strValueOf = String.valueOf(obj);
        if (TextUtils.isEmpty(strValueOf) || (syaVarZb = (syaVar = this.sya).zb(syaVar)) == null || (syaVarFby = syaVarZb.fby(strValueOf)) == null || (ycxVarOk = syaVarFby.ok(strValueOf)) == null) {
            return;
        }
        ycxVarOk.zb();
        ycxVarOk.ycx(new com.bytedance.adsdk.ugeno.ycx.zb() { // from class: com.bytedance.adsdk.ugeno.lud.zb.dj.1
            @Override // com.bytedance.adsdk.ugeno.ycx.zb
            public void ycx() {
            }

            @Override // com.bytedance.adsdk.ugeno.ycx.zb
            public void zb() {
                dj.this.sya();
            }
        });
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void zb() {
    }
}
