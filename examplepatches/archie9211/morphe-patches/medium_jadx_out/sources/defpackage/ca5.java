package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ca5 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ da5 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ca5(da5 da5Var, p92 p92Var) {
        super(p92Var);
        this.c = da5Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objA = this.c.a(null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
