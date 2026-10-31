package nv;

import b.c0;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentsheet.PaymentSheet$ShopPayConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodMetadata f78594a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$ShopPayConfiguration f78595b;

    /* renamed from: c, reason: collision with root package name */
    public final String f78596c;

    /* renamed from: d, reason: collision with root package name */
    public final String f78597d;

    public e(PaymentMethodMetadata paymentMethodMetadata, PaymentSheet$ShopPayConfiguration shopPayConfiguration, String customerSessionClientSecret, String businessName) {
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(shopPayConfiguration, "shopPayConfiguration");
        Intrinsics.g(customerSessionClientSecret, "customerSessionClientSecret");
        Intrinsics.g(businessName, "businessName");
        this.f78594a = paymentMethodMetadata;
        this.f78595b = shopPayConfiguration;
        this.f78596c = customerSessionClientSecret;
        this.f78597d = businessName;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f78594a, eVar.f78594a) && Intrinsics.b(this.f78595b, eVar.f78595b) && Intrinsics.b(this.f78596c, eVar.f78596c) && Intrinsics.b(this.f78597d, eVar.f78597d);
    }

    public final int hashCode() {
        return this.f78597d.hashCode() + c0.e((this.f78595b.hashCode() + (this.f78594a.hashCode() * 31)) * 31, 31, this.f78596c);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Args(paymentMethodMetadata=");
        sb2.append(this.f78594a);
        sb2.append(", shopPayConfiguration=");
        sb2.append(this.f78595b);
        sb2.append(", customerSessionClientSecret=");
        return c0.s(sb2, this.f78596c, ", businessName=", this.f78597d, ")");
    }
}
