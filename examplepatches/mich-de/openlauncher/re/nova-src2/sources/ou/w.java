package ou;

import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w implements x {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSelection.New f80996a;

    public w(PaymentSelection.New paymentSelection) {
        Intrinsics.g(paymentSelection, "paymentSelection");
        this.f80996a = paymentSelection;
    }

    @Override // ou.x
    public final PaymentMethodExtraParams a() {
        return this.f80996a.getF44838i();
    }

    @Override // ou.x
    public final PaymentSelection b() {
        return this.f80996a;
    }

    @Override // ou.x
    public final PaymentMethodOptionsParams c() {
        return this.f80996a.getF44837h();
    }

    @Override // ou.x
    public final String d() {
        PaymentSelection.New r02 = this.f80996a;
        if ((r02 instanceof PaymentSelection.New.Card) || (r02 instanceof PaymentSelection.New.USBankAccount) || (r02 instanceof PaymentSelection.New.GenericPaymentMethod)) {
            return r02.getF44835f().f43680a;
        }
        throw new NoWhenBranchMatchedException();
    }

    @Override // ou.x
    public final PaymentMethodCreateParams e() {
        return this.f80996a.getF44835f();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof w) && Intrinsics.b(this.f80996a, ((w) obj).f80996a);
    }

    @Override // ou.x
    public final String getType() {
        return this.f80996a.getF44835f().f43680a;
    }

    public final int hashCode() {
        return this.f80996a.hashCode();
    }

    public final String toString() {
        return "New(paymentSelection=" + this.f80996a + ")";
    }
}
