package pu;

import com.stripe.android.paymentsheet.PaymentSheet$Address;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w implements x {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$Address f83095a;

    public w(PaymentSheet$Address paymentSheet$Address) {
        this.f83095a = paymentSheet$Address;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof w) && Intrinsics.b(this.f83095a, ((w) obj).f83095a);
    }

    public final int hashCode() {
        PaymentSheet$Address paymentSheet$Address = this.f83095a;
        if (paymentSheet$Address == null) {
            return 0;
        }
        return paymentSheet$Address.hashCode();
    }

    public final String toString() {
        return "GoBack(address=" + this.f83095a + ")";
    }
}
