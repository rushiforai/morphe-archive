package defpackage;

import com.medium.android.graphql.fragment.PageInfoData;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class x8e {
    public final List a;
    public final PageInfoData b;

    public x8e(List list, PageInfoData pageInfoData) {
        list.getClass();
        this.a = list;
        this.b = pageInfoData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x8e)) {
            return false;
        }
        x8e x8eVar = (x8e) obj;
        return g76.L(this.a, x8eVar.a) && g76.L(this.b, x8eVar.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        PageInfoData pageInfoData = this.b;
        return iHashCode + (pageInfoData == null ? 0 : pageInfoData.hashCode());
    }

    public final String toString() {
        return "Page(items=" + this.a + ", nextPagePagination=" + this.b + ")";
    }
}
