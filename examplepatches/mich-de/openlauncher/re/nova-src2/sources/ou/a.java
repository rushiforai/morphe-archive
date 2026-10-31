package ou;

import com.stripe.android.model.PaymentMethod;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f80786a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f80787b;

    /* renamed from: c, reason: collision with root package name */
    public final ft.b f80788c;

    /* renamed from: d, reason: collision with root package name */
    public final PaymentMethod.BillingDetails f80789d;

    public a(Integer num, Integer num2, ft.b bVar, PaymentMethod.BillingDetails billingDetails) {
        this.f80786a = num;
        this.f80787b = num2;
        this.f80788c = bVar;
        this.f80789d = billingDetails;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f80786a, aVar.f80786a) && Intrinsics.b(this.f80787b, aVar.f80787b) && this.f80788c == aVar.f80788c && Intrinsics.b(this.f80789d, aVar.f80789d);
    }

    public final int hashCode() {
        Integer num = this.f80786a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Integer num2 = this.f80787b;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        ft.b bVar = this.f80788c;
        int iHashCode3 = (iHashCode2 + (bVar == null ? 0 : bVar.hashCode())) * 31;
        PaymentMethod.BillingDetails billingDetails = this.f80789d;
        return iHashCode3 + (billingDetails != null ? billingDetails.hashCode() : 0);
    }

    public final String toString() {
        return "CardUpdateParams(expiryMonth=" + this.f80786a + ", expiryYear=" + this.f80787b + ", cardBrand=" + this.f80788c + ", billingDetails=" + this.f80789d + ")";
    }
}
