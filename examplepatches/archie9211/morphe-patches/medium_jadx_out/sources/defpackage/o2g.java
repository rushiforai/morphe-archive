package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o2g extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public fdg c;
    public int d;
    public final /* synthetic */ fdg e;
    public final /* synthetic */ x2g f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o2g(x2g x2gVar, fdg fdgVar, n92 n92Var) {
        super(2, n92Var);
        this.f = x2gVar;
        this.e = fdgVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        x2g x2gVar = this.f;
        fdg fdgVar = this.e;
        switch (i) {
            case 0:
                return new o2g(x2gVar, fdgVar, n92Var);
            default:
                return new o2g(fdgVar, x2gVar, n92Var);
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((o2g) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        x2g x2gVar = this.f;
        fdg fdgVar = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.d;
                if (i2 == 0) {
                    br7.v(obj);
                    x2gVar.b = zi5.i;
                    this.c = fdgVar;
                    this.d = 1;
                    ycg ycgVar = new ycg(new ezf(x2gVar, null, 3));
                    if (ycgVar != tb2Var) {
                        obj = ycgVar;
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                fdgVar = this.c;
                br7.v(obj);
                this.c = null;
                this.d = 2;
                if (((ycg) obj).a.invoke(fdgVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.d;
                if (i3 == 0) {
                    br7.v(obj);
                    this.c = fdgVar;
                    this.d = 1;
                    wcg wcgVar = new wcg(38, new ood(x2gVar, null, 11), new Integer(2));
                    if (wcgVar != tb2Var2) {
                        obj = wcgVar;
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                fdgVar = this.c;
                br7.v(obj);
                this.c = null;
                this.d = 2;
                if (fdgVar.a((wcg) obj, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o2g(fdg fdgVar, x2g x2gVar, n92 n92Var) {
        super(2, n92Var);
        this.e = fdgVar;
        this.f = x2gVar;
    }
}
