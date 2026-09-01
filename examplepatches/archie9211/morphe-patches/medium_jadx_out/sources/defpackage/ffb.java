package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ffb extends p92 {
    public String b;
    public boolean c;
    public /* synthetic */ Object d;
    public final /* synthetic */ nfb e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ffb(nfb nfbVar, p92 p92Var) {
        super(p92Var);
        this.e = nfbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objI = this.e.i(null, false, this);
        return objI == tb2.COROUTINE_SUSPENDED ? objI : new bjb(objI);
    }
}
