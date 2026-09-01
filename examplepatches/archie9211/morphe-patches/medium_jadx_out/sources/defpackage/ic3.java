package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ic3 {
    public final String a;
    public final long b;

    public ic3(String str, long j) {
        str.getClass();
        this.a = str;
        this.b = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ic3)) {
            return false;
        }
        ic3 ic3Var = (ic3) obj;
        return g76.L(this.a, ic3Var.a) && this.b == ic3Var.b;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return iHashCode + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, "DigestHistory(digestId=", this.a, ", createdAt=");
        sbI.append(")");
        return sbI.toString();
    }
}
