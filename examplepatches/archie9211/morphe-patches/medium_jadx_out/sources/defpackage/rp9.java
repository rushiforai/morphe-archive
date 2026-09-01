package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rp9 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ wp9 c;
    public final /* synthetic */ long d;
    public final /* synthetic */ long e;
    public final /* synthetic */ yd4 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rp9(wp9 wp9Var, long j, long j2, yd4 yd4Var, n92 n92Var) {
        super(2, n92Var);
        this.c = wp9Var;
        this.d = j;
        this.e = j2;
        this.f = yd4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new rp9(this.c, this.d, this.e, this.f, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((rp9) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            wp9 wp9Var = this.c;
            va5 va5Var = wp9Var.e;
            String str = wp9Var.b;
            this.b = 1;
            objA = va5Var.a(str, this.d, this.e, this.f, this);
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
}
