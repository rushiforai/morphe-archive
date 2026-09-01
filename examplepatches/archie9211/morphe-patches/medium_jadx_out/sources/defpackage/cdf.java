package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cdf extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ kv6 d;
    public final /* synthetic */ ddf e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cdf(kv6 kv6Var, ddf ddfVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = kv6Var;
        this.e = ddfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ddf ddfVar = this.e;
        kv6 kv6Var = this.d;
        switch (i) {
            case 0:
                return new cdf(kv6Var, ddfVar, n92Var, 0);
            case 1:
                return new cdf(kv6Var, ddfVar, n92Var, 1);
            default:
                return new cdf(kv6Var, ddfVar, n92Var, 2);
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
        return ((cdf) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        kv6 kv6Var = this.d;
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
                f8f f8fVar = new f8f(8);
                iaf iafVar = new iaf(0, this.e, ddf.class, "loadMoreFeed", "loadMoreFeed()V", 0, 7);
                this.c = 1;
                return nk7.r0(kv6Var, f8fVar, iafVar, this, 1) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    iaf iafVar2 = new iaf(0, this.e, ddf.class, "loadMoreEntities", "loadMoreEntities()V", 0, 10);
                    this.c = 1;
                    return nk7.r0(kv6Var, null, iafVar2, this, 3) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    iaf iafVar3 = new iaf(0, this.e, ddf.class, "loadMoreTags", "loadMoreTags()V", 0, 14);
                    this.c = 1;
                    return nk7.r0(kv6Var, null, iafVar3, this, 3) == tb2Var3 ? tb2Var3 : c1eVar;
                }
                if (i4 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
        }
    }
}
