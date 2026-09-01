package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class er9 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Throwable c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ er9(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 3;
        Throwable th = (Throwable) obj2;
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                er9 er9Var = new er9(i2, 0, n92Var);
                er9Var.c = th;
                er9Var.invokeSuspend(c1eVar);
                break;
            default:
                er9 er9Var2 = new er9(i2, 1, n92Var);
                er9Var2.c = th;
                er9Var2.invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Throwable th = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                wld.a.e(th, "Failed to observe item is in catalog", new Object[0]);
                break;
            default:
                br7.v(obj);
                wld.a.e(th, "Failed to observe item is in catalog", new Object[0]);
                break;
        }
        return c1eVar;
    }
}
