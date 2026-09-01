package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zy2 extends p92 {
    public String b;
    public /* synthetic */ Object c;
    public final /* synthetic */ zg7 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zy2(zg7 zg7Var, p92 p92Var) {
        super(p92Var);
        this.d = zg7Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objS0 = this.d.s0(null, this);
        return objS0 == tb2.COROUTINE_SUSPENDED ? objS0 : new bjb(objS0);
    }
}
