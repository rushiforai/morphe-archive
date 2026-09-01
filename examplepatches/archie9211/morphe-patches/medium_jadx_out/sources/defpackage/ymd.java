package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ymd extends p92 {
    public String b;
    public String c;
    public String d;
    public String e;
    public boolean f;
    public /* synthetic */ Object g;
    public final /* synthetic */ mya h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ymd(mya myaVar, p92 p92Var) {
        super(p92Var);
        this.h = myaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objA = this.h.A(this, null, null, null, null, false);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
