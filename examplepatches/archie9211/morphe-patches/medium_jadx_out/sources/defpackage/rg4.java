package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rg4 {
    public final long a;
    public final long b;
    public final long c;
    public final int d;
    public final long e;
    public final long f;
    public final long g;

    public rg4(long j, long j2, long j3, int i, long j4, long j5, long j6) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = i;
        this.e = j4;
        this.f = j5;
        this.g = j6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rg4)) {
            return false;
        }
        rg4 rg4Var = (rg4) obj;
        return this.a == rg4Var.a && this.b == rg4Var.b && this.c == rg4Var.c && this.d == rg4Var.d && this.e == rg4Var.e && this.f == rg4Var.f && this.g == rg4Var.g;
    }

    public final int hashCode() {
        long j = this.a;
        long j2 = this.b;
        int i = ((((int) (j ^ (j >>> 32))) * 31) + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        long j3 = this.c;
        int i2 = (((i + ((int) (j3 ^ (j3 >>> 32)))) * 31) + this.d) * 31;
        long j4 = this.e;
        int i3 = (i2 + ((int) (j4 ^ (j4 >>> 32)))) * 31;
        long j5 = this.f;
        int i4 = (i3 + ((int) (j5 ^ (j5 >>> 32)))) * 31;
        long j6 = this.g;
        return i4 + ((int) ((j6 >>> 32) ^ j6));
    }

    public final String toString() {
        StringBuilder sbD = b09.D("FilePersistenceConfig(recentDelayMs=", ", maxBatchSize=", this.a);
        sbD.append(this.b);
        wgd.y(sbD, ", maxItemSize=", this.c, ", maxItemsPerBatch=");
        sbD.append(this.d);
        sbD.append(", oldFileThreshold=");
        sbD.append(this.e);
        wgd.y(sbD, ", maxDiskSpace=", this.f, ", cleanupFrequencyThreshold=");
        return ev6.t(this.g, ")", sbD);
    }
}
