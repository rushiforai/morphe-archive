package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i7b extends p92 {
    public String b;
    public String c;
    public String d;
    public String e;
    public /* synthetic */ Object f;
    public final /* synthetic */ j7b g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i7b(j7b j7bVar, p92 p92Var) {
        super(p92Var);
        this.g = j7bVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        Object objA = this.g.a(null, null, false, null, null, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
