package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g18 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ h18 d;
    public final /* synthetic */ sl0 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ g18(h18 h18Var, sl0 sl0Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = h18Var;
        this.e = sl0Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        sl0 sl0Var = this.e;
        h18 h18Var = this.d;
        switch (i) {
            case 0:
                return new g18(h18Var, sl0Var, n92Var, 0);
            default:
                return new g18(h18Var, sl0Var, n92Var, 1);
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
        return ((g18) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sl0 sl0Var = this.e;
        h18 h18Var = this.d;
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
                ou ouVar = h18Var.e;
                Float f = new Float(bm0.a.a(sl0Var.c));
                this.c = 1;
                return ouVar.f(this, f) == tb2Var ? tb2Var : c1eVar;
            default:
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
                ou ouVar2 = h18Var.e;
                Float f2 = new Float(bm0.a.a(sl0Var.c));
                this.c = 1;
                return ouVar2.f(this, f2) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
