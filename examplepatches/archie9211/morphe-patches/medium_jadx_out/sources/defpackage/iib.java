package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class iib extends p92 {
    public String b;
    public Object c;
    public Throwable d;
    public int e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ nib h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public iib(nib nibVar, p92 p92Var) {
        super(p92Var);
        this.h = nibVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objI = this.h.i(null, 0, null, this);
        return objI == tb2.COROUTINE_SUSPENDED ? objI : new bjb(objI);
    }
}
