package defpackage;

import com.medium.android.graphql.fragment.CatalogDetailData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nb1 implements bc1 {
    public final CatalogDetailData a;

    public nb1(CatalogDetailData catalogDetailData) {
        this.a = catalogDetailData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof nb1) && this.a.equals(((nb1) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "MakeListPublicSuccess(catalog=" + this.a + ")";
    }
}
