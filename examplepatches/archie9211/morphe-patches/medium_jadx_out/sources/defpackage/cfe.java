package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cfe {
    public final Long a;
    public final Long b;
    public final ArrayList c;

    public cfe(Long l, Long l2, ArrayList arrayList) {
        this.a = l;
        this.b = l2;
        this.c = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cfe)) {
            return false;
        }
        cfe cfeVar = (cfe) obj;
        return g76.L(this.a, cfeVar.a) && g76.L(this.b, cfeVar.b) && this.c.equals(cfeVar.c);
    }

    public final int hashCode() {
        Long l = this.a;
        int iHashCode = (l == null ? 0 : l.hashCode()) * 31;
        Long l2 = this.b;
        return this.c.hashCode() + ((iHashCode + (l2 != null ? l2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "FooterData(regularMemberAt=" + this.a + ", premiumMemberAt=" + this.b + ", adminPublications=" + this.c + ")";
    }
}
