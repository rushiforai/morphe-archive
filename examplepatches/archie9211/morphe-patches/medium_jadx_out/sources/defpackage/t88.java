package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class t88 {
    public final Integer a;
    public final List b;
    public final boolean c;

    public t88(Integer num, List list, boolean z) {
        this.a = num;
        this.b = list;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t88)) {
            return false;
        }
        t88 t88Var = (t88) obj;
        return g76.L(this.a, t88Var.a) && this.b.equals(t88Var.b) && this.c == t88Var.c;
    }

    public final int hashCode() {
        Integer num = this.a;
        return wgd.p((num == null ? 0 : num.hashCode()) * 31, 31, this.b) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Publications(totalCount=");
        sb.append(this.a);
        sb.append(", publications=");
        sb.append(this.b);
        sb.append(", hasNextPage=");
        return lv8.t(sb, this.c, ")");
    }
}
