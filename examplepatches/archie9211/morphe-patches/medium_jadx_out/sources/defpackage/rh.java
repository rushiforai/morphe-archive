package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rh implements uh {
    public final List a;
    public final boolean b;
    public final boolean c;

    public rh(List list, boolean z, boolean z2) {
        list.getClass();
        this.a = list;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rh)) {
            return false;
        }
        rh rhVar = (rh) obj;
        return g76.L(this.a, rhVar.a) && this.b == rhVar.b && this.c == rhVar.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(ka1.x("Data(items=", this.a, ", isRefreshing=", this.b, ", isLoadingMore="), this.c, ")");
    }
}
