package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hn6 implements u93 {
    public final h1b a;

    public hn6(h1b h1bVar, tx9 tx9Var, t93 t93Var) {
        t93Var.getClass();
        this.a = h1bVar;
    }

    @Override // defpackage.u93
    public final String A() {
        return ev6.z(new StringBuilder("Class '"), e0b.a(this.a.a).a().a.a, '\'');
    }

    public final String toString() {
        return hn6.class.getSimpleName() + ": " + this.a;
    }
}
