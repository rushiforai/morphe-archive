package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u76 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ v76 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u76(v76 v76Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = v76Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        v76 v76Var = this.d;
        switch (i) {
            case 0:
                return new u76(v76Var, n92Var, 0);
            case 1:
                return new u76(v76Var, n92Var, 1);
            default:
                return new u76(v76Var, n92Var, 2);
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
        return ((u76) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        int i = this.b;
        v76 v76Var = this.d;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    mtd mtdVar = v76Var.b;
                    this.c = 1;
                    if (mtdVar.h(this) == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    mtd mtdVar2 = v76Var.b;
                    this.c = 1;
                    if (mtdVar2.h(this) == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    Object objH = v76Var.b.h(this);
                    if (objH != tb2Var3) {
                        objH = c1eVar;
                    }
                    if (objH == tb2Var3) {
                    }
                } else if (i4 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
        }
        return c1eVar;
    }
}
