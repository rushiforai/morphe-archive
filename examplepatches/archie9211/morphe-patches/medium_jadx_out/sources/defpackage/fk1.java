package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fk1 extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ hk1 e;
    public final /* synthetic */ do4 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fk1(hk1 hk1Var, do4 do4Var, Object obj, n92 n92Var) {
        super(2, n92Var);
        this.e = hk1Var;
        this.f = do4Var;
        this.d = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        do4 do4Var = this.f;
        hk1 hk1Var = this.e;
        switch (i) {
            case 0:
                return new fk1(hk1Var, do4Var, this.d, n92Var);
            default:
                fk1 fk1Var = new fk1(hk1Var, do4Var, n92Var);
                fk1Var.d = obj;
                return fk1Var;
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
        return ((fk1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
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
                c55 c55Var = this.e.e;
                Object obj2 = this.d;
                this.c = 1;
                return c55Var.f(this.f, obj2, this) == tb2Var ? tb2Var : c1eVar;
            default:
                sb2 sb2Var = (sb2) this.d;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                rya ryaVarP = ev6.p(obj);
                hk1 hk1Var = this.e;
                bo4 bo4Var = hk1Var.d;
                a9 a9Var = new a9(ryaVarP, sb2Var, hk1Var, this.f, 4);
                this.d = null;
                this.c = 1;
                return bo4Var.b(a9Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fk1(hk1 hk1Var, do4 do4Var, n92 n92Var) {
        super(2, n92Var);
        this.e = hk1Var;
        this.f = do4Var;
    }
}
