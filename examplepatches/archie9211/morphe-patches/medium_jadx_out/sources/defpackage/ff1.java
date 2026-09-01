package defpackage;

import com.medium.android.graphql.fragment.CatalogPreviewData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ff1 {
    public final CatalogPreviewData a;
    public final boolean b;

    public ff1(CatalogPreviewData catalogPreviewData, boolean z) {
        catalogPreviewData.getClass();
        this.a = catalogPreviewData;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ff1)) {
            return false;
        }
        ff1 ff1Var = (ff1) obj;
        return g76.L(this.a, ff1Var.a) && this.b == ff1Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "CatalogPreview(data=" + this.a + ", isLocalData=" + this.b + ")";
    }
}
