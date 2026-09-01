package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jq5 extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ mq5 c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jq5(mq5 mq5Var, p92 p92Var) {
        super(p92Var);
        this.c = mq5Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objA = this.c.a(0, this, null, null);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
