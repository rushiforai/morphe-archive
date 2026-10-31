package mt;

import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class y implements a0 {

    /* renamed from: a, reason: collision with root package name */
    public final ConfirmationHandler$Option f76812a;

    public y(ConfirmationHandler$Option option) {
        Intrinsics.g(option, "option");
        this.f76812a = option;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof y) && Intrinsics.b(this.f76812a, ((y) obj).f76812a);
    }

    public final int hashCode() {
        return this.f76812a.hashCode();
    }

    public final String toString() {
        return "Confirming(option=" + this.f76812a + ")";
    }
}
