package com.bytedance.adsdk.ugeno.lud.sya;

import android.content.res.Resources;
import com.bytedance.adsdk.ugeno.lud.lt;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.adsdk.ugeno.lud.zb.ycx {
    public ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
        super(syaVar, str, ycxVar);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void ycx() throws Resources.NotFoundException {
        com.bytedance.adsdk.ugeno.zb.sya syaVarZb;
        com.bytedance.adsdk.ugeno.zb.sya syaVar = this.sya;
        if (syaVar == null || (syaVarZb = syaVar.zb(syaVar)) == null) {
            return;
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVarLt = syaVarZb.lt("SwiperView");
        if (syaVarLt instanceof com.bytedance.adsdk.ugeno.sya) {
            ((com.bytedance.adsdk.ugeno.sya) syaVarLt).sya();
        }
    }
}
