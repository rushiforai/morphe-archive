package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fsc extends p4d implements d55 {
    public int b;
    public /* synthetic */ String c;
    public /* synthetic */ yd4 d;
    public /* synthetic */ int e;
    public final /* synthetic */ gsc f;
    public final /* synthetic */ wsc g;
    public final /* synthetic */ String h;
    public final /* synthetic */ xqc i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fsc(gsc gscVar, wsc wscVar, String str, xqc xqcVar, n92 n92Var) {
        super(4, n92Var);
        this.f = gscVar;
        this.g = wscVar;
        this.h = str;
        this.i = xqcVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        String str = this.c;
        yd4 yd4Var = this.d;
        int i = this.e;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i2 = this.b;
        if (i2 == 0) {
            br7.v(obj);
            if (str == null) {
                str = "";
            }
            this.c = null;
            this.d = null;
            this.e = i;
            this.b = 1;
            objA = this.f.a(this.g, this.h, str, i, this.i, yd4Var, this);
            if (objA == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i2 != 1) {
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
        int iIntValue = ((Number) obj3).intValue();
        String str = this.h;
        xqc xqcVar = this.i;
        fsc fscVar = new fsc(this.f, this.g, str, xqcVar, (n92) obj4);
        fscVar.c = (String) obj;
        fscVar.d = (yd4) obj2;
        fscVar.e = iIntValue;
        return fscVar.invokeSuspend(c1e.a);
    }
}
