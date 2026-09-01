package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lw9 extends p92 {
    public int b;
    public int c;
    public Object d;
    public Throwable e;
    public /* synthetic */ Object f;
    public final /* synthetic */ sw9 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lw9(sw9 sw9Var, p92 p92Var) {
        super(p92Var);
        this.g = sw9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        Object objQ = this.g.q(0, this);
        return objQ == tb2.COROUTINE_SUSPENDED ? objQ : new bjb(objQ);
    }
}
