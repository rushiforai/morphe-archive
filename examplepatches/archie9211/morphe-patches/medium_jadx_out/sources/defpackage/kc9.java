package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kc9 extends p92 {
    public long b;
    public m45 c;
    public rya d;
    public /* synthetic */ Object e;
    public final /* synthetic */ lc9 f;
    public int g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kc9(lc9 lc9Var, p92 p92Var) {
        super(p92Var);
        this.f = lc9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.e = obj;
        this.g |= Integer.MIN_VALUE;
        return this.f.b(0L, null, this);
    }
}
