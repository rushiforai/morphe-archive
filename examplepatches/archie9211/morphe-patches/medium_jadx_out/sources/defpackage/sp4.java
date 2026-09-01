package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class sp4 implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ sp4(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) throws Throwable {
        int i = this.a;
        n92 n92Var2 = null;
        c1e c1eVar = c1e.a;
        Object obj = this.d;
        Object obj2 = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                Object objB0 = flb.b0(n92Var, do4Var, qk0.i, new gd1((c55) obj, n92Var2, 7), new bo4[]{(bo4) obj3, (bo4) obj2});
                return objB0 == tb2.COROUTINE_SUSPENDED ? objB0 : c1eVar;
            case 1:
                Object objB = ((bo4) obj3).b(new sa(do4Var, obj2, obj, 20), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            case 2:
                Object objB2 = ((bo4) obj3).b(new eh9(do4Var, (hx4) obj2, (f3a) obj, 4), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
            case 3:
                bo4[] bo4VarArr = (bo4[]) obj3;
                Object objB02 = flb.b0(n92Var, do4Var, new jl8(bo4VarArr, 1), new gd1((n92) null, (String) obj2, (odd) obj), bo4VarArr);
                return objB02 == tb2.COROUTINE_SUSPENDED ? objB02 : c1eVar;
            default:
                Object objB3 = ((wua) obj3).a.b(new eh9(do4Var, (s53) obj2, (yme) obj, 24), n92Var);
                return objB3 == tb2.COROUTINE_SUSPENDED ? objB3 : c1eVar;
        }
    }
}
