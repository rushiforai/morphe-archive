package jv;

import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z0 implements c1 {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethod f70201a;

    public z0(PaymentMethod savedPaymentMethod) {
        Intrinsics.g(savedPaymentMethod, "savedPaymentMethod");
        this.f70201a = savedPaymentMethod;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof z0) && Intrinsics.b(this.f70201a, ((z0) obj).f70201a);
    }

    public final int hashCode() {
        return this.f70201a.hashCode();
    }

    public final String toString() {
        return "SavedPaymentMethodSelected(savedPaymentMethod=" + this.f70201a + ")";
    }
}
