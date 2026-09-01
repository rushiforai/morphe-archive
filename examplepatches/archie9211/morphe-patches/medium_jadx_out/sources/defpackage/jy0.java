package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jy0 implements hy0 {
    public final m73 a;
    public final long b;

    public jy0(lvc lvcVar, long j) {
        this.a = lvcVar;
        this.b = j;
    }

    @Override // defpackage.hy0
    public final r28 a(r28 r28Var, ar0 ar0Var) {
        return r28Var.b(new by0(ar0Var, false));
    }

    public final float b() {
        long j = this.b;
        if (!f72.d(j)) {
            return Float.POSITIVE_INFINITY;
        }
        return this.a.N(f72.h(j));
    }

    public final r28 c(r28 r28Var) {
        return new by0(z46.h, true);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jy0)) {
            return false;
        }
        jy0 jy0Var = (jy0) obj;
        return g76.L(this.a, jy0Var.a) && f72.b(this.b, jy0Var.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return ((int) (j ^ (j >>> 32))) + iHashCode;
    }

    public final String toString() {
        return "BoxWithConstraintsScopeImpl(density=" + this.a + ", constraints=" + ((Object) f72.l(this.b)) + ')';
    }
}
