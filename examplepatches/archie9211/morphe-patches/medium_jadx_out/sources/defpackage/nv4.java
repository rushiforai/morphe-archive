package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nv4 {
    public final m40 a;

    public nv4(m40 m40Var) {
        m40Var.getClass();
        this.a = m40Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof nv4) && g76.L(this.a, ((nv4) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "CatalogActionEvent(catalogAction=" + this.a + ")";
    }
}
