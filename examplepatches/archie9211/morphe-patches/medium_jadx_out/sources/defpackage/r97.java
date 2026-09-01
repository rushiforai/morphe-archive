package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class r97 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ u97 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r97(u97 u97Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = u97Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        u97 u97Var = this.d;
        switch (i) {
            case 0:
                return new r97(u97Var, n92Var, 0);
            case 1:
                return new r97(u97Var, n92Var, 1);
            default:
                return new r97(u97Var, n92Var, 2);
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
        return ((r97) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        u97 u97Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    r6c r6cVar = u97Var.s;
                    this.c = 1;
                    if (r6cVar.a(c97.a, this) != tb2Var) {
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
                this.c = 2;
                x2b x2bVar = u97.w;
                if (u97Var.g(this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
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
                r6c r6cVar2 = u97Var.q;
                h97 h97Var = new h97(u97Var.d, u97Var.b, u97Var.c, u97Var.o, u97Var.u, u97Var.e);
                this.c = 1;
                return r6cVar2.a(h97Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    x2b x2bVar2 = u97.w;
                    return u97Var.g(this) == tb2Var3 ? tb2Var3 : c1eVar;
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
