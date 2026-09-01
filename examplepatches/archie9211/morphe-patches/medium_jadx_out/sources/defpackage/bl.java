package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bl extends p4d implements c55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ cl d;
    public final /* synthetic */ oya e;
    public final /* synthetic */ float f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bl(cl clVar, oya oyaVar, float f, n92 n92Var) {
        super(3, n92Var);
        this.d = clVar;
        this.e = oyaVar;
        this.f = f;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        oya oyaVar = this.e;
        float f = this.f;
        bl blVar = new bl(this.d, oyaVar, f, (n92) obj3);
        blVar.c = (pl) obj;
        return blVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        oya oyaVar;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            pl plVar = (pl) this.c;
            cl clVar = this.d;
            al alVar = new al(clVar, 0, plVar);
            dn4 dn4Var = clVar.M;
            if (dn4Var == null) {
                g76.g0("resolvedFlingBehavior");
                throw null;
            }
            oya oyaVar2 = this.e;
            this.c = oyaVar2;
            this.b = 1;
            obj = dn4Var.a(alVar, this.f, this);
            if (obj == tb2Var) {
                return tb2Var;
            }
            oyaVar = oyaVar2;
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            oyaVar = (oya) this.c;
            br7.v(obj);
        }
        oyaVar.a = ((Number) obj).floatValue();
        return c1e.a;
    }
}
