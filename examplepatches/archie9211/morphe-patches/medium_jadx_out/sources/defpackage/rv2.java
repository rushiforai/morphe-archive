package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rv2 {
    public final long a;
    public final boolean b;

    public rv2(long j, boolean z) {
        this.a = j;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rv2)) {
            return false;
        }
        rv2 rv2Var = (rv2) obj;
        return this.a == rv2Var.a && this.b == rv2Var.b;
    }

    public final int hashCode() {
        long j = this.a;
        return (((int) (j ^ (j >>> 32))) * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "SelectableTime(timeInMillis=" + this.a + ", isSelected=" + this.b + ")";
    }
}
