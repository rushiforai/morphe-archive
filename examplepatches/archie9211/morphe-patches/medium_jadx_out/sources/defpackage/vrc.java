package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vrc extends p92 {
    public String b;
    public String c;
    public String d;
    public String e;
    public String f;
    public /* synthetic */ Object g;
    public final /* synthetic */ wrc h;
    public int i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vrc(wrc wrcVar, p92 p92Var) {
        super(p92Var);
        this.h = wrcVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.g = obj;
        this.i |= Integer.MIN_VALUE;
        Object objA = this.h.a(null, null, null, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
