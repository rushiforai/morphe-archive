package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jj1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ mj1 d;
    public final /* synthetic */ rg1 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jj1(mj1 mj1Var, rg1 rg1Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = mj1Var;
        this.e = rg1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        rg1 rg1Var = this.e;
        mj1 mj1Var = this.d;
        switch (i) {
            case 0:
                return new jj1(mj1Var, rg1Var, n92Var, 0);
            default:
                return new jj1(mj1Var, rg1Var, n92Var, 1);
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
        return ((jj1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        jj1 jj1Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        mj1 mj1Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = mj1Var.d;
                    String str = mj1Var.b;
                    String str2 = mj1Var.n;
                    this.c = 1;
                    jj1Var = this;
                    obj = n0cVar.T(this.e, false, str, str2, jj1Var);
                    if (obj != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                jj1Var = this;
                r6c r6cVar = mj1Var.h;
                bj1 bj1Var = new bj1((o81) obj);
                jj1Var.c = 2;
                if (r6cVar.a(bj1Var, jj1Var) != tb2Var) {
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
                mj1Var.d.getClass();
                s71 s71VarZ = n0c.z(this.e, false);
                r6c r6cVar2 = mj1Var.h;
                bj1 bj1Var2 = new bj1(s71VarZ);
                this.c = 1;
                return r6cVar2.a(bj1Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
