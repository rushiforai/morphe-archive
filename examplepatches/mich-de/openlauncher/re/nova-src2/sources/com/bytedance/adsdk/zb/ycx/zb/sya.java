package com.bytedance.adsdk.zb.ycx.zb;

import android.graphics.Color;
import android.graphics.Paint;
import com.bytedance.adsdk.zb.ycx.zb.ycx;

/* loaded from: classes2.dex */
public class sya implements ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final ycx<Float, Float> f23258dj;

    /* renamed from: lt, reason: collision with root package name */
    private final ycx<Float, Float> f23259lt;
    private final ycx<Float, Float> lud;
    private final ycx<Float, Float> sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f23260ul = true;
    private final ycx.InterfaceC0028ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ycx<Integer, Integer> f23261zb;

    public sya(ycx.InterfaceC0028ycx interfaceC0028ycx, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.lud.jc jcVar) {
        this.ycx = interfaceC0028ycx;
        ycx<Integer, Integer> ycxVarYcx = jcVar.ycx().ycx();
        this.f23261zb = ycxVarYcx;
        ycxVarYcx.ycx(this);
        ycxVar.ycx(ycxVarYcx);
        ycx<Float, Float> ycxVarYcx2 = jcVar.zb().ycx();
        this.sya = ycxVarYcx2;
        ycxVarYcx2.ycx(this);
        ycxVar.ycx(ycxVarYcx2);
        ycx<Float, Float> ycxVarYcx3 = jcVar.sya().ycx();
        this.f23258dj = ycxVarYcx3;
        ycxVarYcx3.ycx(this);
        ycxVar.ycx(ycxVarYcx3);
        ycx<Float, Float> ycxVarYcx4 = jcVar.dj().ycx();
        this.lud = ycxVarYcx4;
        ycxVarYcx4.ycx(this);
        ycxVar.ycx(ycxVarYcx4);
        ycx<Float, Float> ycxVarYcx5 = jcVar.lud().ycx();
        this.f23259lt = ycxVarYcx5;
        ycxVarYcx5.ycx(this);
        ycxVar.ycx(ycxVarYcx5);
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        this.f23260ul = true;
        this.ycx.ycx();
    }

    public void ycx(Paint paint) {
        if (this.f23260ul) {
            this.f23260ul = false;
            double dFloatValue = this.f23258dj.ul().floatValue() * 0.017453292519943295d;
            float fFloatValue = this.lud.ul().floatValue();
            float fSin = ((float) Math.sin(dFloatValue)) * fFloatValue;
            float fCos = ((float) Math.cos(dFloatValue + 3.141592653589793d)) * fFloatValue;
            int iIntValue = this.f23261zb.ul().intValue();
            paint.setShadowLayer(this.f23259lt.ul().floatValue(), fSin, fCos, Color.argb(Math.round(this.sya.ul().floatValue()), Color.red(iIntValue), Color.green(iIntValue), Color.blue(iIntValue)));
        }
    }
}
