package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class go9 extends p92 {
    public String b;
    public Object c;
    public Throwable d;
    public int e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ ko9 h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public go9(ko9 ko9Var, p92 p92Var) {
        super(p92Var);
        this.h = ko9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objF = this.h.f(null, 0, null, this);
        return objF == tb2.COROUTINE_SUSPENDED ? objF : new bjb(objF);
    }
}
