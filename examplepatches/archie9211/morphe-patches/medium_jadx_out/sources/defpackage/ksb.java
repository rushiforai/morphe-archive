package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ksb extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ msb d;
    public /* synthetic */ long e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ksb(msb msbVar, long j, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = msbVar;
        this.e = j;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new ksb(this.d, this.e, n92Var, 0);
            case 1:
                return new ksb(this.d, this.e, n92Var, 1);
            case 2:
                return new ksb(this.d, this.e, n92Var, 2);
            default:
                ksb ksbVar = new ksb(this.d, n92Var);
                ksbVar.e = ((ip8) obj).a;
                return ksbVar;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((ksb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((ksb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((ksb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                long j = ((ip8) obj).a;
                ksb ksbVar = new ksb(this.d, (n92) obj2);
                ksbVar.e = j;
                return ksbVar.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        msb msbVar = this.d;
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
                vsb vsbVar = msbVar.N;
                s78 s78Var = s78.UserInput;
                jsb jsbVar = new jsb(this.e, null);
                this.c = 1;
                return vsbVar.f(s78Var, jsbVar, this) == tb2Var ? tb2Var : c1eVar;
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
                vsb vsbVar2 = msbVar.N;
                long j = this.e;
                this.c = 1;
                return vsbVar2.b(j, false, this) == tb2Var2 ? tb2Var2 : c1eVar;
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
                vsb vsbVar3 = msbVar.N;
                long j2 = this.e;
                this.c = 1;
                return vsbVar3.b(j2, true, this) == tb2Var3 ? tb2Var3 : c1eVar;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                long j3 = this.e;
                vsb vsbVar4 = msbVar.N;
                this.c = 1;
                Object objK = w2g.K(vsbVar4, j3, this);
                return objK == tb2Var4 ? tb2Var4 : objK;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ksb(msb msbVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 3;
        this.d = msbVar;
    }
}
