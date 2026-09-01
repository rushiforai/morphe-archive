package defpackage;

import com.medium.android.core.models.BillingPeriod;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mzc implements nzc {
    public final BillingPeriod a;

    public mzc(BillingPeriod billingPeriod) {
        this.a = billingPeriod;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof mzc) && this.a == ((mzc) obj).a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Regular(activeBillingPeriod=" + this.a + ")";
    }
}
