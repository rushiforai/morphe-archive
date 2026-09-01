package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hd4 {
    public final ArrayList a;
    public final ArrayList b;
    public final ArrayList c;
    public final ArrayList d;
    public final ArrayList e;

    public hd4(ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, ArrayList arrayList4, ArrayList arrayList5) {
        this.a = arrayList;
        this.b = arrayList2;
        this.c = arrayList3;
        this.d = arrayList4;
        this.e = arrayList5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hd4)) {
            return false;
        }
        hd4 hd4Var = (hd4) obj;
        return this.a.equals(hd4Var.a) && this.b.equals(hd4Var.b) && this.c.equals(hd4Var.c) && this.d.equals(hd4Var.d) && this.e.equals(hd4Var.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + b09.p(this.d, b09.p(this.c, b09.p(this.b, this.a.hashCode() * 31, 31), 31), 31);
    }

    public final String toString() {
        return "ExploreData(recommendedTags=" + this.a + ", trendingPosts=" + this.b + ", staffPicks=" + this.c + ", discoverPosts=" + this.d + ", whoToFollowNodes=" + this.e + ")";
    }
}
