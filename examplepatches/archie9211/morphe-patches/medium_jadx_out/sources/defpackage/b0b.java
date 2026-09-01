package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b0b implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ xpc b;

    public /* synthetic */ b0b(xpc xpcVar, int i) {
        this.a = i;
        this.b = xpcVar;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        xpc xpcVar = this.b;
        switch (i) {
            case 0:
                Object objB = xpcVar.b(new xha(do4Var, 3), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            case 1:
                Object objB2 = xpcVar.b(new xha(do4Var, 6), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
            case 2:
                Object objB3 = xpcVar.b(new xha(do4Var, 14), n92Var);
                return objB3 == tb2.COROUTINE_SUSPENDED ? objB3 : c1eVar;
            case 3:
                Object objB4 = xpcVar.b(new xha(do4Var, 16), n92Var);
                return objB4 == tb2.COROUTINE_SUSPENDED ? objB4 : c1eVar;
            default:
                Object objB5 = xpcVar.b(new i2f(do4Var, 5), n92Var);
                return objB5 == tb2.COROUTINE_SUSPENDED ? objB5 : c1eVar;
        }
    }
}
