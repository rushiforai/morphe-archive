package ju;

import com.stripe.android.PaymentRelayStarter$Args;
import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import dq.p;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends e {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f69936a;

    public c(Function1 paymentRelayStarterFactory) {
        Intrinsics.g(paymentRelayStarterFactory, "paymentRelayStarterFactory");
        this.f69936a = paymentRelayStarterFactory;
    }

    @Override // ju.e
    public final Object d(ww.a aVar, Object obj, ApiRequest$Options apiRequest$Options, d dVar) {
        Object setupIntentArgs;
        StripeIntent stripeIntent = (StripeIntent) obj;
        String str = apiRequest$Options.f42577b;
        Intrinsics.g(stripeIntent, "stripeIntent");
        if (stripeIntent instanceof PaymentIntent) {
            setupIntentArgs = new PaymentRelayStarter$Args.PaymentIntentArgs((PaymentIntent) stripeIntent, str);
        } else {
            if (!(stripeIntent instanceof SetupIntent)) {
                throw new NoWhenBranchMatchedException();
            }
            setupIntentArgs = new PaymentRelayStarter$Args.SetupIntentArgs((SetupIntent) stripeIntent, str);
        }
        ((p) this.f69936a.invoke(aVar)).a(setupIntentArgs);
        return Unit.f71706a;
    }
}
