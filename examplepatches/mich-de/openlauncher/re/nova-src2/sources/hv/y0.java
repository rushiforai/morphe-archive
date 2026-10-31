package hv;

import com.stripe.android.model.PaymentMethod;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class y0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f60681a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f60682b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f60683c;

    /* renamed from: d, reason: collision with root package name */
    public final ft.b f60684d;

    /* renamed from: e, reason: collision with root package name */
    public final String f60685e;

    /* renamed from: f, reason: collision with root package name */
    public final Set f60686f;

    /* renamed from: g, reason: collision with root package name */
    public final PaymentMethod.BillingDetails f60687g;

    public y0(String str, Integer num, Integer num2, ft.b brand, String str2, Set set, PaymentMethod.BillingDetails billingDetails) {
        Intrinsics.g(brand, "brand");
        this.f60681a = str;
        this.f60682b = num;
        this.f60683c = num2;
        this.f60684d = brand;
        this.f60685e = str2;
        this.f60686f = set;
        this.f60687g = billingDetails;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y0)) {
            return false;
        }
        y0 y0Var = (y0) obj;
        return Intrinsics.b(this.f60681a, y0Var.f60681a) && Intrinsics.b(this.f60682b, y0Var.f60682b) && Intrinsics.b(this.f60683c, y0Var.f60683c) && this.f60684d == y0Var.f60684d && Intrinsics.b(this.f60685e, y0Var.f60685e) && Intrinsics.b(this.f60686f, y0Var.f60686f) && Intrinsics.b(this.f60687g, y0Var.f60687g);
    }

    public final int hashCode() {
        String str = this.f60681a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        Integer num = this.f60682b;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.f60683c;
        int iHashCode3 = (this.f60684d.hashCode() + ((iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31)) * 31;
        String str2 = this.f60685e;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Set set = this.f60686f;
        int iHashCode5 = (iHashCode4 + (set == null ? 0 : set.hashCode())) * 31;
        PaymentMethod.BillingDetails billingDetails = this.f60687g;
        return iHashCode5 + (billingDetails != null ? billingDetails.hashCode() : 0);
    }

    public final String toString() {
        return "EditCardPayload(last4=" + this.f60681a + ", expiryMonth=" + this.f60682b + ", expiryYear=" + this.f60683c + ", brand=" + this.f60684d + ", displayBrand=" + this.f60685e + ", networks=" + this.f60686f + ", billingDetails=" + this.f60687g + ")";
    }
}
