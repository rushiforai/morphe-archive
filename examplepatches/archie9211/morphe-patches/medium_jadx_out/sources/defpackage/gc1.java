package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.core.models.CatalogName;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class gc1 implements jc1 {
    public final String a;
    public final CatalogName b;
    public final String c;
    public final long d;
    public final fc1 e;
    public final boolean f;
    public final boolean g;
    public final int h;
    public final boolean i;
    public final Integer j;
    public final az5 k;
    public final boolean l;
    public final boolean m;
    public final boolean n;
    public final boolean o;
    public final ga1 p;
    public final v81 q;
    public final SourceParameter r;

    public gc1(String str, CatalogName catalogName, String str2, long j, fc1 fc1Var, boolean z, boolean z2, int i, boolean z3, Integer num, az5 az5Var, boolean z4, boolean z5, boolean z6, boolean z7, ga1 ga1Var, v81 v81Var, SourceParameter sourceParameter) {
        str.getClass();
        catalogName.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = catalogName;
        this.c = str2;
        this.d = j;
        this.e = fc1Var;
        this.f = z;
        this.g = z2;
        this.h = i;
        this.i = z3;
        this.j = num;
        this.k = az5Var;
        this.l = z4;
        this.m = z5;
        this.n = z6;
        this.o = z7;
        this.p = ga1Var;
        this.q = v81Var;
        this.r = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gc1)) {
            return false;
        }
        gc1 gc1Var = (gc1) obj;
        return g76.L(this.a, gc1Var.a) && g76.L(this.b, gc1Var.b) && g76.L(this.c, gc1Var.c) && this.d == gc1Var.d && this.e.equals(gc1Var.e) && this.f == gc1Var.f && this.g == gc1Var.g && this.h == gc1Var.h && this.i == gc1Var.i && g76.L(this.j, gc1Var.j) && g76.L(this.k, gc1Var.k) && this.l == gc1Var.l && this.m == gc1Var.m && this.n == gc1Var.n && this.o == gc1Var.o && this.p.equals(gc1Var.p) && this.q.equals(gc1Var.q) && this.r.equals(gc1Var.r);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        String str = this.c;
        int iHashCode2 = str == null ? 0 : str.hashCode();
        long j = this.d;
        int iHashCode3 = (((((((((this.e.hashCode() + ((((iHashCode + iHashCode2) * 31) + ((int) (j ^ (j >>> 32)))) * 31)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31) + this.h) * 31) + (this.i ? 1231 : 1237)) * 31;
        Integer num = this.j;
        return this.r.hashCode() + ((this.q.hashCode() + ((this.p.hashCode() + ((((((((ka1.b(this.k, (iHashCode3 + (num != null ? num.hashCode() : 0)) * 31, 31) + (this.l ? 1231 : 1237)) * 31) + (this.m ? 1231 : 1237)) * 31) + (this.n ? 1231 : 1237)) * 31) + (this.o ? 1231 : 1237)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "Catalog(id=" + this.a + ", name=" + this.b + ", description=" + this.c + ", itemsLastInsertedAt=" + this.d + ", creator=" + this.e + ", canAddNote=" + this.f + ", canDisplayFooter=" + this.g + ", totalItemCount=" + this.h + ", isPrivate=" + this.i + ", saveCount=" + this.j + ", uiModels=" + this.k + ", isRefreshing=" + this.l + ", isLoadingMore=" + this.m + ", isInReorderMode=" + this.n + ", isSubmittingReorder=" + this.o + ", topAppBarUiModel=" + this.p + ", bottomBarUiModel=" + this.q + ", sourceParameter=" + this.r + peNPu.GvJh;
    }
}
