package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zi0 extends jd2 {
    public final id2 a;
    public final String b;
    public final String c;
    public final long d;

    public zi0(aj0 aj0Var, String str, String str2, long j) {
        this.a = aj0Var;
        this.b = str;
        this.c = str2;
        this.d = j;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof jd2) {
            zi0 zi0Var = (zi0) ((jd2) obj);
            if (this.a.equals(zi0Var.a) && this.b.equals(zi0Var.b) && this.c.equals(zi0Var.c) && this.d == zi0Var.d) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (((((this.a.hashCode() ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003) ^ this.c.hashCode()) * 1000003;
        long j = this.d;
        return ((int) (j ^ (j >>> 32))) ^ iHashCode;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("RolloutAssignment{rolloutVariant=");
        sb.append(this.a);
        sb.append(", parameterKey=");
        sb.append(this.b);
        sb.append(", parameterValue=");
        sb.append(this.c);
        sb.append(", templateVersion=");
        return ev6.t(this.d, "}", sb);
    }
}
