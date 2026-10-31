package com.bytedance.adsdk.zb.ycx.ycx;

import a2.c;
import android.graphics.Path;
import android.graphics.PointF;
import com.bytedance.adsdk.zb.sya.zb.jc;
import com.bytedance.adsdk.zb.sya.zb.uh;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.List;

/* loaded from: classes2.dex */
public class xkz implements ea, ry, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final jc.ycx f23218dj;

    /* renamed from: ea, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> f23219ea;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, PointF> fby;

    /* renamed from: jc, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> f23220jc;

    /* renamed from: jw, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> f23221jw;

    /* renamed from: lt, reason: collision with root package name */
    private final boolean f23222lt;
    private final boolean lud;

    /* renamed from: ok, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> f23223ok;

    /* renamed from: ry, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> f23224ry;
    private final com.bytedance.adsdk.zb.jw sya;
    private boolean syc;

    /* renamed from: ul, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> f23225ul;

    /* renamed from: zb, reason: collision with root package name */
    private final String f23226zb;
    private final Path ycx = new Path();
    private final zb xkz = new zb();

    /* renamed from: com.bytedance.adsdk.zb.ycx.ycx.xkz$1, reason: invalid class name */
    public static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] ycx;

        static {
            int[] iArr = new int[jc.ycx.values().length];
            ycx = iArr;
            try {
                iArr[jc.ycx.STAR.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                ycx[jc.ycx.POLYGON.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    public xkz(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.jc jcVar) {
        this.sya = jwVar;
        this.f23226zb = jcVar.ycx();
        jc.ycx ycxVarZb = jcVar.zb();
        this.f23218dj = ycxVarZb;
        this.lud = jcVar.jc();
        this.f23222lt = jcVar.ea();
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx = jcVar.sya().ycx();
        this.f23225ul = ycxVarYcx;
        com.bytedance.adsdk.zb.ycx.zb.ycx<PointF, PointF> ycxVarYcx2 = jcVar.dj().ycx();
        this.fby = ycxVarYcx2;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx3 = jcVar.lud().ycx();
        this.f23221jw = ycxVarYcx3;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx4 = jcVar.ul().ycx();
        this.f23219ea = ycxVarYcx4;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx5 = jcVar.jw().ycx();
        this.f23224ry = ycxVarYcx5;
        jc.ycx ycxVar2 = jc.ycx.STAR;
        if (ycxVarZb == ycxVar2) {
            this.f23220jc = jcVar.lt().ycx();
            this.f23223ok = jcVar.fby().ycx();
        } else {
            this.f23220jc = null;
            this.f23223ok = null;
        }
        ycxVar.ycx(ycxVarYcx);
        ycxVar.ycx(ycxVarYcx2);
        ycxVar.ycx(ycxVarYcx3);
        ycxVar.ycx(ycxVarYcx4);
        ycxVar.ycx(ycxVarYcx5);
        if (ycxVarZb == ycxVar2) {
            ycxVar.ycx(this.f23220jc);
            ycxVar.ycx(this.f23223ok);
        }
        ycxVarYcx.ycx(this);
        ycxVarYcx2.ycx(this);
        ycxVarYcx3.ycx(this);
        ycxVarYcx4.ycx(this);
        ycxVarYcx5.ycx(this);
        if (ycxVarZb == ycxVar2) {
            this.f23220jc.ycx(this);
            this.f23223ok.ycx(this);
        }
    }

    private void lud() {
        double d5;
        int iFloor = (int) Math.floor(this.f23225ul.ul().floatValue());
        double radians = Math.toRadians((this.f23221jw == null ? 0.0d : r2.ul().floatValue()) - 90.0d);
        double d11 = iFloor;
        float fFloatValue = this.f23224ry.ul().floatValue() / 100.0f;
        float fFloatValue2 = this.f23219ea.ul().floatValue();
        double d12 = fFloatValue2;
        float fCos = (float) (Math.cos(radians) * d12);
        float fSin = (float) (Math.sin(radians) * d12);
        this.ycx.moveTo(fCos, fSin);
        double d13 = (float) (6.283185307179586d / d11);
        double d14 = radians + d13;
        double dCeil = Math.ceil(d11);
        int i5 = 0;
        while (i5 < dCeil) {
            float fCos2 = (float) (Math.cos(d14) * d12);
            int i11 = i5;
            double d15 = d14;
            float fSin2 = (float) (Math.sin(d14) * d12);
            if (fFloatValue != 0.0f) {
                d5 = dCeil;
                double dAtan2 = (float) (Math.atan2(fSin, fCos) - 1.5707963267948966d);
                float fCos3 = (float) Math.cos(dAtan2);
                float fSin3 = (float) Math.sin(dAtan2);
                double dAtan22 = (float) (Math.atan2(fSin2, fCos2) - 1.5707963267948966d);
                float f11 = fFloatValue2 * fFloatValue * 0.25f;
                this.ycx.cubicTo(fCos - (f11 * fCos3), fSin - (f11 * fSin3), fCos2 + (((float) Math.cos(dAtan22)) * f11), fSin2 + (f11 * ((float) Math.sin(dAtan22))), fCos2, fSin2);
                fCos = fCos2;
                fSin = fSin2;
            } else {
                fSin = fSin2;
                d5 = dCeil;
                fCos = fCos2;
                this.ycx.lineTo(fCos, fSin);
            }
            d14 = d15 + d13;
            i5 = i11 + 1;
            dCeil = d5;
        }
        PointF pointFUl = this.fby.ul();
        this.ycx.offset(pointFUl.x, pointFUl.y);
        this.ycx.close();
    }

    private void sya() {
        float f11;
        float f12;
        int i5;
        float fCos;
        float fSin;
        float f13;
        float f14;
        double d5;
        float fA;
        int i11;
        float f15;
        double d11;
        float f16;
        float f17;
        double d12;
        float f18;
        float f19;
        float fFloatValue = this.f23225ul.ul().floatValue();
        double radians = Math.toRadians((this.f23221jw == null ? 0.0d : r2.ul().floatValue()) - 90.0d);
        double d13 = fFloatValue;
        float f21 = (float) (6.283185307179586d / d13);
        if (this.f23222lt) {
            f21 *= -1.0f;
        }
        float f22 = f21 / 2.0f;
        float f23 = fFloatValue - ((int) fFloatValue);
        int i12 = (f23 > 0.0f ? 1 : (f23 == 0.0f ? 0 : -1));
        if (i12 != 0) {
            radians += (1.0f - f23) * f22;
        }
        float fFloatValue2 = this.f23219ea.ul().floatValue();
        float fFloatValue3 = this.f23220jc.ul().floatValue();
        com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> ycxVar = this.f23223ok;
        float fFloatValue4 = ycxVar != null ? ycxVar.ul().floatValue() / 100.0f : 0.0f;
        com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> ycxVar2 = this.f23224ry;
        float fFloatValue5 = ycxVar2 != null ? ycxVar2.ul().floatValue() / 100.0f : 0.0f;
        if (i12 != 0) {
            fA = c.a(fFloatValue2, fFloatValue3, f23, fFloatValue3);
            f12 = 0.0f;
            i5 = i12;
            double d14 = fA;
            f11 = 2.0f;
            float fCos2 = (float) (Math.cos(radians) * d14);
            fSin = (float) (Math.sin(radians) * d14);
            this.ycx.moveTo(fCos2, fSin);
            d5 = radians + ((f21 * f23) / 2.0f);
            f13 = f23;
            fCos = fCos2;
            f14 = f22;
        } else {
            f11 = 2.0f;
            f12 = 0.0f;
            i5 = i12;
            double d15 = fFloatValue2;
            fCos = (float) (Math.cos(radians) * d15);
            fSin = (float) (d15 * Math.sin(radians));
            this.ycx.moveTo(fCos, fSin);
            f13 = f23;
            f14 = f22;
            d5 = radians + f14;
            fA = 0.0f;
        }
        double dCeil = Math.ceil(d13) * 2.0d;
        int i13 = 0;
        boolean z11 = false;
        double d16 = d5;
        float f24 = fSin;
        float f25 = fCos;
        double d17 = d16;
        while (true) {
            double d18 = i13;
            if (d18 >= dCeil) {
                PointF pointFUl = this.fby.ul();
                this.ycx.offset(pointFUl.x, pointFUl.y);
                this.ycx.close();
                return;
            }
            float f26 = z11 ? fFloatValue2 : fFloatValue3;
            if (fA == f12 || d18 != dCeil - 2.0d) {
                i11 = i13;
                f15 = f14;
            } else {
                i11 = i13;
                f15 = (f21 * f13) / f11;
            }
            if (fA == f12 || d18 != dCeil - 1.0d) {
                d11 = d18;
                f16 = f26;
            } else {
                d11 = d18;
                f16 = fA;
            }
            double d19 = f16;
            float fCos3 = (float) (Math.cos(d17) * d19);
            float f27 = f21;
            float fSin2 = (float) (Math.sin(d17) * d19);
            if (fFloatValue4 == f12 && fFloatValue5 == f12) {
                this.ycx.lineTo(fCos3, fSin2);
                f19 = fCos3;
                f18 = fSin2;
                f17 = f14;
                d12 = d17;
            } else {
                f17 = f14;
                d12 = d17;
                double dAtan2 = (float) (Math.atan2(f24, f25) - 1.5707963267948966d);
                float fCos4 = (float) Math.cos(dAtan2);
                float fSin3 = (float) Math.sin(dAtan2);
                float f28 = f25;
                float f29 = f24;
                f18 = fSin2;
                double dAtan22 = (float) (Math.atan2(fSin2, fCos3) - 1.5707963267948966d);
                float fCos5 = (float) Math.cos(dAtan22);
                float fSin4 = (float) Math.sin(dAtan22);
                float f31 = z11 ? fFloatValue4 : fFloatValue5;
                float f32 = z11 ? fFloatValue5 : fFloatValue4;
                float f33 = (z11 ? fFloatValue3 : fFloatValue2) * f31 * 0.47829f;
                float f34 = fCos4 * f33;
                float f35 = f33 * fSin3;
                float f36 = (z11 ? fFloatValue2 : fFloatValue3) * f32 * 0.47829f;
                float f37 = fCos5 * f36;
                float f38 = f36 * fSin4;
                if (i5 != 0) {
                    if (i11 == 0) {
                        f34 *= f13;
                        f35 *= f13;
                    } else if (d11 == dCeil - 1.0d) {
                        f37 *= f13;
                        f38 *= f13;
                    }
                }
                f19 = fCos3;
                this.ycx.cubicTo(f28 - f34, f29 - f35, fCos3 + f37, f18 + f38, f19, f18);
            }
            d17 = d12 + f15;
            z11 = !z11;
            i13 = i11 + 1;
            f14 = f17;
            f25 = f19;
            f24 = f18;
            f21 = f27;
        }
    }

    private void zb() {
        this.syc = false;
        this.sya.invalidateSelf();
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.ry
    public Path dj() {
        if (this.syc) {
            return this.ycx;
        }
        this.ycx.reset();
        if (this.lud) {
            this.syc = true;
            return this.ycx;
        }
        int i5 = AnonymousClass1.ycx[this.f23218dj.ordinal()];
        if (i5 == 1) {
            sya();
        } else if (i5 == 2) {
            lud();
        }
        this.ycx.close();
        this.xkz.ycx(this.ycx);
        this.syc = true;
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        zb();
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    public void ycx(List<sya> list, List<sya> list2) {
        for (int i5 = 0; i5 < list.size(); i5++) {
            sya syaVar = list.get(i5);
            if (syaVar instanceof thx) {
                thx thxVar = (thx) syaVar;
                if (thxVar.zb() == uh.ycx.SIMULTANEOUSLY) {
                    this.xkz.ycx(thxVar);
                    thxVar.ycx(this);
                }
            }
        }
    }
}
