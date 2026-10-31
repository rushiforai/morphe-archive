package xt;

import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodConfirmationOption f96301a;

    public b(PaymentMethodConfirmationOption nextConfirmationOption) {
        Intrinsics.g(nextConfirmationOption, "nextConfirmationOption");
        this.f96301a = nextConfirmationOption;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b) && Intrinsics.b(this.f96301a, ((b) obj).f96301a);
    }

    public final int hashCode() {
        return this.f96301a.hashCode();
    }

    public final String toString() {
        return "LauncherArguments(nextConfirmationOption=" + this.f96301a + ")";
    }
}
