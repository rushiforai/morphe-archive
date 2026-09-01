package defpackage;

import com.medium.android.graphql.fragment.CatalogItemData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oa1 implements ua1 {
    public final CatalogItemData a;

    public oa1(CatalogItemData catalogItemData) {
        this.a = catalogItemData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof oa1) && this.a.equals(((oa1) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "ItemUpdated(catalogItem=" + this.a + ")";
    }
}
