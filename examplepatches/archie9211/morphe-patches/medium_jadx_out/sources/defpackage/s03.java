package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s03 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public do4 c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ z03 f;
    public final /* synthetic */ String g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ s03(z03 z03Var, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = z03Var;
        this.g = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.g;
        z03 z03Var = this.f;
        switch (i) {
            case 0:
                s03 s03Var = new s03(z03Var, str, n92Var, 0);
                s03Var.e = obj;
                return s03Var;
            default:
                s03 s03Var2 = new s03(z03Var, str, n92Var, 1);
                s03Var2.e = obj;
                return s03Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        do4 do4Var = (do4) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((s03) create(do4Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        String str = this.g;
        z03 z03Var = this.f;
        switch (i) {
            case 0:
                do4 do4Var = (do4) this.e;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.d;
                if (i2 == 0) {
                    br7.v(obj);
                    this.e = null;
                    this.c = do4Var;
                    this.d = 1;
                    obj = z03Var.b(str, as7.j, this);
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
                do4Var = this.c;
                br7.v(obj);
                this.e = null;
                this.c = null;
                this.d = 2;
                if (do4Var.a(obj, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                do4 do4Var2 = (do4) this.e;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.d;
                if (i3 == 0) {
                    br7.v(obj);
                    this.e = null;
                    this.c = do4Var2;
                    this.d = 1;
                    obj = z03Var.b(str, as7.k, this);
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
                do4Var2 = this.c;
                br7.v(obj);
                this.e = null;
                this.c = null;
                this.d = 2;
                if (do4Var2.a(obj, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
