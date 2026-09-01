package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aa8 {
    public final wb8 a;
    public final boolean b;
    public final boolean c;
    public final Object d;

    public aa8(wb8 wb8Var, boolean z, Object obj, boolean z2) {
        if (!wb8Var.a && z) {
            ywb.g(wb8Var.b().concat(" does not allow nullable values"));
            throw null;
        }
        if (!z && z2 && obj == null) {
            rd6.v("Argument with type ", wb8Var.b(), " has null value but is not nullable.");
            throw null;
        }
        this.a = wb8Var;
        this.b = z;
        this.d = obj;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || aa8.class != obj.getClass()) {
            return false;
        }
        aa8 aa8Var = (aa8) obj;
        if (this.b != aa8Var.b || this.c != aa8Var.c || !this.a.equals(aa8Var.a)) {
            return false;
        }
        Object obj2 = aa8Var.d;
        Object obj3 = this.d;
        return obj3 != null ? obj3.equals(obj2) : obj2 == null;
    }

    public final int hashCode() {
        int iHashCode = ((((this.a.hashCode() * 31) + (this.b ? 1 : 0)) * 31) + (this.c ? 1 : 0)) * 31;
        Object obj = this.d;
        return iHashCode + (obj != null ? obj.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(n1b.a.b(aa8.class).j());
        sb.append(" Type: " + this.a);
        sb.append(" Nullable: " + this.b);
        if (this.c) {
            sb.append(" DefaultValue: " + this.d);
        }
        return sb.toString();
    }
}
