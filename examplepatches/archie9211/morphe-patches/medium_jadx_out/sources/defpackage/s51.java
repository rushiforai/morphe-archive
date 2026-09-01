package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s51 extends p92 {
    public String b;
    public String c;
    public Object d;
    public boolean e;
    public /* synthetic */ Object f;
    public final /* synthetic */ t51 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s51(t51 t51Var, p92 p92Var) {
        super(p92Var);
        this.g = t51Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        Object objA = this.g.a(null, null, false, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
