package com.bytedance.sdk.openadsdk.core.ry.zb.lud;

import android.content.Context;
import com.bytedance.adsdk.ugeno.lud.ea;

/* loaded from: classes2.dex */
public class zb extends com.bytedance.adsdk.ugeno.lud.dj.sya {

    /* renamed from: ea, reason: collision with root package name */
    private float f26032ea;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f26033ok;

    public zb(Context context) {
        super(context);
        this.f26032ea = 100.0f;
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        if (objArr != null && objArr.length >= 2) {
            if (com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(objArr[1]), 0.0f) <= 0.0f) {
                ea eaVar = this.ycx;
                if (eaVar != null && !this.f26033ok) {
                    this.f26033ok = true;
                    eaVar.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
                }
                return true;
            }
            if (this.lud.get("rate") != null) {
                this.f26032ea = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(r2), 100);
            }
            if (com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(objArr[0]), 100.0f) >= this.f26032ea) {
                ea eaVar2 = this.ycx;
                if (eaVar2 != null && !this.f26033ok) {
                    this.f26033ok = true;
                    eaVar2.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
                }
                return true;
            }
        }
        return false;
    }
}
