package defpackage;

import com.medium.android.graphql.fragment.CatalogDetailData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lb1 implements bc1 {
    public final CatalogDetailData a;

    public lb1(CatalogDetailData catalogDetailData) {
        this.a = catalogDetailData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof lb1) && this.a.equals(((lb1) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "MakeListPrivateSuccess(catalog=" + this.a + ")";
    }
}
