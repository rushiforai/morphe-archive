package j$.util;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class a0 {
    public static final a0 c = new a0();
    public final boolean a;
    public final long b;

    public a0() {
        this.a = false;
        this.b = 0L;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a0)) {
            return false;
        }
        a0 a0Var = (a0) obj;
        boolean z = a0Var.a;
        boolean z2 = this.a;
        return (z2 && z) ? this.b == a0Var.b : z2 == z;
    }

    public final int hashCode() {
        if (!this.a) {
            return 0;
        }
        long j = this.b;
        return (int) (j ^ (j >>> 32));
    }

    public final String toString() {
        if (!this.a) {
            return "OptionalLong.empty";
        }
        return "OptionalLong[" + this.b + "]";
    }

    public a0(long j) {
        this.a = true;
        this.b = j;
    }
}
