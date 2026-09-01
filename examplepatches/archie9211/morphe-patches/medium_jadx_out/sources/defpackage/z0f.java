package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z0f implements bo4 {
    public final /* synthetic */ pja a;
    public final /* synthetic */ h00 b;
    public final /* synthetic */ ad c;
    public final /* synthetic */ rya d;
    public final /* synthetic */ a1f e;
    public final /* synthetic */ yl2 f;

    public z0f(pja pjaVar, h00 h00Var, ad adVar, rya ryaVar, a1f a1fVar, yl2 yl2Var) {
        this.a = pjaVar;
        this.b = h00Var;
        this.c = adVar;
        this.d = ryaVar;
        this.e = a1fVar;
        this.f = yl2Var;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) throws Throwable {
        Object objB = this.a.b(new k64(do4Var, this.b, this.c, this.d, this.e, this.f, 4), n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }
}
