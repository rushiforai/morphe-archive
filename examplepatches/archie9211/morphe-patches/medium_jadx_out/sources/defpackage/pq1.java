package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pq1 extends oq1 {
    public final Throwable A;
    public final SourceParameter B;
    public final String z;

    public pq1(SourceParameter sourceParameter, String str, Throwable th) {
        str.getClass();
        sourceParameter.getClass();
        this.z = str;
        this.A = th;
        this.B = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pq1)) {
            return false;
        }
        pq1 pq1Var = (pq1) obj;
        return g76.L(this.z, pq1Var.z) && this.A.equals(pq1Var.A) && g76.L(this.B, pq1Var.B);
    }

    public final int hashCode() {
        return this.B.hashCode() + ((this.A.hashCode() + (this.z.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("FollowCollectionFailure(collectionId=");
        sb.append(this.z);
        sb.append(", exception=");
        sb.append(this.A);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.B, ")");
    }
}
