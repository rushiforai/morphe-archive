package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class q8b {
    public final String a;
    public final g08 b;
    public final boolean c;
    public final String d;

    public q8b(String str, g08 g08Var, String str2, boolean z) {
        str.getClass();
        this.a = str;
        this.b = g08Var;
        this.c = z;
        this.d = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q8b)) {
            return false;
        }
        q8b q8bVar = (q8b) obj;
        return g76.L(this.a, q8bVar.a) && this.b.equals(q8bVar.b) && this.c == q8bVar.c && g76.L(this.d, q8bVar.d);
    }

    public final int hashCode() {
        int iHashCode = (((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237)) * 31;
        String str = this.d;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "RepostMenuUiModel(postId=" + this.a + ", metricsContext=" + this.b + ", isReposted=" + this.c + ", repostNote=" + this.d + ")";
    }
}
