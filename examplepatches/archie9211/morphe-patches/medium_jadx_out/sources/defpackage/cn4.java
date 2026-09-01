package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cn4 extends zm4 implements qxd {
    public final zm4 d;
    public final mn6 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cn4(zm4 zm4Var, mn6 mn6Var) {
        super(zm4Var.b, zm4Var.c);
        mn6Var.getClass();
        this.d = zm4Var;
        this.e = mn6Var;
    }

    @Override // defpackage.qxd
    public final o3e f0() {
        return this.d;
    }

    @Override // defpackage.mn6
    public final mn6 l0(sn6 sn6Var) {
        mn6 mn6Var = this.e;
        mn6Var.getClass();
        return new cn4(this.d, mn6Var);
    }

    @Override // defpackage.o3e
    public final o3e n0(boolean z) {
        return qk7.B(this.d.n0(z), this.e.m0().n0(z));
    }

    @Override // defpackage.o3e
    /* JADX INFO: renamed from: o0 */
    public final o3e l0(sn6 sn6Var) {
        mn6 mn6Var = this.e;
        mn6Var.getClass();
        return new cn4(this.d, mn6Var);
    }

    @Override // defpackage.o3e
    public final o3e p0(uvd uvdVar) {
        uvdVar.getClass();
        return qk7.B(this.d.p0(uvdVar), this.e);
    }

    @Override // defpackage.zm4
    public final hec q0() {
        return this.d.q0();
    }

    @Override // defpackage.zm4
    public final String r0(w83 w83Var, w83 w83Var2) {
        g52 g52Var = w83Var2.a.m;
        fj6 fj6Var = a93.Y[11];
        g52Var.getClass();
        fj6Var.getClass();
        return ((Boolean) g52Var.a).booleanValue() ? w83Var.W(this.e) : this.d.r0(w83Var, w83Var2);
    }

    @Override // defpackage.zm4
    public final String toString() {
        return "[@EnhancedForWarnings(" + this.e + ")] " + this.d;
    }

    @Override // defpackage.qxd
    public final mn6 w() {
        return this.e;
    }
}
