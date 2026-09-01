package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uy8 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ gz8 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uy8(int i, n92 n92Var, gz8 gz8Var) {
        super(2, n92Var);
        this.b = i;
        this.d = gz8Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new uy8(0, n92Var, this.d);
            case 1:
                return new uy8(1, n92Var, this.d);
            default:
                return new uy8(2, n92Var, this.d);
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
        return ((uy8) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objF;
        Object objF2;
        int i = this.b;
        gz8 gz8Var = this.d;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
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
                this.c = 1;
                iz8 iz8Var = jz8.a;
                if (gz8Var.k() - 1 < 0 || (objF = gz8Var.f(gz8Var.k() - 1, f76.P(0.0f, 0.0f, null, 7), this)) != tb2Var) {
                    objF = c1eVar;
                }
                return objF == tb2Var ? tb2Var : c1eVar;
            case 1:
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
                this.c = 1;
                iz8 iz8Var2 = jz8.a;
                if (gz8Var.k() + 1 >= gz8Var.o() || (objF2 = gz8Var.f(gz8Var.k() + 1, f76.P(0.0f, 0.0f, null, 7), this)) != tb2Var2) {
                    objF2 = c1eVar;
                }
                return objF2 == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                this.c = 1;
                s78 s78Var = s78.Default;
                at atVar = new at(2, 4, n92Var);
                gz8Var.getClass();
                Object objT = gz8.t(gz8Var, s78Var, atVar, this);
                if (objT != tb2Var3) {
                    objT = c1eVar;
                }
                return objT == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
