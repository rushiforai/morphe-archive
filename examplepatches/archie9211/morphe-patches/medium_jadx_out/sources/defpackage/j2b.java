package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j2b implements l2b {
    public final Object a;
    public final boolean b;

    public j2b(Object obj, boolean z) {
        this.a = obj;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j2b)) {
            return false;
        }
        j2b j2bVar = (j2b) obj;
        return g76.L(this.a, j2bVar.a) && this.b == j2bVar.b;
    }

    public final int hashCode() {
        Object obj = this.a;
        return ((obj == null ? 0 : obj.hashCode()) * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Item(data=" + this.a + ", isRefreshing=" + this.b + ")";
    }
}
