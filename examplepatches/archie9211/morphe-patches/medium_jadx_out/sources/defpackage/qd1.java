package defpackage;

import com.medium.android.graphql.fragment.CatalogPreviewData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qd1 implements rd1 {
    public final CatalogPreviewData a;

    public qd1(CatalogPreviewData catalogPreviewData) {
        this.a = catalogPreviewData;
    }

    @Override // defpackage.rd1
    public final String a() {
        return this.a.getId();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof qd1) && this.a.equals(((qd1) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Updated(catalog=" + this.a + ")";
    }
}
