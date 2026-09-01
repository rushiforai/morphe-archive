package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xe1 {
    public final List a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;

    public xe1(List list, boolean z, boolean z2, boolean z3, boolean z4) {
        list.getClass();
        this.a = list;
        this.b = z;
        this.c = z2;
        this.d = z3;
        this.e = z4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xe1)) {
            return false;
        }
        xe1 xe1Var = (xe1) obj;
        return g76.L(this.a, xe1Var.a) && this.b == xe1Var.b && this.c == xe1Var.c && this.d == xe1Var.d && this.e == xe1Var.e;
    }

    public final int hashCode() {
        return (((((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbX = ka1.x("CatalogItems(items=", this.a, ", isRefreshing=", this.b, ", isInReorderMode=");
        ho2.R(sbX, this.c, ", isLoadingMore=", this.d, ", isSubmittingReorder=");
        return lv8.t(sbX, this.e, ")");
    }
}
