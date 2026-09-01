package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lp9 implements op9 {
    public final dr9 a;
    public final boolean b;
    public final Long c;
    public final kp9 d;
    public final q38 e;
    public final drd f;
    public final lta g;
    public final t35 h;
    public final kx8 i;
    public final SourceParameter j;

    public lp9(dr9 dr9Var, boolean z, Long l, kp9 kp9Var, q38 q38Var, drd drdVar, lta ltaVar, t35 t35Var, kx8 kx8Var, SourceParameter sourceParameter) {
        this.a = dr9Var;
        this.b = z;
        this.c = l;
        this.d = kp9Var;
        this.e = q38Var;
        this.f = drdVar;
        this.g = ltaVar;
        this.h = t35Var;
        this.i = kx8Var;
        this.j = sourceParameter;
    }

    public static lp9 a(lp9 lp9Var, q38 q38Var, int i) {
        dr9 dr9Var = lp9Var.a;
        boolean z = (i & 2) != 0 ? lp9Var.b : true;
        Long l = lp9Var.c;
        kp9 kp9Var = lp9Var.d;
        if ((i & 16) != 0) {
            q38Var = lp9Var.e;
        }
        drd drdVar = lp9Var.f;
        lta ltaVar = lp9Var.g;
        t35 t35Var = lp9Var.h;
        kx8 kx8Var = lp9Var.i;
        SourceParameter sourceParameter = lp9Var.j;
        lp9Var.getClass();
        return new lp9(dr9Var, z, l, kp9Var, q38Var, drdVar, ltaVar, t35Var, kx8Var, sourceParameter);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lp9)) {
            return false;
        }
        lp9 lp9Var = (lp9) obj;
        return this.a.equals(lp9Var.a) && this.b == lp9Var.b && g76.L(this.c, lp9Var.c) && g76.L(this.d, lp9Var.d) && this.e.equals(lp9Var.e) && g76.L(this.f, lp9Var.f) && this.g.equals(lp9Var.g) && g76.L(this.h, lp9Var.h) && this.i.equals(lp9Var.i) && this.j.equals(lp9Var.j);
    }

    public final int hashCode() {
        int iHashCode = ((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31;
        Long l = this.c;
        int iHashCode2 = (iHashCode + (l == null ? 0 : l.hashCode())) * 31;
        kp9 kp9Var = this.d;
        int iHashCode3 = (this.e.hashCode() + ((iHashCode2 + (kp9Var == null ? 0 : kp9Var.hashCode())) * 31)) * 31;
        drd drdVar = this.f;
        int iHashCode4 = (this.g.hashCode() + ((iHashCode3 + (drdVar == null ? 0 : drdVar.hashCode())) * 31)) * 31;
        t35 t35Var = this.h;
        return this.j.hashCode() + ((this.i.hashCode() + ((iHashCode4 + (t35Var != null ? t35Var.hashCode() : 0)) * 31)) * 31);
    }

    public final String toString() {
        return "Content(postUiModel=" + this.a + ", isRefreshing=" + this.b + ", boostedAt=" + this.c + ", featured=" + this.d + ", monthlyStatsUiModel=" + this.e + ", trafficSourcesUiModel=" + this.f + ", readersInterestUiModel=" + this.g + ", friendLinksUiModel=" + this.h + ", overviewStatsUiModel=" + this.i + ", sourceParameter=" + this.j + ")";
    }
}
