package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cz8 extends p92 {
    public int b;
    public wlc c;
    public /* synthetic */ Object d;
    public final /* synthetic */ gz8 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cz8(gz8 gz8Var, n92 n92Var) {
        super(n92Var);
        this.e = gz8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.f(0, null, this);
    }
}
