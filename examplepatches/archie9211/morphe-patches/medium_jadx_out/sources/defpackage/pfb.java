package defpackage;

import com.medium.android.graphql.type.ResponseSortType;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pfb implements x27 {
    public final List a;
    public final ResponseSortType b;

    public pfb(List list, ResponseSortType responseSortType) {
        this.a = list;
        this.b = responseSortType;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pfb)) {
            return false;
        }
        pfb pfbVar = (pfb) obj;
        return this.a.equals(pfbVar.a) && this.b == pfbVar.b;
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return "sorting";
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ResponseSortingUiModel(items=" + this.a + ", item=" + this.b + ")";
    }
}
