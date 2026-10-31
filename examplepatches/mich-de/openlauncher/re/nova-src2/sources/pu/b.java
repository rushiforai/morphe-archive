package pu;

import com.stripe.android.model.Address;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import com.stripe.android.paymentsheet.PaymentSheet$Address;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kw.z0;

/* loaded from: classes4.dex */
public abstract class b {
    public static final ConfirmPaymentIntentParams.Shipping a(AddressDetails addressDetails) {
        String str;
        Intrinsics.g(addressDetails, "<this>");
        PaymentSheet$Address paymentSheet$Address = addressDetails.f44679b;
        String str2 = addressDetails.f44678a;
        if (str2 == null) {
            str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str3 = str2;
        String str4 = paymentSheet$Address != null ? paymentSheet$Address.f44449c : null;
        String str5 = paymentSheet$Address != null ? paymentSheet$Address.f44450d : null;
        String str6 = paymentSheet$Address != null ? paymentSheet$Address.f44447a : null;
        String str7 = paymentSheet$Address != null ? paymentSheet$Address.f44452f : null;
        String str8 = paymentSheet$Address != null ? paymentSheet$Address.f44448b : null;
        if (str8 != null) {
            String upperCase = str8.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase, "toUpperCase(...)");
            str = upperCase;
        } else {
            str = null;
        }
        return new ConfirmPaymentIntentParams.Shipping(new Address(str6, str, str4, str5, paymentSheet$Address != null ? paymentSheet$Address.f44451e : null, str7), str3, null, addressDetails.f44680c, null);
    }

    public static final Map b(PaymentSheet$Address paymentSheet$Address) {
        Intrinsics.g(paymentSheet$Address, "<this>");
        z0 z0Var = IdentifierSpec.Companion;
        z0Var.getClass();
        Pair pair = new Pair(IdentifierSpec.o, paymentSheet$Address.f44449c);
        z0Var.getClass();
        Pair pair2 = new Pair(IdentifierSpec.f45373p, paymentSheet$Address.f44450d);
        z0Var.getClass();
        Pair pair3 = new Pair(IdentifierSpec.f45374q, paymentSheet$Address.f44447a);
        z0Var.getClass();
        Pair pair4 = new Pair(IdentifierSpec.f45378u, paymentSheet$Address.f44452f);
        z0Var.getClass();
        Pair pair5 = new Pair(IdentifierSpec.f45376s, paymentSheet$Address.f44451e);
        z0Var.getClass();
        return MapsKt.j0(pair, pair2, pair3, pair4, pair5, new Pair(IdentifierSpec.f45379v, paymentSheet$Address.f44448b));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r14v4, types: [java.util.Map] */
    public static final Map c(AddressDetails addressDetails, PaymentSheet$BillingDetails paymentSheet$BillingDetails) {
        PaymentSheet$Address paymentSheet$Address;
        Intrinsics.g(addressDetails, "<this>");
        Boolean bool = addressDetails.f44681d;
        PaymentSheet$Address paymentSheet$Address2 = addressDetails.f44679b;
        b70.h hVar = b70.h.f17594a;
        if (paymentSheet$BillingDetails != null && paymentSheet$BillingDetails.b()) {
            return hVar;
        }
        IdentifierSpec.Companion.getClass();
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(MapsKt.j0(new Pair(IdentifierSpec.f45364e, addressDetails.f44678a), new Pair(IdentifierSpec.o, paymentSheet$Address2 != null ? paymentSheet$Address2.f44449c : null), new Pair(IdentifierSpec.f45373p, paymentSheet$Address2 != null ? paymentSheet$Address2.f44450d : null), new Pair(IdentifierSpec.f45374q, paymentSheet$Address2 != null ? paymentSheet$Address2.f44447a : null), new Pair(IdentifierSpec.f45378u, paymentSheet$Address2 != null ? paymentSheet$Address2.f44452f : null), new Pair(IdentifierSpec.f45376s, paymentSheet$Address2 != null ? paymentSheet$Address2.f44451e : null), new Pair(IdentifierSpec.f45379v, paymentSheet$Address2 != null ? paymentSheet$Address2.f44448b : null), new Pair(IdentifierSpec.n, addressDetails.f44680c)), (paymentSheet$BillingDetails == null || (paymentSheet$Address = paymentSheet$BillingDetails.f44509a) == null) ? hVar : b(paymentSheet$Address));
        b70.h hVarE0 = bool != null ? b70.k.e0(new Pair(IdentifierSpec.f45382y, bool != null ? bool.toString() : null)) : null;
        if (hVarE0 != null) {
            hVar = hVarE0;
        }
        return MapsKt.m0(linkedHashMapM0, hVar);
    }
}
