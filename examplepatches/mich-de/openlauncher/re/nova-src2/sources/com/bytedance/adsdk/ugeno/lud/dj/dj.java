package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;

/* loaded from: classes2.dex */
public class dj extends sya implements com.bytedance.adsdk.ugeno.lud.ycx.dj {

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.lud.ycx.sya f22434ea;

    public dj(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        com.bytedance.adsdk.ugeno.lud.ycx.ycx ycxVarNji = this.f22463zb.nji();
        if (ycxVarNji == null) {
            return false;
        }
        com.bytedance.adsdk.ugeno.lud.ycx.sya syaVarYcx = ycxVarNji.ycx(this.f22461lt);
        this.f22434ea = syaVarYcx;
        if (syaVarYcx != null) {
            syaVarYcx.ycx(this);
            return false;
        }
        ycxVarNji.ycx(this.f22461lt, new com.bytedance.adsdk.ugeno.lud.ycx.zb());
        return false;
    }

    @Override // com.bytedance.adsdk.ugeno.lud.ycx.dj
    public void ycx(String str) {
        this.ycx.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
    }
}
