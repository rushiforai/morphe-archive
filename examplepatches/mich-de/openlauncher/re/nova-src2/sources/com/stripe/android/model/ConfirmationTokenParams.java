package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/ConfirmationTokenParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class ConfirmationTokenParams implements StripeParamsModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<ConfirmationTokenParams> CREATOR = new h();

    /* renamed from: a, reason: collision with root package name */
    public final String f43245a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentMethodCreateParams f43246b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43247c;

    /* renamed from: d, reason: collision with root package name */
    public final ft.d f43248d;

    /* renamed from: e, reason: collision with root package name */
    public final ConfirmPaymentIntentParams.Shipping f43249e;

    /* renamed from: f, reason: collision with root package name */
    public final MandateDataParams f43250f;

    /* renamed from: g, reason: collision with root package name */
    public final Boolean f43251g;

    /* renamed from: h, reason: collision with root package name */
    public final String f43252h;

    /* renamed from: i, reason: collision with root package name */
    public final ConfirmationTokenClientContextParams f43253i;

    /* renamed from: j, reason: collision with root package name */
    public final ClientAttributionMetadata f43254j;

    public ConfirmationTokenParams(String str, PaymentMethodCreateParams paymentMethodCreateParams, String str2, ft.d dVar, ConfirmPaymentIntentParams.Shipping shipping, MandateDataParams mandateDataParams, Boolean bool, String str3, ConfirmationTokenClientContextParams confirmationTokenClientContextParams, ClientAttributionMetadata clientAttributionMetadata) {
        this.f43245a = str;
        this.f43246b = paymentMethodCreateParams;
        this.f43247c = str2;
        this.f43248d = dVar;
        this.f43249e = shipping;
        this.f43250f = mandateDataParams;
        this.f43251g = bool;
        this.f43252h = str3;
        this.f43253i = confirmationTokenClientContextParams;
        this.f43254j = clientAttributionMetadata;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConfirmationTokenParams)) {
            return false;
        }
        ConfirmationTokenParams confirmationTokenParams = (ConfirmationTokenParams) obj;
        return Intrinsics.b(this.f43245a, confirmationTokenParams.f43245a) && Intrinsics.b(this.f43246b, confirmationTokenParams.f43246b) && Intrinsics.b(this.f43247c, confirmationTokenParams.f43247c) && this.f43248d == confirmationTokenParams.f43248d && Intrinsics.b(this.f43249e, confirmationTokenParams.f43249e) && Intrinsics.b(this.f43250f, confirmationTokenParams.f43250f) && Intrinsics.b(this.f43251g, confirmationTokenParams.f43251g) && Intrinsics.b(this.f43252h, confirmationTokenParams.f43252h) && Intrinsics.b(this.f43253i, confirmationTokenParams.f43253i) && Intrinsics.b(this.f43254j, confirmationTokenParams.f43254j);
    }

    public final int hashCode() {
        String str = this.f43245a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        PaymentMethodCreateParams paymentMethodCreateParams = this.f43246b;
        int iHashCode2 = (iHashCode + (paymentMethodCreateParams == null ? 0 : paymentMethodCreateParams.hashCode())) * 31;
        String str2 = this.f43247c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        ft.d dVar = this.f43248d;
        int iHashCode4 = (iHashCode3 + (dVar == null ? 0 : dVar.hashCode())) * 31;
        ConfirmPaymentIntentParams.Shipping shipping = this.f43249e;
        int iHashCode5 = (iHashCode4 + (shipping == null ? 0 : shipping.hashCode())) * 31;
        MandateDataParams mandateDataParams = this.f43250f;
        int iHashCode6 = (iHashCode5 + (mandateDataParams == null ? 0 : mandateDataParams.f43521a.hashCode())) * 31;
        Boolean bool = this.f43251g;
        int iHashCode7 = (iHashCode6 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str3 = this.f43252h;
        int iHashCode8 = (iHashCode7 + (str3 == null ? 0 : str3.hashCode())) * 31;
        ConfirmationTokenClientContextParams confirmationTokenClientContextParams = this.f43253i;
        int iHashCode9 = (iHashCode8 + (confirmationTokenClientContextParams == null ? 0 : confirmationTokenClientContextParams.hashCode())) * 31;
        ClientAttributionMetadata clientAttributionMetadata = this.f43254j;
        return iHashCode9 + (clientAttributionMetadata != null ? clientAttributionMetadata.hashCode() : 0);
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        MapBuilder mapBuilder = new MapBuilder();
        String str = this.f43245a;
        if (str != null) {
            mapBuilder.put("payment_method", str);
        }
        PaymentMethodCreateParams paymentMethodCreateParams = this.f43246b;
        if (paymentMethodCreateParams != null) {
            mapBuilder.put("payment_method_data", paymentMethodCreateParams.k0());
        }
        String str2 = this.f43247c;
        if (str2 != null) {
            mapBuilder.put("return_url", str2);
        }
        ft.d dVar = this.f43248d;
        if (dVar == null || dVar == ft.d.f55926d) {
            dVar = null;
        }
        if (dVar != null) {
            mapBuilder.put("setup_future_usage", dVar.f55930a);
        }
        ConfirmPaymentIntentParams.Shipping shipping = this.f43249e;
        if (shipping != null) {
            mapBuilder.put("shipping", shipping.k0());
        }
        MandateDataParams mandateDataParams = this.f43250f;
        if (mandateDataParams != null) {
            mapBuilder.put("mandate_data", mandateDataParams.k0());
        }
        Boolean bool = this.f43251g;
        if (bool != null) {
            mapBuilder.put("set_as_default_payment_method", bool);
        }
        String str3 = this.f43252h;
        if (str3 != null) {
            mapBuilder.put("payment_method_options", b70.k.e0(new Pair("card", a80.m.n("cvc", str3))));
        }
        ConfirmationTokenClientContextParams confirmationTokenClientContextParams = this.f43253i;
        if (confirmationTokenClientContextParams != null) {
            mapBuilder.put("client_context", confirmationTokenClientContextParams.k0());
        }
        ClientAttributionMetadata clientAttributionMetadata = this.f43254j;
        if (clientAttributionMetadata != null) {
            mapBuilder.put("client_attribution_metadata", clientAttributionMetadata.k0());
        }
        return mapBuilder.b();
    }

    public final String toString() {
        return "ConfirmationTokenParams(paymentMethodId=" + this.f43245a + ", paymentMethodData=" + this.f43246b + ", returnUrl=" + this.f43247c + ", setUpFutureUsage=" + this.f43248d + ", shipping=" + this.f43249e + ", mandateDataParams=" + this.f43250f + ", setAsDefaultPaymentMethod=" + this.f43251g + ", cvc=" + this.f43252h + ", clientContext=" + this.f43253i + ", clientAttributionMetadata=" + this.f43254j + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43245a);
        PaymentMethodCreateParams paymentMethodCreateParams = this.f43246b;
        if (paymentMethodCreateParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentMethodCreateParams.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43247c);
        ft.d dVar = this.f43248d;
        if (dVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(dVar.name());
        }
        ConfirmPaymentIntentParams.Shipping shipping = this.f43249e;
        if (shipping == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            shipping.writeToParcel(dest, i5);
        }
        MandateDataParams mandateDataParams = this.f43250f;
        if (mandateDataParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            mandateDataParams.writeToParcel(dest, i5);
        }
        Boolean bool = this.f43251g;
        if (bool == null) {
            dest.writeInt(0);
        } else {
            com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
        }
        dest.writeString(this.f43252h);
        ConfirmationTokenClientContextParams confirmationTokenClientContextParams = this.f43253i;
        if (confirmationTokenClientContextParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            confirmationTokenClientContextParams.writeToParcel(dest, i5);
        }
        ClientAttributionMetadata clientAttributionMetadata = this.f43254j;
        if (clientAttributionMetadata == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            clientAttributionMetadata.writeToParcel(dest, i5);
        }
    }
}
