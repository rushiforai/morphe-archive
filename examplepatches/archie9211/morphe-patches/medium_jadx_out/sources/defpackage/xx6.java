package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xx6 implements cy6, sb2 {
    public final wx6 a;
    public final ib2 b;

    public xx6(wx6 wx6Var, ib2 ib2Var) {
        ib2Var.getClass();
        this.a = wx6Var;
        this.b = ib2Var;
        if (((ky6) wx6Var).d == vx6.DESTROYED) {
            bo.D(ib2Var, null);
        }
    }

    @Override // defpackage.sb2
    public final ib2 Q() {
        return this.b;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        wx6 wx6Var = this.a;
        if (((ky6) wx6Var).d.compareTo(vx6.DESTROYED) <= 0) {
            wx6Var.b(this);
            bo.D(this.b, null);
        }
    }
}
