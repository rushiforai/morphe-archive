package bt;

import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.ui.core.elements.NameSpec;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;
import kw.i2;
import ou.n0;

/* loaded from: classes4.dex */
public final class b extends d {
    public b() {
        super("Name", 0);
    }

    @Override // bt.d
    public final n0 a(PaymentSheet$BillingDetailsCollectionConfiguration configuration) {
        Intrinsics.g(configuration, "configuration");
        return configuration.f44513a;
    }

    @Override // bt.d
    public final i2 b(LinkedHashMap linkedHashMap) {
        return new NameSpec().f45325c.a(linkedHashMap);
    }
}
