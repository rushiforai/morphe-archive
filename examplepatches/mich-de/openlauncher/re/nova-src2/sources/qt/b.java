package qt;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f84318a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$CustomPaymentMethod f84319b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentMethod.BillingDetails f84320c;

    public b(String paymentElementCallbackIdentifier, PaymentSheet$CustomPaymentMethod type, PaymentMethod.BillingDetails billingDetails) {
        Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
        Intrinsics.g(type, "type");
        this.f84318a = paymentElementCallbackIdentifier;
        this.f84319b = type;
        this.f84320c = billingDetails;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f84318a, bVar.f84318a) && Intrinsics.b(this.f84319b, bVar.f84319b) && Intrinsics.b(this.f84320c, bVar.f84320c);
    }

    public final int hashCode() {
        int iHashCode = (this.f84319b.hashCode() + (this.f84318a.hashCode() * 31)) * 31;
        PaymentMethod.BillingDetails billingDetails = this.f84320c;
        return iHashCode + (billingDetails == null ? 0 : billingDetails.hashCode());
    }

    public final String toString() {
        return "CustomPaymentMethodInput(paymentElementCallbackIdentifier=" + this.f84318a + ", type=" + this.f84319b + ", billingDetails=" + this.f84320c + ")";
    }
}
