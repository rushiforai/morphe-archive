package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oz8 implements qz8 {
    public final List a;
    public final boolean b;
    public final boolean c;
    public final boolean d;

    public oz8(List list, boolean z, boolean z2, boolean z3) {
        list.getClass();
        this.a = list;
        this.b = z;
        this.c = z2;
        this.d = z3;
    }

    public static oz8 a(oz8 oz8Var, ArrayList arrayList) {
        return new oz8(arrayList, oz8Var.b, oz8Var.c, oz8Var.d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof oz8)) {
            return false;
        }
        oz8 oz8Var = (oz8) obj;
        return g76.L(this.a, oz8Var.a) && this.b == oz8Var.b && this.c == oz8Var.c && this.d == oz8Var.d;
    }

    public final int hashCode() {
        return (((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return b09.C(ka1.x("Items(items=", this.a, ", hasMore=", this.b, ", isLoadingMore="), this.c, ", isRefreshing=", this.d, ")");
    }
}
