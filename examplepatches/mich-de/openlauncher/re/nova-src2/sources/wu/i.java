package wu;

import com.stripe.android.model.PaymentIntent;
import com.stripe.android.model.SetupIntent;
import com.stripe.android.model.StripeIntent;
import ft.n0;
import gv.k0;
import gv.l0;
import gv.o0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class i {
    /* JADX WARN: Removed duplicated region for block: B:11:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x006e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(StripeIntent stripeIntent) throws Throwable {
        Throwable o0Var;
        n0 n0Var;
        Intrinsics.g(stripeIntent, "stripeIntent");
        boolean z11 = stripeIntent instanceof PaymentIntent;
        if (z11 && (n0Var = ((PaymentIntent) stripeIntent).f43540h) != n0.f55983c) {
            o0Var = new k0(n0Var);
        } else if (z11) {
            StripeIntent.Status status = ((PaymentIntent) stripeIntent).f43547q;
            if (b70.g.O0(kotlin.collections.c.f1(new StripeIntent.Status[]{StripeIntent.Status.f43981c, StripeIntent.Status.f43985g, StripeIntent.Status.f43986h}), status)) {
                o0Var = new gv.n0(status);
            } else if (z11) {
                PaymentIntent paymentIntent = (PaymentIntent) stripeIntent;
                if (paymentIntent.f43535c == null || paymentIntent.f43543k == null) {
                    o0Var = l0.f57891a;
                } else if (stripeIntent instanceof SetupIntent) {
                    StripeIntent.Status status2 = ((SetupIntent) stripeIntent).f43773k;
                    o0Var = b70.g.O0(kotlin.collections.c.f1(new StripeIntent.Status[]{StripeIntent.Status.f43981c, StripeIntent.Status.f43985g}), status2) ? new o0(status2) : null;
                }
            }
        }
        if (o0Var != null) {
            throw o0Var;
        }
    }
}
