package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wq3 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ xq3 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wq3(xq3 xq3Var, p92 p92Var) {
        super(p92Var);
        this.c = xq3Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objP = this.c.p(null, this);
        return objP == tb2.COROUTINE_SUSPENDED ? objP : new bjb(objP);
    }
}
