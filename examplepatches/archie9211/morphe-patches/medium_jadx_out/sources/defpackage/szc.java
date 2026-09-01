package defpackage;

import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class szc {
    public final String a;
    public final String b;
    public final String c;
    public final BillingPeriod d;
    public final zw7 e;
    public final boolean f;
    public final String g;
    public final String h;
    public final boolean i;
    public final rzc j;

    public szc(String str, String str2, String str3, BillingPeriod billingPeriod, zw7 zw7Var, boolean z, String str4, String str5, boolean z2, rzc rzcVar) {
        str3.getClass();
        billingPeriod.getClass();
        zw7Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = billingPeriod;
        this.e = zw7Var;
        this.f = z;
        this.g = str4;
        this.h = str5;
        this.i = z2;
        this.j = rzcVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof szc)) {
            return false;
        }
        szc szcVar = (szc) obj;
        return this.a.equals(szcVar.a) && this.b.equals(szcVar.b) && g76.L(this.c, szcVar.c) && this.d == szcVar.d && this.e == szcVar.e && this.f == szcVar.f && this.g.equals(szcVar.g) && g76.L(this.h, szcVar.h) && this.i == szcVar.i && g76.L(this.j, szcVar.j);
    }

    public final int hashCode() {
        int iO = wgd.o((((this.e.hashCode() + ((this.d.hashCode() + wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c)) * 31)) * 31) + (this.f ? 1231 : 1237)) * 31, 31, this.g);
        String str = this.h;
        int iHashCode = (((iO + (str == null ? 0 : str.hashCode())) * 31) + (this.i ? 1231 : 1237)) * 31;
        rzc rzcVar = this.j;
        return iHashCode + (rzcVar != null ? rzcVar.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("MembershipPlan(productId=", this.a, ", offerToken=", this.b, ", membershipPlanId=");
        sbU.append(this.c);
        sbU.append(", billingPeriod=");
        sbU.append(this.d);
        sbU.append(", membershipType=");
        sbU.append(this.e);
        sbU.append(", trialEligible=");
        sbU.append(this.f);
        sbU.append(", price=");
        ka1.C(sbU, this.g, ", crossOutPrice=", this.h, ", isCurrentPlan=");
        sbU.append(this.i);
        sbU.append(", offer=");
        sbU.append(this.j);
        sbU.append(")");
        return sbU.toString();
    }
}
