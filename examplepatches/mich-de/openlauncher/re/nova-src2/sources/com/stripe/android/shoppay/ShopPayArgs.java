package com.stripe.android.shoppay;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import com.stripe.android.paymentsheet.PaymentSheet$ShopPayConfiguration;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import nv.f;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/shoppay/ShopPayArgs;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ShopPayArgs implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ShopPayArgs> CREATOR = new f(0);

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodMetadata f45017a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$ShopPayConfiguration f45018b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45019c;

    /* renamed from: d, reason: collision with root package name */
    public final String f45020d;

    /* renamed from: e, reason: collision with root package name */
    public final String f45021e;

    /* renamed from: f, reason: collision with root package name */
    public final String f45022f;

    /* renamed from: g, reason: collision with root package name */
    public final String f45023g;

    public ShopPayArgs(PaymentMethodMetadata paymentMethodMetadata, PaymentSheet$ShopPayConfiguration shopPayConfiguration, String publishableKey, String str, String paymentElementCallbackIdentifier, String customerSessionClientSecret, String businessName) {
        Intrinsics.g(paymentMethodMetadata, "paymentMethodMetadata");
        Intrinsics.g(shopPayConfiguration, "shopPayConfiguration");
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(paymentElementCallbackIdentifier, "paymentElementCallbackIdentifier");
        Intrinsics.g(customerSessionClientSecret, "customerSessionClientSecret");
        Intrinsics.g(businessName, "businessName");
        this.f45017a = paymentMethodMetadata;
        this.f45018b = shopPayConfiguration;
        this.f45019c = publishableKey;
        this.f45020d = str;
        this.f45021e = paymentElementCallbackIdentifier;
        this.f45022f = customerSessionClientSecret;
        this.f45023g = businessName;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ShopPayArgs)) {
            return false;
        }
        ShopPayArgs shopPayArgs = (ShopPayArgs) obj;
        return Intrinsics.b(this.f45017a, shopPayArgs.f45017a) && Intrinsics.b(this.f45018b, shopPayArgs.f45018b) && Intrinsics.b(this.f45019c, shopPayArgs.f45019c) && Intrinsics.b(this.f45020d, shopPayArgs.f45020d) && Intrinsics.b(this.f45021e, shopPayArgs.f45021e) && Intrinsics.b(this.f45022f, shopPayArgs.f45022f) && Intrinsics.b(this.f45023g, shopPayArgs.f45023g);
    }

    public final int hashCode() {
        int iE = c0.e((this.f45018b.hashCode() + (this.f45017a.hashCode() * 31)) * 31, 31, this.f45019c);
        String str = this.f45020d;
        return this.f45023g.hashCode() + c0.e(c0.e((iE + (str == null ? 0 : str.hashCode())) * 31, 31, this.f45021e), 31, this.f45022f);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ShopPayArgs(paymentMethodMetadata=");
        sb2.append(this.f45017a);
        sb2.append(", shopPayConfiguration=");
        sb2.append(this.f45018b);
        sb2.append(", publishableKey=");
        c0.D(sb2, this.f45019c, ", stripeAccountId=", this.f45020d, ", paymentElementCallbackIdentifier=");
        c0.D(sb2, this.f45021e, ", customerSessionClientSecret=", this.f45022f, ", businessName=");
        return c0.q(sb2, this.f45023g, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        this.f45017a.writeToParcel(dest, i5);
        this.f45018b.writeToParcel(dest, i5);
        dest.writeString(this.f45019c);
        dest.writeString(this.f45020d);
        dest.writeString(this.f45021e);
        dest.writeString(this.f45022f);
        dest.writeString(this.f45023g);
    }
}
