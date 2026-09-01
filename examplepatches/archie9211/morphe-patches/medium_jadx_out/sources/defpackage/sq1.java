package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class sq1 extends rq1 {
    public final Throwable A;
    public final SourceParameter B;
    public final String z;

    public sq1(SourceParameter sourceParameter, String str, Throwable th) {
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
        if (!(obj instanceof sq1)) {
            return false;
        }
        sq1 sq1Var = (sq1) obj;
        return g76.L(this.z, sq1Var.z) && this.A.equals(sq1Var.A) && g76.L(this.B, sq1Var.B);
    }

    public final int hashCode() {
        return this.B.hashCode() + ((this.A.hashCode() + (this.z.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("MuteCollectionFailure(collectionId=");
        sb.append(this.z);
        sb.append(", exception=");
        sb.append(this.A);
        sb.append(HrUBqHumRuLe.ONHdqTQ);
        return y30.r(sb, this.B, ")");
    }
}
