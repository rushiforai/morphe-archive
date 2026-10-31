package gf;

import fe.s1;

/* loaded from: classes3.dex */
public final class d0 implements t, s {

    /* renamed from: a, reason: collision with root package name */
    public final t f57470a;

    /* renamed from: b, reason: collision with root package name */
    public final long f57471b;

    /* renamed from: c, reason: collision with root package name */
    public s f57472c;

    public d0(t tVar, long j11) {
        this.f57470a = tVar;
        this.f57471b = j11;
    }

    @Override // gf.s
    public final void a(u0 u0Var) {
        s sVar = this.f57472c;
        sVar.getClass();
        sVar.a(this);
    }

    @Override // gf.s
    public final void b(t tVar) {
        s sVar = this.f57472c;
        sVar.getClass();
        sVar.b(this);
    }

    @Override // gf.u0
    public final boolean c() {
        return this.f57470a.c();
    }

    @Override // gf.u0
    public final long d() {
        long jD = this.f57470a.d();
        if (jD == Long.MIN_VALUE) {
            return Long.MIN_VALUE;
        }
        return jD + this.f57471b;
    }

    @Override // gf.t
    public final long e(long j11) {
        long j12 = this.f57471b;
        return this.f57470a.e(j11 - j12) + j12;
    }

    @Override // gf.t
    public final long h(tf.q[] qVarArr, boolean[] zArr, t0[] t0VarArr, boolean[] zArr2, long j11) {
        t0[] t0VarArr2 = new t0[t0VarArr.length];
        int i5 = 0;
        while (true) {
            t0 t0Var = null;
            if (i5 >= t0VarArr.length) {
                break;
            }
            e0 e0Var = (e0) t0VarArr[i5];
            if (e0Var != null) {
                t0Var = e0Var.f57482a;
            }
            t0VarArr2[i5] = t0Var;
            i5++;
        }
        t tVar = this.f57470a;
        long j12 = this.f57471b;
        long jH = tVar.h(qVarArr, zArr, t0VarArr2, zArr2, j11 - j12);
        for (int i11 = 0; i11 < t0VarArr.length; i11++) {
            t0 t0Var2 = t0VarArr2[i11];
            if (t0Var2 == null) {
                t0VarArr[i11] = null;
            } else {
                t0 t0Var3 = t0VarArr[i11];
                if (t0Var3 == null || ((e0) t0Var3).f57482a != t0Var2) {
                    t0VarArr[i11] = new e0(t0Var2, j12);
                }
            }
        }
        return jH + j12;
    }

    @Override // gf.t
    public final long i() {
        long jI = this.f57470a.i();
        if (jI == -9223372036854775807L) {
            return -9223372036854775807L;
        }
        return jI + this.f57471b;
    }

    @Override // gf.t
    public final void l() {
        this.f57470a.l();
    }

    @Override // gf.t
    public final void m(long j11) {
        this.f57470a.m(j11 - this.f57471b);
    }

    @Override // gf.u0
    public final boolean n(long j11) {
        return this.f57470a.n(j11 - this.f57471b);
    }

    @Override // gf.t
    public final long p(long j11, s1 s1Var) {
        long j12 = this.f57471b;
        return this.f57470a.p(j11 - j12, s1Var) + j12;
    }

    @Override // gf.t
    public final y0 q() {
        return this.f57470a.q();
    }

    @Override // gf.t
    public final void r(s sVar, long j11) {
        this.f57472c = sVar;
        this.f57470a.r(this, j11 - this.f57471b);
    }

    @Override // gf.u0
    public final long t() {
        long jT = this.f57470a.t();
        if (jT == Long.MIN_VALUE) {
            return Long.MIN_VALUE;
        }
        return jT + this.f57471b;
    }

    @Override // gf.u0
    public final void v(long j11) {
        this.f57470a.v(j11 - this.f57471b);
    }
}
