package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class tq1 extends rq1 {
    public final SourceParameter A;
    public final String z;

    public tq1(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.z = str;
        this.A = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tq1)) {
            return false;
        }
        tq1 tq1Var = (tq1) obj;
        return g76.L(this.z, tq1Var.z) && g76.L(this.A, tq1Var.A);
    }

    public final int hashCode() {
        return this.A.hashCode() + (this.z.hashCode() * 31);
    }

    public final String toString() {
        return "MuteCollectionSuccess(collectionId=" + this.z + ", sourceParameter=" + this.A + kSWQKWZ.EJtaAH;
    }
}
