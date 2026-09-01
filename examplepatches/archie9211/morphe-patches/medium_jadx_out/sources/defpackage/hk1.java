package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hk1 extends dk1 {
    public final c55 e;

    public hk1(c55 c55Var, bo4 bo4Var, ib2 ib2Var, int i, nz0 nz0Var) {
        super(i, nz0Var, ib2Var, bo4Var);
        this.e = c55Var;
    }

    @Override // defpackage.yj1
    public final yj1 f(ib2 ib2Var, int i, nz0 nz0Var) {
        return new hk1(this.e, this.d, ib2Var, i, nz0Var);
    }

    @Override // defpackage.dk1
    public final Object k(do4 do4Var, n92 n92Var) {
        Object objS = o7f.s(new fk1(this, do4Var, null), n92Var);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : c1e.a;
    }
}
