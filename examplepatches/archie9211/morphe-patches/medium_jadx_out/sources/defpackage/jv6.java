package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jv6 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ kv6 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jv6(kv6 kv6Var, int i, n92 n92Var) {
        super(2, n92Var);
        this.b = 0;
        this.d = kv6Var;
        this.c = i;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        kv6 kv6Var = this.d;
        switch (i) {
            case 0:
                return new jv6(kv6Var, this.c, n92Var);
            case 1:
                return new jv6(kv6Var, n92Var, 1);
            default:
                return new jv6(kv6Var, n92Var, 2);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((jv6) create((xrb) obj, (n92) obj2)).invokeSuspend(c1eVar);
                break;
        }
        return ((jv6) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        kv6 kv6Var = this.d;
        switch (i) {
            case 0:
                br7.v(obj);
                kv6Var.m(this.c, 0);
                break;
            case 1:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (kv6.l(kv6Var, 0, this) == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (kv6.l(kv6Var, 0, this) == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
        }
        return c1eVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jv6(kv6 kv6Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = kv6Var;
    }
}
