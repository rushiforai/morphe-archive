package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x40 {
    public final v92 a;
    public final w92 b;

    public x40(v92 v92Var, w92 w92Var) {
        v92Var.getClass();
        this.a = v92Var;
        this.b = w92Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x40)) {
            return false;
        }
        x40 x40Var = (x40) obj;
        return this.a == x40Var.a && this.b == x40Var.b;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        w92 w92Var = this.b;
        return iHashCode + (w92Var == null ? 0 : w92Var.hashCode());
    }

    public final String toString() {
        return "SectionFieldMapping(section=" + this.a + ", field=" + this.b + ')';
    }
}
