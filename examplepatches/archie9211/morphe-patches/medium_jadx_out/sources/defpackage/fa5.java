package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fa5 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ hx4 c;
    public final /* synthetic */ String d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fa5(n92 n92Var, hx4 hx4Var, String str) {
        super(2, n92Var);
        this.c = hx4Var;
        this.d = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new fa5(n92Var, this.c, this.d);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((fa5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objB;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            cba cbaVar = (cba) this.c.c;
            this.b = 1;
            objB = cbaVar.b(this.d, yd4.NetworkFirst, this);
            if (objB == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
            objB = ((bjb) obj).a;
        }
        return new bjb(objB);
    }
}
