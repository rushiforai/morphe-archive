package gv;

import com.stripe.android.common.model.CommonConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$Configuration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e0 {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$Configuration f57858a;

    /* renamed from: b, reason: collision with root package name */
    public final CommonConfiguration f57859b;

    public e0(PaymentSheet$Configuration configuration) {
        Intrinsics.g(configuration, "configuration");
        this.f57858a = configuration;
        this.f57859b = p6.p0.d(configuration);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e0) && Intrinsics.b(this.f57858a, ((e0) obj).f57858a);
    }

    public final int hashCode() {
        return this.f57858a.hashCode();
    }

    public final String toString() {
        return "PaymentSheet(configuration=" + this.f57858a + ")";
    }
}
