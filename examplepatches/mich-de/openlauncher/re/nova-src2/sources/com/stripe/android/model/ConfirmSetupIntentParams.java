package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.stripe.android.model.MandateDataParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConfirmSetupIntentParams;", "Lcom/stripe/android/model/ConfirmStripeIntentParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ConfirmSetupIntentParams implements ConfirmStripeIntentParams {

    @NotNull
    public static final Parcelable.Creator<ConfirmSetupIntentParams> CREATOR = new eh.a(20);

    /* renamed from: a, reason: collision with root package name */
    public final String f43207a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43208b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentMethodCreateParams f43209c;

    /* renamed from: d, reason: collision with root package name */
    public String f43210d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f43211e;

    /* renamed from: f, reason: collision with root package name */
    public final String f43212f;

    /* renamed from: g, reason: collision with root package name */
    public final MandateDataParams f43213g;

    /* renamed from: h, reason: collision with root package name */
    public final Boolean f43214h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43215i;

    /* renamed from: j, reason: collision with root package name */
    public final PaymentMethodOptionsParams f43216j;

    /* renamed from: k, reason: collision with root package name */
    public final RadarOptions f43217k;

    /* renamed from: l, reason: collision with root package name */
    public final ClientAttributionMetadata f43218l;

    /* renamed from: m, reason: collision with root package name */
    public final String f43219m;

    public ConfirmSetupIntentParams(String clientSecret, String str, PaymentMethodCreateParams paymentMethodCreateParams, String str2, boolean z11, String str3, MandateDataParams mandateDataParams, Boolean bool, String str4, PaymentMethodOptionsParams paymentMethodOptionsParams, RadarOptions radarOptions, ClientAttributionMetadata clientAttributionMetadata, String str5) {
        Intrinsics.g(clientSecret, "clientSecret");
        this.f43207a = clientSecret;
        this.f43208b = str;
        this.f43209c = paymentMethodCreateParams;
        this.f43210d = str2;
        this.f43211e = z11;
        this.f43212f = str3;
        this.f43213g = mandateDataParams;
        this.f43214h = bool;
        this.f43215i = str4;
        this.f43216j = paymentMethodOptionsParams;
        this.f43217k = radarOptions;
        this.f43218l = clientAttributionMetadata;
        this.f43219m = str5;
    }

    @Override // com.stripe.android.model.ConfirmStripeIntentParams
    public final void I0(String str) {
        this.f43210d = str;
    }

    @Override // com.stripe.android.model.ConfirmStripeIntentParams
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final ConfirmSetupIntentParams J0() {
        String str = this.f43210d;
        String clientSecret = this.f43207a;
        Intrinsics.g(clientSecret, "clientSecret");
        return new ConfirmSetupIntentParams(clientSecret, this.f43208b, this.f43209c, str, true, this.f43212f, this.f43213g, this.f43214h, this.f43215i, null, this.f43217k, this.f43218l, this.f43219m, EventBridgeChannel.QUEUE_CAPACITY);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConfirmSetupIntentParams)) {
            return false;
        }
        ConfirmSetupIntentParams confirmSetupIntentParams = (ConfirmSetupIntentParams) obj;
        return Intrinsics.b(this.f43207a, confirmSetupIntentParams.f43207a) && Intrinsics.b(this.f43208b, confirmSetupIntentParams.f43208b) && Intrinsics.b(this.f43209c, confirmSetupIntentParams.f43209c) && Intrinsics.b(this.f43210d, confirmSetupIntentParams.f43210d) && this.f43211e == confirmSetupIntentParams.f43211e && Intrinsics.b(this.f43212f, confirmSetupIntentParams.f43212f) && Intrinsics.b(this.f43213g, confirmSetupIntentParams.f43213g) && Intrinsics.b(this.f43214h, confirmSetupIntentParams.f43214h) && Intrinsics.b(this.f43215i, confirmSetupIntentParams.f43215i) && Intrinsics.b(this.f43216j, confirmSetupIntentParams.f43216j) && Intrinsics.b(this.f43217k, confirmSetupIntentParams.f43217k) && Intrinsics.b(this.f43218l, confirmSetupIntentParams.f43218l) && Intrinsics.b(this.f43219m, confirmSetupIntentParams.f43219m);
    }

    @Override // com.stripe.android.model.ConfirmStripeIntentParams
    /* renamed from: g, reason: from getter */
    public final /* synthetic */ String getF43207a() {
        return this.f43207a;
    }

    public final int hashCode() {
        int iHashCode = this.f43207a.hashCode() * 31;
        String str = this.f43208b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        PaymentMethodCreateParams paymentMethodCreateParams = this.f43209c;
        int iHashCode3 = (iHashCode2 + (paymentMethodCreateParams == null ? 0 : paymentMethodCreateParams.hashCode())) * 31;
        String str2 = this.f43210d;
        int iF = c9.f((iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f43211e);
        String str3 = this.f43212f;
        int iHashCode4 = (iF + (str3 == null ? 0 : str3.hashCode())) * 31;
        MandateDataParams mandateDataParams = this.f43213g;
        int iHashCode5 = (iHashCode4 + (mandateDataParams == null ? 0 : mandateDataParams.f43521a.hashCode())) * 31;
        Boolean bool = this.f43214h;
        int iHashCode6 = (iHashCode5 + (bool == null ? 0 : bool.hashCode())) * 31;
        String str4 = this.f43215i;
        int iHashCode7 = (iHashCode6 + (str4 == null ? 0 : str4.hashCode())) * 31;
        PaymentMethodOptionsParams paymentMethodOptionsParams = this.f43216j;
        int iHashCode8 = (iHashCode7 + (paymentMethodOptionsParams == null ? 0 : paymentMethodOptionsParams.hashCode())) * 31;
        RadarOptions radarOptions = this.f43217k;
        int iHashCode9 = (iHashCode8 + (radarOptions == null ? 0 : radarOptions.hashCode())) * 31;
        ClientAttributionMetadata clientAttributionMetadata = this.f43218l;
        int iHashCode10 = (iHashCode9 + (clientAttributionMetadata == null ? 0 : clientAttributionMetadata.hashCode())) * 31;
        String str5 = this.f43219m;
        return iHashCode10 + (str5 != null ? str5.hashCode() : 0);
    }

    @Override // com.stripe.android.model.ConfirmStripeIntentParams
    /* renamed from: j0, reason: from getter */
    public final String getF43210d() {
        return this.f43210d;
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        Map mapN;
        Map mapJ0 = MapsKt.j0(new Pair("client_secret", this.f43207a), new Pair("use_stripe_sdk", Boolean.valueOf(this.f43211e)));
        String str = this.f43210d;
        Map mapN2 = str != null ? a80.m.n("return_url", str) : null;
        Map map = b70.h.f17594a;
        if (mapN2 == null) {
            mapN2 = map;
        }
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(mapJ0, mapN2);
        String str2 = this.f43212f;
        Map mapN3 = str2 != null ? a80.m.n("mandate", str2) : null;
        if (mapN3 == null) {
            mapN3 = map;
        }
        LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapN3);
        PaymentMethodCreateParams paymentMethodCreateParams = this.f43209c;
        MandateDataParams mandateDataParams = this.f43213g;
        Map mapK0 = mandateDataParams != null ? mandateDataParams.k0() : (paymentMethodCreateParams != null && paymentMethodCreateParams.f43681b && str2 == null) ? new MandateDataParams(MandateDataParams.Type.Online.f43522d).k0() : null;
        Map mapO = mapK0 != null ? com.google.android.gms.internal.measurement.k2.o("mandate_data", mapK0) : null;
        if (mapO == null) {
            mapO = map;
        }
        LinkedHashMap linkedHashMapM03 = MapsKt.m0(linkedHashMapM02, mapO);
        Boolean bool = this.f43214h;
        Map mapE0 = bool != null ? b70.k.e0(new Pair("set_as_default_payment_method", bool)) : null;
        if (mapE0 == null) {
            mapE0 = map;
        }
        LinkedHashMap linkedHashMapM04 = MapsKt.m0(linkedHashMapM03, mapE0);
        RadarOptions radarOptions = this.f43217k;
        Map mapO2 = radarOptions != null ? com.google.android.gms.internal.measurement.k2.o("radar_options", radarOptions.k0()) : null;
        if (mapO2 == null) {
            mapO2 = map;
        }
        LinkedHashMap linkedHashMapM05 = MapsKt.m0(linkedHashMapM04, mapO2);
        if (paymentMethodCreateParams != null) {
            mapN = com.google.android.gms.internal.measurement.k2.o("payment_method_data", paymentMethodCreateParams.k0());
        } else {
            String str3 = this.f43208b;
            if (str3 != null) {
                mapN = a80.m.n("payment_method", str3);
            } else {
                String str4 = this.f43219m;
                mapN = str4 != null ? a80.m.n("confirmation_token", str4) : map;
            }
        }
        LinkedHashMap linkedHashMapM06 = MapsKt.m0(linkedHashMapM05, mapN);
        ClientAttributionMetadata clientAttributionMetadata = this.f43218l;
        Map mapO3 = clientAttributionMetadata != null ? com.google.android.gms.internal.measurement.k2.o("client_attribution_metadata", clientAttributionMetadata.k0()) : null;
        if (mapO3 != null) {
            map = mapO3;
        }
        return MapsKt.m0(linkedHashMapM06, map);
    }

    public final String toString() {
        String str = this.f43210d;
        StringBuilder sbW = b.c0.w("ConfirmSetupIntentParams(clientSecret=", this.f43207a, ", paymentMethodId=", this.f43208b, ", paymentMethodCreateParams=");
        sbW.append(this.f43209c);
        sbW.append(", returnUrl=");
        sbW.append(str);
        sbW.append(", useStripeSdk=");
        c9.s(", mandateId=", this.f43212f, ", mandateData=", sbW, this.f43211e);
        sbW.append(this.f43213g);
        sbW.append(", setAsDefaultPaymentMethod=");
        sbW.append(this.f43214h);
        sbW.append(", paymentMethodCode=");
        sbW.append(this.f43215i);
        sbW.append(", paymentMethodOptions=");
        sbW.append(this.f43216j);
        sbW.append(", radarOptions=");
        sbW.append(this.f43217k);
        sbW.append(", clientAttributionMetadata=");
        sbW.append(this.f43218l);
        sbW.append(", confirmationTokenId=");
        return b.c0.q(sbW, this.f43219m, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43207a);
        dest.writeString(this.f43208b);
        PaymentMethodCreateParams paymentMethodCreateParams = this.f43209c;
        if (paymentMethodCreateParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentMethodCreateParams.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43210d);
        dest.writeInt(this.f43211e ? 1 : 0);
        dest.writeString(this.f43212f);
        MandateDataParams mandateDataParams = this.f43213g;
        if (mandateDataParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            mandateDataParams.writeToParcel(dest, i5);
        }
        Boolean bool = this.f43214h;
        if (bool == null) {
            dest.writeInt(0);
        } else {
            com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
        }
        dest.writeString(this.f43215i);
        dest.writeParcelable(this.f43216j, i5);
        RadarOptions radarOptions = this.f43217k;
        if (radarOptions == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            radarOptions.writeToParcel(dest, i5);
        }
        ClientAttributionMetadata clientAttributionMetadata = this.f43218l;
        if (clientAttributionMetadata == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            clientAttributionMetadata.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43219m);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public ConfirmSetupIntentParams(String str, String str2, PaymentMethodCreateParams paymentMethodCreateParams, String str3, boolean z11, String str4, MandateDataParams mandateDataParams, Boolean bool, String str5, PaymentMethodOptionsParams.Card card, RadarOptions radarOptions, ClientAttributionMetadata clientAttributionMetadata, String str6, int i5) {
        String str7;
        String str8 = (i5 & 2) != 0 ? null : str2;
        PaymentMethodCreateParams paymentMethodCreateParams2 = (i5 & 4) != 0 ? null : paymentMethodCreateParams;
        String str9 = (i5 & 8) != 0 ? null : str3;
        boolean z12 = (i5 & 16) != 0 ? false : z11;
        String str10 = (i5 & 32) != 0 ? null : str4;
        MandateDataParams mandateDataParams2 = (i5 & 64) != 0 ? null : mandateDataParams;
        Boolean bool2 = (i5 & 128) != 0 ? null : bool;
        if ((i5 & 256) != 0) {
            str7 = paymentMethodCreateParams2 != null ? paymentMethodCreateParams2.f43680a : null;
        } else {
            str7 = str5;
        }
        this(str, str8, paymentMethodCreateParams2, str9, z12, str10, mandateDataParams2, bool2, str7, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : card, (i5 & 1024) != 0 ? null : radarOptions, (i5 & 2048) != 0 ? null : clientAttributionMetadata, (i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : str6);
    }
}
