package pu;

import com.stripe.android.paymentsheet.PaymentSheet$Address;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v implements x {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$Address f83094a;

    public v(PaymentSheet$Address paymentSheet$Address) {
        this.f83094a = paymentSheet$Address;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v) && Intrinsics.b(this.f83094a, ((v) obj).f83094a);
    }

    public final int hashCode() {
        PaymentSheet$Address paymentSheet$Address = this.f83094a;
        if (paymentSheet$Address == null) {
            return 0;
        }
        return paymentSheet$Address.hashCode();
    }

    public final String toString() {
        return "EnterManually(address=" + this.f83094a + ")";
    }
}
