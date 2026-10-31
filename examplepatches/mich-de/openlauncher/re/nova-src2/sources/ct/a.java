package ct;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a extends i {
    public a() {
        super("FinancialConnectionsSdk", 4);
    }

    @Override // ct.i
    public final boolean a(PaymentMethodMetadata paymentMethodMetadata, String code) {
        Intrinsics.g(code, "code");
        return paymentMethodMetadata.f43112w != null;
    }
}
