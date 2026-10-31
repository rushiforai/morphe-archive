package mt;

import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Args;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g implements i {

    /* renamed from: a, reason: collision with root package name */
    public final ConfirmationHandler$Option f76753a;

    /* renamed from: b, reason: collision with root package name */
    public final ConfirmationHandler$Args f76754b;

    public g(PaymentMethodConfirmationOption confirmationOption, ConfirmationHandler$Args arguments) {
        Intrinsics.g(confirmationOption, "confirmationOption");
        Intrinsics.g(arguments, "arguments");
        this.f76753a = confirmationOption;
        this.f76754b = arguments;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f76753a, gVar.f76753a) && Intrinsics.b(this.f76754b, gVar.f76754b);
    }

    public final int hashCode() {
        return this.f76754b.hashCode() + (this.f76753a.hashCode() * 31);
    }

    public final String toString() {
        return "NextStep(confirmationOption=" + this.f76753a + ", arguments=" + this.f76754b + ")";
    }
}
