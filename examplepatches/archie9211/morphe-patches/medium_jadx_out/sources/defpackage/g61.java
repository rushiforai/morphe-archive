package defpackage;

import android.graphics.Paint;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g61 implements zl3 {
    public final f61 a;
    public final m50 b;
    public uq c;
    public uq d;

    public g61() {
        p73 p73Var = flb.g;
        ip6 ip6Var = ip6.Ltr;
        f61 f61Var = new f61();
        f61Var.a = p73Var;
        f61Var.b = ip6Var;
        f61Var.c = xx3.a;
        f61Var.d = 0L;
        this.a = f61Var;
        this.b = new m50(this);
    }

    public static uq a(g61 g61Var, long j, pxf pxfVar, float f, int i) {
        uq uqVarD = g61Var.d(pxfVar);
        if (f != 1.0f) {
            j = uu1.b(uu1.c(j) * f, j);
        }
        Paint paint = uqVarD.a;
        long j2 = op8.j(paint.getColor());
        int i2 = uu1.i;
        if (!ezd.a(j2, j)) {
            uqVarD.e(j);
        }
        if (uqVarD.c != null) {
            uqVarD.h(null);
        }
        if (!g76.L(uqVarD.d, null)) {
            uqVarD.f(null);
        }
        if (uqVarD.b != i) {
            uqVarD.d(i);
        }
        if (paint.isFilterBitmap()) {
            return uqVarD;
        }
        uqVarD.g(1);
        return uqVarD;
    }

    @Override // defpackage.zl3
    public final void E(long j, long j2, long j3, float f, int i) {
        e61 e61Var = this.a.c;
        uq uqVarZ = this.d;
        if (uqVarZ == null) {
            uqVarZ = rx0.z();
            uqVarZ.l(1);
            this.d = uqVarZ;
        }
        Paint paint = uqVarZ.a;
        long j4 = op8.j(paint.getColor());
        int i2 = uu1.i;
        if (!ezd.a(j4, j)) {
            uqVarZ.e(j);
        }
        if (uqVarZ.c != null) {
            uqVarZ.h(null);
        }
        if (!g76.L(uqVarZ.d, null)) {
            uqVarZ.f(null);
        }
        if (uqVarZ.b != 3) {
            uqVarZ.d(3);
        }
        if (paint.getStrokeWidth() != f) {
            uqVarZ.k(f);
        }
        if (paint.getStrokeMiter() != 4.0f) {
            paint.setStrokeMiter(4.0f);
        }
        if (uqVarZ.a() != i) {
            uqVarZ.i(i);
        }
        if (uqVarZ.b() != 0) {
            uqVarZ.j(0);
        }
        if (!paint.isFilterBitmap()) {
            uqVarZ.g(1);
        }
        e61Var.i(j2, j3, uqVarZ);
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return km4.j(this, Q(f));
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return i / b();
    }

    @Override // defpackage.zl3
    public final void O(long j, float f, float f2, long j2, long j3, float f3, pxf pxfVar) {
        int i = (int) (j2 >> 32);
        int i2 = (int) (j2 & 4294967295L);
        this.a.c.u(Float.intBitsToFloat(i), Float.intBitsToFloat(i2), Float.intBitsToFloat((int) (j3 >> 32)) + Float.intBitsToFloat(i), Float.intBitsToFloat((int) (j3 & 4294967295L)) + Float.intBitsToFloat(i2), f, f2, a(this, j, pxfVar, f3, 3));
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / b();
    }

    @Override // defpackage.zl3
    public final void S(br brVar, ez0 ez0Var, float f, pxf pxfVar, int i) {
        this.a.c.f(brVar, c(ez0Var, pxfVar, f, null, i, 1));
    }

    @Override // defpackage.m73
    public final float U() {
        return this.a.a.U();
    }

    @Override // defpackage.zl3
    public final void V(br brVar, long j, float f, pxf pxfVar) {
        this.a.c.f(brVar, a(this, j, pxfVar, f, 3));
    }

    @Override // defpackage.zl3
    public final void Y(long j, long j2, long j3, float f, pxf pxfVar, int i) {
        int i2 = (int) (j2 >> 32);
        int i3 = (int) (j2 & 4294967295L);
        this.a.c.l(Float.intBitsToFloat(i2), Float.intBitsToFloat(i3), Float.intBitsToFloat((int) (j3 >> 32)) + Float.intBitsToFloat(i2), Float.intBitsToFloat((int) (4294967295L & j3)) + Float.intBitsToFloat(i3), a(this, j, pxfVar, f, i));
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return b() * f;
    }

    @Override // defpackage.m73
    public final float b() {
        return this.a.a.b();
    }

    @Override // defpackage.zl3
    public final m50 b0() {
        return this.b;
    }

    public final uq c(ez0 ez0Var, pxf pxfVar, float f, bs0 bs0Var, int i, int i2) {
        uq uqVarD = d(pxfVar);
        if (ez0Var != null) {
            ez0Var.a(f, this.b.B(), uqVarD);
        } else {
            Paint paint = uqVarD.a;
            if (uqVarD.c != null) {
                uqVarD.h(null);
            }
            long j = op8.j(paint.getColor());
            long j2 = uu1.b;
            if (!ezd.a(j, j2)) {
                uqVarD.e(j2);
            }
            if (paint.getAlpha() / 255.0f != f) {
                uqVarD.c(f);
            }
        }
        if (!g76.L(uqVarD.d, bs0Var)) {
            uqVarD.f(bs0Var);
        }
        if (uqVarD.b != i) {
            uqVarD.d(i);
        }
        if (uqVarD.a.isFilterBitmap() == i2) {
            return uqVarD;
        }
        uqVarD.g(i2);
        return uqVarD;
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        throw null;
    }

    public final uq d(pxf pxfVar) {
        if (g76.L(pxfVar, ph4.R)) {
            uq uqVar = this.c;
            if (uqVar != null) {
                return uqVar;
            }
            uq uqVarZ = rx0.z();
            uqVarZ.l(0);
            this.c = uqVarZ;
            return uqVarZ;
        }
        if (!(pxfVar instanceof uuc)) {
            ygf.a();
            return null;
        }
        uq uqVarZ2 = this.d;
        if (uqVarZ2 == null) {
            uqVarZ2 = rx0.z();
            uqVarZ2.l(1);
            this.d = uqVarZ2;
        }
        Paint paint = uqVarZ2.a;
        float strokeWidth = paint.getStrokeWidth();
        uuc uucVar = (uuc) pxfVar;
        float f = uucVar.R;
        if (strokeWidth != f) {
            uqVarZ2.k(f);
        }
        int iA = uqVarZ2.a();
        int i = uucVar.T;
        if (iA != i) {
            uqVarZ2.i(i);
        }
        float strokeMiter = paint.getStrokeMiter();
        float f2 = uucVar.S;
        if (strokeMiter != f2) {
            paint.setStrokeMiter(f2);
        }
        int iB = uqVarZ2.b();
        int i2 = uucVar.U;
        if (iB == i2) {
            return uqVarZ2;
        }
        uqVarZ2.j(i2);
        return uqVarZ2;
    }

    @Override // defpackage.zl3
    public final long f() {
        return this.b.B();
    }

    @Override // defpackage.zl3
    public final void f0(oz6 oz6Var, float f, long j, pxf pxfVar) {
        this.a.c.d(f, j, c(oz6Var, pxfVar, 1.0f, null, 3, 1));
    }

    @Override // defpackage.zl3
    public final void g0(wp wpVar, long j, long j2, long j3, float f, bs0 bs0Var, int i) {
        this.a.c.e(wpVar, j, j2, j3, c(null, ph4.R, f, bs0Var, 3, i));
    }

    @Override // defpackage.zl3
    public final ip6 getLayoutDirection() {
        return this.a.b;
    }

    @Override // defpackage.m73
    public final /* synthetic */ int i0(float f) {
        return ho2.d(this, f);
    }

    @Override // defpackage.zl3
    public final long k0() {
        return hk7.s(this.b.B());
    }

    @Override // defpackage.m73
    public final /* synthetic */ long m0(long j) {
        return ho2.g(j, this);
    }

    @Override // defpackage.zl3
    public final void o(ez0 ez0Var, long j, long j2, long j3, float f, pxf pxfVar) {
        int i = (int) (j >> 32);
        int i2 = (int) (j & 4294967295L);
        this.a.c.g(Float.intBitsToFloat(i), Float.intBitsToFloat(i2), Float.intBitsToFloat((int) (j2 >> 32)) + Float.intBitsToFloat(i), Float.intBitsToFloat((int) (j2 & 4294967295L)) + Float.intBitsToFloat(i2), Float.intBitsToFloat((int) (j3 >> 32)), Float.intBitsToFloat((int) (j3 & 4294967295L)), c(ez0Var, pxfVar, f, null, 3, 1));
    }

    @Override // defpackage.m73
    public final /* synthetic */ float p0(long j) {
        return ho2.f(j, this);
    }

    @Override // defpackage.zl3
    public final void q(long j, long j2, long j3, long j4, pxf pxfVar) {
        int i = (int) (j2 >> 32);
        int i2 = (int) (j2 & 4294967295L);
        this.a.c.g(Float.intBitsToFloat(i), Float.intBitsToFloat(i2), Float.intBitsToFloat((int) (j3 >> 32)) + Float.intBitsToFloat(i), Float.intBitsToFloat((int) (j3 & 4294967295L)) + Float.intBitsToFloat(i2), Float.intBitsToFloat((int) (j4 >> 32)), Float.intBitsToFloat((int) (j4 & 4294967295L)), a(this, j, pxfVar, 1.0f, 3));
    }

    @Override // defpackage.m73
    public final /* synthetic */ long r(long j) {
        return ho2.e(j, this);
    }

    @Override // defpackage.zl3
    public final void t0(oz6 oz6Var, float f, long j, pxf pxfVar) {
        this.a.c.u(Float.intBitsToFloat(0), Float.intBitsToFloat(0), Float.intBitsToFloat((int) (j >> 32)) + Float.intBitsToFloat(0), Float.intBitsToFloat((int) (4294967295L & j)) + Float.intBitsToFloat(0), -90.0f, f, c(oz6Var, pxfVar, 1.0f, null, 3, 1));
    }

    @Override // defpackage.zl3
    public final void u(long j, float f, long j2, pxf pxfVar) {
        this.a.c.d(f, j2, a(this, j, pxfVar, 1.0f, 3));
    }

    @Override // defpackage.m73
    public final /* synthetic */ float z(long j) {
        return km4.i(j, this);
    }
}
