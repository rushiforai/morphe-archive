package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w23 implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ wua b;

    public /* synthetic */ w23(wua wuaVar, int i) {
        this.a = i;
        this.b = wuaVar;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        wua wuaVar = this.b;
        switch (i) {
            case 0:
                Object objB = wuaVar.a.b(new yh(do4Var, 21), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            case 1:
                Object objB2 = wuaVar.a.b(new wv4(do4Var, 7), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
            default:
                Object objB3 = wuaVar.a.b(new i2f(do4Var, 6), n92Var);
                return objB3 == tb2.COROUTINE_SUSPENDED ? objB3 : c1eVar;
        }
    }
}
