package defpackage;

import com.medium.android.core.models.BillingPeriod;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ww7 {
    public final boolean a;
    public final Long b;
    public final s69 c;
    public final zw7 d;
    public final zw7 e;
    public final String f;
    public final long g;
    public final String h;
    public final String i;
    public final BillingPeriod j;

    public ww7(boolean z, Long l, s69 s69Var, zw7 zw7Var, zw7 zw7Var2, String str, long j, String str2, String str3, BillingPeriod billingPeriod) {
        s69Var.getClass();
        zw7Var.getClass();
        zw7Var2.getClass();
        str.getClass();
        this.a = z;
        this.b = l;
        this.c = s69Var;
        this.d = zw7Var;
        this.e = zw7Var2;
        this.f = str;
        this.g = j;
        this.h = str2;
        this.i = str3;
        this.j = billingPeriod;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ww7)) {
            return false;
        }
        ww7 ww7Var = (ww7) obj;
        return this.a == ww7Var.a && g76.L(this.b, ww7Var.b) && this.c == ww7Var.c && this.d == ww7Var.d && this.e == ww7Var.e && g76.L(this.f, ww7Var.f) && this.g == ww7Var.g && g76.L(this.h, ww7Var.h) && g76.L(this.i, ww7Var.i) && this.j == ww7Var.j;
    }

    public final int hashCode() {
        int i = (this.a ? 1231 : 1237) * 31;
        Long l = this.b;
        int iO = wgd.o((this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((i + (l == null ? 0 : l.hashCode())) * 31)) * 31)) * 31)) * 31, 31, this.f);
        long j = this.g;
        int i2 = (iO + ((int) (j ^ (j >>> 32)))) * 31;
        String str = this.h;
        int iHashCode = (i2 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.i;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        BillingPeriod billingPeriod = this.j;
        return iHashCode2 + (billingPeriod != null ? billingPeriod.hashCode() : 0);
    }

    public final String toString() {
        return "MembershipStatus(isCancelled=" + this.a + ", expiresAt=" + this.b + ", paymentProvider=" + this.c + ", membershipType=" + this.d + dpBiLjNeNsiASg.vRCVCPosapBRUf + this.e + ", membershipId=" + this.f + ", startedAt=" + this.g + ", membershipPlanId=" + this.h + ", productId=" + this.i + ", billingPeriod=" + this.j + ")";
    }
}
