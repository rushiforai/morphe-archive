package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w52 {
    public final Object a;
    public final int b;
    public final i52 c;

    public w52(Object obj, int i, i52 i52Var) {
        this.a = obj;
        this.b = i;
        this.c = i52Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w52)) {
            return false;
        }
        w52 w52Var = (w52) obj;
        return this.a.equals(w52Var.a) && this.b == w52Var.b && this.c.equals(w52Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + this.b) * 31);
    }

    public final String toString() {
        return "VerticalAnchor(id=" + this.a + ", index=" + this.b + ", reference=" + this.c + ')';
    }
}
