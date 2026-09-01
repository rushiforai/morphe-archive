package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t95 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ hx4 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t95(hx4 hx4Var, p92 p92Var) {
        super(p92Var);
        this.c = hx4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objA1 = this.c.a1(null, this);
        return objA1 == tb2.COROUTINE_SUSPENDED ? objA1 : new bjb(objA1);
    }
}
