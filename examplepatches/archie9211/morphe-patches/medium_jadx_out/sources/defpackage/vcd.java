package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vcd {
    public final List a;
    public final boolean b;
    public final boolean c;

    public vcd(List list, boolean z, boolean z2) {
        list.getClass();
        this.a = list;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vcd)) {
            return false;
        }
        vcd vcdVar = (vcd) obj;
        return g76.L(this.a, vcdVar.a) && this.b == vcdVar.b && this.c == vcdVar.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        return lv8.t(ka1.x("SectionItems(items=", this.a, ", hasMore=", this.b, ", loadingMore="), this.c, ")");
    }
}
