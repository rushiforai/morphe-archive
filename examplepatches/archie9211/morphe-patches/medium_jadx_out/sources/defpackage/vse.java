package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vse {
    public final long a;
    public final long b;
    public final int c;

    public vse(long j, long j2, int i) {
        this.a = j;
        this.b = j2;
        this.c = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vse)) {
            return false;
        }
        vse vseVar = (vse) obj;
        return this.a == vseVar.a && this.b == vseVar.b && this.c == vseVar.c;
    }

    public final int hashCode() {
        long j = this.a;
        int i = ((int) (j ^ (j >>> 32))) * 31;
        long j2 = this.b;
        return ((i + ((int) ((j2 >>> 32) ^ j2))) * 31) + this.c;
    }

    public final String toString() {
        StringBuilder sbD = b09.D("VerticalBarChartPointData(frontPoint=", ", backPoint=", this.a);
        sbD.append(this.b);
        sbD.append(", labelResId=");
        sbD.append(this.c);
        sbD.append(")");
        return sbD.toString();
    }
}
