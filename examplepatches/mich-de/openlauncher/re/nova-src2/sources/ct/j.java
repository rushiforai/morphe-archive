package ct;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.model.PaymentMethod;
import java.util.Set;

/* loaded from: classes4.dex */
public interface j {
    Set a(boolean z11);

    u b();

    boolean c(PaymentMethodMetadata paymentMethodMetadata);

    boolean d();

    PaymentMethod.Type getType();
}
