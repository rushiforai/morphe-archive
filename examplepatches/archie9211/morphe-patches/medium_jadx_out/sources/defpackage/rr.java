package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rr extends co6 implements b55 {
    public final /* synthetic */ gd9 a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ hd9 c;
    public final /* synthetic */ mz1 d;
    public final /* synthetic */ int e;
    public final /* synthetic */ int f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rr(gd9 gd9Var, m45 m45Var, hd9 hd9Var, mz1 mz1Var, int i, int i2) {
        super(2);
        this.a = gd9Var;
        this.b = m45Var;
        this.c = hd9Var;
        this.d = mz1Var;
        this.e = i;
        this.f = i2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        tr.a(this.a, this.b, this.c, this.d, (x12) obj, tr7.y(this.e | 1), this.f);
        return c1e.a;
    }
}
