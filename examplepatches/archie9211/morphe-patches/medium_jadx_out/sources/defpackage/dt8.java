package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dt8 extends p92 {
    public rya b;
    public et8 c;
    public /* synthetic */ Object d;
    public final /* synthetic */ sa e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dt8(sa saVar, n92 n92Var) {
        super(n92Var);
        this.e = saVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.e(null, this);
    }
}
