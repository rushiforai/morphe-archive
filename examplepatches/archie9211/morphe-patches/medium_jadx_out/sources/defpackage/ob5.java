package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ob5 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ub5 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ob5(ub5 ub5Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ub5Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ub5 ub5Var = this.d;
        switch (i) {
            case 0:
                return new ob5(ub5Var, n92Var, 0);
            case 1:
                return new ob5(ub5Var, n92Var, 1);
            default:
                return new ob5(ub5Var, n92Var, 2);
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
        return ((ob5) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        ub5 ub5Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                cr0 cr0Var = ub5Var.d;
                this.c = 1;
                Object objB = ((xx2) cr0Var).b(this);
                return objB == tb2Var ? tb2Var : objB;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                this.c = 1;
                int i4 = ub5.g;
                Object objA = ub5Var.a(this);
                return objA == tb2Var2 ? tb2Var2 : objA;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                this.c = 1;
                int i6 = ub5.g;
                Object objA2 = ub5Var.a(this);
                return objA2 == tb2Var3 ? tb2Var3 : objA2;
        }
    }
}
