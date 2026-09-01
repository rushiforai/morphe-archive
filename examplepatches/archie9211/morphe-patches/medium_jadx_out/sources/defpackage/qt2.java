package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qt2 {
    public long a;
    public float b;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qt2)) {
            return false;
        }
        qt2 qt2Var = (qt2) obj;
        return this.a == qt2Var.a && Float.compare(this.b, qt2Var.b) == 0;
    }

    public final int hashCode() {
        long j = this.a;
        return Float.floatToIntBits(this.b) + (((int) (j ^ (j >>> 32))) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("DataPointAtTime(time=");
        sb.append(this.a);
        sb.append(", dataPoint=");
        return lv8.s(sb, this.b, ')');
    }
}
