package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ul5 extends p92 {
    public l23 b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ vl5 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ul5(vl5 vl5Var, p92 p92Var) {
        super(p92Var);
        this.e = vl5Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objA = this.e.a(null, 0, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
