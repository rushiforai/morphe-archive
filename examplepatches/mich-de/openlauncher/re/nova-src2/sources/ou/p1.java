package ou;

import com.stripe.android.model.LinkPaymentDetails;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p1 implements t1 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkPaymentDetails f80956a;

    public p1(LinkPaymentDetails paymentDetails) {
        Intrinsics.g(paymentDetails, "paymentDetails");
        this.f80956a = paymentDetails;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof p1) && Intrinsics.b(this.f80956a, ((p1) obj).f80956a);
    }

    public final int hashCode() {
        return this.f80956a.hashCode();
    }

    public final String toString() {
        return "Link(paymentDetails=" + this.f80956a + ")";
    }
}
