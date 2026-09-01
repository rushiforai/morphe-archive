package defpackage;

import com.medium.android.graphql.fragment.CatalogPagingResultData;
import java.util.List;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class yz8 {
    public final List a;
    public final Object b;
    public final rt2 c;

    public yz8(List list, CatalogPagingResultData catalogPagingResultData, rt2 rt2Var) {
        list.getClass();
        rt2Var.getClass();
        this.a = list;
        this.b = catalogPagingResultData;
        this.c = rt2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yz8)) {
            return false;
        }
        yz8 yz8Var = (yz8) obj;
        return g76.L(this.a, yz8Var.a) && g76.L(this.b, yz8Var.b) && this.c == yz8Var.c;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        Object obj = this.b;
        return this.c.hashCode() + ((iHashCode + (obj == null ? 0 : obj.hashCode())) * 31);
    }

    public final String toString() {
        return fiHTiFJ.ABtvvGPjjgPCA + this.a + ", paging=" + this.b + ", source=" + this.c + ")";
    }
}
