package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k5e extends p92 {
    public String b;
    public String c;
    public String d;
    public String e;
    public String f;
    public /* synthetic */ Object g;
    public final /* synthetic */ vwa h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k5e(vwa vwaVar, p92 p92Var) {
        super(p92Var);
        this.h = vwaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objV = this.h.v(null, null, null, null, null, this);
        return objV == tb2.COROUTINE_SUSPENDED ? objV : new bjb(objV);
    }
}
