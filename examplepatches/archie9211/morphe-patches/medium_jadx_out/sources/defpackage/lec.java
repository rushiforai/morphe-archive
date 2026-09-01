package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lec extends l43 implements qxd {
    public final hec b;
    public final mn6 c;

    public lec(hec hecVar, mn6 mn6Var) {
        mn6Var.getClass();
        this.b = hecVar;
        this.c = mn6Var;
    }

    @Override // defpackage.qxd
    public final o3e f0() {
        return this.b;
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: q0 */
    public final hec n0(boolean z) {
        o3e o3eVarB = qk7.B(this.b.n0(z), this.c.m0().n0(z));
        o3eVarB.getClass();
        return (hec) o3eVarB;
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: r0 */
    public final hec p0(uvd uvdVar) {
        uvdVar.getClass();
        o3e o3eVarB = qk7.B(this.b.p0(uvdVar), this.c);
        o3eVarB.getClass();
        return (hec) o3eVarB;
    }

    @Override // defpackage.l43
    public final hec s0() {
        return this.b;
    }

    @Override // defpackage.hec
    public final String toString() {
        return "[@EnhancedForWarnings(" + this.c + ")] " + this.b;
    }

    @Override // defpackage.l43
    public final l43 u0(hec hecVar) {
        return new lec(hecVar, this.c);
    }

    @Override // defpackage.l43
    /* JADX INFO: renamed from: v0, reason: merged with bridge method [inline-methods] */
    public final lec l0(sn6 sn6Var) {
        mn6 mn6Var = this.c;
        mn6Var.getClass();
        return new lec(this.b, mn6Var);
    }

    @Override // defpackage.qxd
    public final mn6 w() {
        return this.c;
    }
}
