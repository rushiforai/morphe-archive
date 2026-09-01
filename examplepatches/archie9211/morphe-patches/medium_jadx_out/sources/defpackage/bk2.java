package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bk2 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ek2 b;

    public /* synthetic */ bk2(ek2 ek2Var, int i) {
        this.a = i;
        this.b = ek2Var;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        Object objB;
        int i = this.a;
        c1e c1eVar = c1e.a;
        ek2 ek2Var = this.b;
        switch (i) {
            case 0:
                lk9 lk9Var = (lk9) obj;
                if (lk9Var instanceof hk9) {
                    if (((hk9) lk9Var).b || (objB = ek2Var.b(n92Var)) != tb2.COROUTINE_SUSPENDED) {
                        return c1eVar;
                    }
                } else if (lk9Var instanceof ik9) {
                    if (((ik9) lk9Var).b || (objB = ek2Var.b(n92Var)) != tb2.COROUTINE_SUSPENDED) {
                        return c1eVar;
                    }
                } else if (lk9Var instanceof kk9) {
                    if (!((kk9) lk9Var).b || (objB = ek2Var.b(n92Var)) != tb2.COROUTINE_SUSPENDED) {
                        return c1eVar;
                    }
                } else {
                    if (!(lk9Var instanceof jk9)) {
                        ygf.a();
                        return null;
                    }
                    if (!((jk9) lk9Var).b || (objB = ek2Var.b(n92Var)) != tb2.COROUTINE_SUSPENDED) {
                        return c1eVar;
                    }
                }
                return objB;
            default:
                Object objB2 = ek2Var.b(n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
        }
    }
}
