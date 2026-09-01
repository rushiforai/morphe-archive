package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class e9e extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ q9e d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e9e(q9e q9eVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = q9eVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        q9e q9eVar = this.d;
        switch (i) {
            case 0:
                return new e9e(q9eVar, n92Var, 0);
            case 1:
                return new e9e(q9eVar, n92Var, 1);
            default:
                return new e9e(q9eVar, n92Var, 2);
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
        return ((e9e) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        q9e q9eVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    uua uuaVar = q9eVar.d.h;
                    a7c a7cVar = new a7c(7, q9eVar);
                    this.c = 1;
                    if (uuaVar.a.b(a7cVar, this) == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                z72.b();
                return null;
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
                c9e c9eVar = (c9e) ei7.N(q9eVar.p.a.getValue(), q9eVar.m);
                this.c = 1;
                Object objA = c9eVar.b.a(u8e.a, this);
                if (objA != tb2Var2) {
                    objA = c1eVar;
                }
                return objA == tb2Var2 ? tb2Var2 : c1eVar;
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
                c9e c9eVar2 = (c9e) ei7.N(q9eVar.p.a.getValue(), q9eVar.m);
                this.c = 1;
                Object objA2 = c9eVar2.b.a(v8e.a, this);
                if (objA2 != tb2Var3) {
                    objA2 = c1eVar;
                }
                return objA2 == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
