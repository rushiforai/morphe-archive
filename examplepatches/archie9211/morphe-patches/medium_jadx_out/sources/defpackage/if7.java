package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class if7 implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ sg7 b;

    public /* synthetic */ if7(sg7 sg7Var, int i) {
        this.a = i;
        this.b = sg7Var;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        Object objA;
        int i = this.a;
        tf7 tf7Var = tf7.a;
        c1e c1eVar = c1e.a;
        sg7 sg7Var = this.b;
        switch (i) {
            case 0:
                return (((Boolean) obj).booleanValue() && (objA = sg7Var.u.a(of7.a, n92Var)) == tb2.COROUTINE_SUSPENDED) ? objA : c1eVar;
            case 1:
                ((Number) obj).intValue();
                Object objA2 = sg7Var.u.a(tf7Var, n92Var);
                return objA2 == tb2.COROUTINE_SUSPENDED ? objA2 : c1eVar;
            case 2:
                ((Number) obj).intValue();
                Object objA3 = sg7Var.u.a(tf7Var, n92Var);
                return objA3 == tb2.COROUTINE_SUSPENDED ? objA3 : c1eVar;
            case 3:
                sg7Var.x.a((mf7) obj, n92Var);
                return c1eVar;
            default:
                ((Boolean) obj).getClass();
                Object objA4 = sg7Var.u.a(new wf7(sg7Var.A), n92Var);
                return objA4 == tb2.COROUTINE_SUSPENDED ? objA4 : c1eVar;
        }
    }
}
