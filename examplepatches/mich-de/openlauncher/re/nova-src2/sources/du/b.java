package du;

import android.content.Context;
import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import jt.a1;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final Context f49524a;

    public b(Context context) {
        Intrinsics.g(context, "context");
        this.f49524a = context;
    }

    public final String a(StripeIntent intent, int i5) {
        PaymentMethod paymentMethod;
        PaymentMethod.Type type;
        Intrinsics.g(intent, "intent");
        Context context = this.f49524a;
        if (i5 == 4) {
            return context.getResources().getString(2132019783);
        }
        PaymentMethod n = intent.getN();
        if (((n != null ? n.f43573e : null) != PaymentMethod.Type.f43639i || !(intent.getF43553w() instanceof StripeIntent.NextActionData.SdkData.Use3DS2)) && (intent.getF43547q() == StripeIntent.Status.f43984f || intent.getF43547q() == StripeIntent.Status.f43983e)) {
            if (intent instanceof PaymentIntent) {
                PaymentIntent paymentIntent = (PaymentIntent) intent;
                StripeIntent.Status status = paymentIntent.f43547q;
                PaymentIntent.Error error = paymentIntent.f43549s;
                if (status != StripeIntent.Status.f43983e || ((paymentMethod = paymentIntent.n) != null && (type = paymentMethod.f43573e) != null && type.f43656b)) {
                    if (!Intrinsics.b(error != null ? error.f43557b : null, "payment_intent_authentication_failure")) {
                        if (error != null) {
                            Intrinsics.g(context, "context");
                            return a1.a(context, error.f43560e, error.f43557b, error.f43558c);
                        }
                    }
                }
                return context.getResources().getString(2132019782);
            }
            if (!(intent instanceof SetupIntent)) {
                throw new NoWhenBranchMatchedException();
            }
            SetupIntent.Error error2 = ((SetupIntent) intent).f43775m;
            if (Intrinsics.b(error2 != null ? error2.f43779a : null, "setup_intent_authentication_failure")) {
                return context.getResources().getString(2132019782);
            }
            if (error2 != null) {
                Intrinsics.g(context, "context");
                return a1.a(context, error2.f43782d, error2.f43779a, error2.f43780b);
            }
        }
        return null;
    }
}
