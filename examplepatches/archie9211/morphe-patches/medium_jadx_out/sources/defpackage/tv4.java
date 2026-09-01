package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tv4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ xv4 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ tv4(xv4 xv4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = xv4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        xv4 xv4Var = this.d;
        switch (i) {
            case 0:
                return new tv4(xv4Var, n92Var, 0);
            case 1:
                return new tv4(xv4Var, n92Var, 1);
            default:
                return new tv4(xv4Var, n92Var, 2);
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
        return ((tv4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        xv4 xv4Var = this.d;
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
                mv4 mv4Var = xv4Var.h;
                this.c = 1;
                Object objD = mv4Var.c.D(this);
                if (objD != tb2Var) {
                    objD = c1eVar;
                }
                return objD == tb2Var ? tb2Var : c1eVar;
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
                mv4 mv4Var2 = xv4Var.h;
                this.c = 1;
                Object objC0 = mv4Var2.c.c0(this);
                if (objC0 != tb2Var2) {
                    objC0 = c1eVar;
                }
                return objC0 == tb2Var2 ? tb2Var2 : c1eVar;
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
                uua uuaVarZ = bo.z(xv4Var.d.f);
                aq aqVar = new aq(11, xv4Var);
                this.c = 1;
                return uuaVarZ.a.b(aqVar, this) == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
