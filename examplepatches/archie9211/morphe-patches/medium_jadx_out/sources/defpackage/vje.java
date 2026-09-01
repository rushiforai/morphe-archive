package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vje extends p92 {
    public String b;
    public /* synthetic */ Object c;
    public final /* synthetic */ ble d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vje(ble bleVar, p92 p92Var) {
        super(p92Var);
        this.d = bleVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objB = this.d.b(null, this);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : new bjb(objB);
    }
}
