package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kb9 {
    public final Float a;
    public final long b;
    public final Float c;

    public kb9(Float f, long j, Float f2) {
        this.a = f;
        this.b = j;
        this.c = f2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kb9)) {
            return false;
        }
        kb9 kb9Var = (kb9) obj;
        return g76.L(this.a, kb9Var.a) && this.b == kb9Var.b && g76.L(this.c, kb9Var.c);
    }

    public final int hashCode() {
        Float f = this.a;
        int iHashCode = f == null ? 0 : f.hashCode();
        long j = this.b;
        int i = ((iHashCode * 31) + ((int) (j ^ (j >>> 32)))) * 31;
        Float f2 = this.c;
        return i + (f2 != null ? f2.hashCode() : 0);
    }

    public final String toString() {
        return "PointData(frontPoint=" + this.a + ", timestamp=" + this.b + ", backPoint=" + this.c + ")";
    }
}
