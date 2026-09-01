package defpackage;

import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class r7d {
    public final String a;
    public final boolean b;
    public final List c;
    public final List d;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v0, types: [java.util.Collection, java.util.List] */
    /* JADX WARN: Type inference failed for: r4v1, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r4v2, types: [java.util.ArrayList] */
    public r7d(String str, boolean z, List list, List list2) {
        str.getClass();
        this.a = str;
        this.b = z;
        this.c = list;
        this.d = list2;
        if (list2.isEmpty()) {
            int size = list.size();
            list2 = new ArrayList(size);
            for (int i = 0; i < size; i++) {
                list2.add("ASC");
            }
        }
        this.d = list2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof r7d) {
            r7d r7dVar = (r7d) obj;
            String str = r7dVar.a;
            if (this.b == r7dVar.b && this.c.equals(r7dVar.c) && g76.L(this.d, r7dVar.d)) {
                String str2 = this.a;
                return tuc.N(str2, "index_", false) ? tuc.N(str, "index_", false) : str2.equals(str);
            }
        }
        return false;
    }

    public final int hashCode() {
        String str = this.a;
        return this.d.hashCode() + wgd.p((((tuc.N(str, "index_", false) ? -1184239155 : str.hashCode()) * 31) + (this.b ? 1 : 0)) * 31, 31, this.c);
    }

    public final String toString() {
        return nuc.A(nuc.C("\n            |Index {\n            |   name = '" + this.a + "',\n            |   unique = '" + this.b + "',\n            |   columns = {" + mk7.D(this.c) + "\n            |   orders = {" + mk7.C(this.d) + mBTDfueQiGWRV.RRso));
    }
}
