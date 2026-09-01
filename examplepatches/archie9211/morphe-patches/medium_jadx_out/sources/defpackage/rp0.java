package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rp0 {
    public final long a;
    public final long b;

    public rp0(long j, long j2) {
        this.a = j;
        this.b = j2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rp0)) {
            return false;
        }
        rp0 rp0Var = (rp0) obj;
        return this.a == rp0Var.a && this.b == rp0Var.b;
    }

    public final int hashCode() {
        long j = this.a;
        int i = ((int) (j ^ (j >>> 32))) * 31;
        long j2 = this.b;
        return i + ((int) ((j2 >>> 32) ^ j2));
    }

    public final String toString() {
        return ev6.t(this.b, ")", b09.D("BatchClosedMetadata(lastTimeWasUsedInMs=", ", eventsCount=", this.a));
    }
}
