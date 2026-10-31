package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;
import android.text.TextUtils;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.Map;

/* loaded from: classes2.dex */
public class zb extends sya implements com.bytedance.adsdk.ugeno.ycx.zb {

    /* renamed from: ea, reason: collision with root package name */
    private String f22466ea;

    public zb(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        Object obj;
        com.bytedance.adsdk.ugeno.zb.sya syaVarFby;
        com.bytedance.adsdk.ugeno.ycx.ycx ycxVarOk;
        Map<String, Object> map = this.lud;
        if (map == null || map.size() <= 0 || (obj = this.lud.get(PendingUpgradeStore.KEY_NAME)) == null) {
            return false;
        }
        String strValueOf = String.valueOf(obj);
        if (TextUtils.isEmpty(strValueOf)) {
            return false;
        }
        Object obj2 = this.lud.get("state");
        if (obj2 != null) {
            this.f22466ea = String.valueOf(obj2);
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVar = this.f22463zb;
        com.bytedance.adsdk.ugeno.zb.sya syaVarZb = syaVar.zb(syaVar);
        if (syaVarZb != null && (syaVarFby = syaVarZb.fby(strValueOf)) != null && (ycxVarOk = syaVarFby.ok(strValueOf)) != null) {
            ycxVarOk.ycx(this);
        }
        return false;
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb
    public void zb() {
        com.bytedance.adsdk.ugeno.lud.ea eaVar;
        if ((TextUtils.equals(this.f22466ea, "complete") || TextUtils.isEmpty(this.f22466ea)) && (eaVar = this.ycx) != null) {
            eaVar.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.ycx.zb
    public void ycx() {
        com.bytedance.adsdk.ugeno.lud.ea eaVar;
        if ((TextUtils.equals(this.f22466ea, "start") || TextUtils.isEmpty(this.f22466ea)) && (eaVar = this.ycx) != null) {
            eaVar.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
        }
    }
}
