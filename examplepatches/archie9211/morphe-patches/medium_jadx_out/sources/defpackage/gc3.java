package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gc3 {
    public final String a;
    public final long b;
    public final List c;
    public final hc3 d;

    public gc3(String str, long j, List list, hc3 hc3Var) {
        str.getClass();
        this.a = str;
        this.b = j;
        this.c = list;
        this.d = hc3Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gc3)) {
            return false;
        }
        gc3 gc3Var = (gc3) obj;
        return g76.L(this.a, gc3Var.a) && this.b == gc3Var.b && g76.L(this.c, gc3Var.c) && g76.L(this.d, gc3Var.d);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        int iP = wgd.p((iHashCode + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c);
        hc3 hc3Var = this.d;
        return iP + (hc3Var == null ? 0 : hc3Var.hashCode());
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, "Digest(id=", this.a, ", createdAt=");
        sbI.append(", sections=");
        sbI.append(this.c);
        sbI.append(", error=");
        sbI.append(this.d);
        sbI.append(")");
        return sbI.toString();
    }
}
