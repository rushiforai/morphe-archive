package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mj2 extends c09 {
    public final c09 f;
    public final w82 g;
    public final long h;
    public final boolean i;
    public cmd k;
    public boolean l;
    public bs0 n;
    public c09 o;
    public final long p;
    public final h49 j = new h49(0);
    public float m = 1.0f;

    public mj2(c09 c09Var, c09 c09Var2, w82 w82Var, long j, boolean z) {
        this.f = c09Var2;
        this.g = w82Var;
        this.h = j;
        this.i = z;
        this.o = c09Var;
        long jH = c09Var != null ? c09Var.h() : 0L;
        long jH2 = c09Var2 != null ? c09Var2.h() : 0L;
        long jFloatToRawIntBits = 9205357640488583168L;
        boolean z2 = jH != 9205357640488583168L;
        boolean z3 = jH2 != 9205357640488583168L;
        if (z2 && z3) {
            jFloatToRawIntBits = (((long) Float.floatToRawIntBits(Math.max(Float.intBitsToFloat((int) (jH >> 32)), Float.intBitsToFloat((int) (jH2 >> 32))))) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(Math.max(Float.intBitsToFloat((int) (jH & 4294967295L)), Float.intBitsToFloat((int) (jH2 & 4294967295L))))));
        }
        this.p = jFloatToRawIntBits;
    }

    @Override // defpackage.c09
    public final boolean a(float f) {
        this.m = f;
        return true;
    }

    @Override // defpackage.c09
    public final boolean e(bs0 bs0Var) {
        this.n = bs0Var;
        return true;
    }

    @Override // defpackage.c09
    public final long h() {
        return this.p;
    }

    @Override // defpackage.c09
    public final void i(zl3 zl3Var) {
        boolean z = this.l;
        c09 c09Var = this.f;
        if (z) {
            j(zl3Var, c09Var, this.m);
            return;
        }
        cmd cmdVar = this.k;
        if (cmdVar == null) {
            cmdVar = new cmd(e38.a());
            this.k = cmdVar;
        }
        float fD = in3.d(cmd.a(cmdVar.a)) / in3.d(this.h);
        float fU = iq7.u(fD, 0.0f, 1.0f);
        float f = this.m;
        float f2 = fU * f;
        if (this.i) {
            f -= f2;
        }
        this.l = fD >= 1.0f;
        j(zl3Var, this.o, f);
        j(zl3Var, c09Var, f2);
        if (this.l) {
            this.o = null;
        } else {
            h49 h49Var = this.j;
            h49Var.h(h49Var.g() + 1);
        }
    }

    public final void j(zl3 zl3Var, c09 c09Var, float f) {
        if (c09Var == null || f <= 0.0f) {
            return;
        }
        long jF = zl3Var.f();
        long jH = c09Var.h();
        long jH2 = (jH == 9205357640488583168L || dfc.e(jH) || jF == 9205357640488583168L || dfc.e(jF)) ? jF : hp7.H(jH, this.g.g(jH, jF));
        if (jF == 9205357640488583168L || dfc.e(jF)) {
            c09Var.g(zl3Var, jH2, f, this.n);
            return;
        }
        float fIntBitsToFloat = (Float.intBitsToFloat((int) (jF >> 32)) - Float.intBitsToFloat((int) (jH2 >> 32))) / 2.0f;
        float fIntBitsToFloat2 = (Float.intBitsToFloat((int) (jF & 4294967295L)) - Float.intBitsToFloat((int) (jH2 & 4294967295L))) / 2.0f;
        ((md5) zl3Var.b0().b).j(fIntBitsToFloat, fIntBitsToFloat2, fIntBitsToFloat, fIntBitsToFloat2);
        try {
            c09Var.g(zl3Var, jH2, f, this.n);
        } finally {
            float f2 = -fIntBitsToFloat;
            float f3 = -fIntBitsToFloat2;
            ((md5) zl3Var.b0().b).j(f2, f3, f2, f3);
        }
    }
}
