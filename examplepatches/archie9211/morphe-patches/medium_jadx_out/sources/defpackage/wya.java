package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wya extends zya {
    public final g01 a;

    public wya(g01 g01Var) {
        g01Var.getClass();
        this.a = g01Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof wya) && g76.L(this.a, ((wya) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "CollectionActionEvent(collectionAction=" + this.a + ")";
    }
}
