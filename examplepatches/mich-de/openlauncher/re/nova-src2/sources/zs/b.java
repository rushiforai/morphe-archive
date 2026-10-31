package zs;

import com.stripe.android.core.model.CountryCode;
import com.stripe.android.link.model.LinkAccount;
import com.stripe.android.model.ConsumerPaymentDetails;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import cr.d;
import kotlin.jvm.internal.Intrinsics;
import ou.m0;

/* loaded from: classes4.dex */
public abstract class b {
    public static final boolean a(ConsumerPaymentDetails.PaymentDetails paymentDetails, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsConfig, LinkAccount linkAccount) {
        ConsumerPaymentDetails.BillingAddress f43300f;
        Intrinsics.g(paymentDetails, "<this>");
        Intrinsics.g(billingDetailsConfig, "billingDetailsConfig");
        Intrinsics.g(linkAccount, "linkAccount");
        if (!(paymentDetails instanceof ConsumerPaymentDetails.BankAccount) && !(paymentDetails instanceof ConsumerPaymentDetails.Card)) {
            return true;
        }
        if (billingDetailsConfig.f44516d == m0.f80933c && ((f43300f = paymentDetails.getF43300f()) == null || f43300f.f43280b == null || f43300f.f43283e == null || f43300f.f43284f == null || f43300f.f43285g == null)) {
            return false;
        }
        if (billingDetailsConfig.i() && linkAccount.b() == null) {
            return false;
        }
        if (!billingDetailsConfig.e()) {
            return true;
        }
        ConsumerPaymentDetails.BillingAddress f43300f2 = paymentDetails.getF43300f();
        return (f43300f2 != null ? f43300f2.f43279a : null) != null;
    }

    public static final ConsumerPaymentDetails.BillingAddress b(PaymentSheet$BillingDetails paymentSheet$BillingDetails) {
        PaymentSheet$Address paymentSheet$Address = paymentSheet$BillingDetails.f44509a;
        CountryCode countryCodeA = null;
        if (paymentSheet$Address == null) {
            return null;
        }
        String str = paymentSheet$BillingDetails.f44511c;
        String str2 = paymentSheet$Address.f44449c;
        String str3 = paymentSheet$Address.f44450d;
        String str4 = paymentSheet$Address.f44447a;
        String str5 = paymentSheet$Address.f44452f;
        String str6 = paymentSheet$Address.f44451e;
        String str7 = paymentSheet$Address.f44448b;
        if (str7 != null) {
            CountryCode.Companion.getClass();
            countryCodeA = d.a(str7);
        }
        return new ConsumerPaymentDetails.BillingAddress(str, str2, str3, str5, str4, str6, countryCodeA);
    }
}
