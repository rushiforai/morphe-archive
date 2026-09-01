package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class p3d extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ z3d c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p3d(z3d z3dVar, p92 p92Var) {
        super(p92Var);
        this.c = z3dVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objB = this.c.b(null, null, null, null, null, false, this);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
