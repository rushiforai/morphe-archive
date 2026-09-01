package defpackage;

import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mw7 {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final zw7 e;
    public final BillingPeriod f;
    public final kv7 g;
    public final String h;

    public mw7(String str, String str2, String str3, String str4, zw7 zw7Var, BillingPeriod billingPeriod, kv7 kv7Var, String str5) {
        str.getClass();
        str2.getClass();
        str4.getClass();
        zw7Var.getClass();
        billingPeriod.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = zw7Var;
        this.f = billingPeriod;
        this.g = kv7Var;
        this.h = str5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mw7)) {
            return false;
        }
        mw7 mw7Var = (mw7) obj;
        return g76.L(this.a, mw7Var.a) && g76.L(this.b, mw7Var.b) && g76.L(this.c, mw7Var.c) && g76.L(this.d, mw7Var.d) && this.e == mw7Var.e && this.f == mw7Var.f && g76.L(this.g, mw7Var.g) && g76.L(this.h, mw7Var.h);
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (this.f.hashCode() + ((this.e.hashCode() + wgd.o((iO + (str == null ? 0 : str.hashCode())) * 31, 31, this.d)) * 31)) * 31;
        kv7 kv7Var = this.g;
        int iHashCode2 = (iHashCode + (kv7Var == null ? 0 : kv7Var.hashCode())) * 31;
        String str2 = this.h;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("MembershipPlan(productId=", this.a, ", basePlanId=", this.b, ", offerId=");
        ka1.C(sbU, this.c, ", membershipPlanId=", this.d, ", membershipType=");
        sbU.append(this.e);
        sbU.append(", billingPeriod=");
        sbU.append(this.f);
        sbU.append(", crossoutPlan=");
        sbU.append(this.g);
        sbU.append(", couponCode=");
        sbU.append(this.h);
        sbU.append(")");
        return sbU.toString();
    }
}
