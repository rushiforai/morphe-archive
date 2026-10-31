package ou;

import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r1 implements t1 {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethod.USBankAccount f80971a;

    public r1(PaymentMethod.USBankAccount usBankAccount) {
        Intrinsics.g(usBankAccount, "usBankAccount");
        this.f80971a = usBankAccount;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof r1) && Intrinsics.b(this.f80971a, ((r1) obj).f80971a);
    }

    public final int hashCode() {
        return this.f80971a.hashCode();
    }

    public final String toString() {
        return "USBankAccount(usBankAccount=" + this.f80971a + ")";
    }
}
