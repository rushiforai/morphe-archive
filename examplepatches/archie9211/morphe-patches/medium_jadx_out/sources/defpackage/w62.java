package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w62 implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ to4 b;

    public /* synthetic */ w62(to4 to4Var, int i) {
        this.a = i;
        this.b = to4Var;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        to4 to4Var = this.b;
        switch (i) {
            case 0:
                Object objB = to4Var.b(new yh(do4Var, 14), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            case 1:
                Object objB2 = to4Var.b(new yh(do4Var, 22), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
            case 2:
                Object objB3 = to4Var.b(new wv4(do4Var, 8), n92Var);
                return objB3 == tb2.COROUTINE_SUSPENDED ? objB3 : c1eVar;
            default:
                Object objB4 = to4Var.b(new wv4(do4Var, 26), n92Var);
                return objB4 == tb2.COROUTINE_SUSPENDED ? objB4 : c1eVar;
        }
    }
}
