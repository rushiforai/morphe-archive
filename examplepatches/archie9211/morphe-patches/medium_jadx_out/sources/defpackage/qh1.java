package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qh1 extends p92 {
    public String b;
    public /* synthetic */ Object c;
    public final /* synthetic */ qi1 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qh1(qi1 qi1Var, p92 p92Var) {
        super(p92Var);
        this.d = qi1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objT = this.d.t(null, this);
        return objT == tb2.COROUTINE_SUSPENDED ? objT : new bjb(objT);
    }
}
