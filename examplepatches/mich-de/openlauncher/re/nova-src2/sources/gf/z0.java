package gf;

import fe.z1;

/* loaded from: classes3.dex */
public abstract class z0 extends h {

    /* renamed from: k, reason: collision with root package name */
    public final a f57671k;

    public z0(a aVar) {
        this.f57671k = aVar;
    }

    @Override // gf.a
    public final z1 f() {
        return this.f57671k.f();
    }

    @Override // gf.a
    public final fe.u0 g() {
        return this.f57671k.g();
    }

    @Override // gf.a
    public final boolean h() {
        return this.f57671k.h();
    }

    @Override // gf.a
    public final void k(vf.g0 g0Var) {
        this.f57506j = g0Var;
        this.f57505i = wf.v.j(null);
        y();
    }

    @Override // gf.h
    public final w r(Object obj, w wVar) {
        return w(wVar);
    }

    @Override // gf.h
    public final long s(long j11, Object obj) {
        return j11;
    }

    @Override // gf.h
    public final int t(int i5, Object obj) {
        return i5;
    }

    @Override // gf.h
    public final void u(Object obj, a aVar, z1 z1Var) {
        x(z1Var);
    }

    public w w(w wVar) {
        return wVar;
    }

    public abstract void x(z1 z1Var);

    public void y() {
        v(null, this.f57671k);
    }
}
