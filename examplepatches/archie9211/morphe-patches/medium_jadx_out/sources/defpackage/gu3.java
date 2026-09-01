package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gu3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ju3 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gu3(ju3 ju3Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ju3Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ju3 ju3Var = this.d;
        switch (i) {
            case 0:
                return new gu3(ju3Var, n92Var, 0);
            case 1:
                return new gu3(ju3Var, n92Var, 1);
            case 2:
                return new gu3(ju3Var, n92Var, 2);
            case 3:
                return new gu3(ju3Var, n92Var, 3);
            case 4:
                return new gu3(ju3Var, n92Var, 4);
            default:
                return new gu3(ju3Var, n92Var, 5);
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
        return ((gu3) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        ju3 ju3Var = this.d;
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
                xpc xpcVar = ju3Var.r;
                ut3 ut3Var = ut3.c;
                this.c = 1;
                xpcVar.a(ut3Var, this);
                return c1eVar == tb2Var ? tb2Var : c1eVar;
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
                r6c r6cVar = ju3Var.q;
                qt3 qt3Var = qt3.a;
                this.c = 1;
                return r6cVar.a(qt3Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
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
                xpc xpcVar2 = ju3Var.r;
                ut3 ut3Var2 = ut3.a;
                this.c = 1;
                xpcVar2.a(ut3Var2, this);
                return c1eVar == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xpc xpcVar3 = ju3Var.r;
                ut3 ut3Var3 = ut3.c;
                this.c = 1;
                xpcVar3.a(ut3Var3, this);
                return c1eVar == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar2 = ju3Var.q;
                qt3 qt3Var2 = qt3.b;
                this.c = 1;
                return r6cVar2.a(qt3Var2, this) == tb2Var5 ? tb2Var5 : c1eVar;
            default:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    olb olbVar = ju3Var.c;
                    yd4 yd4Var = yd4.NetworkFirst;
                    this.c = 1;
                    return olbVar.n(yd4Var, this) == tb2Var6 ? tb2Var6 : c1eVar;
                }
                if (i7 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                Object obj2 = ((bjb) obj).a;
                return c1eVar;
        }
    }
}
