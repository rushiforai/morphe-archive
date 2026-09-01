package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dad extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ had d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dad(had hadVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = hadVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        had hadVar = this.d;
        switch (i) {
            case 0:
                return new dad(hadVar, n92Var, 0);
            default:
                return new dad(hadVar, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((dad) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        had hadVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                x9d x9dVar = hadVar.e;
                this.c = 1;
                Object objD = x9dVar.b.D(this);
                if (objD != tb2Var) {
                    objD = c1eVar;
                }
                return objD == tb2Var ? tb2Var : c1eVar;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    xpc xpcVar = hadVar.k;
                    Boolean bool = Boolean.TRUE;
                    xpcVar.getClass();
                    xpcVar.m(null, bool);
                    s26 s26Var = hadVar.d;
                    this.c = 1;
                    if (s26Var.t0(this) != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    if (i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                x9d x9dVar2 = hadVar.e;
                this.c = 2;
                if (x9dVar2.c(this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
