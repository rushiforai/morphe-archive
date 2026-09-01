package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vua extends oic {
    public final x45 e;
    public int f;

    public vua(long j, sic sicVar, x45 x45Var) {
        super(j, sicVar);
        this.e = x45Var;
        this.f = 1;
    }

    @Override // defpackage.oic
    public final void c() {
        if (this.c) {
            return;
        }
        l();
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
        this.f++;
    }

    @Override // defpackage.oic
    public final void l() {
        int i = this.f - 1;
        this.f = i;
        if (i == 0) {
            a();
        }
    }

    @Override // defpackage.oic
    public final void n(dqc dqcVar) {
        dsb dsbVar = uic.a;
        throw new IllegalStateException("Cannot modify a state object in a read-only snapshot");
    }

    @Override // defpackage.oic
    public final oic u(x45 x45Var) {
        uic.w(this);
        return new yc8(this.b, this.a, uic.i(x45Var, this.e, true), this);
    }

    @Override // defpackage.oic
    public final void m() {
    }
}
