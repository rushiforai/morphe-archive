package yu;

import a70.d;
import b.c0;
import b.c9;
import b70.k;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodSaveConsentBehavior;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import com.stripe.android.ui.core.Amount;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;
import uu.b;
import wu.c;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f97646a;

    /* renamed from: b, reason: collision with root package name */
    public final CardBrandChoiceEligibility f97647b;

    /* renamed from: c, reason: collision with root package name */
    public final String f97648c;

    /* renamed from: d, reason: collision with root package name */
    public final Amount f97649d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentSheet$BillingDetails f97650e;

    /* renamed from: f, reason: collision with root package name */
    public final AddressDetails f97651f;

    /* renamed from: g, reason: collision with root package name */
    public final PaymentMethodSaveConsentBehavior f97652g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f97653h;

    /* renamed from: i, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f97654i;

    /* renamed from: j, reason: collision with root package name */
    public final d f97655j;

    public a(String paymentMethodCode, CardBrandChoiceEligibility cbcEligibility, String merchantName, Amount amount, PaymentSheet$BillingDetails paymentSheet$BillingDetails, AddressDetails addressDetails, PaymentMethodSaveConsentBehavior paymentMethodSaveConsentBehavior, boolean z11, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration) {
        Intrinsics.g(paymentMethodCode, "paymentMethodCode");
        Intrinsics.g(cbcEligibility, "cbcEligibility");
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(paymentMethodSaveConsentBehavior, "paymentMethodSaveConsentBehavior");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        this.f97646a = paymentMethodCode;
        this.f97647b = cbcEligibility;
        this.f97648c = merchantName;
        this.f97649d = amount;
        this.f97650e = paymentSheet$BillingDetails;
        this.f97651f = addressDetails;
        this.f97652g = paymentMethodSaveConsentBehavior;
        this.f97653h = z11;
        this.f97654i = billingDetailsCollectionConfiguration;
        this.f97655j = LazyKt.a(new xu.d(this, 7));
    }

    public final b a() {
        Map map = (Map) this.f97655j.getValue();
        LinkedHashMap linkedHashMap = new LinkedHashMap(k.d0(map.size()));
        for (Map.Entry entry : map.entrySet()) {
            linkedHashMap.put(entry.getKey(), new pw.a((String) entry.getValue(), true));
        }
        return new b(linkedHashMap, c.f94691d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f97646a, aVar.f97646a) && Intrinsics.b(this.f97647b, aVar.f97647b) && Intrinsics.b(this.f97648c, aVar.f97648c) && Intrinsics.b(this.f97649d, aVar.f97649d) && Intrinsics.b(this.f97650e, aVar.f97650e) && Intrinsics.b(this.f97651f, aVar.f97651f) && Intrinsics.b(this.f97652g, aVar.f97652g) && this.f97653h == aVar.f97653h && Intrinsics.b(this.f97654i, aVar.f97654i);
    }

    public final int hashCode() {
        int iE = c0.e((this.f97647b.hashCode() + (this.f97646a.hashCode() * 31)) * 31, 31, this.f97648c);
        Amount amount = this.f97649d;
        int iHashCode = (iE + (amount == null ? 0 : amount.hashCode())) * 31;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f97650e;
        int iHashCode2 = (iHashCode + (paymentSheet$BillingDetails == null ? 0 : paymentSheet$BillingDetails.hashCode())) * 31;
        AddressDetails addressDetails = this.f97651f;
        return this.f97654i.hashCode() + c9.f((this.f97652g.hashCode() + ((iHashCode2 + (addressDetails != null ? addressDetails.hashCode() : 0)) * 31)) * 31, 31, this.f97653h);
    }

    public final String toString() {
        return "FormArguments(paymentMethodCode=" + this.f97646a + ", cbcEligibility=" + this.f97647b + ", merchantName=" + this.f97648c + ", amount=" + this.f97649d + ", billingDetails=" + this.f97650e + ", shippingDetails=" + this.f97651f + ", paymentMethodSaveConsentBehavior=" + this.f97652g + ", hasIntentToSetup=" + this.f97653h + ", billingDetailsCollectionConfiguration=" + this.f97654i + ")";
    }
}
