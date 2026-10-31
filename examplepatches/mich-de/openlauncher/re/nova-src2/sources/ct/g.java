package ct;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g extends i {
    public g() {
        super("UnsupportedForSetup", 1);
    }

    @Override // ct.i
    public final boolean a(PaymentMethodMetadata paymentMethodMetadata, String code) {
        Intrinsics.g(code, "code");
        return !paymentMethodMetadata.m(code);
    }
}
