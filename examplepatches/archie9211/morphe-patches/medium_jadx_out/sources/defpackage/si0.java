package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class si0 extends bd2 {
    public final long a;
    public final String b;
    public final String c;
    public final long d;
    public final int e;

    public si0(long j, String str, String str2, long j2, int i) {
        this.a = j;
        this.b = str;
        this.c = str2;
        this.d = j2;
        this.e = i;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof bd2) {
            si0 si0Var = (si0) ((bd2) obj);
            if (this.a == si0Var.a && this.b.equals(si0Var.b)) {
                String str = si0Var.c;
                String str2 = this.c;
                if (str2 != null ? str2.equals(str) : str == null) {
                    if (this.d == si0Var.d && this.e == si0Var.e) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        int iHashCode = (((((int) (j ^ (j >>> 32))) ^ 1000003) * 1000003) ^ this.b.hashCode()) * 1000003;
        String str = this.c;
        int iHashCode2 = (iHashCode ^ (str == null ? 0 : str.hashCode())) * 1000003;
        long j2 = this.d;
        return this.e ^ ((iHashCode2 ^ ((int) (j2 ^ (j2 >>> 32)))) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Frame{pc=");
        sb.append(this.a);
        sb.append(", symbol=");
        sb.append(this.b);
        sb.append(", file=");
        sb.append(this.c);
        sb.append(", offset=");
        sb.append(this.d);
        sb.append(", importance=");
        return ho2.H(sb, this.e, "}");
    }
}
