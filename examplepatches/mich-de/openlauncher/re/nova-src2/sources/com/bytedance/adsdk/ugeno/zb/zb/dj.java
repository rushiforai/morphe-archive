package com.bytedance.adsdk.ugeno.zb.zb;

import a2.c;
import com.bytedance.adsdk.ugeno.zb.zb.zb;

/* loaded from: classes2.dex */
final class dj {

    /* renamed from: dj, reason: collision with root package name */
    private final float[] f22740dj;

    /* renamed from: dy, reason: collision with root package name */
    private int f22741dy;

    /* renamed from: ea, reason: collision with root package name */
    private final float[] f22742ea;
    private final float[] fby;

    /* renamed from: jc, reason: collision with root package name */
    private final float[] f22743jc;

    /* renamed from: jw, reason: collision with root package name */
    private final float[] f22744jw;

    /* renamed from: lt, reason: collision with root package name */
    private final float[] f22745lt;
    private final float[] lud;

    /* renamed from: ok, reason: collision with root package name */
    private final float[] f22746ok;
    private int pmi;

    /* renamed from: ry, reason: collision with root package name */
    private final int[] f22747ry;
    private final zb.dj[] sya;
    private final float[] syc;

    /* renamed from: ul, reason: collision with root package name */
    private final float[] f22748ul;
    private int wie;
    private int xkz;
    private final zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final zb.sya f22749zb;

    public dj(zb zbVar) {
        this.ycx = zbVar;
        this.f22749zb = zbVar.ycx();
        zb.dj[] djVarArr = (zb.dj[]) zbVar.zb().toArray(new zb.dj[0]);
        this.sya = djVarArr;
        this.f22740dj = new float[600];
        this.lud = new float[600];
        this.f22745lt = new float[600];
        this.f22748ul = new float[600];
        this.fby = new float[600];
        this.f22744jw = new float[600];
        this.f22743jc = new float[600];
        this.f22742ea = new float[600];
        this.f22746ok = new float[600];
        this.f22747ry = new int[600];
        this.syc = new float[djVarArr.length];
        int iNanoTime = (int) (System.nanoTime() ^ System.identityHashCode(this));
        this.f22741dy = iNanoTime == 0 ? 305441741 : iNanoTime;
    }

    private void sya(float f11) {
        zb.dj[] djVarArr = this.sya;
        float[] fArr = this.syc;
        for (int i5 = 0; i5 < djVarArr.length; i5++) {
            zb.dj djVar = djVarArr[i5];
            float f12 = djVar.f22785zb;
            if (f12 > 0.0f) {
                fArr[i5] = (f12 * f11) + fArr[i5];
                while (true) {
                    float f13 = fArr[i5];
                    if (f13 < 1.0f || this.xkz >= 600) {
                        break;
                    }
                    fArr[i5] = f13 - 1.0f;
                    ycx(i5, djVar);
                }
                if (this.xkz >= 600) {
                    fArr[i5] = 0.0f;
                }
            }
        }
    }

    public void ycx(int i5, int i11) {
        this.wie = i5;
        this.pmi = i11;
    }

    public zb zb() {
        return this.ycx;
    }

    private void zb(float f11) {
        float[] fArr = this.f22740dj;
        float[] fArr2 = this.lud;
        float[] fArr3 = this.f22745lt;
        float[] fArr4 = this.f22748ul;
        float[] fArr5 = this.fby;
        float[] fArr6 = this.f22744jw;
        float[] fArr7 = this.f22742ea;
        float[] fArr8 = this.f22746ok;
        int i5 = 0;
        while (i5 < this.xkz) {
            float f12 = fArr5[i5] + f11;
            if (f12 >= fArr6[i5]) {
                ycx(i5);
            } else {
                float f13 = (fArr8[i5] * f11) + fArr7[i5];
                if (f13 <= 0.0f) {
                    ycx(i5);
                } else {
                    if (f13 > 1.0f) {
                        f13 = 1.0f;
                    }
                    fArr5[i5] = f12;
                    fArr7[i5] = f13;
                    fArr[i5] = (fArr3[i5] * f11) + fArr[i5];
                    fArr2[i5] = (fArr4[i5] * f11) + fArr2[i5];
                    i5++;
                }
            }
        }
    }

    public zb.dj[] ycx() {
        return this.sya;
    }

    public void ycx(float f11) {
        if (this.wie <= 0 || this.pmi <= 0 || this.sya.length == 0) {
            return;
        }
        zb(f11);
        sya(f11);
    }

    private void ycx(int i5) {
        int i11 = this.xkz - 1;
        this.xkz = i11;
        if (i5 != i11) {
            float[] fArr = this.f22740dj;
            fArr[i5] = fArr[i11];
            float[] fArr2 = this.lud;
            fArr2[i5] = fArr2[i11];
            float[] fArr3 = this.f22745lt;
            fArr3[i5] = fArr3[i11];
            float[] fArr4 = this.f22748ul;
            fArr4[i5] = fArr4[i11];
            float[] fArr5 = this.fby;
            fArr5[i5] = fArr5[i11];
            float[] fArr6 = this.f22744jw;
            fArr6[i5] = fArr6[i11];
            float[] fArr7 = this.f22743jc;
            fArr7[i5] = fArr7[i11];
            float[] fArr8 = this.f22742ea;
            fArr8[i5] = fArr8[i11];
            float[] fArr9 = this.f22746ok;
            fArr9[i5] = fArr9[i11];
            int[] iArr = this.f22747ry;
            iArr[i5] = iArr[i11];
        }
    }

    private float sya() {
        int i5 = this.f22741dy;
        int i11 = i5 ^ (i5 << 13);
        int i12 = i11 ^ (i11 >>> 17);
        int i13 = i12 ^ (i12 << 5);
        if (i13 == 0) {
            i13 = -1640531527;
        }
        this.f22741dy = i13;
        return (i13 >>> 8) * 5.9604645E-8f;
    }

    private void zb(int i5) {
        float fYcx = this.f22749zb.f22788jw.ycx(this.wie);
        float fYcx2 = this.f22749zb.f22787jc.ycx(this.pmi);
        float f11 = fYcx < 0.0f ? 0.0f : fYcx;
        float f12 = fYcx2 < 0.0f ? 0.0f : fYcx2;
        float fYcx3 = this.f22749zb.f22790ul.ycx(this.wie);
        float fYcx4 = this.f22749zb.fby.ycx(this.pmi);
        float f13 = f11 / 2.0f;
        float f14 = fYcx3 - f13;
        float f15 = f12 / 2.0f;
        float f16 = fYcx4 - f15;
        zb.sya syaVar = this.f22749zb;
        int i11 = syaVar.f22786dj;
        int i12 = syaVar.lud;
        if (i11 == 2) {
            if (i12 == 1) {
                ycx(i5, f14, f16, f11, f12);
                return;
            } else {
                this.f22740dj[i5] = (sya() * f11) + f14;
                this.lud[i5] = (sya() * f12) + f16;
                return;
            }
        }
        if (i11 == 3 || i11 == 4) {
            float fSya = sya() * 6.2831855f;
            float fSqrt = i12 == 1 ? 1.0f : (float) Math.sqrt(sya());
            double d5 = fSya;
            this.f22740dj[i5] = (((float) Math.cos(d5)) * f13 * fSqrt) + fYcx3;
            this.lud[i5] = (((float) Math.sin(d5)) * f15 * fSqrt) + fYcx4;
            return;
        }
        if (i11 == 1) {
            this.f22740dj[i5] = (sya() * f11) + f14;
            this.lud[i5] = fYcx4;
        } else {
            this.f22740dj[i5] = fYcx3;
            this.lud[i5] = fYcx4;
        }
    }

    private void ycx(int i5, zb.dj djVar) {
        int i11 = this.xkz;
        this.xkz = i11 + 1;
        float fYcx = ycx(djVar.sya, djVar.f22778dj);
        if (fYcx < 0.01f) {
            fYcx = 0.01f;
        }
        float fYcx2 = ycx(djVar.lud, djVar.f22782lt);
        if (fYcx2 < 0.0f) {
            fYcx2 = 0.0f;
        }
        float fYcx3 = ycx(djVar.f22784ul, djVar.fby);
        if (fYcx3 < 0.0f) {
            fYcx3 = 0.0f;
        }
        float fSya = sya() * 6.2831855f;
        float radians = (float) Math.toRadians(djVar.f22781jw);
        if (radians > 0.0f) {
            fSya = c.a(sya(), 0.5f, radians, fSya);
        }
        float fSya2 = 1.0f - (djVar.f22780jc > 0.0f ? sya() * djVar.f22780jc : 0.0f);
        if (fSya2 < 0.0f) {
            fSya2 = 0.0f;
        }
        this.fby[i11] = 0.0f;
        this.f22744jw[i11] = fYcx;
        this.f22743jc[i11] = fYcx2;
        double d5 = fSya;
        this.f22745lt[i11] = ((float) Math.cos(d5)) * fYcx3;
        this.f22748ul[i11] = ((float) Math.sin(d5)) * fYcx3;
        this.f22742ea[i11] = fSya2;
        this.f22746ok[i11] = djVar.f22779ea;
        this.f22747ry[i11] = i5;
        zb(i11);
    }

    private void ycx(int i5, float f11, float f12, float f13, float f14) {
        float f15 = f13 + f14;
        float f16 = f15 * 2.0f;
        if (f16 <= 0.0f) {
            this.f22740dj[i5] = f11;
            this.lud[i5] = f12;
            return;
        }
        float fSya = sya() * f16;
        if (fSya < f13) {
            this.f22740dj[i5] = f11 + fSya;
            this.lud[i5] = f12;
            return;
        }
        if (fSya < f15) {
            this.f22740dj[i5] = f11 + f13;
            this.lud[i5] = (fSya - f13) + f12;
            return;
        }
        float f17 = 2.0f * f13;
        if (fSya < f17 + f14) {
            this.f22740dj[i5] = (f11 + f13) - ((fSya - f13) - f14);
            this.lud[i5] = f12 + f14;
        } else {
            this.f22740dj[i5] = f11;
            this.lud[i5] = (f12 + f14) - ((fSya - f17) - f14);
        }
    }

    private float ycx(float f11, float f12) {
        return f12 <= 0.0f ? f11 : (((sya() * 2.0f) - 1.0f) * f12) + f11;
    }

    public void ycx(lt ltVar) {
        int i5 = this.xkz;
        ltVar.ycx(600);
        ltVar.ycx = i5;
        System.arraycopy(this.f22740dj, 0, ltVar.sya, 0, i5);
        System.arraycopy(this.lud, 0, ltVar.f22750dj, 0, i5);
        System.arraycopy(this.f22743jc, 0, ltVar.lud, 0, i5);
        System.arraycopy(this.f22742ea, 0, ltVar.f22752lt, 0, i5);
        System.arraycopy(this.fby, 0, ltVar.f22753ul, 0, i5);
        System.arraycopy(this.f22747ry, 0, ltVar.fby, 0, i5);
        ltVar.f22754zb = this.f22749zb.f22789lt;
    }
}
