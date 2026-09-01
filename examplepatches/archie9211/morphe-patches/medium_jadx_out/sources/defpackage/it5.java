package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class it5 implements bo4 {
    public final /* synthetic */ ro4 a;
    public final /* synthetic */ hv8 b;
    public final /* synthetic */ yl2 c;
    public final /* synthetic */ ms d;
    public final /* synthetic */ rya e;

    public it5(ro4 ro4Var, hv8 hv8Var, yl2 yl2Var, ms msVar, rya ryaVar) {
        this.a = ro4Var;
        this.b = hv8Var;
        this.c = yl2Var;
        this.d = msVar;
        this.e = ryaVar;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        Object objB = this.a.b(new a9(do4Var, this.b, this.c, this.d, this.e), n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }
}
