package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ge4 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ md5 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ge4(md5 md5Var, p92 p92Var) {
        super(p92Var);
        this.c = md5Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objL = this.c.l(null, null, this);
        return objL == tb2.COROUTINE_SUSPENDED ? objL : new bjb(objL);
    }
}
