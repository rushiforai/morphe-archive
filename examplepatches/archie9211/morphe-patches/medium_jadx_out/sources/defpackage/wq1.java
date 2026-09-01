package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wq1 extends uq1 {
    public final SourceParameter A;
    public final String z;

    public wq1(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        this.z = str;
        this.A = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wq1)) {
            return false;
        }
        wq1 wq1Var = (wq1) obj;
        return g76.L(this.z, wq1Var.z) && g76.L(this.A, wq1Var.A);
    }

    public final int hashCode() {
        return this.A.hashCode() + (this.z.hashCode() * 31);
    }

    public final String toString() {
        return "UnMuteCollectionSuccess(collectionId=" + this.z + ", sourceParameter=" + this.A + ")";
    }
}
