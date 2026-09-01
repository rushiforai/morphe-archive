package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v81 {
    public final boolean a;
    public final boolean b;
    public final String c;
    public final xm1 d;
    public final int e;
    public final boolean f;
    public final SourceParameter g;

    public v81(boolean z, boolean z2, String str, xm1 xm1Var, int i, boolean z3, SourceParameter sourceParameter) {
        str.getClass();
        this.a = z;
        this.b = z2;
        this.c = str;
        this.d = xm1Var;
        this.e = i;
        this.f = z3;
        this.g = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v81)) {
            return false;
        }
        v81 v81Var = (v81) obj;
        return this.a == v81Var.a && this.b == v81Var.b && g76.L(this.c, v81Var.c) && g76.L(this.d, v81Var.d) && this.e == v81Var.e && this.f == v81Var.f && g76.L(this.g, v81Var.g);
    }

    public final int hashCode() {
        return this.g.hashCode() + ((((((this.d.hashCode() + wgd.o((((this.a ? 1231 : 1237) * 31) + (this.b ? 1231 : 1237)) * 31, 31, this.c)) * 31) + this.e) * 31) + (this.f ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CatalogDetailBottomBarUiModel(isInReorderMode=");
        sb.append(this.a);
        sb.append(", isSubmittingReorder=");
        sb.append(this.b);
        sb.append(", catalogId=");
        sb.append(this.c);
        sb.append(", clapsState=");
        sb.append(this.d);
        sb.append(", responseCount=");
        sb.append(this.e);
        sb.append(", enableResponse=");
        sb.append(this.f);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.g, ")");
    }
}
