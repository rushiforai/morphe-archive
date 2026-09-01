package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y9b extends p92 {
    public rj2 b;
    public /* synthetic */ Object c;
    public final /* synthetic */ z9b d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y9b(z9b z9bVar, p92 p92Var) {
        super(p92Var);
        this.d = z9bVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objE = this.d.e(this);
        return objE == tb2.COROUTINE_SUSPENDED ? objE : new bjb(objE);
    }
}
