package ou;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.LinkPaymentDetails;
import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i {
    public static j a(ResolvableString displayName, PaymentMethod paymentMethod, boolean z11, boolean z12) {
        Intrinsics.g(displayName, "displayName");
        Intrinsics.g(paymentMethod, "paymentMethod");
        LinkPaymentDetails linkPaymentDetails = paymentMethod.f43584r;
        PaymentMethod.Type type = paymentMethod.f43573e;
        int i5 = type == null ? -1 : h.f80896a[type.ordinal()];
        t1 o1Var = null;
        if (i5 != 1) {
            if (i5 == 2) {
                PaymentMethod.USBankAccount uSBankAccount = paymentMethod.f43583q;
                if (uSBankAccount != null) {
                    o1Var = new r1(uSBankAccount);
                }
            } else if (i5 == 3) {
                PaymentMethod.SepaDebit sepaDebit = paymentMethod.f43580l;
                if (sepaDebit != null) {
                    o1Var = new q1(sepaDebit);
                }
            } else if (i5 == 4 && linkPaymentDetails != null) {
                o1Var = new p1(linkPaymentDetails);
            }
        } else if (linkPaymentDetails != null) {
            o1Var = new p1(linkPaymentDetails);
        } else {
            PaymentMethod.Card card = paymentMethod.f43576h;
            if (card != null) {
                o1Var = new o1(card, paymentMethod.f43574f);
            }
        }
        if (o1Var == null) {
            o1Var = s1.f80974a;
        }
        return new j(displayName, paymentMethod, o1Var, z11, z12);
    }

    public static /* synthetic */ j b(ResolvableString resolvableString, PaymentMethod paymentMethod, boolean z11, int i5) {
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        return a(resolvableString, paymentMethod, z11, (i5 & 8) == 0);
    }
}
