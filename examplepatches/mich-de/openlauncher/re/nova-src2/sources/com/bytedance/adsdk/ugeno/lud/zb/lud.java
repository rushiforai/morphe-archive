package com.bytedance.adsdk.ugeno.lud.zb;

import android.view.View;
import com.bytedance.adsdk.ugeno.lud.jw;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class lud extends ycx {
    public lud(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
        super(syaVar, str, ycxVar);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void ycx() {
        Object obj;
        Map<String, Object> map = this.f22485lt;
        String strValueOf = (map == null || map.size() <= 0 || (obj = this.f22485lt.get(PendingUpgradeStore.KEY_NAME)) == null) ? b.f42142b : String.valueOf(obj);
        com.bytedance.adsdk.ugeno.zb.sya syaVar = this.sya;
        com.bytedance.adsdk.ugeno.zb.sya syaVarZb = syaVar.zb(syaVar);
        if (syaVarZb == null) {
            return;
        }
        ycx(syaVarZb, strValueOf);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void zb() {
    }

    private void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str) {
        List<com.bytedance.adsdk.ugeno.zb.sya<View>> listJw;
        if (syaVar == null) {
            return;
        }
        jw jwVarDuz = syaVar.duz();
        if (jwVarDuz != null) {
            jwVarDuz.ycx(str);
        }
        if (!(syaVar instanceof com.bytedance.adsdk.ugeno.zb.ycx) || (listJw = ((com.bytedance.adsdk.ugeno.zb.ycx) syaVar).jw()) == null || listJw.isEmpty()) {
            return;
        }
        Iterator<com.bytedance.adsdk.ugeno.zb.sya<View>> it = listJw.iterator();
        while (it.hasNext()) {
            ycx(it.next(), str);
        }
    }
}
