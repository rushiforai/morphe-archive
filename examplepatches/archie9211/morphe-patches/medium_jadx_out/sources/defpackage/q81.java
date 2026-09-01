package defpackage;

import com.medium.android.graphql.fragment.CatalogDetailData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q81 {
    public final CatalogDetailData a;
    public final boolean b;

    public q81(CatalogDetailData catalogDetailData, boolean z) {
        catalogDetailData.getClass();
        this.a = catalogDetailData;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q81)) {
            return false;
        }
        q81 q81Var = (q81) obj;
        return g76.L(this.a, q81Var.a) && this.b == q81Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "CatalogDetail(data=" + this.a + ", isLocalData=" + this.b + ")";
    }
}
