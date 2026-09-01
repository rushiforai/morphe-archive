package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wh1 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ qi1 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wh1(qi1 qi1Var, p92 p92Var) {
        super(p92Var);
        this.c = qi1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objW = this.c.w(null, null, null, this);
        return objW == tb2.COROUTINE_SUSPENDED ? objW : new bjb(objW);
    }
}
