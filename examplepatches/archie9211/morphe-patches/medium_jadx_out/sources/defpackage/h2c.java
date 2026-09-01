package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h2c extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ l2c c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h2c(l2c l2cVar, p92 p92Var) {
        super(p92Var);
        this.c = l2cVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objB = this.c.b(null, this);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
