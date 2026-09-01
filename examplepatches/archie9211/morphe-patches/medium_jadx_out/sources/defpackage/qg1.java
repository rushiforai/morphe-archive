package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qg1 {
    public final boolean a;
    public final Boolean b;
    public final boolean c;
    public final boolean d;
    public final eg1 e;

    public qg1(boolean z, Boolean bool, boolean z2, boolean z3, eg1 eg1Var) {
        this.a = z;
        this.b = bool;
        this.c = z2;
        this.d = z3;
        this.e = eg1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qg1)) {
            return false;
        }
        qg1 qg1Var = (qg1) obj;
        return this.a == qg1Var.a && g76.L(this.b, qg1Var.b) && this.c == qg1Var.c && this.d == qg1Var.d && g76.L(this.e, qg1Var.e);
    }

    public final int hashCode() {
        int i = (this.a ? 1231 : 1237) * 31;
        Boolean bool = this.b;
        int iHashCode = (((((i + (bool == null ? 0 : bool.hashCode())) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31;
        eg1 eg1Var = this.e;
        return iHashCode + (eg1Var != null ? eg1Var.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MenuOptions(canEditInfo=");
        sb.append(this.a);
        sb.append(", isCatalogPublic=");
        sb.append(this.b);
        sb.append(", canBeReported=");
        ho2.R(sb, this.c, ", canBeDeleted=", this.d, ", catalogShareData=");
        sb.append(this.e);
        sb.append(")");
        return sb.toString();
    }
}
