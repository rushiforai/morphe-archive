package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yc1 extends p92 {
    public int b;
    public int c;
    public Object d;
    public Throwable e;
    public /* synthetic */ Object f;
    public final /* synthetic */ id1 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yc1(id1 id1Var, p92 p92Var) {
        super(p92Var);
        this.g = id1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        Object objK = this.g.k(0, this);
        return objK == tb2.COROUTINE_SUSPENDED ? objK : new bjb(objK);
    }
}
