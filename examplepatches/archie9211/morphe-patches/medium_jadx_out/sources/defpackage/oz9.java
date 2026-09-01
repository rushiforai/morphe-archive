package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oz9 extends p92 {
    public String b;
    public bp3 c;
    public /* synthetic */ Object d;
    public final /* synthetic */ gg5 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public oz9(gg5 gg5Var, p92 p92Var) {
        super(p92Var);
        this.e = gg5Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.H(null, null, null, null, this);
    }
}
