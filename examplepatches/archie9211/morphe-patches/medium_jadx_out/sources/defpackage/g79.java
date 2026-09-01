package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class g79 extends p92 {
    public String b;
    public /* synthetic */ Object c;
    public final /* synthetic */ i79 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g79(i79 i79Var, p92 p92Var) {
        super(p92Var);
        this.d = i79Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        Object objD = this.d.d(null, null, null, this);
        return objD == tb2.COROUTINE_SUSPENDED ? objD : new bjb(objD);
    }
}
