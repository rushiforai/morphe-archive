package com.bytedance.adsdk.zb.ycx.zb;

import android.graphics.Matrix;
import android.graphics.PointF;
import com.bytedance.adsdk.zb.ycx.zb.ycx;

/* loaded from: classes2.dex */
public class dy {

    /* renamed from: dj, reason: collision with root package name */
    private final Matrix f23238dj;

    /* renamed from: ea, reason: collision with root package name */
    private dj f23239ea;
    private ycx<com.bytedance.adsdk.zb.ul.sya, com.bytedance.adsdk.zb.ul.sya> fby;

    /* renamed from: jc, reason: collision with root package name */
    private ycx<Integer, Integer> f23240jc;

    /* renamed from: jw, reason: collision with root package name */
    private ycx<Float, Float> f23241jw;

    /* renamed from: lt, reason: collision with root package name */
    private ycx<PointF, PointF> f23242lt;
    private final float[] lud;

    /* renamed from: ok, reason: collision with root package name */
    private dj f23243ok;

    /* renamed from: ry, reason: collision with root package name */
    private ycx<?, Float> f23244ry;
    private final Matrix sya;

    /* renamed from: ul, reason: collision with root package name */
    private ycx<?, PointF> f23245ul;
    private ycx<?, Float> xkz;
    private final Matrix ycx = new Matrix();

    /* renamed from: zb, reason: collision with root package name */
    private final Matrix f23246zb;

    public dy(com.bytedance.adsdk.zb.sya.ycx.ok okVar) {
        this.f23242lt = okVar.ycx() == null ? null : okVar.ycx().ycx();
        this.f23245ul = okVar.zb() == null ? null : okVar.zb().ycx();
        this.fby = okVar.sya() == null ? null : okVar.sya().ycx();
        this.f23241jw = okVar.dj() == null ? null : okVar.dj().ycx();
        dj djVar = okVar.fby() == null ? null : (dj) okVar.fby().ycx();
        this.f23239ea = djVar;
        if (djVar != null) {
            this.f23246zb = new Matrix();
            this.sya = new Matrix();
            this.f23238dj = new Matrix();
            this.lud = new float[9];
        } else {
            this.f23246zb = null;
            this.sya = null;
            this.f23238dj = null;
            this.lud = null;
        }
        this.f23243ok = okVar.jw() == null ? null : (dj) okVar.jw().ycx();
        if (okVar.lud() != null) {
            this.f23240jc = okVar.lud().ycx();
        }
        if (okVar.lt() != null) {
            this.f23244ry = okVar.lt().ycx();
        } else {
            this.f23244ry = null;
        }
        if (okVar.ul() != null) {
            this.xkz = okVar.ul().ycx();
        } else {
            this.xkz = null;
        }
    }

    private void lud() {
        for (int i5 = 0; i5 < 9; i5++) {
            this.lud[i5] = 0.0f;
        }
    }

    public Matrix dj() {
        PointF pointFUl;
        PointF pointFUl2;
        this.ycx.reset();
        ycx<?, PointF> ycxVar = this.f23245ul;
        if (ycxVar != null && (pointFUl2 = ycxVar.ul()) != null) {
            float f11 = pointFUl2.x;
            if (f11 != 0.0f || pointFUl2.y != 0.0f) {
                this.ycx.preTranslate(f11, pointFUl2.y);
            }
        }
        ycx<Float, Float> ycxVar2 = this.f23241jw;
        if (ycxVar2 != null) {
            float fFloatValue = ycxVar2 instanceof wie ? ycxVar2.ul().floatValue() : ((dj) ycxVar2).jw();
            if (fFloatValue != 0.0f) {
                this.ycx.preRotate(fFloatValue);
            }
        }
        if (this.f23239ea != null) {
            float fCos = this.f23243ok == null ? 0.0f : (float) Math.cos(Math.toRadians((-r3.jw()) + 90.0f));
            float fSin = this.f23243ok == null ? 1.0f : (float) Math.sin(Math.toRadians((-r5.jw()) + 90.0f));
            float fTan = (float) Math.tan(Math.toRadians(r0.jw()));
            lud();
            float[] fArr = this.lud;
            fArr[0] = fCos;
            fArr[1] = fSin;
            float f12 = -fSin;
            fArr[3] = f12;
            fArr[4] = fCos;
            fArr[8] = 1.0f;
            this.f23246zb.setValues(fArr);
            lud();
            float[] fArr2 = this.lud;
            fArr2[0] = 1.0f;
            fArr2[3] = fTan;
            fArr2[4] = 1.0f;
            fArr2[8] = 1.0f;
            this.sya.setValues(fArr2);
            lud();
            float[] fArr3 = this.lud;
            fArr3[0] = fCos;
            fArr3[1] = f12;
            fArr3[3] = fSin;
            fArr3[4] = fCos;
            fArr3[8] = 1.0f;
            this.f23238dj.setValues(fArr3);
            this.sya.preConcat(this.f23246zb);
            this.f23238dj.preConcat(this.sya);
            this.ycx.preConcat(this.f23238dj);
        }
        ycx<com.bytedance.adsdk.zb.ul.sya, com.bytedance.adsdk.zb.ul.sya> ycxVar3 = this.fby;
        if (ycxVar3 != null) {
            com.bytedance.adsdk.zb.ul.sya syaVarUl = ycxVar3.ul();
            if (syaVarUl.ycx() != 1.0f || syaVarUl.zb() != 1.0f) {
                this.ycx.preScale(syaVarUl.ycx(), syaVarUl.zb());
            }
        }
        ycx<PointF, PointF> ycxVar4 = this.f23242lt;
        if (ycxVar4 != null && (((pointFUl = ycxVar4.ul()) != null && pointFUl.x != 0.0f) || pointFUl.y != 0.0f)) {
            this.ycx.preTranslate(-pointFUl.x, -pointFUl.y);
        }
        return this.ycx;
    }

    public ycx<?, Float> sya() {
        return this.xkz;
    }

    public void ycx(com.bytedance.adsdk.zb.sya.sya.ycx ycxVar) {
        ycxVar.ycx(this.f23240jc);
        ycxVar.ycx(this.f23244ry);
        ycxVar.ycx(this.xkz);
        ycxVar.ycx(this.f23242lt);
        ycxVar.ycx(this.f23245ul);
        ycxVar.ycx(this.fby);
        ycxVar.ycx(this.f23241jw);
        ycxVar.ycx(this.f23239ea);
        ycxVar.ycx(this.f23243ok);
    }

    public ycx<?, Float> zb() {
        return this.f23244ry;
    }

    public Matrix zb(float f11) {
        ycx<?, PointF> ycxVar = this.f23245ul;
        PointF pointFUl = ycxVar == null ? null : ycxVar.ul();
        ycx<com.bytedance.adsdk.zb.ul.sya, com.bytedance.adsdk.zb.ul.sya> ycxVar2 = this.fby;
        com.bytedance.adsdk.zb.ul.sya syaVarUl = ycxVar2 == null ? null : ycxVar2.ul();
        this.ycx.reset();
        if (pointFUl != null) {
            this.ycx.preTranslate(pointFUl.x * f11, pointFUl.y * f11);
        }
        if (syaVarUl != null) {
            double d5 = f11;
            this.ycx.preScale((float) Math.pow(syaVarUl.ycx(), d5), (float) Math.pow(syaVarUl.zb(), d5));
        }
        ycx<Float, Float> ycxVar3 = this.f23241jw;
        if (ycxVar3 != null) {
            float fFloatValue = ycxVar3.ul().floatValue();
            ycx<PointF, PointF> ycxVar4 = this.f23242lt;
            PointF pointFUl2 = ycxVar4 != null ? ycxVar4.ul() : null;
            this.ycx.preRotate(fFloatValue * f11, pointFUl2 == null ? 0.0f : pointFUl2.x, pointFUl2 != null ? pointFUl2.y : 0.0f);
        }
        return this.ycx;
    }

    public void ycx(ycx.InterfaceC0028ycx interfaceC0028ycx) {
        ycx<Integer, Integer> ycxVar = this.f23240jc;
        if (ycxVar != null) {
            ycxVar.ycx(interfaceC0028ycx);
        }
        ycx<?, Float> ycxVar2 = this.f23244ry;
        if (ycxVar2 != null) {
            ycxVar2.ycx(interfaceC0028ycx);
        }
        ycx<?, Float> ycxVar3 = this.xkz;
        if (ycxVar3 != null) {
            ycxVar3.ycx(interfaceC0028ycx);
        }
        ycx<PointF, PointF> ycxVar4 = this.f23242lt;
        if (ycxVar4 != null) {
            ycxVar4.ycx(interfaceC0028ycx);
        }
        ycx<?, PointF> ycxVar5 = this.f23245ul;
        if (ycxVar5 != null) {
            ycxVar5.ycx(interfaceC0028ycx);
        }
        ycx<com.bytedance.adsdk.zb.ul.sya, com.bytedance.adsdk.zb.ul.sya> ycxVar6 = this.fby;
        if (ycxVar6 != null) {
            ycxVar6.ycx(interfaceC0028ycx);
        }
        ycx<Float, Float> ycxVar7 = this.f23241jw;
        if (ycxVar7 != null) {
            ycxVar7.ycx(interfaceC0028ycx);
        }
        dj djVar = this.f23239ea;
        if (djVar != null) {
            djVar.ycx(interfaceC0028ycx);
        }
        dj djVar2 = this.f23243ok;
        if (djVar2 != null) {
            djVar2.ycx(interfaceC0028ycx);
        }
    }

    public void ycx(float f11) {
        ycx<Integer, Integer> ycxVar = this.f23240jc;
        if (ycxVar != null) {
            ycxVar.ycx(f11);
        }
        ycx<?, Float> ycxVar2 = this.f23244ry;
        if (ycxVar2 != null) {
            ycxVar2.ycx(f11);
        }
        ycx<?, Float> ycxVar3 = this.xkz;
        if (ycxVar3 != null) {
            ycxVar3.ycx(f11);
        }
        ycx<PointF, PointF> ycxVar4 = this.f23242lt;
        if (ycxVar4 != null) {
            ycxVar4.ycx(f11);
        }
        ycx<?, PointF> ycxVar5 = this.f23245ul;
        if (ycxVar5 != null) {
            ycxVar5.ycx(f11);
        }
        ycx<com.bytedance.adsdk.zb.ul.sya, com.bytedance.adsdk.zb.ul.sya> ycxVar6 = this.fby;
        if (ycxVar6 != null) {
            ycxVar6.ycx(f11);
        }
        ycx<Float, Float> ycxVar7 = this.f23241jw;
        if (ycxVar7 != null) {
            ycxVar7.ycx(f11);
        }
        dj djVar = this.f23239ea;
        if (djVar != null) {
            djVar.ycx(f11);
        }
        dj djVar2 = this.f23243ok;
        if (djVar2 != null) {
            djVar2.ycx(f11);
        }
    }

    public ycx<?, Integer> ycx() {
        return this.f23240jc;
    }
}
