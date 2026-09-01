package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nv6 implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ bo4 c;

    public /* synthetic */ nv6(bo4 bo4Var, int i, int i2) {
        this.a = i2;
        this.c = bo4Var;
        this.b = i;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) throws Throwable {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = this.b;
        bo4 bo4Var = this.c;
        switch (i) {
            case 0:
                Object objB = ((u50) bo4Var).b(new mv6(i2, 0, do4Var), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            default:
                Object objB2 = ((zz) bo4Var).b(new mv6(i2, 1, do4Var), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
        }
    }
}
