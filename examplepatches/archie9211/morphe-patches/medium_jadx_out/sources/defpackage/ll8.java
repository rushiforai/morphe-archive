package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ll8 implements bo4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ bo4[] b;

    public /* synthetic */ ll8(bo4[] bo4VarArr, int i) {
        this.a = i;
        this.b = bo4VarArr;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) throws Throwable {
        int i = this.a;
        c1e c1eVar = c1e.a;
        int i2 = 3;
        n92 n92Var2 = null;
        bo4[] bo4VarArr = this.b;
        switch (i) {
            case 0:
                Object objB0 = flb.b0(n92Var, do4Var, new jl8(bo4VarArr, 0), new kl8(i2, 0, n92Var2), bo4VarArr);
                return objB0 == tb2.COROUTINE_SUSPENDED ? objB0 : c1eVar;
            default:
                Object objB02 = flb.b0(n92Var, do4Var, new jl8(bo4VarArr, 2), new kl8(i2, 1, n92Var2), bo4VarArr);
                return objB02 == tb2.COROUTINE_SUSPENDED ? objB02 : c1eVar;
        }
    }
}
