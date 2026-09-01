package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zqc extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ rrc c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zqc(rrc rrcVar, p92 p92Var) {
        super(p92Var);
        this.c = rrcVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objA = this.c.a(null, 0L, 0L, null, this);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : new bjb(objA);
    }
}
