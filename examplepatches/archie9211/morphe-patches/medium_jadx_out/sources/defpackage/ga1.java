package defpackage;

import com.medium.android.core.models.CatalogName;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ga1 {
    public final CatalogName a;
    public final pg1 b;
    public final boolean c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final boolean h;
    public final boolean i;
    public final Boolean j;
    public final eg1 k;
    public final xm1 l;

    public ga1(CatalogName catalogName, pg1 pg1Var, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7, Boolean bool, eg1 eg1Var, xm1 xm1Var) {
        catalogName.getClass();
        this.a = catalogName;
        this.b = pg1Var;
        this.c = z;
        this.d = z2;
        this.e = z3;
        this.f = z4;
        this.g = z5;
        this.h = z6;
        this.i = z7;
        this.j = bool;
        this.k = eg1Var;
        this.l = xm1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ga1)) {
            return false;
        }
        ga1 ga1Var = (ga1) obj;
        return g76.L(this.a, ga1Var.a) && g76.L(this.b, ga1Var.b) && this.c == ga1Var.c && this.d == ga1Var.d && this.e == ga1Var.e && this.f == ga1Var.f && this.g == ga1Var.g && this.h == ga1Var.h && this.i == ga1Var.i && g76.L(this.j, ga1Var.j) && g76.L(this.k, ga1Var.k) && this.l.equals(ga1Var.l);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        pg1 pg1Var = this.b;
        int iHashCode2 = (((((((((((((((iHashCode + (pg1Var == null ? 0 : pg1Var.hashCode())) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237)) * 31) + (this.i ? 1231 : 1237)) * 31;
        Boolean bool = this.j;
        int iHashCode3 = (iHashCode2 + (bool == null ? 0 : bool.hashCode())) * 31;
        eg1 eg1Var = this.k;
        return this.l.hashCode() + ((iHashCode3 + (eg1Var != null ? eg1Var.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CatalogDetailTopAppBarUiModel(catalogName=");
        sb.append(this.a);
        sb.append(", downloadStatus=");
        sb.append(this.b);
        sb.append(", canUndoClaps=");
        ho2.R(sb, this.c, ", canEdit=", this.d, ", canReport=");
        ho2.R(sb, this.e, ", canReorder=", this.f, ", canDelete=");
        ho2.R(sb, this.g, ", canToggleVisibility=", this.h, ", isPrivate=");
        sb.append(this.i);
        sb.append(", isFollowingCatalog=");
        sb.append(this.j);
        sb.append(", catalogShareData=");
        sb.append(this.k);
        sb.append(", clapsState=");
        sb.append(this.l);
        sb.append(")");
        return sb.toString();
    }
}
