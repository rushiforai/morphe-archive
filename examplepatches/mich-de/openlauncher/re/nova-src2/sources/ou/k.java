package ou;

import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final String f80916a;

    /* renamed from: b, reason: collision with root package name */
    public final String f80917b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentMethod.BillingDetails f80918c;

    public k(String paymentElementCallbackIdentifier, String type, PaymentMethod.BillingDetails billingDetails) {
        Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
        Intrinsics.g(type, "type");
        this.f80916a = paymentElementCallbackIdentifier;
        this.f80917b = type;
        this.f80918c = billingDetails;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Intrinsics.b(this.f80916a, kVar.f80916a) && Intrinsics.b(this.f80917b, kVar.f80917b) && Intrinsics.b(this.f80918c, kVar.f80918c);
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f80916a.hashCode() * 31, 31, this.f80917b);
        PaymentMethod.BillingDetails billingDetails = this.f80918c;
        return iE + (billingDetails == null ? 0 : billingDetails.hashCode());
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("ExternalPaymentMethodInput(paymentElementCallbackIdentifier=", this.f80916a, ", type=", this.f80917b, ", billingDetails=");
        sbW.append(this.f80918c);
        sbW.append(")");
        return sbW.toString();
    }
}
