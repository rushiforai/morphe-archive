package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lh9 extends p92 {
    public md9 b;
    public sh9 c;
    public /* synthetic */ Object d;
    public final /* synthetic */ h1c e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lh9(h1c h1cVar, n92 n92Var) {
        super(n92Var);
        this.e = h1cVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.X0(null, null, null, null, this);
    }
}
