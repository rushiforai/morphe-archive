package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mxe implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ zz b;
    public final /* synthetic */ String c;

    public /* synthetic */ mxe(zz zzVar, String str, int i) {
        this.a = i;
        this.b = zzVar;
        this.c = str;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        String str = this.c;
        zz zzVar = this.b;
        switch (i) {
            case 0:
                Object objB = zzVar.b(new gi1(do4Var, str, 3), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            case 1:
                Object objB2 = zzVar.b(new gi1(do4Var, str, 4), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
            case 2:
                Object objB3 = zzVar.b(new gi1(do4Var, str, 5), n92Var);
                return objB3 == tb2.COROUTINE_SUSPENDED ? objB3 : c1eVar;
            case 3:
                Object objB4 = zzVar.b(new gi1(do4Var, str, 6), n92Var);
                return objB4 == tb2.COROUTINE_SUSPENDED ? objB4 : c1eVar;
            case 4:
                Object objB5 = zzVar.b(new gi1(do4Var, str, 7), n92Var);
                return objB5 == tb2.COROUTINE_SUSPENDED ? objB5 : c1eVar;
            default:
                Object objB6 = zzVar.b(new gi1(do4Var, str, 8), n92Var);
                return objB6 == tb2.COROUTINE_SUSPENDED ? objB6 : c1eVar;
        }
    }
}
