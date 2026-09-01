package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u47 extends p4d implements c55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ do4 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u47(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 3;
        do4 do4Var = (do4) obj;
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                u47 u47Var = new u47(i2, 0, n92Var);
                u47Var.d = do4Var;
                return u47Var.invokeSuspend(c1eVar);
            default:
                u47 u47Var2 = new u47(i2, 1, n92Var);
                u47Var2.d = do4Var;
                return u47Var2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                do4 do4Var = this.d;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    return do4Var.a(null, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                do4 do4Var2 = this.d;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.d = null;
                    this.c = 1;
                    return do4Var2.a(vbf.a, this) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
