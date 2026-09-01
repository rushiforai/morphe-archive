package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class afb extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ nfb c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public afb(nfb nfbVar, p92 p92Var) {
        super(p92Var);
        this.c = nfbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objD = this.c.d(null, null, 0, null, null, null, 0, this);
        return objD == tb2.COROUTINE_SUSPENDED ? objD : new bjb(objD);
    }
}
