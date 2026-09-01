package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qp7 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ rp7 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qp7(rp7 rp7Var, p92 p92Var) {
        super(p92Var);
        this.c = rp7Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objE = this.c.e(null, null, this);
        return objE == tb2.COROUTINE_SUSPENDED ? objE : new bjb(objE);
    }
}
