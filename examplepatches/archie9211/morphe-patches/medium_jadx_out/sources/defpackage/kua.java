package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kua extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ nua d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kua(nua nuaVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = nuaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        nua nuaVar = this.d;
        switch (i) {
            case 0:
                return new kua(nuaVar, n92Var, 0);
            case 1:
                return new kua(nuaVar, n92Var, 1);
            case 2:
                return new kua(nuaVar, n92Var, 2);
            default:
                return new kua(nuaVar, n92Var, 3);
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
        return ((kua) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        nua nuaVar = this.d;
        c1e c1eVar = c1e.a;
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
                xpc xpcVar = nuaVar.n;
                this.c = 1;
                xpcVar.a(null, this);
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
                zta ztaVar = nuaVar.g;
                this.c = 1;
                Object objD = ztaVar.b.D(this);
                if (objD != tb2Var2) {
                    objD = c1eVar;
                }
                return objD == tb2Var2 ? tb2Var2 : c1eVar;
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
                zta ztaVar2 = nuaVar.g;
                this.c = 1;
                Object objC0 = ztaVar2.b.c0(this);
                if (objC0 != tb2Var3) {
                    objC0 = c1eVar;
                }
                return objC0 == tb2Var3 ? tb2Var3 : c1eVar;
            default:
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
                xpc xpcVar2 = nuaVar.n;
                this.c = 1;
                xpcVar2.a(aua.a, this);
                return c1eVar == tb2Var4 ? tb2Var4 : c1eVar;
        }
    }
}
