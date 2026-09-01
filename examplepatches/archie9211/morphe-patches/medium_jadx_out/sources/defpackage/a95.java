package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a95 {
    public final int a;
    public final int b;
    public final long c;

    public a95(int i, int i2, long j) {
        this.a = i;
        this.b = i2;
        this.c = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a95)) {
            return false;
        }
        a95 a95Var = (a95) obj;
        return this.a == a95Var.a && this.b == a95Var.b && this.c == a95Var.c;
    }

    public final int hashCode() {
        int i = ((this.a * 31) + this.b) * 31;
        long j = this.c;
        return i + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        return ev6.t(this.c, ")", ev6.B(this.a, this.b, "Timeseries(followersTotal=", ", subscribersTotal=", ", collectedAt="));
    }
}
