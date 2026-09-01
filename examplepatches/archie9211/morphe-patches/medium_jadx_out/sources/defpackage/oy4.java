package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oy4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sy4 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ oy4(sy4 sy4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sy4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new oy4(this.d, n92Var, 0);
            default:
                return new oy4(this.d, n92Var, 1);
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
        return ((oy4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        sy4 sy4Var = this.d;
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
                hy4 hy4Var = sy4Var.d;
                this.c = 1;
                n0c n0cVar = hy4Var.b;
                if (n0cVar == null) {
                    g76.g0("paginatedDataUseCase");
                    throw null;
                }
                Object objD = n0cVar.D(this);
                if (objD != tb2Var) {
                    objD = c1eVar;
                }
                return objD == tb2Var ? tb2Var : c1eVar;
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
                hy4 hy4Var2 = sy4Var.d;
                this.c = 1;
                n0c n0cVar2 = hy4Var2.b;
                if (n0cVar2 == null) {
                    g76.g0("paginatedDataUseCase");
                    throw null;
                }
                Object objC0 = n0cVar2.c0(this);
                if (objC0 != tb2Var2) {
                    objC0 = c1eVar;
                }
                return objC0 == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
