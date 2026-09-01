package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b43 extends q28 {
    public final int o = fh8.e(this);
    public q28 p;

    @Override // defpackage.q28
    public final void D0() {
        super.D0();
        for (q28 q28Var = this.p; q28Var != null; q28Var = q28Var.f) {
            q28Var.D0();
        }
    }

    @Override // defpackage.q28
    public final void E0() {
        for (q28 q28Var = this.p; q28Var != null; q28Var = q28Var.f) {
            q28Var.E0();
        }
        super.E0();
    }

    @Override // defpackage.q28
    public final void F0() {
        super.F0();
        for (q28 q28Var = this.p; q28Var != null; q28Var = q28Var.f) {
            q28Var.F0();
        }
    }

    @Override // defpackage.q28
    public final void G0(q28 q28Var) {
        this.a = q28Var;
        for (q28 q28Var2 = this.p; q28Var2 != null; q28Var2 = q28Var2.f) {
            q28Var2.G0(q28Var);
        }
    }

    @Override // defpackage.q28
    public final void H0(eh8 eh8Var) {
        this.h = eh8Var;
        for (q28 q28Var = this.p; q28Var != null; q28Var = q28Var.f) {
            q28Var.H0(eh8Var);
        }
    }

    public final a43 I0(a43 a43Var) {
        q28 q28Var = ((q28) a43Var).a;
        if (q28Var != a43Var) {
            q28 q28Var2 = a43Var instanceof q28 ? (q28) a43Var : null;
            q28 q28Var3 = q28Var2 != null ? q28Var2.e : null;
            if (q28Var != this.a || !g76.L(q28Var3, this)) {
                ygf.f("Cannot delegate to an already delegated node");
                return null;
            }
        } else {
            if (q28Var.n) {
                b26.b("Cannot delegate to an already attached node");
            }
            q28Var.G0(this.a);
            int i = this.c;
            int iF = fh8.f(q28Var);
            q28Var.c = iF;
            int i2 = this.c;
            int i3 = iF & 2;
            if (i3 != 0 && (i2 & 2) != 0 && !(this instanceof sp6)) {
                b26.b("Delegating to multiple LayoutModifierNodes without the delegating node implementing LayoutModifierNode itself is not allowed.\nDelegating Node: " + this + "\nDelegate Node: " + q28Var);
            }
            q28Var.f = this.p;
            this.p = q28Var;
            q28Var.e = this;
            K0(iF | this.c, false);
            if (this.n) {
                if (i3 == 0 || (i & 2) != 0) {
                    H0(this.h);
                } else {
                    hj0 hj0Var = flb.v0(this).F;
                    this.a.H0(null);
                    hj0Var.i();
                }
                q28Var.w0();
                q28Var.E0();
                if (!q28Var.n) {
                    b26.b("autoInvalidateInsertedNode called on unattached node");
                }
                fh8.a(q28Var, -1, 1);
            }
        }
        return a43Var;
    }

    public final void J0(a43 a43Var) {
        q28 q28Var = null;
        for (q28 q28Var2 = this.p; q28Var2 != null; q28Var2 = q28Var2.f) {
            if (q28Var2 == a43Var) {
                boolean z = q28Var2.n;
                if (z) {
                    t68 t68Var = fh8.a;
                    if (!z) {
                        b26.b("autoInvalidateRemovedNode called on unattached node");
                    }
                    fh8.a(q28Var2, -1, 2);
                    q28Var2.F0();
                    q28Var2.x0();
                }
                q28Var2.G0(q28Var2);
                q28Var2.d = 0;
                q28 q28Var3 = q28Var2.f;
                if (q28Var == null) {
                    this.p = q28Var3;
                } else {
                    q28Var.f = q28Var3;
                }
                q28Var2.f = null;
                q28Var2.e = null;
                int i = this.c;
                int iF = fh8.f(this);
                K0(iF, true);
                if (this.n && (i & 2) != 0 && (iF & 2) == 0) {
                    hj0 hj0Var = flb.v0(this).F;
                    this.a.H0(null);
                    hj0Var.i();
                    return;
                }
                return;
            }
            q28Var = q28Var2;
        }
        ik4.m("Could not find delegate: ", a43Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r2v2, types: [q28] */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6 */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8 */
    public final void K0(int i, boolean z) {
        q28 q28Var;
        int i2 = this.c;
        this.c = i;
        if (i2 != i) {
            q28 q28Var2 = this.a;
            if (q28Var2 == this) {
                this.d = i;
            }
            boolean z2 = this.n;
            ?? r2 = this;
            if (z2) {
                while (r2 != 0) {
                    i |= r2.c;
                    r2.c = i;
                    if (r2 == q28Var2) {
                        break;
                    } else {
                        r2 = r2.e;
                    }
                }
                if (z && r2 == q28Var2) {
                    i = fh8.f(q28Var2);
                    q28Var2.c = i;
                }
                int i3 = i | ((r2 == 0 || (q28Var = r2.f) == null) ? 0 : q28Var.d);
                for (?? r22 = r2; r22 != 0; r22 = r22.e) {
                    i3 |= r22.c;
                    r22.d = i3;
                }
            }
        }
    }

    @Override // defpackage.q28
    public final void w0() {
        super.w0();
        for (q28 q28Var = this.p; q28Var != null; q28Var = q28Var.f) {
            q28Var.H0(this.h);
            if (!q28Var.n) {
                q28Var.w0();
            }
        }
    }

    @Override // defpackage.q28
    public final void x0() {
        for (q28 q28Var = this.p; q28Var != null; q28Var = q28Var.f) {
            q28Var.x0();
        }
        super.x0();
    }
}
