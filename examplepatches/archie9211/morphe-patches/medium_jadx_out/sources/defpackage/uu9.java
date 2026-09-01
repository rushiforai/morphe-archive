package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uu9 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sw9 b;

    public /* synthetic */ uu9(sw9 sw9Var, int i) {
        this.a = i;
        this.b = sw9Var;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        Object objA;
        int i = this.a;
        c1e c1eVar = c1e.a;
        sw9 sw9Var = this.b;
        switch (i) {
            case 0:
                Object objA2 = sw9Var.B0.a(xr9.a, n92Var);
                return objA2 == tb2.COROUTINE_SUSPENDED ? objA2 : c1eVar;
            default:
                mf9 mf9Var = (mf9) obj;
                r6c r6cVar = sw9Var.B0;
                if (mf9Var instanceof ff9) {
                    ff9 ff9Var = (ff9) mf9Var;
                    objA = r6cVar.a(new sr9(ff9Var.b, ff9Var.c), n92Var);
                    if (objA != tb2.COROUTINE_SUSPENDED) {
                        return c1eVar;
                    }
                } else if (!(mf9Var instanceof gf9) || (objA = r6cVar.a(new as9(((gf9) mf9Var).b), n92Var)) != tb2.COROUTINE_SUSPENDED) {
                    return c1eVar;
                }
                return objA;
        }
    }
}
