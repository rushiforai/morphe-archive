package gv;

import b.c9;
import com.stripe.android.GooglePayJsonFactory$BillingAddressParameters;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x0 {

    /* renamed from: a, reason: collision with root package name */
    public final wu.a f57977a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f57978b;

    /* renamed from: c, reason: collision with root package name */
    public final GooglePayJsonFactory$BillingAddressParameters f57979c;

    /* renamed from: d, reason: collision with root package name */
    public final List f57980d;

    public x0(wu.a aVar, boolean z11, GooglePayJsonFactory$BillingAddressParameters googlePayJsonFactory$BillingAddressParameters, List additionalEnabledNetworks) {
        Intrinsics.g(additionalEnabledNetworks, "additionalEnabledNetworks");
        this.f57977a = aVar;
        this.f57978b = z11;
        this.f57979c = googlePayJsonFactory$BillingAddressParameters;
        this.f57980d = additionalEnabledNetworks;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x0)) {
            return false;
        }
        x0 x0Var = (x0) obj;
        return this.f57977a == x0Var.f57977a && this.f57978b == x0Var.f57978b && Intrinsics.b(this.f57979c, x0Var.f57979c) && Intrinsics.b(this.f57980d, x0Var.f57980d);
    }

    public final int hashCode() {
        int iF = c9.f(this.f57977a.hashCode() * 31, 31, this.f57978b);
        GooglePayJsonFactory$BillingAddressParameters googlePayJsonFactory$BillingAddressParameters = this.f57979c;
        return this.f57980d.hashCode() + ((iF + (googlePayJsonFactory$BillingAddressParameters == null ? 0 : googlePayJsonFactory$BillingAddressParameters.hashCode())) * 31);
    }

    public final String toString() {
        return "GooglePay(buttonType=" + this.f57977a + ", allowCreditCards=" + this.f57978b + ", billingAddressParameters=" + this.f57979c + ", additionalEnabledNetworks=" + this.f57980d + ")";
    }
}
