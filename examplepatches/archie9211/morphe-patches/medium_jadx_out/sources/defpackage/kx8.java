package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kx8 {
    public final Long a;
    public final Long b;
    public final long c;
    public final long d;
    public final Float e;
    public final Float f;
    public final String g;
    public final long h;
    public final long i;
    public final long j;
    public final long k;
    public final long l;
    public final long m;
    public final jx8 n;

    public kx8(Long l, Long l2, long j, long j2, Float f, Float f2, String str, long j3, long j4, long j5, long j6, long j7, long j8, jx8 jx8Var) {
        jx8Var.getClass();
        this.a = l;
        this.b = l2;
        this.c = j;
        this.d = j2;
        this.e = f;
        this.f = f2;
        this.g = str;
        this.h = j3;
        this.i = j4;
        this.j = j5;
        this.k = j6;
        this.l = j7;
        this.m = j8;
        this.n = jx8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kx8)) {
            return false;
        }
        kx8 kx8Var = (kx8) obj;
        return g76.L(this.a, kx8Var.a) && g76.L(this.b, kx8Var.b) && this.c == kx8Var.c && this.d == kx8Var.d && g76.L(this.e, kx8Var.e) && g76.L(this.f, kx8Var.f) && g76.L(this.g, kx8Var.g) && this.h == kx8Var.h && this.i == kx8Var.i && this.j == kx8Var.j && this.k == kx8Var.k && this.l == kx8Var.l && this.m == kx8Var.m && this.n == kx8Var.n;
    }

    public final int hashCode() {
        Long l = this.a;
        int iHashCode = (l == null ? 0 : l.hashCode()) * 31;
        Long l2 = this.b;
        int iHashCode2 = (iHashCode + (l2 == null ? 0 : l2.hashCode())) * 31;
        long j = this.c;
        int i = (iHashCode2 + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.d;
        int i2 = (i + ((int) (j2 ^ (j2 >>> 32)))) * 31;
        Float f = this.e;
        int iHashCode3 = (i2 + (f == null ? 0 : f.hashCode())) * 31;
        Float f2 = this.f;
        int iHashCode4 = (iHashCode3 + (f2 == null ? 0 : f2.hashCode())) * 31;
        String str = this.g;
        int iHashCode5 = str != null ? str.hashCode() : 0;
        long j3 = this.h;
        int i3 = (((iHashCode4 + iHashCode5) * 31) + ((int) (j3 ^ (j3 >>> 32)))) * 31;
        long j4 = this.i;
        int i4 = (i3 + ((int) (j4 ^ (j4 >>> 32)))) * 31;
        long j5 = this.j;
        int i5 = (i4 + ((int) (j5 ^ (j5 >>> 32)))) * 31;
        long j6 = this.k;
        int i6 = (i5 + ((int) (j6 ^ (j6 >>> 32)))) * 31;
        long j7 = this.l;
        int i7 = (i6 + ((int) (j7 ^ (j7 >>> 32)))) * 31;
        long j8 = this.m;
        return this.n.hashCode() + ((i7 + ((int) (j8 ^ (j8 >>> 32)))) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("OverviewStatsUiModel(from=");
        sb.append(this.a);
        sb.append(", presentations=");
        sb.append(this.b);
        sb.append(", views=");
        sb.append(this.c);
        wgd.y(sb, ", reads=", this.d, ", readsRatio=");
        sb.append(this.e);
        sb.append(", viewsRatio=");
        sb.append(this.f);
        sb.append(", totalEarnings=");
        sb.append(this.g);
        sb.append(", followersGained=");
        sb.append(this.h);
        wgd.y(sb, ", followersLost=", this.i, ", netFollowerCount=");
        sb.append(this.j);
        wgd.y(sb, ", subscribersGained=", this.k, ", subscribersLost=");
        sb.append(this.l);
        wgd.y(sb, ", netSubscriberCount=", this.m, ", updateFrequency=");
        sb.append(this.n);
        sb.append(")");
        return sb.toString();
    }
}
