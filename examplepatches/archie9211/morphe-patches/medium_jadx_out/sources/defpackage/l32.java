package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l32 extends p92 {
    public n32 b;
    public Object c;
    public e18 d;
    public int e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ n32 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l32(n32 n32Var, p92 p92Var) {
        super(p92Var);
        this.h = n32Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objC = this.h.c(this);
        return objC == tb2.COROUTINE_SUSPENDED ? objC : new bjb(objC);
    }
}
