package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qc3 {
    public final String a;
    public final long b;
    public final boolean c;

    public qc3(long j, String str, boolean z) {
        str.getClass();
        this.a = str;
        this.b = j;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qc3)) {
            return false;
        }
        qc3 qc3Var = (qc3) obj;
        return g76.L(this.a, qc3Var.a) && this.b == qc3Var.b && this.c == qc3Var.c;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return ((iHashCode + ((int) (j ^ (j >>> 32)))) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, "DigestHistoryUiModel(digestId=", this.a, ", createdAt=");
        sbI.append(", isSelected=");
        sbI.append(this.c);
        sbI.append(")");
        return sbI.toString();
    }
}
