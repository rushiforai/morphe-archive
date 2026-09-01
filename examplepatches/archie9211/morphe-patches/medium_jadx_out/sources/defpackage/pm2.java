package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pm2 extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public int c;
    public final /* synthetic */ elb d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ x45 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pm2(n92 n92Var, elb elbVar, boolean z, boolean z2, x45 x45Var) {
        super(2, n92Var);
        this.d = elbVar;
        this.e = z;
        this.f = z2;
        this.g = x45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new pm2(this.d, this.e, this.f, this.g, n92Var);
            default:
                return new pm2(n92Var, this.d, this.e, this.f, this.g);
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
        return ((pm2) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        switch (this.b) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i = this.c;
                if (i != 0) {
                    if (i == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                elb elbVar = this.d;
                boolean z = !(elbVar.k() && elbVar.l()) && this.e;
                boolean z2 = this.f;
                elb elbVar2 = this.d;
                om2 om2Var = new om2(z, z2, elbVar2, null, this.g, 0);
                this.c = 1;
                Object objR = elbVar2.r(z2, om2Var, this);
                return objR == tb2Var ? tb2Var : objR;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return obj;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                x45 x45Var = this.g;
                boolean z3 = this.f;
                boolean z4 = this.e;
                elb elbVar3 = this.d;
                om2 om2Var2 = new om2(z3, z4, elbVar3, null, x45Var, 1);
                this.c = 1;
                Object objR2 = elbVar3.r(z4, om2Var2, this);
                return objR2 == tb2Var2 ? tb2Var2 : objR2;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pm2(elb elbVar, boolean z, boolean z2, x45 x45Var, n92 n92Var) {
        super(2, n92Var);
        this.d = elbVar;
        this.e = z;
        this.f = z2;
        this.g = x45Var;
    }
}
