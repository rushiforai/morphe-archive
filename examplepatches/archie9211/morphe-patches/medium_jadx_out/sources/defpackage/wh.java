package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wh extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ bi d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wh(bi biVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = biVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        bi biVar = this.d;
        switch (i) {
            case 0:
                return new wh(biVar, n92Var, 0);
            default:
                return new wh(biVar, n92Var, 1);
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
        return ((wh) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        bi biVar = this.d;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    fj7 fj7Var = biVar.c;
                    this.c = 1;
                    Object objD = fj7Var.b.D(this);
                    if (objD != tb2Var) {
                        objD = c1eVar;
                    }
                    if (objD == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    fj7 fj7Var2 = biVar.c;
                    this.c = 1;
                    Object objC0 = fj7Var2.b.c0(this);
                    if (objC0 != tb2Var2) {
                        objC0 = c1eVar;
                    }
                    if (objC0 == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
        }
        return c1eVar;
    }
}
