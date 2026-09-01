package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ksd extends oic {
    public final oic e;
    public final boolean f;
    public final boolean g;
    public x45 h;
    public final long i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ksd(oic oicVar, x45 x45Var, boolean z, boolean z2) {
        x45 x45VarE;
        super(0L, sic.e);
        dsb dsbVar = uic.a;
        this.e = oicVar;
        this.f = z;
        this.g = z2;
        this.h = uic.i(x45Var, (oicVar == null || (x45VarE = oicVar.e()) == null) ? uic.j.e : x45VarE, z);
        this.i = to7.j();
    }

    @Override // defpackage.oic
    public final void c() {
        oic oicVar;
        this.c = true;
        if (!this.g || (oicVar = this.e) == null) {
            return;
        }
        oicVar.c();
    }

    @Override // defpackage.oic
    public final sic d() {
        return v().d();
    }

    @Override // defpackage.oic
    public final x45 e() {
        return this.h;
    }

    @Override // defpackage.oic
    public final boolean f() {
        return v().f();
    }

    @Override // defpackage.oic
    public final long g() {
        return v().g();
    }

    @Override // defpackage.oic
    public final x45 i() {
        return null;
    }

    @Override // defpackage.oic
    public final void k() {
        to7.y();
        throw null;
    }

    @Override // defpackage.oic
    public final void l() {
        to7.y();
        throw null;
    }

    @Override // defpackage.oic
    public final void m() {
        v().m();
    }

    @Override // defpackage.oic
    public final void n(dqc dqcVar) {
        v().n(dqcVar);
    }

    @Override // defpackage.oic
    public final oic u(x45 x45Var) {
        x45 x45VarI = uic.i(x45Var, this.h, true);
        return !this.f ? uic.e(v().u(null), x45VarI, true) : v().u(x45VarI);
    }

    public final oic v() {
        oic oicVar = this.e;
        return oicVar == null ? uic.j : oicVar;
    }
}
