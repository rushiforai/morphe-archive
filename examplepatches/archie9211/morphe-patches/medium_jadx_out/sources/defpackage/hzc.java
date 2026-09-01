package defpackage;

import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hzc implements nzc {
    public final BillingPeriod a;
    public final String b;
    public final String c;

    public hzc(BillingPeriod billingPeriod, String str, String str2) {
        this.a = billingPeriod;
        this.b = str;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hzc)) {
            return false;
        }
        hzc hzcVar = (hzc) obj;
        return this.a == hzcVar.a && this.b.equals(hzcVar.b) && this.c.equals(hzcVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("FreeTrial(activeBillingPeriod=");
        sb.append(this.a);
        sb.append(", regularMembershipPrice=");
        sb.append(this.b);
        sb.append(", premiumMembershipPrice=");
        return ka1.v(sb, this.c, ")");
    }
}
