package wt;

import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodConfirmationOption f94670a;

    public c(PaymentMethodConfirmationOption nextConfirmationOption) {
        Intrinsics.g(nextConfirmationOption, "nextConfirmationOption");
        this.f94670a = nextConfirmationOption;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Intrinsics.b(this.f94670a, ((c) obj).f94670a);
    }

    public final int hashCode() {
        return this.f94670a.hashCode();
    }

    public final String toString() {
        return "LauncherArguments(nextConfirmationOption=" + this.f94670a + ")";
    }
}
