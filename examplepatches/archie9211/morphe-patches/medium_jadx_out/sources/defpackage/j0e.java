package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j0e extends p92 {
    public String b;
    public String c;
    public String d;
    public String e;
    public /* synthetic */ Object f;
    public final /* synthetic */ a1a g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j0e(a1a a1aVar, p92 p92Var) {
        super(p92Var);
        this.g = a1aVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        Object objI = this.g.I(null, null, null, null, this);
        return objI == tb2.COROUTINE_SUSPENDED ? objI : new bjb(objI);
    }
}
