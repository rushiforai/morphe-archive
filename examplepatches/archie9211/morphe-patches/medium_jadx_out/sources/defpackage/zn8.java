package defpackage;

import com.datadog.android.core.yjCm.PqkdNGCEoxOKZk;
import com.medium.android.graphql.fragment.CatalogDetailData;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class zn8 {
    public final String a;
    public final boolean b;
    public final String c;
    public final List d;
    public final CatalogPreviewData e;
    public final CatalogDetailData f;
    public final List g;

    public zn8(String str, boolean z, String str2, List list, CatalogPreviewData catalogPreviewData, CatalogDetailData catalogDetailData, List list2) {
        str.getClass();
        str2.getClass();
        catalogDetailData.getClass();
        list2.getClass();
        this.a = str;
        this.b = z;
        this.c = str2;
        this.d = list;
        this.e = catalogPreviewData;
        this.f = catalogDetailData;
        this.g = list2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zn8)) {
            return false;
        }
        zn8 zn8Var = (zn8) obj;
        return g76.L(this.a, zn8Var.a) && this.b == zn8Var.b && g76.L(this.c, zn8Var.c) && this.d.equals(zn8Var.d) && this.e.equals(zn8Var.e) && g76.L(this.f, zn8Var.f) && g76.L(this.g, zn8Var.g);
    }

    public final int hashCode() {
        return this.g.hashCode() + ((this.f.hashCode() + ((this.e.hashCode() + wgd.p(wgd.o(((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31, 31, this.c), 31, this.d)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbD = ev6.D("OfflineCatalog(id=", this.a, ", isReadingList=", ", version=", this.b);
        sbD.append(this.c);
        sbD.append(", postIds=");
        sbD.append(this.d);
        sbD.append(", preview=");
        sbD.append(this.e);
        sbD.append(PqkdNGCEoxOKZk.rMfJROwYyZef);
        sbD.append(this.f);
        sbD.append(", items=");
        return b09.B(sbD, this.g, ")");
    }
}
