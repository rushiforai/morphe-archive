package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rb5 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ub5 d;
    public final /* synthetic */ yd4 e;
    public final /* synthetic */ boolean f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rb5(ub5 ub5Var, yd4 yd4Var, boolean z, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ub5Var;
        this.e = yd4Var;
        this.f = z;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new rb5(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new rb5(this.d, this.e, this.f, n92Var, 1);
            default:
                return new rb5(this.d, this.e, this.f, n92Var, 2);
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
        return ((rb5) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        int i = this.b;
        boolean z = this.f;
        yd4 yd4Var = this.e;
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
                ba5 ba5Var = ub5Var.a;
                this.c = 1;
                Object objA2 = ba5Var.a(yd4Var, z, this);
                return objA2 == tb2Var ? tb2Var : objA2;
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
                Object objB = ub5Var.b(yd4Var, z, this);
                return objB == tb2Var2 ? tb2Var2 : objB;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    og3 og3Var = ub5Var.b;
                    this.c = 1;
                    objA = og3Var.a(yd4Var, z, this);
                    if (objA == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i5 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA = ((bjb) obj).a;
                }
                rj2 rj2Var = (rj2) (objA instanceof ajb ? null : objA);
                return Boolean.valueOf(rj2Var != null ? rj2Var.l : false);
        }
    }
}
