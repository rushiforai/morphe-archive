package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mo9 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ pkf c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mo9(pkf pkfVar, p92 p92Var) {
        super(p92Var);
        this.c = pkfVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objK = this.c.K(null, 0, null, this);
        return objK == tb2.COROUTINE_SUSPENDED ? objK : new bjb(objK);
    }
}
