package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xa2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ vb9 d;
    public final /* synthetic */ rhd e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xa2(vb9 vb9Var, rhd rhdVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = vb9Var;
        this.e = rhdVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new xa2(this.d, this.e, n92Var, 0);
            case 1:
                return new xa2(this.d, this.e, n92Var, 1);
            default:
                return new xa2(this.d, this.e, n92Var, 2);
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
        return ((xa2) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        vb9 vb9Var = this.d;
        final rhd rhdVar = this.e;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        final int i2 = 1;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
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
                this.c = 1;
                Object objS = o7f.s(new lm1(vb9Var, rhdVar, n92Var, 8), this);
                if (objS != tb2Var) {
                    objS = c1eVar;
                }
                return objS == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
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
                this.c = 1;
                Object objL = w2g.l(vb9Var, new i05(rhdVar, n92Var, i2), this);
                if (objL != tb2Var2) {
                    objL = c1eVar;
                }
                return objL == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
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
                this.c = 1;
                final int i6 = 0;
                Object objD = yk3.d(this.d, new ra7(rhdVar, 0), new m45() { // from class: sa7
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i7 = i6;
                        c1e c1eVar2 = c1e.a;
                        rhd rhdVar2 = rhdVar;
                        switch (i7) {
                            case 0:
                                rhdVar2.a();
                                break;
                            default:
                                rhdVar2.onCancel();
                                break;
                        }
                        return c1eVar2;
                    }
                }, new m45() { // from class: sa7
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i7 = i2;
                        c1e c1eVar2 = c1e.a;
                        rhd rhdVar2 = rhdVar;
                        switch (i7) {
                            case 0:
                                rhdVar2.a();
                                break;
                            default:
                                rhdVar2.onCancel();
                                break;
                        }
                        return c1eVar2;
                    }
                }, new l23(29, rhdVar), this);
                if (objD != tb2Var3) {
                    objD = c1eVar;
                }
                return objD == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
