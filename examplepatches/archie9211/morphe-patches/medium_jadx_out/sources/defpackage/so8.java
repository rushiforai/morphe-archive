package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class so8 extends p92 {
    public io8 b;
    public yo8 c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ yo8 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public so8(yo8 yo8Var, p92 p92Var) {
        super(p92Var);
        this.f = yo8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        Object objH = this.f.h(null, this);
        return objH == tb2.COROUTINE_SUSPENDED ? objH : new bjb(objH);
    }
}
