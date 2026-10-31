package ku;

import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends h {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentFlowResult$Unvalidated f72234a;

    public e(PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated) {
        this.f72234a = paymentFlowResult$Unvalidated;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && Intrinsics.b(this.f72234a, ((e) obj).f72234a);
    }

    public final int hashCode() {
        return this.f72234a.hashCode();
    }

    public final String toString() {
        return "Complete(result=" + this.f72234a + ")";
    }
}
