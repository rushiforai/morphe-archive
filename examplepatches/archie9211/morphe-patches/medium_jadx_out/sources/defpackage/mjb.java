package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mjb extends p92 {
    public int b;
    public int c;
    public int d;
    public int e;
    public long f;
    public x45 g;
    public qya h;
    public /* synthetic */ Object i;
    public int j;

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.i = obj;
        this.j |= Integer.MIN_VALUE;
        Object objW = er7.w(0, 0L, 0, null, this);
        return objW == tb2.COROUTINE_SUSPENDED ? objW : new bjb(objW);
    }
}
