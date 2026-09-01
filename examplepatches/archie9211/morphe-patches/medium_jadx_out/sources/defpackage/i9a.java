package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class i9a implements k9a {
    public final xqc a;
    public final ArrayList b;
    public final boolean c;
    public final boolean d;

    public i9a(xqc xqcVar, ArrayList arrayList, boolean z, boolean z2) {
        xqcVar.getClass();
        this.a = xqcVar;
        this.b = arrayList;
        this.c = z;
        this.d = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i9a)) {
            return false;
        }
        i9a i9aVar = (i9a) obj;
        return this.a == i9aVar.a && this.b.equals(i9aVar.b) && this.c == i9aVar.c && this.d == i9aVar.d;
    }

    public final int hashCode() {
        return ((b09.p(this.b, this.a.hashCode() * 31, 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("LifeTimeStats(selectedSort=");
        sb.append(this.a);
        sb.append(", items=");
        sb.append(this.b);
        sb.append(", isLoadingMore=");
        return b09.C(sb, this.c, ", isRefreshing=", this.d, ")");
    }
}
