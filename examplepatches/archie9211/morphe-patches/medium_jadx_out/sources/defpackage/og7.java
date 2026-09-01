package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class og7 implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ zz b;

    public /* synthetic */ og7(zz zzVar, int i) {
        this.a = i;
        this.b = zzVar;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        zz zzVar = this.b;
        switch (i) {
            case 0:
                Object objB = zzVar.b(new wv4(do4Var, 9), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            default:
                Object objB2 = zzVar.b(new wv4(do4Var, 10), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
        }
    }
}
