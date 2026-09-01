package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bv9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sw9 d;
    public final /* synthetic */ rg1 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bv9(sw9 sw9Var, rg1 rg1Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sw9Var;
        this.e = rg1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        rg1 rg1Var = this.e;
        sw9 sw9Var = this.d;
        switch (i) {
            case 0:
                return new bv9(sw9Var, rg1Var, n92Var, 0);
            default:
                return new bv9(sw9Var, rg1Var, n92Var, 1);
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
        return ((bv9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        bv9 bv9Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        sw9 sw9Var = this.d;
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
                n0c n0cVar = sw9Var.t;
                boolean z = sw9Var.H0;
                n0cVar.getClass();
                s71 s71VarZ = n0c.z(this.e, z);
                r6c r6cVar = sw9Var.x0;
                ks9 ks9Var = new ks9(s71VarZ);
                this.c = 1;
                return r6cVar.a(ks9Var, this) == tb2Var ? tb2Var : c1eVar;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = sw9Var.t;
                    boolean z2 = sw9Var.H0;
                    String str = sw9Var.d;
                    String str2 = sw9Var.D0;
                    this.c = 1;
                    bv9Var = this;
                    obj = n0cVar2.T(this.e, z2, str, str2, bv9Var);
                    if (obj != tb2Var2) {
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
                bv9Var = this;
                r6c r6cVar2 = sw9Var.x0;
                ks9 ks9Var2 = new ks9((o81) obj);
                bv9Var.c = 2;
                if (r6cVar2.a(ks9Var2, bv9Var) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
