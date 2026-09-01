package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lta {
    public final Long a;
    public final List b;

    public lta(Long l, List list) {
        this.a = l;
        this.b = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lta)) {
            return false;
        }
        lta ltaVar = (lta) obj;
        return g76.L(this.a, ltaVar.a) && this.b.equals(ltaVar.b);
    }

    public final int hashCode() {
        Long l = this.a;
        return this.b.hashCode() + ((l == null ? 0 : l.hashCode()) * 31);
    }

    public final String toString() {
        return "ReadersInterestUiModel(publishedAt=" + this.a + ", topics=" + this.b + ")";
    }
}
