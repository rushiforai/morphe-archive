package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rk2 extends p92 {
    public Object b;
    public /* synthetic */ Object c;
    public final /* synthetic */ zk2 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rk2(zk2 zk2Var, p92 p92Var) {
        super(p92Var);
        this.d = zk2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objL = this.d.l(this);
        return objL == tb2.COROUTINE_SUSPENDED ? objL : new bjb(objL);
    }
}
