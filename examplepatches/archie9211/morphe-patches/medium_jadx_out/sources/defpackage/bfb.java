package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bfb extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ nfb c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bfb(nfb nfbVar, p92 p92Var) {
        super(p92Var);
        this.c = nfbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objE = this.c.e(null, null, null, null, 0, this);
        return objE == tb2.COROUTINE_SUSPENDED ? objE : new bjb(objE);
    }
}
