package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rv6 extends zv2 {
    public static final /* synthetic */ fj6[] i;
    public final c38 d;
    public final y05 e;
    public final u67 f;
    public final u67 g;
    public final tv6 h;

    static {
        u4a u4aVar = new u4a(rv6.class, "fragments", "getFragments()Ljava/util/List;", 0);
        s1b s1bVar = n1b.a;
        i = new fj6[]{s1bVar.g(u4aVar), km4.t(rv6.class, "empty", "getEmpty()Z", 0, s1bVar)};
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public rv6(c38 c38Var, y05 y05Var, x67 x67Var) {
        x67Var.getClass();
        ky kyVar = cd7.e;
        z05 z05Var = y05Var.a;
        super(kyVar, z05Var.c() ? z05.e : z05Var.g());
        this.d = c38Var;
        this.e = y05Var;
        this.f = new u67(x67Var, new qv6(this, 0));
        this.g = new u67(x67Var, new qv6(this, 1));
        this.h = new tv6(x67Var, new qv6(this, 2));
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.x(this, obj);
    }

    public final boolean equals(Object obj) {
        rv6 rv6Var = obj instanceof rv6 ? (rv6) obj : null;
        return rv6Var != null && g76.L(this.e, rv6Var.e) && g76.L(this.d, rv6Var.d);
    }

    @Override // defpackage.yv2
    public final yv2 h() {
        y05 y05Var = this.e;
        if (y05Var.a.c()) {
            return null;
        }
        return this.d.X(y05Var.b());
    }

    public final int hashCode() {
        return this.e.hashCode() + (this.d.hashCode() * 31);
    }
}
