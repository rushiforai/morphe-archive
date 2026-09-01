package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ek1 extends dk1 {
    public ek1(bo4 bo4Var, ib2 ib2Var, int i, nz0 nz0Var, int i2) {
        super((i2 & 4) != 0 ? -3 : i, (i2 & 8) != 0 ? nz0.SUSPEND : nz0Var, (i2 & 2) != 0 ? zx3.a : ib2Var, bo4Var);
    }

    @Override // defpackage.yj1
    public final yj1 f(ib2 ib2Var, int i, nz0 nz0Var) {
        return new ek1(i, nz0Var, ib2Var, this.d);
    }

    @Override // defpackage.yj1
    public final bo4 i() {
        return this.d;
    }

    @Override // defpackage.dk1
    public final Object k(do4 do4Var, n92 n92Var) {
        Object objB = this.d.b(do4Var, n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }
}
