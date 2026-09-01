package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gu2 extends p92 {
    public mu2 b;
    public rpc c;
    public boolean d;
    public /* synthetic */ Object e;
    public final /* synthetic */ mu2 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gu2(mu2 mu2Var, n92 n92Var) {
        super(n92Var);
        this.f = mu2Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.g(false, this);
    }
}
