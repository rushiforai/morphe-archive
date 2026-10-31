package com.bytedance.adsdk.ugeno.lud.zb;

import com.bytedance.adsdk.ugeno.lud.lt;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes2.dex */
public class zb extends ycx {

    /* renamed from: jw, reason: collision with root package name */
    private List<com.bytedance.adsdk.ugeno.lud.ycx.dj> f22488jw;

    public zb(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
        super(syaVar, str, ycxVar);
        this.f22488jw = new CopyOnWriteArrayList();
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void ycx() {
        Object obj;
        com.bytedance.adsdk.ugeno.lud.ycx.sya syaVarYcx;
        Map<String, Object> map = this.f22485lt;
        if (map == null || map.size() <= 0 || (obj = this.f22485lt.get(PendingUpgradeStore.KEY_NAME)) == null) {
            return;
        }
        String strValueOf = String.valueOf(obj);
        com.bytedance.adsdk.ugeno.lud.ycx.ycx ycxVarNji = this.sya.nji();
        if (ycxVarNji == null || (syaVarYcx = ycxVarNji.ycx(strValueOf)) == null) {
            return;
        }
        syaVarYcx.ycx(strValueOf);
    }
}
