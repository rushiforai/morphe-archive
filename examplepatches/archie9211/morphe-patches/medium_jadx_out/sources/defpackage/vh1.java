package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vh1 implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ u50 b;

    public /* synthetic */ vh1(u50 u50Var, int i) {
        this.a = i;
        this.b = u50Var;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        u50 u50Var = this.b;
        switch (i) {
            case 0:
                Object objB = u50Var.b(new yh(do4Var, 10), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            case 1:
                Object objB2 = u50Var.b(new wv4(do4Var, 6), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
            case 2:
                Object objB3 = u50Var.b(new xha(do4Var, 8), n92Var);
                return objB3 == tb2.COROUTINE_SUSPENDED ? objB3 : c1eVar;
            case 3:
                Object objB4 = u50Var.b(new i2f(do4Var, 1), n92Var);
                return objB4 == tb2.COROUTINE_SUSPENDED ? objB4 : c1eVar;
            case 4:
                Object objB5 = u50Var.b(new i2f(do4Var, 2), n92Var);
                return objB5 == tb2.COROUTINE_SUSPENDED ? objB5 : c1eVar;
            case 5:
                Object objB6 = u50Var.b(new i2f(do4Var, 3), n92Var);
                return objB6 == tb2.COROUTINE_SUSPENDED ? objB6 : c1eVar;
            default:
                Object objB7 = u50Var.b(new i2f(do4Var, 4), n92Var);
                return objB7 == tb2.COROUTINE_SUSPENDED ? objB7 : c1eVar;
        }
    }
}
