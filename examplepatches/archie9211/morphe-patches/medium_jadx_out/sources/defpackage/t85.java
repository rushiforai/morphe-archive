package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class t85 implements u85 {
    public final ArrayList a;
    public final ArrayList b;
    public final Integer c;
    public final Integer d;
    public final boolean e;

    public t85(ArrayList arrayList, ArrayList arrayList2, Integer num, Integer num2, boolean z) {
        this.a = arrayList;
        this.b = arrayList2;
        this.c = num;
        this.d = num2;
        this.e = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t85)) {
            return false;
        }
        t85 t85Var = (t85) obj;
        return this.a.equals(t85Var.a) && this.b.equals(t85Var.b) && g76.L(this.c, t85Var.c) && g76.L(this.d, t85Var.d) && this.e == t85Var.e;
    }

    public final int hashCode() {
        int iP = b09.p(this.b, this.a.hashCode() * 31, 31);
        Integer num = this.c;
        int iHashCode = (iP + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.d;
        return ((iHashCode + (num2 != null ? num2.hashCode() : 0)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Success(writers=");
        sb.append(this.a);
        sb.append(", collections=");
        sb.append(this.b);
        sb.append(", writerCount=");
        sb.append(this.c);
        sb.append(", publicationCount=");
        sb.append(this.d);
        sb.append(", isRefreshing=");
        return lv8.t(sb, this.e, ")");
    }
}
