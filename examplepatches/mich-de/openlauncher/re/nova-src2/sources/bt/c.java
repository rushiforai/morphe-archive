package bt;

import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.ui.core.elements.PhoneSpec;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;
import kw.i2;
import ou.n0;

/* loaded from: classes4.dex */
public final class c extends d {
    public c() {
        super("Phone", 1);
    }

    @Override // bt.d
    public final n0 a(PaymentSheet$BillingDetailsCollectionConfiguration configuration) {
        Intrinsics.g(configuration, "configuration");
        return configuration.f44514b;
    }

    @Override // bt.d
    public final i2 b(LinkedHashMap linkedHashMap) {
        return new PhoneSpec().a(linkedHashMap);
    }
}
