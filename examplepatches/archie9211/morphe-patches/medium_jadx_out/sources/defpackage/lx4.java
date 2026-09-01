package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lx4 implements px4 {
    public final List a;
    public final boolean b;
    public final boolean c;

    public lx4(List list, boolean z, boolean z2) {
        list.getClass();
        this.a = list;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lx4)) {
            return false;
        }
        lx4 lx4Var = (lx4) obj;
        return g76.L(this.a, lx4Var.a) && this.b == lx4Var.b && this.c == lx4Var.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(ka1.x("Content(uiModels=", this.a, ", isRefreshing=", this.b, ", isLoadingMore="), this.c, ")");
    }
}
