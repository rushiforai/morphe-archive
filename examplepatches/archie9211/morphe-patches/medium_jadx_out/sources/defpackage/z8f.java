package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z8f extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ a9f d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z8f(a9f a9fVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = a9fVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        a9f a9fVar = this.d;
        switch (i) {
            case 0:
                return new z8f(a9fVar, n92Var, 0);
            default:
                return new z8f(a9fVar, n92Var, 1);
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
        return ((z8f) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        int i = this.b;
        a9f a9fVar = this.d;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    mn mnVar = a9fVar.a;
                    this.c = 1;
                    Object objL = mnVar.z.l(this);
                    if (objL != tb2Var) {
                        objL = c1eVar;
                    }
                    if (objL == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1eVar;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    mn mnVar2 = a9fVar.a;
                    this.c = 1;
                    Object objA = mnVar2.A.a(this);
                    if (objA != tb2Var2) {
                        objA = c1eVar;
                    }
                    if (objA == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1eVar;
        }
    }
}
