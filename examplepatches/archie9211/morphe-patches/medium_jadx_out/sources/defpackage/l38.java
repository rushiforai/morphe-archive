package defpackage;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import java.util.Calendar;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l38 {
    public final Calendar a;
    public final List b;
    public final Long c;
    public final Long d;
    public final Long e;
    public final Long f;
    public final Long g;
    public final List h;

    public l38(Calendar calendar, List list, Long l, Long l2, Long l3, Long l4, Long l5, List list2) {
        calendar.getClass();
        this.a = calendar;
        this.b = list;
        this.c = l;
        this.d = l2;
        this.e = l3;
        this.f = l4;
        this.g = l5;
        this.h = list2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l38)) {
            return false;
        }
        l38 l38Var = (l38) obj;
        return g76.L(this.a, l38Var.a) && this.b.equals(l38Var.b) && g76.L(this.c, l38Var.c) && g76.L(this.d, l38Var.d) && g76.L(this.e, l38Var.e) && g76.L(this.f, l38Var.f) && g76.L(this.g, l38Var.g) && this.h.equals(l38Var.h);
    }

    public final int hashCode() {
        int iP = wgd.p(this.a.hashCode() * 31, 31, this.b);
        Long l = this.c;
        int iHashCode = (iP + (l == null ? 0 : l.hashCode())) * 31;
        Long l2 = this.d;
        int iHashCode2 = (iHashCode + (l2 == null ? 0 : l2.hashCode())) * 31;
        Long l3 = this.e;
        int iHashCode3 = (iHashCode2 + (l3 == null ? 0 : l3.hashCode())) * 31;
        Long l4 = this.f;
        int iHashCode4 = (iHashCode3 + (l4 == null ? 0 : l4.hashCode())) * 31;
        Long l5 = this.g;
        return this.h.hashCode() + ((iHashCode4 + (l5 != null ? l5.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "MonthlyChartSectionUiModel(selectedDate=" + this.a + ZVsviyDAr.oJclJzbLfal + this.b + ", totalPresentations=" + this.c + ", totalViews=" + this.d + ", totalReads=" + this.e + ", netFollowersGained=" + this.f + ", netSubscribersGained=" + this.g + ", points=" + this.h + ")";
    }
}
