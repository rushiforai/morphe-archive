package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l85 implements m85 {
    public final ArrayList a;
    public final ArrayList b;
    public final ArrayList c;
    public final Integer d;
    public final Integer e;
    public final Integer f;
    public final boolean g;

    public l85(ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, Integer num, Integer num2, Integer num3, boolean z) {
        this.a = arrayList;
        this.b = arrayList2;
        this.c = arrayList3;
        this.d = num;
        this.e = num2;
        this.f = num3;
        this.g = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l85)) {
            return false;
        }
        l85 l85Var = (l85) obj;
        return this.a.equals(l85Var.a) && this.b.equals(l85Var.b) && this.c.equals(l85Var.c) && g76.L(this.d, l85Var.d) && g76.L(this.e, l85Var.e) && g76.L(this.f, l85Var.f) && this.g == l85Var.g;
    }

    public final int hashCode() {
        int iP = b09.p(this.c, b09.p(this.b, this.a.hashCode() * 31, 31), 31);
        Integer num = this.d;
        int iHashCode = (iP + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.e;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.f;
        return ((iHashCode2 + (num3 != null ? num3.hashCode() : 0)) * 31) + (this.g ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(peNPu.HYnnm);
        sb.append(this.a);
        sb.append(", collections=");
        sb.append(this.b);
        sb.append(", tags=");
        sb.append(this.c);
        sb.append(", writerCount=");
        sb.append(this.d);
        sb.append(", collectionCount=");
        sb.append(this.e);
        sb.append(", tagsCount=");
        sb.append(this.f);
        sb.append(", isRefreshing=");
        return lv8.t(sb, this.g, ")");
    }
}
