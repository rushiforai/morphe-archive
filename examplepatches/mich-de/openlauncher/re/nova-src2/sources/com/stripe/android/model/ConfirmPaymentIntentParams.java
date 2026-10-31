package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.amplitude.android.TrackingOptions;
import com.amplitude.core.events.Plan;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.stripe.android.model.MandateDataParams;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/ConfirmPaymentIntentParams;", "Lcom/stripe/android/model/ConfirmStripeIntentParams;", "ft/d", "Shipping", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class ConfirmPaymentIntentParams implements ConfirmStripeIntentParams {

    @NotNull
    public static final Parcelable.Creator<ConfirmPaymentIntentParams> CREATOR = new d();

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethodCreateParams f43185a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43186b;

    /* renamed from: c, reason: collision with root package name */
    public final SourceParams f43187c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43188d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43189e;

    /* renamed from: f, reason: collision with root package name */
    public String f43190f;

    /* renamed from: g, reason: collision with root package name */
    public final Boolean f43191g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f43192h;

    /* renamed from: i, reason: collision with root package name */
    public final PaymentMethodOptionsParams f43193i;

    /* renamed from: j, reason: collision with root package name */
    public final String f43194j;

    /* renamed from: k, reason: collision with root package name */
    public final MandateDataParams f43195k;

    /* renamed from: l, reason: collision with root package name */
    public final ft.d f43196l;

    /* renamed from: m, reason: collision with root package name */
    public final Shipping f43197m;
    public final String n;
    public final Boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final String f43198p;

    /* renamed from: q, reason: collision with root package name */
    public final RadarOptions f43199q;

    /* renamed from: r, reason: collision with root package name */
    public final ClientAttributionMetadata f43200r;

    /* renamed from: s, reason: collision with root package name */
    public final String f43201s;

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/ConfirmPaymentIntentParams$Shipping;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Shipping implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Shipping> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final Address f43202a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43203b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43204c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43205d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43206e;

        public Shipping(Address address, String name, String str, String str2, String str3) {
            Intrinsics.g(address, "address");
            Intrinsics.g(name, "name");
            this.f43202a = address;
            this.f43203b = name;
            this.f43204c = str;
            this.f43205d = str2;
            this.f43206e = str3;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Shipping)) {
                return false;
            }
            Shipping shipping = (Shipping) obj;
            return Intrinsics.b(this.f43202a, shipping.f43202a) && Intrinsics.b(this.f43203b, shipping.f43203b) && Intrinsics.b(this.f43204c, shipping.f43204c) && Intrinsics.b(this.f43205d, shipping.f43205d) && Intrinsics.b(this.f43206e, shipping.f43206e);
        }

        public final int hashCode() {
            int iE = b.c0.e(this.f43202a.hashCode() * 31, 31, this.f43203b);
            String str = this.f43204c;
            int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43205d;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43206e;
            return iHashCode2 + (str3 != null ? str3.hashCode() : 0);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            b70.h hVar = b70.h.f17594a;
            Map mapM0 = hVar;
            for (Pair pair : ul.b.Q(new Pair(PlaceTypes.ADDRESS, this.f43202a.k0()), new Pair(PendingUpgradeStore.KEY_NAME, this.f43203b), new Pair(TrackingOptions.AMP_TRACKING_OPTION_CARRIER, this.f43204c), new Pair("phone", this.f43205d), new Pair("tracking_number", this.f43206e))) {
                String str = (String) pair.f71683a;
                Object obj = pair.f71684b;
                Map mapE0 = obj != null ? b70.k.e0(new Pair(str, obj)) : null;
                if (mapE0 == null) {
                    mapE0 = hVar;
                }
                mapM0 = MapsKt.m0(mapM0, mapE0);
            }
            return mapM0;
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Shipping(address=");
            sb2.append(this.f43202a);
            sb2.append(", name=");
            sb2.append(this.f43203b);
            sb2.append(", carrier=");
            b.c0.D(sb2, this.f43204c, ", phone=", this.f43205d, ", trackingNumber=");
            return b.c0.q(sb2, this.f43206e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f43202a.writeToParcel(dest, i5);
            dest.writeString(this.f43203b);
            dest.writeString(this.f43204c);
            dest.writeString(this.f43205d);
            dest.writeString(this.f43206e);
        }
    }

    public ConfirmPaymentIntentParams(PaymentMethodCreateParams paymentMethodCreateParams, String str, SourceParams sourceParams, String str2, String clientSecret, String str3, Boolean bool, boolean z11, PaymentMethodOptionsParams paymentMethodOptionsParams, String str4, MandateDataParams mandateDataParams, ft.d dVar, Shipping shipping, String str5, Boolean bool2, String str6, RadarOptions radarOptions, ClientAttributionMetadata clientAttributionMetadata, String str7) {
        Intrinsics.g(clientSecret, "clientSecret");
        this.f43185a = paymentMethodCreateParams;
        this.f43186b = str;
        this.f43187c = sourceParams;
        this.f43188d = str2;
        this.f43189e = clientSecret;
        this.f43190f = str3;
        this.f43191g = bool;
        this.f43192h = z11;
        this.f43193i = paymentMethodOptionsParams;
        this.f43194j = str4;
        this.f43195k = mandateDataParams;
        this.f43196l = dVar;
        this.f43197m = shipping;
        this.n = str5;
        this.o = bool2;
        this.f43198p = str6;
        this.f43199q = radarOptions;
        this.f43200r = clientAttributionMetadata;
        this.f43201s = str7;
    }

    @Override // com.stripe.android.model.ConfirmStripeIntentParams
    public final void I0(String str) {
        this.f43190f = str;
    }

    @Override // com.stripe.android.model.ConfirmStripeIntentParams
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final ConfirmPaymentIntentParams J0() {
        String str = this.f43190f;
        String clientSecret = this.f43189e;
        Intrinsics.g(clientSecret, "clientSecret");
        return new ConfirmPaymentIntentParams(this.f43185a, this.f43186b, this.f43187c, this.f43188d, clientSecret, str, this.f43191g, true, this.f43193i, this.f43194j, this.f43195k, this.f43196l, this.f43197m, this.n, this.o, this.f43198p, this.f43199q, this.f43200r, this.f43201s);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConfirmPaymentIntentParams)) {
            return false;
        }
        ConfirmPaymentIntentParams confirmPaymentIntentParams = (ConfirmPaymentIntentParams) obj;
        return Intrinsics.b(this.f43185a, confirmPaymentIntentParams.f43185a) && Intrinsics.b(this.f43186b, confirmPaymentIntentParams.f43186b) && Intrinsics.b(this.f43187c, confirmPaymentIntentParams.f43187c) && Intrinsics.b(this.f43188d, confirmPaymentIntentParams.f43188d) && Intrinsics.b(this.f43189e, confirmPaymentIntentParams.f43189e) && Intrinsics.b(this.f43190f, confirmPaymentIntentParams.f43190f) && Intrinsics.b(this.f43191g, confirmPaymentIntentParams.f43191g) && this.f43192h == confirmPaymentIntentParams.f43192h && Intrinsics.b(this.f43193i, confirmPaymentIntentParams.f43193i) && Intrinsics.b(this.f43194j, confirmPaymentIntentParams.f43194j) && Intrinsics.b(this.f43195k, confirmPaymentIntentParams.f43195k) && this.f43196l == confirmPaymentIntentParams.f43196l && Intrinsics.b(this.f43197m, confirmPaymentIntentParams.f43197m) && Intrinsics.b(this.n, confirmPaymentIntentParams.n) && Intrinsics.b(this.o, confirmPaymentIntentParams.o) && Intrinsics.b(this.f43198p, confirmPaymentIntentParams.f43198p) && Intrinsics.b(this.f43199q, confirmPaymentIntentParams.f43199q) && Intrinsics.b(this.f43200r, confirmPaymentIntentParams.f43200r) && Intrinsics.b(this.f43201s, confirmPaymentIntentParams.f43201s);
    }

    @Override // com.stripe.android.model.ConfirmStripeIntentParams
    /* renamed from: g, reason: from getter */
    public final String getF43189e() {
        return this.f43189e;
    }

    public final int hashCode() {
        PaymentMethodCreateParams paymentMethodCreateParams = this.f43185a;
        int iHashCode = (paymentMethodCreateParams == null ? 0 : paymentMethodCreateParams.hashCode()) * 31;
        String str = this.f43186b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        SourceParams sourceParams = this.f43187c;
        int iHashCode3 = (iHashCode2 + (sourceParams == null ? 0 : sourceParams.hashCode())) * 31;
        String str2 = this.f43188d;
        int iE = b.c0.e((iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f43189e);
        String str3 = this.f43190f;
        int iHashCode4 = (iE + (str3 == null ? 0 : str3.hashCode())) * 31;
        Boolean bool = this.f43191g;
        int iF = c9.f((iHashCode4 + (bool == null ? 0 : bool.hashCode())) * 31, 31, this.f43192h);
        PaymentMethodOptionsParams paymentMethodOptionsParams = this.f43193i;
        int iHashCode5 = (iF + (paymentMethodOptionsParams == null ? 0 : paymentMethodOptionsParams.hashCode())) * 31;
        String str4 = this.f43194j;
        int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
        MandateDataParams mandateDataParams = this.f43195k;
        int iHashCode7 = (iHashCode6 + (mandateDataParams == null ? 0 : mandateDataParams.f43521a.hashCode())) * 31;
        ft.d dVar = this.f43196l;
        int iHashCode8 = (iHashCode7 + (dVar == null ? 0 : dVar.hashCode())) * 31;
        Shipping shipping = this.f43197m;
        int iHashCode9 = (iHashCode8 + (shipping == null ? 0 : shipping.hashCode())) * 31;
        String str5 = this.n;
        int iHashCode10 = (iHashCode9 + (str5 == null ? 0 : str5.hashCode())) * 31;
        Boolean bool2 = this.o;
        int iHashCode11 = (iHashCode10 + (bool2 == null ? 0 : bool2.hashCode())) * 31;
        String str6 = this.f43198p;
        int iHashCode12 = (iHashCode11 + (str6 == null ? 0 : str6.hashCode())) * 31;
        RadarOptions radarOptions = this.f43199q;
        int iHashCode13 = (iHashCode12 + (radarOptions == null ? 0 : radarOptions.hashCode())) * 31;
        ClientAttributionMetadata clientAttributionMetadata = this.f43200r;
        int iHashCode14 = (iHashCode13 + (clientAttributionMetadata == null ? 0 : clientAttributionMetadata.hashCode())) * 31;
        String str7 = this.f43201s;
        return iHashCode14 + (str7 != null ? str7.hashCode() : 0);
    }

    @Override // com.stripe.android.model.ConfirmStripeIntentParams
    /* renamed from: j0, reason: from getter */
    public final String getF43190f() {
        return this.f43190f;
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        Map mapN;
        Map mapJ0 = MapsKt.j0(new Pair("client_secret", this.f43189e), new Pair("use_stripe_sdk", Boolean.valueOf(this.f43192h)));
        Boolean bool = this.f43191g;
        Map mapE0 = bool != null ? b70.k.e0(new Pair("save_payment_method", bool)) : null;
        Map map = b70.h.f17594a;
        if (mapE0 == null) {
            mapE0 = map;
        }
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(mapJ0, mapE0);
        String str = this.f43194j;
        Map mapN2 = str != null ? a80.m.n("mandate", str) : null;
        if (mapN2 == null) {
            mapN2 = map;
        }
        LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapN2);
        PaymentMethodCreateParams paymentMethodCreateParams = this.f43185a;
        MandateDataParams mandateDataParams = this.f43195k;
        Map mapK0 = mandateDataParams != null ? mandateDataParams.k0() : (paymentMethodCreateParams != null && paymentMethodCreateParams.f43681b && str == null) ? new MandateDataParams(MandateDataParams.Type.Online.f43522d).k0() : null;
        Map mapO = mapK0 != null ? com.google.android.gms.internal.measurement.k2.o("mandate_data", mapK0) : null;
        if (mapO == null) {
            mapO = map;
        }
        LinkedHashMap linkedHashMapM03 = MapsKt.m0(linkedHashMapM02, mapO);
        String str2 = this.f43190f;
        Map mapN3 = str2 != null ? a80.m.n("return_url", str2) : null;
        if (mapN3 == null) {
            mapN3 = map;
        }
        LinkedHashMap linkedHashMapM04 = MapsKt.m0(linkedHashMapM03, mapN3);
        PaymentMethodOptionsParams paymentMethodOptionsParams = this.f43193i;
        Map mapO2 = paymentMethodOptionsParams != null ? com.google.android.gms.internal.measurement.k2.o("payment_method_options", paymentMethodOptionsParams.k0()) : null;
        if (mapO2 == null) {
            mapO2 = map;
        }
        LinkedHashMap linkedHashMapM05 = MapsKt.m0(linkedHashMapM04, mapO2);
        ft.d dVar = this.f43196l;
        Map mapN4 = dVar != null ? a80.m.n("setup_future_usage", dVar.f55930a) : null;
        if (mapN4 == null) {
            mapN4 = map;
        }
        LinkedHashMap linkedHashMapM06 = MapsKt.m0(linkedHashMapM05, mapN4);
        Boolean bool2 = this.o;
        Map mapE02 = bool2 != null ? b70.k.e0(new Pair("set_as_default_payment_method", bool2)) : null;
        if (mapE02 == null) {
            mapE02 = map;
        }
        LinkedHashMap linkedHashMapM07 = MapsKt.m0(linkedHashMapM06, mapE02);
        Shipping shipping = this.f43197m;
        Map mapO3 = shipping != null ? com.google.android.gms.internal.measurement.k2.o("shipping", shipping.k0()) : null;
        if (mapO3 == null) {
            mapO3 = map;
        }
        LinkedHashMap linkedHashMapM08 = MapsKt.m0(linkedHashMapM07, mapO3);
        RadarOptions radarOptions = this.f43199q;
        Map mapO4 = radarOptions != null ? com.google.android.gms.internal.measurement.k2.o("radar_options", radarOptions.k0()) : null;
        if (mapO4 == null) {
            mapO4 = map;
        }
        LinkedHashMap linkedHashMapM09 = MapsKt.m0(linkedHashMapM08, mapO4);
        if (paymentMethodCreateParams != null) {
            mapN = com.google.android.gms.internal.measurement.k2.o("payment_method_data", paymentMethodCreateParams.k0());
        } else {
            String str3 = this.f43186b;
            if (str3 != null) {
                mapN = a80.m.n("payment_method", str3);
            } else {
                String str4 = this.f43201s;
                if (str4 != null) {
                    mapN = a80.m.n("confirmation_token", str4);
                } else {
                    SourceParams sourceParams = this.f43187c;
                    if (sourceParams != null) {
                        mapN = com.google.android.gms.internal.measurement.k2.o("source_data", sourceParams.k0());
                    } else {
                        String str5 = this.f43188d;
                        mapN = str5 != null ? a80.m.n(Plan.AMP_PLAN_SOURCE, str5) : map;
                    }
                }
            }
        }
        LinkedHashMap linkedHashMapM010 = MapsKt.m0(linkedHashMapM09, mapN);
        String str6 = this.n;
        Map mapN5 = str6 != null ? a80.m.n("receipt_email", str6) : null;
        if (mapN5 == null) {
            mapN5 = map;
        }
        LinkedHashMap linkedHashMapM011 = MapsKt.m0(linkedHashMapM010, mapN5);
        ClientAttributionMetadata clientAttributionMetadata = this.f43200r;
        Map mapO5 = clientAttributionMetadata != null ? com.google.android.gms.internal.measurement.k2.o("client_attribution_metadata", clientAttributionMetadata.k0()) : null;
        if (mapO5 != null) {
            map = mapO5;
        }
        return MapsKt.m0(linkedHashMapM011, map);
    }

    public final String toString() {
        String str = this.f43190f;
        StringBuilder sb2 = new StringBuilder("ConfirmPaymentIntentParams(paymentMethodCreateParams=");
        sb2.append(this.f43185a);
        sb2.append(", paymentMethodId=");
        sb2.append(this.f43186b);
        sb2.append(", sourceParams=");
        sb2.append(this.f43187c);
        sb2.append(", sourceId=");
        sb2.append(this.f43188d);
        sb2.append(", clientSecret=");
        b.c0.D(sb2, this.f43189e, ", returnUrl=", str, ", savePaymentMethod=");
        sb2.append(this.f43191g);
        sb2.append(", useStripeSdk=");
        sb2.append(this.f43192h);
        sb2.append(", paymentMethodOptions=");
        sb2.append(this.f43193i);
        sb2.append(", mandateId=");
        sb2.append(this.f43194j);
        sb2.append(", mandateData=");
        sb2.append(this.f43195k);
        sb2.append(", setupFutureUsage=");
        sb2.append(this.f43196l);
        sb2.append(", shipping=");
        sb2.append(this.f43197m);
        sb2.append(", receiptEmail=");
        sb2.append(this.n);
        sb2.append(", setAsDefaultPaymentMethod=");
        sb2.append(this.o);
        sb2.append(", paymentMethodCode=");
        sb2.append(this.f43198p);
        sb2.append(", radarOptions=");
        sb2.append(this.f43199q);
        sb2.append(", clientAttributionMetadata=");
        sb2.append(this.f43200r);
        sb2.append(", confirmationTokenId=");
        return b.c0.q(sb2, this.f43201s, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) throws JSONException {
        Intrinsics.g(dest, "dest");
        PaymentMethodCreateParams paymentMethodCreateParams = this.f43185a;
        if (paymentMethodCreateParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentMethodCreateParams.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43186b);
        SourceParams sourceParams = this.f43187c;
        if (sourceParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            sourceParams.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43188d);
        dest.writeString(this.f43189e);
        dest.writeString(this.f43190f);
        Boolean bool = this.f43191g;
        if (bool == null) {
            dest.writeInt(0);
        } else {
            com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
        }
        dest.writeInt(this.f43192h ? 1 : 0);
        dest.writeParcelable(this.f43193i, i5);
        dest.writeString(this.f43194j);
        MandateDataParams mandateDataParams = this.f43195k;
        if (mandateDataParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            mandateDataParams.writeToParcel(dest, i5);
        }
        ft.d dVar = this.f43196l;
        if (dVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(dVar.name());
        }
        Shipping shipping = this.f43197m;
        if (shipping == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            shipping.writeToParcel(dest, i5);
        }
        dest.writeString(this.n);
        Boolean bool2 = this.o;
        if (bool2 == null) {
            dest.writeInt(0);
        } else {
            com.google.android.gms.internal.measurement.k2.w(dest, 1, bool2);
        }
        dest.writeString(this.f43198p);
        RadarOptions radarOptions = this.f43199q;
        if (radarOptions == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            radarOptions.writeToParcel(dest, i5);
        }
        ClientAttributionMetadata clientAttributionMetadata = this.f43200r;
        if (clientAttributionMetadata == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            clientAttributionMetadata.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43201s);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public ConfirmPaymentIntentParams(PaymentMethodCreateParams paymentMethodCreateParams, String str, String str2, Boolean bool, PaymentMethodOptionsParams paymentMethodOptionsParams, MandateDataParams mandateDataParams, ft.d dVar, Shipping shipping, Boolean bool2, String str3, RadarOptions radarOptions, ClientAttributionMetadata clientAttributionMetadata, String str4, int i5) {
        String str5;
        PaymentMethodCreateParams paymentMethodCreateParams2 = (i5 & 1) != 0 ? null : paymentMethodCreateParams;
        String str6 = (i5 & 2) != 0 ? null : str;
        Boolean bool3 = (i5 & 64) != 0 ? null : bool;
        boolean z11 = (i5 & 128) == 0;
        PaymentMethodOptionsParams paymentMethodOptionsParams2 = (i5 & 256) != 0 ? null : paymentMethodOptionsParams;
        MandateDataParams mandateDataParams2 = (i5 & 1024) != 0 ? null : mandateDataParams;
        ft.d dVar2 = (i5 & 2048) != 0 ? null : dVar;
        Shipping shipping2 = (i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? null : shipping;
        Boolean bool4 = (i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : bool2;
        if ((32768 & i5) != 0) {
            str5 = paymentMethodCreateParams2 != null ? paymentMethodCreateParams2.f43680a : null;
        } else {
            str5 = str3;
        }
        this(paymentMethodCreateParams2, str6, null, null, str2, null, bool3, z11, paymentMethodOptionsParams2, null, mandateDataParams2, dVar2, shipping2, null, bool4, str5, (65536 & i5) != 0 ? null : radarOptions, (131072 & i5) != 0 ? null : clientAttributionMetadata, (i5 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? null : str4);
    }
}
