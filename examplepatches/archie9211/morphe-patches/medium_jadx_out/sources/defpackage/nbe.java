package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nbe extends p92 {
    public g8e b;
    public obe c;
    public /* synthetic */ Object d;
    public final /* synthetic */ no3 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nbe(no3 no3Var, n92 n92Var) {
        super(n92Var);
        this.e = no3Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.x0(null, null, null, null, this);
    }
}
