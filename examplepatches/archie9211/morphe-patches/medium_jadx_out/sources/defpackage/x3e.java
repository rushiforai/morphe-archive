package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x3e implements y3e {
    public final Long a;
    public final Long b;
    public final List c;
    public final boolean d;
    public final boolean e;

    public x3e(Long l, Long l2, List list, boolean z, boolean z2) {
        list.getClass();
        this.a = l;
        this.b = l2;
        this.c = list;
        this.d = z;
        this.e = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x3e)) {
            return false;
        }
        x3e x3eVar = (x3e) obj;
        return g76.L(this.a, x3eVar.a) && g76.L(this.b, x3eVar.b) && g76.L(this.c, x3eVar.c) && this.d == x3eVar.d && this.e == x3eVar.e;
    }

    public final int hashCode() {
        Long l = this.a;
        int iHashCode = (l == null ? 0 : l.hashCode()) * 31;
        Long l2 = this.b;
        return ((wgd.p((iHashCode + (l2 != null ? l2.hashCode() : 0)) * 31, 31, this.c) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Main(clapCount=");
        sb.append(this.a);
        sb.append(", votersCount=");
        sb.append(this.b);
        sb.append(", items=");
        sb.append(this.c);
        sb.append(", isLoadingMore=");
        sb.append(this.d);
        sb.append(", isRefreshing=");
        return lv8.t(sb, this.e, ")");
    }
}
