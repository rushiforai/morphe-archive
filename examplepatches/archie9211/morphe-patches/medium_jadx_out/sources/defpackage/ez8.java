package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ez8 extends p92 {
    public gz8 b;
    public s78 c;
    public p4d d;
    public /* synthetic */ Object e;
    public final /* synthetic */ gz8 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ez8(gz8 gz8Var, n92 n92Var) {
        super(n92Var);
        this.f = gz8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return gz8.t(this.f, null, null, this);
    }
}
