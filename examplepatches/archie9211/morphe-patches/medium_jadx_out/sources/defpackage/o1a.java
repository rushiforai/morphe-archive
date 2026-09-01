package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class o1a extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public final /* synthetic */ q1a e;
    public final /* synthetic */ boolean f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o1a(q1a q1aVar, boolean z, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = q1aVar;
        this.f = z;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        boolean z = this.f;
        q1a q1aVar = this.e;
        switch (i) {
            case 0:
                return new o1a(q1aVar, z, n92Var, 0);
            default:
                return new o1a(q1aVar, z, n92Var, 1);
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
        return ((o1a) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objA2;
        int i = this.b;
        c1e c1eVar = c1e.a;
        boolean z = this.f;
        q1a q1aVar = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.d;
                if (i2 == 0) {
                    br7.v(obj);
                    vnb vnbVar = q1aVar.d;
                    this.d = 1;
                    objA = vnbVar.a(z, this);
                    if (objA != tb2Var) {
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
                objA = ((bjb) obj).a;
                if (bjb.b(objA) == null) {
                    return c1eVar;
                }
                r6c r6cVar = q1aVar.g;
                j1a j1aVar = new j1a();
                this.c = objA;
                this.d = 2;
                if (r6cVar.a(j1aVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.d;
                if (i3 == 0) {
                    br7.v(obj);
                    xnb xnbVar = q1aVar.e;
                    this.d = 1;
                    objA2 = xnbVar.a(z, this);
                    if (objA2 != tb2Var2) {
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
                objA2 = ((bjb) obj).a;
                if (bjb.b(objA2) == null) {
                    return c1eVar;
                }
                r6c r6cVar2 = q1aVar.g;
                j1a j1aVar2 = new j1a();
                this.c = objA2;
                this.d = 2;
                if (r6cVar2.a(j1aVar2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
