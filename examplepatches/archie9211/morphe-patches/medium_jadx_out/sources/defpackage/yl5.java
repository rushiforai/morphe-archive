package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yl5 implements am5 {
    public final ArrayList a;
    public final boolean b;
    public final boolean c;

    public yl5(ArrayList arrayList, boolean z, boolean z2) {
        this.a = arrayList;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yl5)) {
            return false;
        }
        yl5 yl5Var = (yl5) obj;
        return this.a.equals(yl5Var.a) && this.b == yl5Var.b && this.c == yl5Var.c;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Items(items=");
        sb.append(this.a);
        sb.append(", isLoadingMore=");
        sb.append(this.b);
        sb.append(", isRefreshing=");
        return lv8.t(sb, this.c, ")");
    }
}
