package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mg {
    public final g01 a;

    public mg(g01 g01Var) {
        g01Var.getClass();
        this.a = g01Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof mg) && g76.L(this.a, ((mg) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "CollectionActionEvent(collectionAction=" + this.a + ")";
    }
}
