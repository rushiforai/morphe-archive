package defpackage;

import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uo5 implements vo5 {
    public final ArrayList a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final SourceParameter e;

    public uo5(ArrayList arrayList, boolean z, boolean z2, boolean z3, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a = arrayList;
        this.b = z;
        this.c = z2;
        this.d = z3;
        this.e = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uo5)) {
            return false;
        }
        uo5 uo5Var = (uo5) obj;
        return this.a.equals(uo5Var.a) && this.b == uo5Var.b && this.c == uo5Var.c && this.d == uo5Var.d && g76.L(this.e, uo5Var.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + (((((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Results(posts=");
        sb.append(this.a);
        sb.append(", isRefreshing=");
        sb.append(this.b);
        sb.append(", isLoadingMore=");
        ho2.R(sb, this.c, ", hasMore=", this.d, ", sourceParameter=");
        return y30.r(sb, this.e, ")");
    }
}
