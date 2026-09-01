package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v33 extends l43 implements im2, hkb {
    public final hec b;
    public final boolean c;

    public v33(hec hecVar, boolean z) {
        this.b = hecVar;
        this.c = z;
    }

    @Override // defpackage.im2
    public final o3e a0(mn6 mn6Var) {
        mn6Var.getClass();
        o3e o3eVarM0 = mn6Var.m0();
        v33 v33VarT = hpe.t(o3eVarM0, this.c);
        if (v33VarT != null) {
            return v33VarT;
        }
        hec hecVarJ = gq7.J(o3eVarM0);
        return hecVarJ != null ? hecVarJ : o3eVarM0.n0(false);
    }

    @Override // defpackage.im2
    public final boolean b0() {
        hec hecVar = this.b;
        hecVar.j0();
        return hecVar.j0().a() instanceof swd;
    }

    @Override // defpackage.l43, defpackage.mn6
    public final boolean k0() {
        return false;
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: q0 */
    public final hec n0(boolean z) {
        return z ? this.b.n0(z) : this;
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: r0 */
    public final hec p0(uvd uvdVar) {
        uvdVar.getClass();
        return new v33(this.b.p0(uvdVar), this.c);
    }

    @Override // defpackage.l43
    public final hec s0() {
        return this.b;
    }

    @Override // defpackage.hec
    public final String toString() {
        return this.b + " & Any";
    }

    @Override // defpackage.l43
    public final l43 u0(hec hecVar) {
        return new v33(hecVar, this.c);
    }
}
