package defpackage;

import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j12 extends n4 {
    public final sb2 c;
    public b55 d;
    public uz0 e;
    public enc f;
    public boolean g;

    public j12(sb2 sb2Var, iy9 iy9Var) {
        super(iy9Var);
        this.c = sb2Var;
        this.d = new at(2, 1, null);
    }

    @Override // defpackage.n4
    public final void m() {
        uz0 uz0Var = this.e;
        if (uz0Var != null) {
            uz0Var.f(new CancellationException("onBack cancelled"), true);
        }
        enc encVar = this.f;
        if (encVar != null) {
            encVar.m(null);
        }
        this.e = null;
        this.f = null;
        this.g = false;
    }

    @Override // defpackage.n4
    public final void n() {
        if (this.e != null && !this.g) {
            m();
        }
        n92 n92Var = null;
        if (this.e == null) {
            this.g = false;
            this.e = pwd.e(-2, 4, nz0.SUSPEND);
            this.f = vx0.c0(this.c, null, null, new r91(this, n92Var, 10), 3);
        }
        uz0 uz0Var = this.e;
        if (uz0Var != null) {
            uz0Var.c(null);
        }
        this.g = false;
    }

    @Override // defpackage.n4
    public final void o(sl0 sl0Var) {
        uz0 uz0Var = this.e;
        if (uz0Var != null) {
            uz0Var.e(sl0Var);
        }
    }

    @Override // defpackage.n4
    public final void p() {
        m();
        if (super.k()) {
            this.g = true;
            this.e = pwd.e(-2, 4, nz0.SUSPEND);
            this.f = vx0.c0(this.c, null, null, new r91(this, (n92) null, 10), 3);
        }
    }

    public final void u(boolean z) {
        enc encVar;
        if (!z && super.k() && (encVar = this.f) != null && !encVar.f()) {
            m();
        }
        ((ul0) this.a).f(z);
        ((tl0) this.b).f(z);
    }
}
