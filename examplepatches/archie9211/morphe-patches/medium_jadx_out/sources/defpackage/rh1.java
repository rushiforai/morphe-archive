package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rh1 extends p92 {
    public String b;
    public Object c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ qi1 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rh1(qi1 qi1Var, p92 p92Var) {
        super(p92Var);
        this.f = qi1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        Object objU = this.f.u(null, this);
        return objU == tb2.COROUTINE_SUSPENDED ? objU : new bjb(objU);
    }
}
