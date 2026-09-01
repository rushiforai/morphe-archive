package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f9e implements k9e {
    public final List a;
    public final boolean b;
    public final boolean c;
    public final boolean d;

    public f9e(List list, boolean z, boolean z2, boolean z3) {
        list.getClass();
        this.a = list;
        this.b = z;
        this.c = z2;
        this.d = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f9e)) {
            return false;
        }
        f9e f9eVar = (f9e) obj;
        return g76.L(this.a, f9eVar.a) && this.b == f9eVar.b && this.c == f9eVar.c && this.d == f9eVar.d;
    }

    public final int hashCode() {
        return (((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return b09.C(ka1.x("Content(items=", this.a, ", isLoadingMore=", this.b, ", isRefreshing="), this.c, ", hasMore=", this.d, ")");
    }
}
