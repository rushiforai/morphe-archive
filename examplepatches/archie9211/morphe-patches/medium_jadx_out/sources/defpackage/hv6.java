package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hv6 extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ kv6 d;
    public final /* synthetic */ int e;
    public final /* synthetic */ int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hv6(kv6 kv6Var, int i, int i2, n92 n92Var) {
        super(2, n92Var);
        this.d = kv6Var;
        this.e = i;
        this.f = i2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        hv6 hv6Var = new hv6(this.d, this.e, this.f, n92Var);
        hv6Var.c = obj;
        return hv6Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((hv6) create((xrb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            kv6 kv6Var = this.d;
            fv6 fv6Var = new fv6((xrb) this.c, kv6Var, 0);
            m73 m73Var = ((cv6) kv6Var.f.getValue()).i;
            this.b = 1;
            if (xz5.C(fv6Var, this.e, this.f, 100, m73Var, this) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }
}
