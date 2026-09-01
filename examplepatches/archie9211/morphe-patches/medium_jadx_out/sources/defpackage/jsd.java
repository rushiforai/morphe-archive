package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jsd extends k78 {
    public final k78 o;
    public final boolean p;
    public final boolean q;
    public x45 r;
    public x45 s;
    public final long t;

    /* JADX WARN: Illegal instructions before constructor call */
    public jsd(k78 k78Var, x45 x45Var, x45 x45Var2, boolean z, boolean z2) {
        x45 x45VarI;
        x45 x45VarY;
        dsb dsbVar = uic.a;
        super(0L, sic.e, uic.i(x45Var, (k78Var == null || (x45VarY = k78Var.e()) == null) ? uic.j.e : x45VarY, z), uic.j(x45Var2, (k78Var == null || (x45VarI = k78Var.i()) == null) ? uic.j.f : x45VarI));
        this.o = k78Var;
        this.p = z;
        this.q = z2;
        this.r = this.e;
        this.s = this.f;
        this.t = to7.j();
    }

    @Override // defpackage.k78
    public final void C(g78 g78Var) {
        to7.y();
        throw null;
    }

    @Override // defpackage.k78
    public final k78 D(x45 x45Var, x45 x45Var2) {
        x45 x45VarI = uic.i(x45Var, this.r, true);
        x45 x45VarJ = uic.j(x45Var2, this.s);
        return !this.p ? new jsd(E().D(null, x45VarJ), x45VarI, x45VarJ, false, true) : E().D(x45VarI, x45VarJ);
    }

    public final k78 E() {
        k78 k78Var = this.o;
        return k78Var == null ? uic.j : k78Var;
    }

    @Override // defpackage.k78, defpackage.oic
    public final void c() {
        k78 k78Var;
        this.c = true;
        if (!this.q || (k78Var = this.o) == null) {
            return;
        }
        k78Var.c();
    }

    @Override // defpackage.oic
    public final sic d() {
        return E().d();
    }

    @Override // defpackage.k78, defpackage.oic
    public final x45 e() {
        return this.r;
    }

    @Override // defpackage.k78, defpackage.oic
    public final boolean f() {
        return E().f();
    }

    @Override // defpackage.oic
    public final long g() {
        return E().g();
    }

    @Override // defpackage.k78, defpackage.oic
    public final int h() {
        return E().h();
    }

    @Override // defpackage.k78, defpackage.oic
    public final x45 i() {
        return this.s;
    }

    @Override // defpackage.k78, defpackage.oic
    public final void k() {
        to7.y();
        throw null;
    }

    @Override // defpackage.k78, defpackage.oic
    public final void l() {
        to7.y();
        throw null;
    }

    @Override // defpackage.k78, defpackage.oic
    public final void m() {
        E().m();
    }

    @Override // defpackage.k78, defpackage.oic
    public final void n(dqc dqcVar) {
        E().n(dqcVar);
    }

    @Override // defpackage.oic
    public final void r(sic sicVar) {
        to7.y();
        throw null;
    }

    @Override // defpackage.oic
    public final void s(long j) {
        to7.y();
        throw null;
    }

    @Override // defpackage.k78, defpackage.oic
    public final void t(int i) {
        E().t(i);
    }

    @Override // defpackage.k78, defpackage.oic
    public final oic u(x45 x45Var) {
        x45 x45VarI = uic.i(x45Var, this.r, true);
        return !this.p ? uic.e(E().u(null), x45VarI, true) : E().u(x45VarI);
    }

    @Override // defpackage.k78
    public final fo7 w() {
        return E().w();
    }

    @Override // defpackage.k78
    public final g78 x() {
        return E().x();
    }

    @Override // defpackage.k78
    /* JADX INFO: renamed from: y */
    public final x45 e() {
        return this.r;
    }
}
