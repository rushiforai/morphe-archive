package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tm9 extends p92 {
    public String b;
    public x57 c;
    public Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ gn9 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tm9(gn9 gn9Var, p92 p92Var) {
        super(p92Var);
        this.f = gn9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        Object objV = this.f.v(null, this);
        return objV == tb2.COROUTINE_SUSPENDED ? objV : new bjb(objV);
    }
}
