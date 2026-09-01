package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wm1 implements xm1 {
    public final long a;
    public final int b;

    public wm1(int i, long j) {
        this.a = j;
        this.b = i;
    }

    @Override // defpackage.xm1
    public final long a() {
        return this.a;
    }

    @Override // defpackage.xm1
    public final int b() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wm1)) {
            return false;
        }
        wm1 wm1Var = (wm1) obj;
        return this.a == wm1Var.a && this.b == wm1Var.b;
    }

    public final int hashCode() {
        long j = this.a;
        return (((int) (j ^ (j >>> 32))) * 31) + this.b;
    }

    public final String toString() {
        return "Unclappable(totalClapCount=" + this.a + ", currentUserClapCount=" + this.b + ")";
    }
}
