package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mx2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ boolean c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mx2(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                mx2 mx2Var = new mx2(2, 0, n92Var);
                mx2Var.c = ((Boolean) obj).booleanValue();
                return mx2Var;
            case 1:
                mx2 mx2Var2 = new mx2(2, 1, n92Var);
                mx2Var2.c = ((Boolean) obj).booleanValue();
                return mx2Var2;
            case 2:
                mx2 mx2Var3 = new mx2(2, 2, n92Var);
                mx2Var3.c = ((Boolean) obj).booleanValue();
                return mx2Var3;
            default:
                mx2 mx2Var4 = new mx2(2, 3, n92Var);
                mx2Var4.c = ((Boolean) obj).booleanValue();
                return mx2Var4;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Boolean bool = (Boolean) obj;
        bool.booleanValue();
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                return ((mx2) create(bool, n92Var)).invokeSuspend(c1eVar);
            case 1:
                return ((mx2) create(bool, n92Var)).invokeSuspend(c1eVar);
            case 2:
                return ((mx2) create(bool, n92Var)).invokeSuspend(c1eVar);
            default:
                ((mx2) create(bool, n92Var)).invokeSuspend(c1eVar);
                return c1eVar;
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        boolean z = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                return Boolean.valueOf(!z);
            case 1:
                br7.v(obj);
                return Boolean.valueOf(!z);
            case 2:
                br7.v(obj);
                return Boolean.valueOf(z);
            default:
                br7.v(obj);
                if (z) {
                    km4.I(wld.a, null, "Should request push notification permission", new Object[0], "Should request push notification permission");
                }
                return c1e.a;
        }
    }
}
