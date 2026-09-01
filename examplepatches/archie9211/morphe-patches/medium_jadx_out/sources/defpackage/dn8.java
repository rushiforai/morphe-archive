package defpackage;

import androidx.recyclerview.widget.RecyclerView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dn8 {
    public final gy6 a;
    public final RecyclerView b;
    public final long c;
    public final int d;
    public final int e;

    public dn8(gy6 gy6Var, RecyclerView recyclerView, long j, int i, int i2) {
        this.a = gy6Var;
        this.b = recyclerView;
        this.c = j;
        this.d = i;
        this.e = i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof dn8) {
            dn8 dn8Var = (dn8) obj;
            if (this.a == dn8Var.a && this.b.equals(dn8Var.b) && this.c == dn8Var.c && this.d == dn8Var.d && this.e == dn8Var.e) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        long j = this.c;
        return ((((iHashCode + ((int) (j ^ (j >>> 32)))) * 31) + this.d) * 31) + this.e;
    }

    public final String toString() {
        return "ItemsScrollEvent(adapter=" + this.a + ", recyclerView=" + this.b + ", viewStartedAt=" + this.c + ", firstVisibleItemPosition=" + this.d + ", lastVisibleItemPosition=" + this.e + ")";
    }
}
