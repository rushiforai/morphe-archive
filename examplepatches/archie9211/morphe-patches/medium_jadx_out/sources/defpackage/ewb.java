package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ewb extends p4d implements x45 {
    public int b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ hwb e;
    public final /* synthetic */ dsd f;
    public final /* synthetic */ float g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ewb(Object obj, Object obj2, hwb hwbVar, dsd dsdVar, float f, n92 n92Var) {
        super(1, n92Var);
        this.c = obj;
        this.d = obj2;
        this.e = hwbVar;
        this.f = dsdVar;
        this.g = f;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new ewb(this.c, this.d, this.e, this.f, this.g, n92Var);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        return ((ewb) create((n92) obj)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        if (i == 0) {
            br7.v(obj);
            dwb dwbVar = new dwb(this.c, this.d, this.e, this.f, this.g, (n92) null);
            this.b = 1;
            if (o7f.s(dwbVar, this) == tb2Var) {
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
