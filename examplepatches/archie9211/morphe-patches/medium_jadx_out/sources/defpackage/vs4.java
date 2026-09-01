package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vs4 extends p92 {
    public String b;
    public String c;
    public String d;
    public String e;
    public /* synthetic */ Object f;
    public final /* synthetic */ ws4 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vs4(ws4 ws4Var, p92 p92Var) {
        super(p92Var);
        this.g = ws4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        Object objB = this.g.b(null, null, null, null, this);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
