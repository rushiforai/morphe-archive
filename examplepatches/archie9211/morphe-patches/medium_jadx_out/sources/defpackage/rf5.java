package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rf5 implements lx8 {
    public of5 a;
    public final lf5 b;
    public final mn c;
    public b55 d;
    public m45 e;
    public boolean g;
    public float[] i;
    public boolean j;
    public int n;
    public er7 p;
    public boolean q;
    public boolean r;
    public boolean t;
    public long f = 9223372034707292159L;
    public final float[] h = pk7.a();
    public m73 k = sgg.n();
    public ip6 l = ip6.Ltr;
    public final g61 m = new g61();
    public long o = nrd.b;
    public boolean s = true;
    public final ce u = new ce(23, this);

    public rf5(of5 of5Var, lf5 lf5Var, mn mnVar, b55 b55Var, m45 m45Var) {
        this.a = of5Var;
        this.b = lf5Var;
        this.c = mnVar;
        this.d = b55Var;
        this.e = m45Var;
    }

    public final float[] a() {
        float[] fArrA = this.i;
        if (fArrA == null) {
            fArrA = pk7.a();
            this.i = fArrA;
        }
        if (this.r) {
            this.r = false;
            float[] fArrB = b();
            if (this.s) {
                return fArrB;
            }
            if (!kyd.Z(fArrB, fArrA)) {
                fArrA[0] = Float.NaN;
                return null;
            }
        } else if (Float.isNaN(fArrA[0])) {
            return null;
        }
        return fArrA;
    }

    public final float[] b() {
        boolean z = this.q;
        float[] fArr = this.h;
        if (z) {
            of5 of5Var = this.a;
            long jS = of5Var.v;
            qf5 qf5Var = of5Var.a;
            if ((9223372034707292159L & jS) == 9205357640488583168L) {
                jS = hk7.s(nk7.C0(this.f));
            }
            float fIntBitsToFloat = Float.intBitsToFloat((int) (jS >> 32));
            float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jS & 4294967295L));
            float fB = qf5Var.B();
            float fV = qf5Var.v();
            float fE = qf5Var.E();
            float fP = qf5Var.p();
            float fR = qf5Var.r();
            float fC = qf5Var.c();
            float fM = qf5Var.M();
            double d = ((double) fE) * 0.017453292519943295d;
            float fSin = (float) Math.sin(d);
            float fCos = (float) Math.cos(d);
            float f = -fSin;
            float f2 = (fV * fCos) - (0.0f * fSin);
            float f3 = (0.0f * fCos) + (fV * fSin);
            double d2 = ((double) fP) * 0.017453292519943295d;
            float fSin2 = (float) Math.sin(d2);
            float fCos2 = (float) Math.cos(d2);
            float f4 = -fSin2;
            float f5 = fSin * fSin2;
            float f6 = fSin * fCos2;
            float f7 = fCos * fSin2;
            float f8 = fCos * fCos2;
            float f9 = (f3 * fSin2) + (fB * fCos2);
            float f10 = (f3 * fCos2) + ((-fB) * fSin2);
            double d3 = ((double) fR) * 0.017453292519943295d;
            float fSin3 = (float) Math.sin(d3);
            float fCos3 = (float) Math.cos(d3);
            float f11 = -fSin3;
            float f12 = (fCos3 * f5) + (f11 * fCos2);
            float f13 = (f5 * fSin3) + (fCos2 * fCos3);
            float f14 = fSin3 * fCos;
            float f15 = f13 * fC;
            float f16 = f14 * fC;
            float f17 = ((fSin3 * f6) + (fCos3 * f4)) * fC;
            float f18 = f12 * fM;
            float f19 = fCos * fCos3 * fM;
            float f20 = ((fCos3 * f6) + (f11 * f4)) * fM;
            float f21 = f7 * 1.0f;
            float f22 = f * 1.0f;
            float f23 = f8 * 1.0f;
            if (fArr.length >= 16) {
                fArr[0] = f15;
                fArr[1] = f16;
                fArr[2] = f17;
                fArr[3] = 0.0f;
                fArr[4] = f18;
                fArr[5] = f19;
                fArr[6] = f20;
                fArr[7] = 0.0f;
                fArr[8] = f21;
                fArr[9] = f22;
                fArr[10] = f23;
                fArr[11] = 0.0f;
                float f24 = -fIntBitsToFloat;
                fArr[12] = ((f15 * f24) - (fIntBitsToFloat2 * f18)) + f9 + fIntBitsToFloat;
                fArr[13] = ((f16 * f24) - (fIntBitsToFloat2 * f19)) + f2 + fIntBitsToFloat2;
                fArr[14] = ((f24 * f17) - (fIntBitsToFloat2 * f20)) + f10;
                fArr[15] = 1.0f;
            }
            this.q = false;
            this.s = qk7.u(fArr);
        }
        return fArr;
    }

    public final void c() {
        if (this.j || this.g) {
            return;
        }
        this.c.invalidate();
        f(true);
    }

    public final void d(long j) {
        boolean zP = mn.p();
        mn mnVar = this.c;
        if (zP) {
            mnVar.N(-4.0f);
        }
        of5 of5Var = this.a;
        if (!k46.b(of5Var.t, j)) {
            of5Var.t = j;
            of5Var.a.o((int) (j >> 32), (int) (j & 4294967295L), of5Var.u);
        }
        if (Build.VERSION.SDK_INT >= 26) {
            u36.q(mnVar);
        } else {
            mnVar.invalidate();
        }
    }

    public final void e(long j) {
        if (s46.a(j, this.f)) {
            return;
        }
        if (mn.p()) {
            this.c.N(-4.0f);
        }
        this.f = j;
        c();
    }

    public final void f(boolean z) {
        if (z != this.j) {
            this.j = z;
            mn mnVar = this.c;
            x68 x68Var = mnVar.E;
            boolean z2 = mnVar.G;
            if (!z) {
                if (z2) {
                    return;
                }
                x68Var.j(this);
                x68 x68Var2 = mnVar.F;
                if (x68Var2 != null) {
                    x68Var2.j(this);
                    return;
                }
                return;
            }
            if (!z2) {
                x68Var.a(this);
                return;
            }
            x68 x68Var3 = mnVar.F;
            if (x68Var3 == null) {
                x68Var3 = new x68();
                mnVar.F = x68Var3;
            }
            x68Var3.a(this);
        }
    }

    public final void g() {
        mn.p();
        if (this.j) {
            if (!nrd.a(this.o, nrd.b) && !s46.a(this.a.u, this.f)) {
                of5 of5Var = this.a;
                float fIntBitsToFloat = Float.intBitsToFloat((int) (this.o >> 32)) * ((int) (this.f >> 32));
                long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (this.o & 4294967295L)) * ((int) (this.f & 4294967295L)))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
                if (!ip8.b(of5Var.v, jFloatToRawIntBits)) {
                    of5Var.v = jFloatToRawIntBits;
                    of5Var.a.s(jFloatToRawIntBits);
                }
            }
            this.a.f(this.k, this.l, this.f, this.u);
            f(false);
        }
    }
}
