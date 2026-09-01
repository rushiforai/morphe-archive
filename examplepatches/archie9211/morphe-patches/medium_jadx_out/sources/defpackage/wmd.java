package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wmd extends p92 {
    public String b;
    public boolean c;
    public /* synthetic */ Object d;
    public final /* synthetic */ q8c e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wmd(q8c q8cVar, p92 p92Var) {
        super(p92Var);
        this.e = q8cVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objB = this.e.b(null, false, this);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
