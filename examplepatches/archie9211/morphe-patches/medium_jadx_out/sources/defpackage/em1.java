package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class em1 extends p92 {
    public String b;
    public String c;
    public String d;
    public String e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ m50 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public em1(m50 m50Var, p92 p92Var) {
        super(p92Var);
        this.h = m50Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objF = this.h.F(null, 0, null, null, null, this);
        return objF == tb2.COROUTINE_SUSPENDED ? objF : new bjb(objF);
    }
}
