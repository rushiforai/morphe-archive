package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yc8 extends oic {
    public final x45 e;
    public final oic f;

    public yc8(long j, sic sicVar, x45 x45Var, oic oicVar) {
        super(j, sicVar);
        this.e = x45Var;
        this.f = oicVar;
        oicVar.k();
    }

    @Override // defpackage.oic
    public final void c() {
        oic oicVar = this.f;
        if (this.c) {
            return;
        }
        if (this.b != oicVar.g()) {
            a();
        }
        oicVar.l();
        this.c = true;
        synchronized (uic.c) {
            o();
        }
    }

    @Override // defpackage.oic
    public final x45 e() {
        return this.e;
    }

    @Override // defpackage.oic
    public final boolean f() {
        return true;
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
    public final void n(dqc dqcVar) {
        dsb dsbVar = uic.a;
        throw new IllegalStateException("Cannot modify a state object in a read-only snapshot");
    }

    @Override // defpackage.oic
    public final oic u(x45 x45Var) {
        return new yc8(this.b, this.a, uic.i(x45Var, this.e, true), this.f);
    }

    @Override // defpackage.oic
    public final void m() {
    }
}
