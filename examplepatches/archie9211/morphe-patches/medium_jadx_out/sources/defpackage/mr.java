package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mr extends co6 implements x45 {
    public final /* synthetic */ dd9 a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ hd9 c;
    public final /* synthetic */ String d;
    public final /* synthetic */ ip6 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mr(dd9 dd9Var, m45 m45Var, hd9 hd9Var, String str, ip6 ip6Var) {
        super(1);
        this.a = dd9Var;
        this.b = m45Var;
        this.c = hd9Var;
        this.d = str;
        this.e = ip6Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        dd9 dd9Var = this.a;
        dd9Var.p.addView(dd9Var, dd9Var.q);
        dd9Var.n(this.b, this.c, this.d, this.e);
        return new u7(2, dd9Var);
    }
}
