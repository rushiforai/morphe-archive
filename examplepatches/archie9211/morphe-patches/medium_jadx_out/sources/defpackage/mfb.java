package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mfb extends p92 {
    public String b;
    public Object c;
    public /* synthetic */ Object d;
    public final /* synthetic */ nfb e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mfb(nfb nfbVar, p92 p92Var) {
        super(p92Var);
        this.e = nfbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objP = this.e.p(null, null, this);
        return objP == tb2.COROUTINE_SUSPENDED ? objP : new bjb(objP);
    }
}
