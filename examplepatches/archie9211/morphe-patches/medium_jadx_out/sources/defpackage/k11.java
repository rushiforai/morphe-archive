package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k11 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ d56 d;
    public final /* synthetic */ ejc e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k11(d56 d56Var, ejc ejcVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = d56Var;
        this.e = ejcVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ejc ejcVar = this.e;
        d56 d56Var = this.d;
        switch (i) {
            case 0:
                return new k11(d56Var, ejcVar, n92Var, 0);
            case 1:
                return new k11(d56Var, ejcVar, n92Var, 1);
            case 2:
                return new k11(d56Var, ejcVar, n92Var, 2);
            case 3:
                return new k11(d56Var, ejcVar, n92Var, 3);
            default:
                return new k11(d56Var, ejcVar, n92Var, 4);
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
        return ((k11) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        ejc ejcVar = this.e;
        d56 d56Var = this.d;
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
                bo4 bo4VarA = d56Var.a();
                j11 j11Var = new j11(ejcVar, 0);
                this.c = 1;
                return bo4VarA.b(j11Var, this) == tb2Var ? tb2Var : c1eVar;
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
                bo4 bo4VarA2 = d56Var.a();
                j11 j11Var2 = new j11(ejcVar, 1);
                this.c = 1;
                return bo4VarA2.b(j11Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
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
                bo4 bo4VarA3 = d56Var.a();
                j11 j11Var3 = new j11(ejcVar, 2);
                this.c = 1;
                return bo4VarA3.b(j11Var3, this) == tb2Var3 ? tb2Var3 : c1eVar;
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
                bo4 bo4VarA4 = d56Var.a();
                j11 j11Var4 = new j11(ejcVar, 3);
                this.c = 1;
                return bo4VarA4.b(j11Var4, this) == tb2Var4 ? tb2Var4 : c1eVar;
            default:
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
                bo4 bo4VarA5 = d56Var.a();
                j11 j11Var5 = new j11(ejcVar, 5);
                this.c = 1;
                return bo4VarA5.b(j11Var5, this) == tb2Var5 ? tb2Var5 : c1eVar;
        }
    }
}
