package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yd8 extends p92 {
    public rya b;
    public rya c;
    public /* synthetic */ Object d;
    public final /* synthetic */ be8 e;
    public int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yd8(be8 be8Var, p92 p92Var) {
        super(p92Var);
        this.e = be8Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.d = obj;
        this.f |= Integer.MIN_VALUE;
        return this.e.a(this);
    }
}
