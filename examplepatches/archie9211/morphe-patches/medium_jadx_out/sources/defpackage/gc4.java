package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gc4 implements jc4 {
    public final az5 a;
    public final boolean b;

    public gc4(az5 az5Var, boolean z) {
        az5Var.getClass();
        this.a = az5Var;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gc4)) {
            return false;
        }
        gc4 gc4Var = (gc4) obj;
        return g76.L(this.a, gc4Var.a) && this.b == gc4Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "FeaturedPosts(posts=" + this.a + ", isLoadingMore=" + this.b + ")";
    }
}
