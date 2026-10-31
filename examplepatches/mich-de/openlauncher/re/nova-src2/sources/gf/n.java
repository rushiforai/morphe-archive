package gf;

import fe.s1;

/* loaded from: classes3.dex */
public final class n implements t, s {

    /* renamed from: a, reason: collision with root package name */
    public final w f57567a;

    /* renamed from: b, reason: collision with root package name */
    public final long f57568b;

    /* renamed from: c, reason: collision with root package name */
    public final vf.m f57569c;

    /* renamed from: d, reason: collision with root package name */
    public a f57570d;

    /* renamed from: e, reason: collision with root package name */
    public t f57571e;

    /* renamed from: f, reason: collision with root package name */
    public s f57572f;

    /* renamed from: g, reason: collision with root package name */
    public long f57573g = -9223372036854775807L;

    public n(w wVar, vf.m mVar, long j11) {
        this.f57567a = wVar;
        this.f57569c = mVar;
        this.f57568b = j11;
    }

    @Override // gf.s
    public final void a(u0 u0Var) {
        s sVar = this.f57572f;
        int i5 = wf.v.f94376a;
        sVar.a(this);
    }

    @Override // gf.s
    public final void b(t tVar) {
        s sVar = this.f57572f;
        int i5 = wf.v.f94376a;
        sVar.b(this);
    }

    @Override // gf.u0
    public final boolean c() {
        t tVar = this.f57571e;
        return tVar != null && tVar.c();
    }

    @Override // gf.u0
    public final long d() {
        t tVar = this.f57571e;
        int i5 = wf.v.f94376a;
        return tVar.d();
    }

    @Override // gf.t
    public final long e(long j11) {
        t tVar = this.f57571e;
        int i5 = wf.v.f94376a;
        return tVar.e(j11);
    }

    public final void f(w wVar) {
        long j11 = this.f57573g;
        if (j11 == -9223372036854775807L) {
            j11 = this.f57568b;
        }
        a aVar = this.f57570d;
        aVar.getClass();
        t tVarA = aVar.a(wVar, this.f57569c, j11);
        this.f57571e = tVarA;
        if (this.f57572f != null) {
            tVarA.r(this, j11);
        }
    }

    @Override // gf.t
    public final long h(tf.q[] qVarArr, boolean[] zArr, t0[] t0VarArr, boolean[] zArr2, long j11) {
        long j12;
        long j13 = this.f57573g;
        if (j13 == -9223372036854775807L || j11 != this.f57568b) {
            j12 = j11;
        } else {
            this.f57573g = -9223372036854775807L;
            j12 = j13;
        }
        t tVar = this.f57571e;
        int i5 = wf.v.f94376a;
        return tVar.h(qVarArr, zArr, t0VarArr, zArr2, j12);
    }

    @Override // gf.t
    public final long i() {
        t tVar = this.f57571e;
        int i5 = wf.v.f94376a;
        return tVar.i();
    }

    @Override // gf.t
    public final void l() {
        t tVar = this.f57571e;
        if (tVar != null) {
            tVar.l();
            return;
        }
        a aVar = this.f57570d;
        if (aVar != null) {
            aVar.i();
        }
    }

    @Override // gf.t
    public final void m(long j11) {
        t tVar = this.f57571e;
        int i5 = wf.v.f94376a;
        tVar.m(j11);
    }

    @Override // gf.u0
    public final boolean n(long j11) {
        t tVar = this.f57571e;
        return tVar != null && tVar.n(j11);
    }

    @Override // gf.t
    public final long p(long j11, s1 s1Var) {
        t tVar = this.f57571e;
        int i5 = wf.v.f94376a;
        return tVar.p(j11, s1Var);
    }

    @Override // gf.t
    public final y0 q() {
        t tVar = this.f57571e;
        int i5 = wf.v.f94376a;
        return tVar.q();
    }

    @Override // gf.t
    public final void r(s sVar, long j11) {
        this.f57572f = sVar;
        t tVar = this.f57571e;
        if (tVar != null) {
            long j12 = this.f57573g;
            if (j12 == -9223372036854775807L) {
                j12 = this.f57568b;
            }
            tVar.r(this, j12);
        }
    }

    @Override // gf.u0
    public final long t() {
        t tVar = this.f57571e;
        int i5 = wf.v.f94376a;
        return tVar.t();
    }

    @Override // gf.u0
    public final void v(long j11) {
        t tVar = this.f57571e;
        int i5 = wf.v.f94376a;
        tVar.v(j11);
    }
}
