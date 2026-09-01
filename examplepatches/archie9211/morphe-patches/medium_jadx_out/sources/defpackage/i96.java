package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i96 {
    public static final i96 d = new i96(h5b.STRICT, 6);
    public final h5b a;
    public final tn6 b;
    public final h5b c;

    public i96(h5b h5bVar, int i) {
        this(h5bVar, (i & 2) != 0 ? new tn6(1, 0, 0) : null, h5bVar);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i96)) {
            return false;
        }
        i96 i96Var = (i96) obj;
        return this.a == i96Var.a && g76.L(this.b, i96Var.b) && this.c == i96Var.c;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        tn6 tn6Var = this.b;
        return this.c.hashCode() + ((iHashCode + (tn6Var == null ? 0 : tn6Var.d)) * 31);
    }

    public final String toString() {
        return "JavaNullabilityAnnotationsStatus(reportLevelBefore=" + this.a + ", sinceVersion=" + this.b + ", reportLevelAfter=" + this.c + ')';
    }

    public i96(h5b h5bVar, tn6 tn6Var, h5b h5bVar2) {
        h5bVar.getClass();
        h5bVar2.getClass();
        this.a = h5bVar;
        this.b = tn6Var;
        this.c = h5bVar2;
    }
}
