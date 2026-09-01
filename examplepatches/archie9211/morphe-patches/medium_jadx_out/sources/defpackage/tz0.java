package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tz0 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ uz0 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tz0(uz0 uz0Var, p92 p92Var) {
        super(p92Var);
        this.c = uz0Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objH = this.c.H(null, 0, 0L, this);
        return objH == tb2.COROUTINE_SUSPENDED ? objH : new kk1(objH);
    }
}
