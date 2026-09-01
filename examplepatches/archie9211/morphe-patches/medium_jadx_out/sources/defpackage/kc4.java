package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kc4 implements nc4 {
    public final String a;
    public final int b;
    public final int c;
    public final boolean d;
    public final long e;
    public final Long f;
    public final ec4 g;
    public final jc4 h;

    public kc4(String str, int i, int i2, boolean z, long j, Long l, ec4 ec4Var, jc4 jc4Var) {
        str.getClass();
        ec4Var.getClass();
        this.a = str;
        this.b = i;
        this.c = i2;
        this.d = z;
        this.e = j;
        this.f = l;
        this.g = ec4Var;
        this.h = jc4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kc4)) {
            return false;
        }
        kc4 kc4Var = (kc4) obj;
        return g76.L(this.a, kc4Var.a) && this.b == kc4Var.b && this.c == kc4Var.c && this.d == kc4Var.d && this.e == kc4Var.e && g76.L(this.f, kc4Var.f) && this.g == kc4Var.g && this.h.equals(kc4Var.h);
    }

    public final int hashCode() {
        int iHashCode = ((((this.a.hashCode() * 31) + this.b) * 31) + this.c) * 31;
        int i = this.d ? 1231 : 1237;
        long j = this.e;
        int i2 = (((iHashCode + i) * 31) + ((int) (j ^ (j >>> 32)))) * 31;
        Long l = this.f;
        return this.h.hashCode() + ((this.g.hashCode() + ((i2 + (l == null ? 0 : l.hashCode())) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbT = y30.t(this.b, "Content(publicationName=", this.a, ", availableFeaturingToken=", ", featuringTokenCapacity=");
        sbT.append(this.c);
        sbT.append(", hasReachedMaxNumberOfFeaturedToken=");
        sbT.append(this.d);
        sbT.append(", featuringTokenRefillInterval=");
        sbT.append(this.e);
        sbT.append(", nextFeaturingTokenRefillTimestamp=");
        sbT.append(this.f);
        sbT.append(", selectedSort=");
        sbT.append(this.g);
        sbT.append(", featuredPostsState=");
        sbT.append(this.h);
        sbT.append(")");
        return sbT.toString();
    }
}
