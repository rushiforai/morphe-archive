package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bn4 extends zm4 implements im2 {
    @Override // defpackage.im2
    public final o3e a0(mn6 mn6Var) {
        o3e o3eVarK;
        mn6Var.getClass();
        o3e o3eVarM0 = mn6Var.m0();
        if (o3eVarM0 instanceof zm4) {
            o3eVarK = o3eVarM0;
        } else {
            if (!(o3eVarM0 instanceof hec)) {
                ygf.a();
                return null;
            }
            hec hecVar = (hec) o3eVarM0;
            o3eVarK = pwd.K(hecVar, hecVar.n0(true));
        }
        return qk7.t(o3eVarK, o3eVarM0);
    }

    @Override // defpackage.im2
    public final boolean b0() {
        hec hecVar = this.b;
        return (hecVar.j0().a() instanceof swd) && g76.L(hecVar.j0(), this.c.j0());
    }

    @Override // defpackage.mn6
    public final mn6 l0(sn6 sn6Var) {
        hec hecVar = this.b;
        hecVar.getClass();
        hec hecVar2 = this.c;
        hecVar2.getClass();
        return new bn4(hecVar, hecVar2);
    }

    @Override // defpackage.o3e
    public final o3e n0(boolean z) {
        return pwd.K(this.b.n0(z), this.c.n0(z));
    }

    @Override // defpackage.o3e
    /* JADX INFO: renamed from: o0 */
    public final o3e l0(sn6 sn6Var) {
        hec hecVar = this.b;
        hecVar.getClass();
        hec hecVar2 = this.c;
        hecVar2.getClass();
        return new bn4(hecVar, hecVar2);
    }

    @Override // defpackage.o3e
    public final o3e p0(uvd uvdVar) {
        uvdVar.getClass();
        return pwd.K(this.b.p0(uvdVar), this.c.p0(uvdVar));
    }

    @Override // defpackage.zm4
    public final hec q0() {
        return this.b;
    }

    @Override // defpackage.zm4
    public final String r0(w83 w83Var, w83 w83Var2) {
        boolean zO = w83Var2.a.o();
        hec hecVar = this.c;
        hec hecVar2 = this.b;
        if (!zO) {
            return w83Var.E(w83Var.W(hecVar2), w83Var.W(hecVar), ok7.B(this));
        }
        return "(" + w83Var.W(hecVar2) + ".." + w83Var.W(hecVar) + ')';
    }

    @Override // defpackage.zm4
    public final String toString() {
        return "(" + this.b + ".." + this.c + ')';
    }
}
