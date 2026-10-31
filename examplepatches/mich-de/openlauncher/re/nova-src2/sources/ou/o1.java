package ou;

import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o1 implements t1 {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethod.Card f80949a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethod.BillingDetails f80950b;

    public o1(PaymentMethod.Card card, PaymentMethod.BillingDetails billingDetails) {
        Intrinsics.g(card, "card");
        this.f80949a = card;
        this.f80950b = billingDetails;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o1)) {
            return false;
        }
        o1 o1Var = (o1) obj;
        return Intrinsics.b(this.f80949a, o1Var.f80949a) && Intrinsics.b(this.f80950b, o1Var.f80950b);
    }

    public final int hashCode() {
        int iHashCode = this.f80949a.hashCode() * 31;
        PaymentMethod.BillingDetails billingDetails = this.f80950b;
        return iHashCode + (billingDetails == null ? 0 : billingDetails.hashCode());
    }

    public final String toString() {
        return "Card(card=" + this.f80949a + ", billingDetails=" + this.f80950b + ")";
    }
}
