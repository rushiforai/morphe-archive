package defpackage;

import com.medium.android.graphql.fragment.CatalogPreviewData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m4e implements n4e {
    public final CatalogPreviewData a;

    public m4e(CatalogPreviewData catalogPreviewData) {
        this.a = catalogPreviewData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m4e) && this.a.equals(((m4e) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Success(data=" + this.a + ")";
    }
}
