package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w40 {
    public final v92 a;
    public final t92 b;

    public w40(v92 v92Var, t92 t92Var) {
        t92Var.getClass();
        this.a = v92Var;
        this.b = t92Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w40)) {
            return false;
        }
        w40 w40Var = (w40) obj;
        return this.a == w40Var.a && this.b == w40Var.b;
    }

    public final int hashCode() {
        v92 v92Var = this.a;
        return this.b.hashCode() + ((v92Var == null ? 0 : v92Var.hashCode()) * 31);
    }

    public final String toString() {
        return "SectionCustomEventFieldMapping(section=" + this.a + ", field=" + this.b + ')';
    }
}
