package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class m57 extends p4d implements d55 {
    public int b;
    public /* synthetic */ Integer c;
    public final /* synthetic */ n57 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m57(n57 n57Var, n92 n92Var) {
        super(4, n92Var);
        this.d = n57Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Integer num = this.c;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            this.c = null;
            this.b = 1;
            objA = this.d.a(num, 15, this);
            if (objA == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objA = ((bjb) obj).a;
        }
        return new bjb(objA);
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        ((Number) obj3).intValue();
        m57 m57Var = new m57(this.d, (n92) obj4);
        m57Var.c = (Integer) obj;
        return m57Var.invokeSuspend(c1e.a);
    }
}
