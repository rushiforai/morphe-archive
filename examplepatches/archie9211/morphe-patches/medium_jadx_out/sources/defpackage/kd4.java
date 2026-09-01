package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kd4 implements ld4 {
    public final List a;
    public final List b;
    public final List c;
    public final List d;
    public final List e;
    public final boolean f;

    public kd4(List list, List list2, List list3, List list4, List list5, boolean z) {
        this.a = list;
        this.b = list2;
        this.c = list3;
        this.d = list4;
        this.e = list5;
        this.f = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kd4)) {
            return false;
        }
        kd4 kd4Var = (kd4) obj;
        return this.a.equals(kd4Var.a) && this.b.equals(kd4Var.b) && this.c.equals(kd4Var.c) && this.d.equals(kd4Var.d) && this.e.equals(kd4Var.e) && this.f == kd4Var.f;
    }

    public final int hashCode() {
        return wgd.p(wgd.p(wgd.p(wgd.p(this.a.hashCode() * 31, 31, this.b), 31, this.c), 31, this.d), 31, this.e) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        return "Success(recommendedTags=" + this.a + ", trendingPosts=" + this.b + ", staffPicks=" + this.c + ", discoverPosts=" + this.d + ", whoToFollowNodes=" + this.e + ", isRefreshing=" + this.f + ")";
    }
}
