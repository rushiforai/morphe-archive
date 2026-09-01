package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class msc implements osc {
    public final boolean a;
    public final xqc b;
    public final ArrayList c;
    public final boolean d;
    public final boolean e;

    public msc(boolean z, xqc xqcVar, ArrayList arrayList, boolean z2, boolean z3) {
        xqcVar.getClass();
        this.a = z;
        this.b = xqcVar;
        this.c = arrayList;
        this.d = z2;
        this.e = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof msc)) {
            return false;
        }
        msc mscVar = (msc) obj;
        return this.a == mscVar.a && this.b == mscVar.b && this.c.equals(mscVar.c) && this.d == mscVar.d && this.e == mscVar.e;
    }

    public final int hashCode() {
        return ((b09.p(this.c, (this.b.hashCode() + ((this.a ? 1231 : 1237) * 31)) * 31, 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("LifeTimeStats(enablePaywallFilter=");
        sb.append(this.a);
        sb.append(", selectedSort=");
        sb.append(this.b);
        sb.append(", items=");
        sb.append(this.c);
        sb.append(", isLoadingMore=");
        sb.append(this.d);
        sb.append(", isRefreshing=");
        return lv8.t(sb, this.e, ")");
    }
}
