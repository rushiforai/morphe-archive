package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zh1 extends p92 {
    public ud1 b;
    public y88 c;
    public qi1 d;
    public Object e;
    public String f;
    public int g;
    public int h;
    public int i;
    public /* synthetic */ Object j;
    public final /* synthetic */ qi1 k;
    public int l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zh1(qi1 qi1Var, p92 p92Var) {
        super(p92Var);
        this.k = qi1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.j = obj;
        this.l |= Integer.MIN_VALUE;
        Object objZ = this.k.z(null, this);
        return objZ == tb2.COROUTINE_SUSPENDED ? objZ : new bjb(objZ);
    }
}
