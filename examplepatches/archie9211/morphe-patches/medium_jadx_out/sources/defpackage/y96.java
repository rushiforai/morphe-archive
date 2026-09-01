package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class y96 {
    public static final y96 e = new y96(null, false);
    public final vl8 a;
    public final d68 b;
    public final boolean c;
    public final boolean d;

    public y96(vl8 vl8Var, d68 d68Var, boolean z, boolean z2) {
        this.a = vl8Var;
        this.b = d68Var;
        this.c = z;
        this.d = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y96)) {
            return false;
        }
        y96 y96Var = (y96) obj;
        return this.a == y96Var.a && this.b == y96Var.b && this.c == y96Var.c && this.d == y96Var.d;
    }

    public final int hashCode() {
        vl8 vl8Var = this.a;
        int iHashCode = (vl8Var == null ? 0 : vl8Var.hashCode()) * 31;
        d68 d68Var = this.b;
        return ((((iHashCode + (d68Var != null ? d68Var.hashCode() : 0)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("JavaTypeQualifiers(nullability=");
        sb.append(this.a);
        sb.append(", mutability=");
        sb.append(this.b);
        sb.append(", definitelyNotNull=");
        sb.append(this.c);
        sb.append(", isNullabilityQualifierForWarning=");
        return ev6.A(sb, this.d, ')');
    }

    public /* synthetic */ y96(vl8 vl8Var, boolean z) {
        this(vl8Var, null, z, false);
    }
}
