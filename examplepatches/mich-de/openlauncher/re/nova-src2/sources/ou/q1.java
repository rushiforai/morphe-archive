package ou;

import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q1 implements t1 {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethod.SepaDebit f80965a;

    public q1(PaymentMethod.SepaDebit sepaDebit) {
        Intrinsics.g(sepaDebit, "sepaDebit");
        this.f80965a = sepaDebit;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof q1) && Intrinsics.b(this.f80965a, ((q1) obj).f80965a);
    }

    public final int hashCode() {
        return this.f80965a.hashCode();
    }

    public final String toString() {
        return "SepaDebit(sepaDebit=" + this.f80965a + ")";
    }
}
