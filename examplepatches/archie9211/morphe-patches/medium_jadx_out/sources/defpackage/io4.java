package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class io4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ wx6 e;
    public final /* synthetic */ vx6 f;
    public final /* synthetic */ bo4 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ io4(wx6 wx6Var, vx6 vx6Var, bo4 bo4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = wx6Var;
        this.f = vx6Var;
        this.g = bo4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                io4 io4Var = new io4(this.e, this.f, this.g, n92Var, 0);
                io4Var.d = obj;
                return io4Var;
            default:
                io4 io4Var2 = new io4(this.e, this.f, this.g, n92Var, 1);
                io4Var2.d = obj;
                return io4Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((io4) create((k2a) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((io4) create((l2a) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        l2a l2aVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        bo4 bo4Var = this.g;
        vx6 vx6Var = this.f;
        wx6 wx6Var = this.e;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    ho4 ho4Var = new ho4(bo4Var, (k2a) this.d, null, 0);
                    this.c = 1;
                    return gq7.P(wx6Var, vx6Var, ho4Var, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    l2a l2aVar2 = (l2a) this.d;
                    xs3 xs3Var = new xs3(bo4Var, l2aVar2, n92Var, 8);
                    this.d = l2aVar2;
                    this.c = 1;
                    if (gq7.P(wx6Var, vx6Var, xs3Var, this) == tb2Var2) {
                        return tb2Var2;
                    }
                    l2aVar = l2aVar2;
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    l2aVar = (l2a) this.d;
                    br7.v(obj);
                }
                l2aVar.c(null);
                return c1eVar;
        }
    }
}
