package ou;

import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v implements x {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSelection.ExternalPaymentMethod f80990a;

    public v(PaymentSelection.ExternalPaymentMethod paymentSelection) {
        Intrinsics.g(paymentSelection, "paymentSelection");
        this.f80990a = paymentSelection;
    }

    @Override // ou.x
    public final PaymentMethodExtraParams a() {
        return null;
    }

    @Override // ou.x
    public final PaymentSelection b() {
        return this.f80990a;
    }

    @Override // ou.x
    public final PaymentMethodOptionsParams c() {
        return null;
    }

    @Override // ou.x
    public final String d() {
        return this.f80990a.f44804a;
    }

    @Override // ou.x
    public final PaymentMethodCreateParams e() {
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v) && Intrinsics.b(this.f80990a, ((v) obj).f80990a);
    }

    @Override // ou.x
    public final String getType() {
        return this.f80990a.f44804a;
    }

    public final int hashCode() {
        return this.f80990a.hashCode();
    }

    public final String toString() {
        return "External(paymentSelection=" + this.f80990a + ")";
    }
}
