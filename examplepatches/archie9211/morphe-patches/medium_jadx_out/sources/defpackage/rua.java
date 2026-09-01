package defpackage;

import com.medium.android.graphql.fragment.CatalogPreviewData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rua implements sua {
    public final CatalogPreviewData a;

    public rua(CatalogPreviewData catalogPreviewData) {
        this.a = catalogPreviewData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof rua) && this.a.equals(((rua) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Success(catalogPreviewData=" + this.a + ")";
    }
}
