package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f45 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ul d;
    public final /* synthetic */ i45 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ f45(ul ulVar, i45 i45Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ulVar;
        this.e = i45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        i45 i45Var = this.e;
        ul ulVar = this.d;
        switch (i) {
            case 0:
                return new f45(ulVar, i45Var, n92Var, 0);
            default:
                return new f45(ulVar, i45Var, n92Var, 1);
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
        return ((f45) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        i45 i45Var = this.e;
        c1e c1eVar = c1e.a;
        ul ulVar = this.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    j45 j45Var = j45.Collapsed;
                    this.c = 1;
                    Object objA = ulVar.a(j45Var, s78.Default, new xk(4, 0, n92Var), this);
                    if (objA != tb2Var) {
                        objA = c1eVar;
                    }
                    if (objA == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                i45Var.l();
                return c1eVar;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    j45 j45Var2 = j45.Expanded;
                    this.c = 1;
                    Object objA2 = ulVar.a(j45Var2, s78.Default, new nk(ulVar, gk.a, null), this);
                    if (objA2 != tb2Var2) {
                        objA2 = c1eVar;
                    }
                    if (objA2 != tb2Var2) {
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
                u50 u50VarE = no7.E(new fl(ulVar, 3));
                aq aqVar = new aq(13, i45Var);
                this.c = 2;
                if (u50VarE.b(aqVar, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
