package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jpa extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ mpa d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jpa(mpa mpaVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = mpaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        mpa mpaVar = this.d;
        switch (i) {
            case 0:
                return new jpa(mpaVar, n92Var, 0);
            case 1:
                return new jpa(mpaVar, n92Var, 1);
            default:
                return new jpa(mpaVar, n92Var, 2);
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
        return ((jpa) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        mpa mpaVar = this.d;
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
                npa npaVar = mpaVar.t;
                float f = mpaVar.q ? 1.0f : 0.0f;
                this.c = 1;
                Object objF = npaVar.a.f(this, new Float(f));
                if (objF != tb2Var) {
                    objF = c1eVar;
                }
                return objF == tb2Var ? tb2Var : c1eVar;
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
                if (mpaVar.t.a.e()) {
                    return c1eVar;
                }
                npa npaVar2 = mpaVar.t;
                float fG = mpaVar.w.g() / mpaVar.O0();
                this.c = 1;
                Object objF2 = npaVar2.a.f(this, new Float(fG));
                if (objF2 != tb2Var2) {
                    objF2 = c1eVar;
                }
                return objF2 == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1 || i4 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                if (mpaVar.q) {
                    this.c = 2;
                    if (mpaVar.M0(this) != tb2Var3) {
                        return c1eVar;
                    }
                } else {
                    this.c = 1;
                    if (mpaVar.L0(this) != tb2Var3) {
                        return c1eVar;
                    }
                }
                return tb2Var3;
        }
    }
}
