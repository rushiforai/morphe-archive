package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hi8 extends l43 implements im2 {
    public final hec b;

    public hi8(hec hecVar) {
        hecVar.getClass();
        this.b = hecVar;
    }

    @Override // defpackage.im2
    public final o3e a0(mn6 mn6Var) {
        mn6Var.getClass();
        o3e o3eVarM0 = mn6Var.m0();
        if (!nxd.f(o3eVarM0) && !nxd.e(o3eVarM0)) {
            return o3eVarM0;
        }
        if (o3eVarM0 instanceof hec) {
            hec hecVar = (hec) o3eVarM0;
            hec hecVarN0 = hecVar.n0(false);
            return !nxd.f(hecVar) ? hecVarN0 : new hi8(hecVarN0);
        }
        if (!(o3eVarM0 instanceof zm4)) {
            ygf.a();
            return null;
        }
        zm4 zm4Var = (zm4) o3eVarM0;
        hec hecVar2 = zm4Var.b;
        hec hecVarN02 = hecVar2.n0(false);
        if (nxd.f(hecVar2)) {
            hecVarN02 = new hi8(hecVarN02);
        }
        hec hecVar3 = zm4Var.c;
        hec hecVarN03 = hecVar3.n0(false);
        if (nxd.f(hecVar3)) {
            hecVarN03 = new hi8(hecVarN03);
        }
        return qk7.B(pwd.K(hecVarN02, hecVarN03), qk7.r(o3eVarM0));
    }

    @Override // defpackage.im2
    public final boolean b0() {
        return true;
    }

    @Override // defpackage.l43, defpackage.mn6
    public final boolean k0() {
        return false;
    }

    @Override // defpackage.hec, defpackage.o3e
    public final o3e p0(uvd uvdVar) {
        uvdVar.getClass();
        return new hi8(this.b.p0(uvdVar));
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: q0 */
    public final hec n0(boolean z) {
        return z ? this.b.n0(true) : this;
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: r0 */
    public final hec p0(uvd uvdVar) {
        uvdVar.getClass();
        return new hi8(this.b.p0(uvdVar));
    }

    @Override // defpackage.l43
    public final hec s0() {
        return this.b;
    }

    @Override // defpackage.l43
    public final l43 u0(hec hecVar) {
        return new hi8(hecVar);
    }
}
