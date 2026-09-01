package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x07 extends ep7 {
    public final wg6 e;
    public final Object f;
    public final ep7 g;

    public x07(wg6 wg6Var, Object obj, ep7 ep7Var) {
        obj.getClass();
        ep7Var.getClass();
        this.e = wg6Var;
        this.f = obj;
        this.g = ep7Var;
    }

    @Override // defpackage.ep7
    public final Object s(wg6 wg6Var) {
        return wg6Var.equals(this.e) ? vx0.T(wg6Var).cast(this.f) : this.g.s(wg6Var);
    }

    public final String toString() {
        return bu1.F0(bu1.Y0(szb.O0(szb.K0(this, new vx5(20)))), null, "{", "}", new vx5(21), 25);
    }

    @Override // defpackage.ep7
    public final ep7 y(wg6 wg6Var, Object obj) {
        wg6 wg6Var2 = this.e;
        boolean zEquals = wg6Var.equals(wg6Var2);
        ep7 ep7Var = this.g;
        if (!zEquals) {
            ep7 ep7VarY = ep7Var.y(wg6Var, null);
            if (ep7VarY != ep7Var) {
                this = new x07(wg6Var2, this.f, ep7VarY);
            }
            ep7Var = this;
        }
        return obj != null ? new x07(wg6Var, obj, ep7Var) : ep7Var;
    }
}
