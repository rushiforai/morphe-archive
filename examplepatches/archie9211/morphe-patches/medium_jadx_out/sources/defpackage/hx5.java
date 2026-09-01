package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hx5 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ gx5 d;
    public final /* synthetic */ rx5 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hx5(gx5 gx5Var, rx5 rx5Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = gx5Var;
        this.e = rx5Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        rx5 rx5Var = this.e;
        gx5 gx5Var = this.d;
        switch (i) {
            case 0:
                return new hx5(gx5Var, rx5Var, n92Var, 0);
            default:
                return new hx5(gx5Var, rx5Var, n92Var, 1);
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
        return ((hx5) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        rx5 rx5Var = this.e;
        gx5 gx5Var = this.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    Object objC = ((kva) gx5Var).c(rx5Var, this);
                    return objC == tb2Var ? tb2Var : objC;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return obj;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
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
                hx5 hx5Var = new hx5(gx5Var, rx5Var, n92Var, 0);
                this.c = 1;
                Object objZ = wo7.z(3000L, hx5Var, this);
                return objZ == tb2Var2 ? tb2Var2 : objZ;
        }
    }
}
