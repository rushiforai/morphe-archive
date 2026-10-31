package gv;

import com.stripe.android.paymentsheet.PaymentSheet$CustomerAccessType;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j implements k {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$CustomerConfiguration f57877a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$CustomerAccessType.LegacyCustomerEphemeralKey f57878b;

    /* renamed from: c, reason: collision with root package name */
    public final String f57879c;

    /* renamed from: d, reason: collision with root package name */
    public final String f57880d;

    public j(PaymentSheet$CustomerConfiguration customerConfig, PaymentSheet$CustomerAccessType.LegacyCustomerEphemeralKey legacyCustomerEphemeralKey) {
        Intrinsics.g(customerConfig, "customerConfig");
        this.f57877a = customerConfig;
        this.f57878b = legacyCustomerEphemeralKey;
        this.f57879c = customerConfig.f44572a;
        this.f57880d = legacyCustomerEphemeralKey.f44571a;
    }

    @Override // gv.k
    public final String a() {
        return this.f57880d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f57877a, jVar.f57877a) && Intrinsics.b(this.f57878b, jVar.f57878b);
    }

    @Override // gv.k
    public final String getId() {
        return this.f57879c;
    }

    public final int hashCode() {
        return this.f57878b.f44571a.hashCode() + (this.f57877a.hashCode() * 31);
    }

    public final String toString() {
        return "Legacy(customerConfig=" + this.f57877a + ", accessType=" + this.f57878b + ")";
    }
}
