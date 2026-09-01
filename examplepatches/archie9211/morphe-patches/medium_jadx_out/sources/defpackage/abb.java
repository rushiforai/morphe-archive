package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class abb implements bbb {
    public final Integer a;
    public final List b;
    public final boolean c;
    public final boolean d;

    public abb(Integer num, List list, boolean z, boolean z2) {
        this.a = num;
        this.b = list;
        this.c = z;
        this.d = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof abb)) {
            return false;
        }
        abb abbVar = (abb) obj;
        return g76.L(this.a, abbVar.a) && this.b.equals(abbVar.b) && this.c == abbVar.c && this.d == abbVar.d;
    }

    public final int hashCode() {
        Integer num = this.a;
        return ((wgd.p((num == null ? 0 : num.hashCode()) * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Main(repostCount=");
        sb.append(this.a);
        sb.append(", items=");
        sb.append(this.b);
        sb.append(", isLoadingMore=");
        return b09.C(sb, this.c, ", isRefreshing=", this.d, ")");
    }
}
