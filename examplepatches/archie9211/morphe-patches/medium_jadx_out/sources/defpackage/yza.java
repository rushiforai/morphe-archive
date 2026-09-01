package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yza extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ gz8 d;
    public final /* synthetic */ x45 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yza(gz8 gz8Var, x45 x45Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = gz8Var;
        this.e = x45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new yza(this.d, this.e, n92Var, 0);
            default:
                return new yza(this.d, this.e, n92Var, 1);
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
        return ((yza) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        x45 x45Var = this.e;
        gz8 gz8Var = this.d;
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
                u50 u50VarE = no7.E(new wx4(gz8Var, 8));
                xza xzaVar = new xza(0, x45Var);
                this.c = 1;
                return u50VarE.b(xzaVar, this) == tb2Var ? tb2Var : c1eVar;
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
                u50 u50VarE2 = no7.E(new wx4(gz8Var, 10));
                xza xzaVar2 = new xza(2, x45Var);
                this.c = 1;
                return u50VarE2.b(xzaVar2, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
