package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class q2b implements s2b {
    public final List a;
    public final boolean b;

    public q2b(List list, boolean z) {
        list.getClass();
        this.a = list;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q2b)) {
            return false;
        }
        q2b q2bVar = (q2b) obj;
        return g76.L(this.a, q2bVar.a) && this.b == q2bVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Items(items=" + this.a + ", isRefreshing=" + this.b + ")";
    }
}
