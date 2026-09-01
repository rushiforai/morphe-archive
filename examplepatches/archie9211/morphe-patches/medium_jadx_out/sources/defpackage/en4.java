package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class en4 {
    public final float a;
    public final float b;
    public final long c;

    public en4(float f, float f2, long j) {
        this.a = f;
        this.b = f2;
        this.c = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof en4)) {
            return false;
        }
        en4 en4Var = (en4) obj;
        return Float.compare(this.a, en4Var.a) == 0 && Float.compare(this.b, en4Var.b) == 0 && this.c == en4Var.c;
    }

    public final int hashCode() {
        int iP = km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31);
        long j = this.c;
        return iP + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        return "FlingInfo(initialVelocity=" + this.a + ", distance=" + this.b + ", duration=" + this.c + ')';
    }
}
