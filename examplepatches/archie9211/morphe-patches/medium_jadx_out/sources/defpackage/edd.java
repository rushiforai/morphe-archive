package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class edd extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ odd d;
    public final /* synthetic */ rg1 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ edd(odd oddVar, rg1 rg1Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = oddVar;
        this.e = rg1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        rg1 rg1Var = this.e;
        odd oddVar = this.d;
        switch (i) {
            case 0:
                return new edd(oddVar, rg1Var, n92Var, 0);
            default:
                return new edd(oddVar, rg1Var, n92Var, 1);
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
        return ((edd) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        edd eddVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        odd oddVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = oddVar.s;
                    String str = oddVar.c;
                    String str2 = oddVar.P;
                    this.c = 1;
                    eddVar = this;
                    obj = n0cVar.T(this.e, false, str, str2, eddVar);
                    if (obj != tb2Var) {
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
                eddVar = this;
                r6c r6cVar = oddVar.M;
                dcd dcdVar = new dcd((o81) obj);
                eddVar.c = 2;
                if (r6cVar.a(dcdVar, eddVar) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
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
                oddVar.s.getClass();
                s71 s71VarZ = n0c.z(this.e, false);
                r6c r6cVar2 = oddVar.M;
                dcd dcdVar2 = new dcd(s71VarZ);
                this.c = 1;
                return r6cVar2.a(dcdVar2, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
