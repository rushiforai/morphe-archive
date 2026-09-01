package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rl3 extends el3 {
    public sl3 J;
    public hw8 K;
    public boolean L;
    public c55 M;
    public c55 N;
    public boolean O;

    @Override // defpackage.el3
    public final Object M0(dl3 dl3Var, dl3 dl3Var2) {
        Object objA = this.J.a(s78.UserInput, new ku2(dl3Var, this, null, 9), dl3Var2);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    @Override // defpackage.el3
    public final void R0(long j) {
        if (!this.n || g76.L(this.M, pl3.a)) {
            return;
        }
        vx0.c0(u0(), null, wb2.UNDISPATCHED, new ql3(this, j, (n92) null, 0), 1);
    }

    @Override // defpackage.el3
    public final void S0(nk3 nk3Var) {
        if (!this.n || g76.L(this.N, pl3.b)) {
            return;
        }
        vx0.c0(u0(), null, wb2.UNDISPATCHED, new ku2(this, nk3Var, null, 10), 1);
    }

    @Override // defpackage.el3
    public final boolean a1() {
        return this.L;
    }
}
