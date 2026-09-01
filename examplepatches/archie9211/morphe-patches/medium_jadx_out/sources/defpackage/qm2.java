package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qm2 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ ib2 c;
    public final /* synthetic */ elb d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ x45 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qm2(ib2 ib2Var, elb elbVar, boolean z, boolean z2, x45 x45Var, n92 n92Var) {
        super(2, n92Var);
        this.c = ib2Var;
        this.d = elbVar;
        this.e = z;
        this.f = z2;
        this.g = x45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new qm2(this.c, this.d, this.e, this.f, this.g, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((qm2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i != 0) {
            if (i == 1) {
                br7.v(obj);
                return obj;
            }
            ygf.f("call to 'resume' before 'invoke' with coroutine");
            return null;
        }
        br7.v(obj);
        pm2 pm2Var = new pm2(this.d, this.e, this.f, this.g, (n92) null);
        this.b = 1;
        Object objM0 = vx0.m0(this.c, pm2Var, this);
        return objM0 == tb2Var ? tb2Var : objM0;
    }
}
