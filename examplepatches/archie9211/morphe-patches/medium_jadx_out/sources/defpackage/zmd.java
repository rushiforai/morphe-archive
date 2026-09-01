package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zmd extends p92 {
    public String b;
    public String c;
    public String d;
    public String e;
    public boolean f;
    public /* synthetic */ Object g;
    public final /* synthetic */ a1a h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zmd(a1a a1aVar, p92 p92Var) {
        super(p92Var);
        this.h = a1aVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objH = this.h.H(this, null, null, null, null, false);
        return objH == tb2.COROUTINE_SUSPENDED ? objH : new bjb(objH);
    }
}
