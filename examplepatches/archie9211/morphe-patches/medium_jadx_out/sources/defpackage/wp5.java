package defpackage;

import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wp5 implements xp5 {
    public final ArrayList a;
    public final boolean b;
    public final boolean c;
    public final SourceParameter d;

    public wp5(SourceParameter sourceParameter, ArrayList arrayList, boolean z, boolean z2) {
        sourceParameter.getClass();
        this.a = arrayList;
        this.b = z;
        this.c = z2;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wp5)) {
            return false;
        }
        wp5 wp5Var = (wp5) obj;
        return this.a.equals(wp5Var.a) && this.b == wp5Var.b && this.c == wp5Var.c && g76.L(this.d, wp5Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + (((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "Results(items=" + this.a + ", isRefreshing=" + this.b + ", isLoadingMore=" + this.c + ", sourceParameter=" + this.d + ")";
    }
}
