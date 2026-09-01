package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fi3 implements bo4 {
    public final bo4 a;
    public final x45 b;
    public final b55 c;

    public fi3(bo4 bo4Var, x45 x45Var, b55 b55Var) {
        this.a = bo4Var;
        this.b = x45Var;
        this.c = b55Var;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        rya ryaVar = new rya();
        ryaVar.a = flb.i;
        Object objB = this.a.b(new sa(this, ryaVar, do4Var, 14), n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }
}
