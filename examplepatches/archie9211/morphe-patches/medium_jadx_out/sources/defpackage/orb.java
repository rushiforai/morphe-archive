package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class orb extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ float d;
    public final /* synthetic */ ww e;
    public final /* synthetic */ oya f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public orb(float f, ww wwVar, oya oyaVar, n92 n92Var) {
        super(2, n92Var);
        this.d = f;
        this.e = wwVar;
        this.f = oyaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        orb orbVar = new orb(this.d, this.e, this.f, n92Var);
        orbVar.c = obj;
        return orbVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((orb) create((xrb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            xrb xrbVar = (xrb) this.c;
            pma pmaVar = new pma(this.f, 25, xrbVar);
            this.b = 1;
            if (tr7.k(0.0f, this.d, this.e, pmaVar, this, 4) == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }
}
