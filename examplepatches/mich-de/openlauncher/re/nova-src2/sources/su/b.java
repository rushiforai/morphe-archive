package su;

import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import cv.j;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class b implements a {
    public final boolean a(StripeIntent stripeIntent) {
        JSONObject jSONObjectOptJSONObject;
        Intrinsics.g(stripeIntent, "stripeIntent");
        boolean z11 = stripeIntent instanceof PaymentIntent;
        if (!z11) {
            if (stripeIntent instanceof SetupIntent) {
                return false;
            }
            throw new NoWhenBranchMatchedException();
        }
        if (z11) {
            String str = ((PaymentIntent) stripeIntent).f43554x;
            if (str != null && (jSONObjectOptJSONObject = new JSONObject(str).optJSONObject("card")) != null) {
                return jSONObjectOptJSONObject.optBoolean("require_cvc_recollection");
            }
        } else if (!(stripeIntent instanceof SetupIntent)) {
            throw new NoWhenBranchMatchedException();
        }
        return false;
    }

    public final void b(PaymentMethod paymentMethod, Function1 function1) {
        Intrinsics.g(paymentMethod, "paymentMethod");
        PaymentMethod.Card card = paymentMethod.f43576h;
        j jVar = card != null ? new j(card.f43613h, card.f43606a) : null;
        if (jVar == null) {
            throw new IllegalStateException("unable to create CvcRecollectionData");
        }
        function1.invoke(jVar);
    }

    public final boolean c(StripeIntent stripeIntent, PaymentMethod paymentMethod) {
        Intrinsics.g(stripeIntent, "stripeIntent");
        Intrinsics.g(paymentMethod, "paymentMethod");
        return paymentMethod.f43573e == PaymentMethod.Type.f43639i && a(stripeIntent);
    }
}
