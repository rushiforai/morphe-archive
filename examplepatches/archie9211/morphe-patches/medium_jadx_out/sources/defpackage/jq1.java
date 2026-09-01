package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jq1 extends p92 {
    public i56 b;
    public Object c;
    public fa4 d;
    public /* synthetic */ Object e;
    public final /* synthetic */ kq1 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jq1(kq1 kq1Var, p92 p92Var) {
        super(p92Var);
        this.f = kq1Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.intercept(null, this);
    }
}
