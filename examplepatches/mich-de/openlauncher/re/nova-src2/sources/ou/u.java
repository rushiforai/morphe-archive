package ou;

import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u implements x {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSelection.CustomPaymentMethod f80983a;

    public u(PaymentSelection.CustomPaymentMethod paymentSelection) {
        Intrinsics.g(paymentSelection, "paymentSelection");
        this.f80983a = paymentSelection;
    }

    @Override // ou.x
    public final PaymentMethodExtraParams a() {
        return null;
    }

    @Override // ou.x
    public final PaymentSelection b() {
        return this.f80983a;
    }

    @Override // ou.x
    public final PaymentMethodOptionsParams c() {
        return null;
    }

    @Override // ou.x
    public final String d() {
        return this.f80983a.f44799a;
    }

    @Override // ou.x
    public final PaymentMethodCreateParams e() {
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof u) && Intrinsics.b(this.f80983a, ((u) obj).f80983a);
    }

    @Override // ou.x
    public final String getType() {
        return this.f80983a.f44799a;
    }

    public final int hashCode() {
        return this.f80983a.hashCode();
    }

    public final String toString() {
        return "Custom(paymentSelection=" + this.f80983a + ")";
    }
}
