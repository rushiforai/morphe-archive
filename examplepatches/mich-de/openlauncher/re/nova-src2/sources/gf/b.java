package gf;

import io.sentry.e3;

/* loaded from: classes3.dex */
public final class b implements t0 {

    /* renamed from: a, reason: collision with root package name */
    public final t0 f57454a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f57455b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c f57456c;

    public b(c cVar, t0 t0Var) {
        this.f57456c = cVar;
        this.f57454a = t0Var;
    }

    @Override // gf.t0
    public final void c() {
        this.f57454a.c();
    }

    @Override // gf.t0
    public final int e(e3 e3Var, ie.f fVar, int i5) {
        c cVar = this.f57456c;
        if (cVar.f()) {
            return -3;
        }
        if (this.f57455b) {
            fVar.f61556b = 4;
            return -4;
        }
        int iE = this.f57454a.e(e3Var, fVar, i5);
        if (iE != -5) {
            long j11 = cVar.f57462f;
            if (j11 == Long.MIN_VALUE || ((iE != -4 || fVar.f61582f < j11) && !(iE == -3 && cVar.t() == Long.MIN_VALUE && !fVar.f61581e))) {
                return iE;
            }
            fVar.q();
            fVar.f61556b = 4;
            this.f57455b = true;
            return -4;
        }
        fe.k0 k0Var = (fe.k0) e3Var.f67209c;
        k0Var.getClass();
        int i11 = k0Var.C;
        int i12 = k0Var.B;
        if (i12 == 0 && i11 == 0) {
            return -5;
        }
        if (cVar.f57461e != 0) {
            i12 = 0;
        }
        if (cVar.f57462f != Long.MIN_VALUE) {
            i11 = 0;
        }
        fe.j0 j0VarA = k0Var.a();
        j0VarA.A = i12;
        j0VarA.B = i11;
        e3Var.f67209c = new fe.k0(j0VarA);
        return -5;
    }

    @Override // gf.t0
    public final int f(long j11) {
        if (this.f57456c.f()) {
            return -3;
        }
        return this.f57454a.f(j11);
    }

    @Override // gf.t0
    public final boolean isReady() {
        return !this.f57456c.f() && this.f57454a.isReady();
    }
}
