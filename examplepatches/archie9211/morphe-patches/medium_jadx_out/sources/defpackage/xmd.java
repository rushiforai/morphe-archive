package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xmd extends p92 {
    public String b;
    public boolean c;
    public /* synthetic */ Object d;
    public final /* synthetic */ hha e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xmd(hha hhaVar, p92 p92Var) {
        super(p92Var);
        this.e = hhaVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        Object objR = this.e.r(null, false, this);
        return objR == tb2.COROUTINE_SUSPENDED ? objR : new bjb(objR);
    }
}
