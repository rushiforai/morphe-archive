package com.bytedance.adsdk.ugeno.lud.sya;

import android.content.res.Resources;
import com.bytedance.adsdk.ugeno.lud.lt;

/* loaded from: classes2.dex */
public class zb extends com.bytedance.adsdk.ugeno.lud.zb.ycx {
    public zb(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
        super(syaVar, str, ycxVar);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void ycx() throws Resources.NotFoundException {
        if (this.sya == null) {
            return;
        }
        Object obj = this.f22485lt.get("position");
        int iYcx = obj != null ? com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj), 0) : 0;
        com.bytedance.adsdk.ugeno.zb.sya syaVar = this.sya;
        com.bytedance.adsdk.ugeno.zb.sya syaVarZb = syaVar.zb(syaVar);
        if (syaVarZb == null) {
            return;
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVarLt = syaVarZb.lt("SwiperView");
        if (syaVarLt instanceof com.bytedance.adsdk.ugeno.sya) {
            ((com.bytedance.adsdk.ugeno.sya) syaVarLt).ycx(iYcx);
        }
    }
}
