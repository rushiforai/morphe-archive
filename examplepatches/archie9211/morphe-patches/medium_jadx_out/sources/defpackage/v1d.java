package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class v1d implements y1d {
    public final g01 a;

    public v1d(g01 g01Var) {
        g01Var.getClass();
        this.a = g01Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v1d) && g76.L(this.a, ((v1d) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "CollectionActionEvent(collectionAction=" + this.a + ")";
    }
}
