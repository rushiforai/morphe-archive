package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class h79 extends p92 {
    public String b;
    public String c;
    public /* synthetic */ Object d;
    public final /* synthetic */ i79 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h79(i79 i79Var, p92 p92Var) {
        super(p92Var);
        this.e = i79Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objF = this.e.f(null, null, null, this);
        return objF == tb2.COROUTINE_SUSPENDED ? objF : new bjb(objF);
    }
}
