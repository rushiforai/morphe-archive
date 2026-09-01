package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ake extends p92 {
    public /* synthetic */ Object b;
    public final /* synthetic */ ble c;
    public int d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ake(ble bleVar, p92 p92Var) {
        super(p92Var);
        this.c = bleVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.b = obj;
        this.d |= Integer.MIN_VALUE;
        Object objG = this.c.g(0, null, false, null, this);
        return objG == tb2.COROUTINE_SUSPENDED ? objG : new bjb(objG);
    }
}
