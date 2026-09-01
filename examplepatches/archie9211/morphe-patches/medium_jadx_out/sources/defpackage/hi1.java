package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hi1 implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ r6c b;
    public final /* synthetic */ String c;

    public /* synthetic */ hi1(r6c r6cVar, String str, int i) {
        this.a = i;
        this.b = r6cVar;
        this.c = str;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        String str = this.c;
        r6c r6cVar = this.b;
        switch (i) {
            case 0:
                tb2 tb2VarM = r6c.m(r6cVar, new gi1(do4Var, str, 0), n92Var);
                return tb2VarM == tb2.COROUTINE_SUSPENDED ? tb2VarM : c1eVar;
            default:
                tb2 tb2VarM2 = r6c.m(r6cVar, new gi1(do4Var, str, 1), n92Var);
                return tb2VarM2 == tb2.COROUTINE_SUSPENDED ? tb2VarM2 : c1eVar;
        }
    }
}
