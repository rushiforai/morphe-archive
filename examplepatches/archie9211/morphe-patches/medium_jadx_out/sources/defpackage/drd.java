package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class drd {
    public final Long a;
    public final int b;
    public final int c;
    public final ArrayList d;

    public drd(Long l, int i, int i2, ArrayList arrayList) {
        this.a = l;
        this.b = i;
        this.c = i2;
        this.d = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof drd)) {
            return false;
        }
        drd drdVar = (drd) obj;
        return g76.L(this.a, drdVar.a) && this.b == drdVar.b && this.c == drdVar.c && this.d.equals(drdVar.d);
    }

    public final int hashCode() {
        Long l = this.a;
        return this.d.hashCode() + ((((((l == null ? 0 : l.hashCode()) * 31) + this.b) * 31) + this.c) * 31);
    }

    public final String toString() {
        return "TrafficSourcesUiModel(publishedAt=" + this.a + ", internalReferrersPercentage=" + this.b + ", externalReferrersPercentage=" + this.c + ", externalReferrers=" + this.d + ")";
    }
}
