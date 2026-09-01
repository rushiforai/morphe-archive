package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aw3 extends p92 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ cw3 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public aw3(cw3 cw3Var, p92 p92Var) {
        super(p92Var);
        this.d = cw3Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objI = this.d.i(null, 0, this);
        return objI == tb2.COROUTINE_SUSPENDED ? objI : new bjb(objI);
    }
}
