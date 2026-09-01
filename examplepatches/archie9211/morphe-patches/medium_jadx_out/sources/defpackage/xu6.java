package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xu6 extends n01 {
    public final xp r;
    public j68 s;

    public xu6(x45 x45Var) {
        super(28);
        this.r = new xp(9, (byte) 0);
        x45Var.invoke(this);
    }

    @Override // defpackage.n01
    public final xp X() {
        return this.r;
    }

    public final void k0(Object obj, String str, c55 c55Var) {
        this.r.e(1, new vu6(obj != null ? new wu6(0, obj) : null, new wu6(0, str), new mz1(new zq(2, c55Var), true, -857469575)));
    }

    public final void l0(int i, x45 x45Var, x45 x45Var2, d55 d55Var) {
        this.r.e(i, new vu6(x45Var, x45Var2, d55Var));
    }
}
