package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v52 {
    public final Object a;
    public final int b;
    public final pq6 c;

    public v52(Object obj, int i, pq6 pq6Var) {
        this.a = obj;
        this.b = i;
        this.c = pq6Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v52)) {
            return false;
        }
        v52 v52Var = (v52) obj;
        return this.a.equals(v52Var.a) && this.b == v52Var.b && this.c.equals(v52Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + this.b) * 31);
    }

    public final String toString() {
        return "HorizontalAnchor(id=" + this.a + ", index=" + this.b + ", reference=" + this.c + ')';
    }
}
