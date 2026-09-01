package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lu2 extends p92 {
    public pya b;
    public /* synthetic */ Object c;
    public final /* synthetic */ mu2 d;
    public int e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lu2(mu2 mu2Var, p92 p92Var) {
        super(p92Var);
        this.d = mu2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.c = obj;
        this.e |= Integer.MIN_VALUE;
        return this.d.i(null, false, this);
    }
}
