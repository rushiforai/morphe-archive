package defpackage;

import com.android.billingclient.api.ProductDetails;
import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ecb {
    public final String a;
    public final String b;
    public final ProductDetails.PricingPhase c;
    public final boolean d;
    public final String e;
    public final ProductDetails.PricingPhase f;
    public final zw7 g;
    public final BillingPeriod h;
    public final String i;
    public final kv7 j;
    public final String k;

    public ecb(String str, String str2, ProductDetails.PricingPhase pricingPhase, boolean z, String str3, ProductDetails.PricingPhase pricingPhase2, zw7 zw7Var, BillingPeriod billingPeriod, String str4, kv7 kv7Var, String str5) {
        zw7Var.getClass();
        billingPeriod.getClass();
        str4.getClass();
        this.a = str;
        this.b = str2;
        this.c = pricingPhase;
        this.d = z;
        this.e = str3;
        this.f = pricingPhase2;
        this.g = zw7Var;
        this.h = billingPeriod;
        this.i = str4;
        this.j = kv7Var;
        this.k = str5;
    }

    public static ecb a(ecb ecbVar, boolean z) {
        String str = ecbVar.a;
        String str2 = ecbVar.b;
        ProductDetails.PricingPhase pricingPhase = ecbVar.c;
        String str3 = ecbVar.e;
        ProductDetails.PricingPhase pricingPhase2 = ecbVar.f;
        zw7 zw7Var = ecbVar.g;
        BillingPeriod billingPeriod = ecbVar.h;
        String str4 = ecbVar.i;
        kv7 kv7Var = ecbVar.j;
        String str5 = ecbVar.k;
        zw7Var.getClass();
        billingPeriod.getClass();
        str4.getClass();
        return new ecb(str, str2, pricingPhase, z, str3, pricingPhase2, zw7Var, billingPeriod, str4, kv7Var, str5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ecb) {
            ecb ecbVar = (ecb) obj;
            if (this.a.equals(ecbVar.a) && this.b.equals(ecbVar.b) && this.c == ecbVar.c && this.d == ecbVar.d && g76.L(this.e, ecbVar.e) && g76.L(this.f, ecbVar.f) && this.g == ecbVar.g && this.h == ecbVar.h && g76.L(this.i, ecbVar.i) && g76.L(this.j, ecbVar.j) && g76.L(this.k, ecbVar.k)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (((this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b)) * 31) + (this.d ? 1231 : 1237)) * 31;
        String str = this.e;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        ProductDetails.PricingPhase pricingPhase = this.f;
        int iO = wgd.o((this.h.hashCode() + ((this.g.hashCode() + ((iHashCode2 + (pricingPhase == null ? 0 : pricingPhase.hashCode())) * 31)) * 31)) * 31, 31, this.i);
        kv7 kv7Var = this.j;
        int iHashCode3 = (iO + (kv7Var == null ? 0 : kv7Var.hashCode())) * 31;
        String str2 = this.k;
        return iHashCode3 + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("ResolvedMembershipPlan(productId=", this.a, ", offerToken=", this.b, ", pricingPhase=");
        sbU.append(this.c);
        sbU.append(", trialEligible=");
        sbU.append(this.d);
        sbU.append(", trialPeriod=");
        sbU.append(this.e);
        sbU.append(", introductoryOfferPricingPhase=");
        sbU.append(this.f);
        sbU.append(", membershipType=");
        sbU.append(this.g);
        sbU.append(", billingPeriod=");
        sbU.append(this.h);
        sbU.append(", membershipPlanId=");
        sbU.append(this.i);
        sbU.append(", crossoutPlan=");
        sbU.append(this.j);
        sbU.append(", couponCode=");
        return ka1.v(sbU, this.k, ")");
    }
}
