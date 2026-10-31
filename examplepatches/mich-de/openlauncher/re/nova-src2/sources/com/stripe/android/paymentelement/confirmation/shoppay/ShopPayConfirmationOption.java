package com.stripe.android.paymentelement.confirmation.shoppay;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.paymentelement.confirmation.ConfirmationHandler$Option;
import com.stripe.android.paymentsheet.PaymentSheet$ShopPayConfiguration;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import ww.c;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/shoppay/ShopPayConfirmationOption;", "Lcom/stripe/android/paymentelement/confirmation/ConfirmationHandler$Option;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ShopPayConfirmationOption implements ConfirmationHandler$Option {

    @NotNull
    public static final Parcelable.Creator<ShopPayConfirmationOption> CREATOR = new c(23);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentSheet$ShopPayConfiguration f44194a;

    /* renamed from: b, reason: collision with root package name */
    public final String f44195b;

    /* renamed from: c, reason: collision with root package name */
    public final String f44196c;

    public ShopPayConfirmationOption(PaymentSheet$ShopPayConfiguration shopPayConfiguration, String customerSessionClientSecret, String merchantDisplayName) {
        Intrinsics.g(shopPayConfiguration, "shopPayConfiguration");
        Intrinsics.g(customerSessionClientSecret, "customerSessionClientSecret");
        Intrinsics.g(merchantDisplayName, "merchantDisplayName");
        this.f44194a = shopPayConfiguration;
        this.f44195b = customerSessionClientSecret;
        this.f44196c = merchantDisplayName;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ShopPayConfirmationOption)) {
            return false;
        }
        ShopPayConfirmationOption shopPayConfirmationOption = (ShopPayConfirmationOption) obj;
        return Intrinsics.b(this.f44194a, shopPayConfirmationOption.f44194a) && Intrinsics.b(this.f44195b, shopPayConfirmationOption.f44195b) && Intrinsics.b(this.f44196c, shopPayConfirmationOption.f44196c);
    }

    public final int hashCode() {
        return this.f44196c.hashCode() + c0.e(this.f44194a.hashCode() * 31, 31, this.f44195b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ShopPayConfirmationOption(shopPayConfiguration=");
        sb2.append(this.f44194a);
        sb2.append(", customerSessionClientSecret=");
        sb2.append(this.f44195b);
        sb2.append(", merchantDisplayName=");
        return c0.q(sb2, this.f44196c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f44194a.writeToParcel(dest, i5);
        dest.writeString(this.f44195b);
        dest.writeString(this.f44196c);
    }
}
