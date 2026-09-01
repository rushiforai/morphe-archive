package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a9d extends p92 {
    public ok7 b;
    public e9d c;
    public /* synthetic */ Object d;
    public final /* synthetic */ z46 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a9d(z46 z46Var, n92 n92Var) {
        super(n92Var);
        this.e = z46Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.p(null, null, null, null, this);
    }
}
