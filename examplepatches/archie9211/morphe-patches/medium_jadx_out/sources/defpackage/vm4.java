package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vm4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ xm4 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ vm4(xm4 xm4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = xm4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        xm4 xm4Var = this.d;
        switch (i) {
            case 0:
                return new vm4(xm4Var, n92Var, 0);
            default:
                return new vm4(xm4Var, n92Var, 1);
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
        return ((vm4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        int i = this.b;
        c1e c1eVar = c1e.a;
        xm4 xm4Var = this.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    dm4 dm4Var = xm4Var.e;
                    this.c = 1;
                    Object objM0 = vx0.m0(dm4Var.d, new bm4(dm4Var, null, 2), this);
                    if (objM0 != tb2Var) {
                        objM0 = c1eVar;
                    }
                    if (objM0 != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 != 2) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    Object obj2 = ((bjb) obj).a;
                    return c1eVar;
                }
                br7.v(obj);
                n32 n32Var = xm4Var.d;
                this.c = 2;
                if (n32Var.c(this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
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
                br7.v(obj);
                kb2 kb2Var = xm4Var.g;
                z8 z8Var = new z8(xm4Var, n92Var, 25);
                this.c = 1;
                return vx0.m0(kb2Var, z8Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
