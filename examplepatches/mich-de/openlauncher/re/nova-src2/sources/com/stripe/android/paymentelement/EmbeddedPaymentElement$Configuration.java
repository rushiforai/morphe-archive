package com.stripe.android.paymentelement;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import b.u4;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import com.stripe.android.paymentsheet.PaymentSheet$CardFundingType;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$GooglePayConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$LinkConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kt.j;
import org.jetbrains.annotations.NotNull;
import ou.w0;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentelement/EmbeddedPaymentElement$Configuration", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class EmbeddedPaymentElement$Configuration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<EmbeddedPaymentElement$Configuration> CREATOR = new ji.a(15);

    /* renamed from: a, reason: collision with root package name */
    public final String f44107a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$CustomerConfiguration f44108b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentSheet$GooglePayConfiguration f44109c;

    /* renamed from: d, reason: collision with root package name */
    public final PaymentSheet$BillingDetails f44110d;

    /* renamed from: e, reason: collision with root package name */
    public final AddressDetails f44111e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f44112f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f44113g;

    /* renamed from: h, reason: collision with root package name */
    public final PaymentSheet$Appearance f44114h;

    /* renamed from: i, reason: collision with root package name */
    public final String f44115i;

    /* renamed from: j, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f44116j;

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f44117k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f44118l;

    /* renamed from: m, reason: collision with root package name */
    public final List f44119m;
    public final List n;
    public final PaymentSheet$CardBrandAcceptance o;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayList f44120p;

    /* renamed from: q, reason: collision with root package name */
    public final ArrayList f44121q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f44122r;

    /* renamed from: s, reason: collision with root package name */
    public final PaymentSheet$LinkConfiguration f44123s;

    /* renamed from: t, reason: collision with root package name */
    public final j f44124t;

    /* renamed from: u, reason: collision with root package name */
    public final LinkedHashMap f44125u;

    /* renamed from: v, reason: collision with root package name */
    public final boolean f44126v;

    /* renamed from: w, reason: collision with root package name */
    public final String f44127w;

    public EmbeddedPaymentElement$Configuration(String merchantDisplayName, PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration, PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration, PaymentSheet$BillingDetails paymentSheet$BillingDetails, AddressDetails addressDetails, boolean z11, boolean z12, PaymentSheet$Appearance appearance, String str, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration, ArrayList arrayList, boolean z13, ArrayList paymentMethodOrder, ArrayList externalPaymentMethods, PaymentSheet$CardBrandAcceptance cardBrandAcceptance, ArrayList arrayList2, ArrayList arrayList3, boolean z14, PaymentSheet$LinkConfiguration link, j formSheetAction, LinkedHashMap linkedHashMap, boolean z15, String str2) {
        Intrinsics.g(merchantDisplayName, "merchantDisplayName");
        Intrinsics.g(appearance, "appearance");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        Intrinsics.g(paymentMethodOrder, "paymentMethodOrder");
        Intrinsics.g(externalPaymentMethods, "externalPaymentMethods");
        Intrinsics.g(cardBrandAcceptance, "cardBrandAcceptance");
        Intrinsics.g(link, "link");
        Intrinsics.g(formSheetAction, "formSheetAction");
        this.f44107a = merchantDisplayName;
        this.f44108b = paymentSheet$CustomerConfiguration;
        this.f44109c = paymentSheet$GooglePayConfiguration;
        this.f44110d = paymentSheet$BillingDetails;
        this.f44111e = addressDetails;
        this.f44112f = z11;
        this.f44113g = z12;
        this.f44114h = appearance;
        this.f44115i = str;
        this.f44116j = billingDetailsCollectionConfiguration;
        this.f44117k = arrayList;
        this.f44118l = z13;
        this.f44119m = paymentMethodOrder;
        this.n = externalPaymentMethods;
        this.o = cardBrandAcceptance;
        this.f44120p = arrayList2;
        this.f44121q = arrayList3;
        this.f44122r = z14;
        this.f44123s = link;
        this.f44124t = formSheetAction;
        this.f44125u = linkedHashMap;
        this.f44126v = z15;
        this.f44127w = str2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof EmbeddedPaymentElement$Configuration)) {
            return false;
        }
        EmbeddedPaymentElement$Configuration embeddedPaymentElement$Configuration = (EmbeddedPaymentElement$Configuration) obj;
        return Intrinsics.b(this.f44107a, embeddedPaymentElement$Configuration.f44107a) && Intrinsics.b(this.f44108b, embeddedPaymentElement$Configuration.f44108b) && Intrinsics.b(this.f44109c, embeddedPaymentElement$Configuration.f44109c) && Intrinsics.b(this.f44110d, embeddedPaymentElement$Configuration.f44110d) && Intrinsics.b(this.f44111e, embeddedPaymentElement$Configuration.f44111e) && this.f44112f == embeddedPaymentElement$Configuration.f44112f && this.f44113g == embeddedPaymentElement$Configuration.f44113g && Intrinsics.b(this.f44114h, embeddedPaymentElement$Configuration.f44114h) && Intrinsics.b(this.f44115i, embeddedPaymentElement$Configuration.f44115i) && Intrinsics.b(this.f44116j, embeddedPaymentElement$Configuration.f44116j) && this.f44117k.equals(embeddedPaymentElement$Configuration.f44117k) && this.f44118l == embeddedPaymentElement$Configuration.f44118l && Intrinsics.b(this.f44119m, embeddedPaymentElement$Configuration.f44119m) && Intrinsics.b(this.n, embeddedPaymentElement$Configuration.n) && Intrinsics.b(this.o, embeddedPaymentElement$Configuration.o) && this.f44120p.equals(embeddedPaymentElement$Configuration.f44120p) && this.f44121q.equals(embeddedPaymentElement$Configuration.f44121q) && this.f44122r == embeddedPaymentElement$Configuration.f44122r && Intrinsics.b(this.f44123s, embeddedPaymentElement$Configuration.f44123s) && this.f44124t == embeddedPaymentElement$Configuration.f44124t && this.f44125u.equals(embeddedPaymentElement$Configuration.f44125u) && this.f44126v == embeddedPaymentElement$Configuration.f44126v && Intrinsics.b(this.f44127w, embeddedPaymentElement$Configuration.f44127w);
    }

    public final int hashCode() {
        int iHashCode = this.f44107a.hashCode() * 31;
        PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = this.f44108b;
        int iHashCode2 = (iHashCode + (paymentSheet$CustomerConfiguration == null ? 0 : paymentSheet$CustomerConfiguration.hashCode())) * 31;
        PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration = this.f44109c;
        int iHashCode3 = (iHashCode2 + (paymentSheet$GooglePayConfiguration == null ? 0 : paymentSheet$GooglePayConfiguration.hashCode())) * 31;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f44110d;
        int iHashCode4 = (iHashCode3 + (paymentSheet$BillingDetails == null ? 0 : paymentSheet$BillingDetails.hashCode())) * 31;
        AddressDetails addressDetails = this.f44111e;
        int iHashCode5 = (this.f44114h.hashCode() + c9.f(c9.f((iHashCode4 + (addressDetails == null ? 0 : addressDetails.hashCode())) * 31, 31, this.f44112f), 31, this.f44113g)) * 31;
        String str = this.f44115i;
        int iF = c9.f((this.f44125u.hashCode() + ((this.f44124t.hashCode() + ((this.f44123s.hashCode() + c9.f((this.f44121q.hashCode() + ((this.f44120p.hashCode() + ((this.o.hashCode() + u4.c(u4.c(c9.f((this.f44117k.hashCode() + ((this.f44116j.hashCode() + ((iHashCode5 + (str == null ? 0 : str.hashCode())) * 31)) * 31)) * 31, 31, this.f44118l), 31, this.f44119m), 31, this.n)) * 31)) * 31)) * 31, 31, this.f44122r)) * 31)) * 31)) * 31, 31, this.f44126v);
        String str2 = this.f44127w;
        return iF + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Configuration(merchantDisplayName=");
        sb2.append(this.f44107a);
        sb2.append(", customer=");
        sb2.append(this.f44108b);
        sb2.append(", googlePay=");
        sb2.append(this.f44109c);
        sb2.append(", defaultBillingDetails=");
        sb2.append(this.f44110d);
        sb2.append(", shippingDetails=");
        sb2.append(this.f44111e);
        sb2.append(", allowsDelayedPaymentMethods=");
        sb2.append(this.f44112f);
        sb2.append(", allowsPaymentMethodsRequiringShippingAddress=");
        sb2.append(this.f44113g);
        sb2.append(", appearance=");
        sb2.append(this.f44114h);
        sb2.append(", primaryButtonLabel=");
        sb2.append(this.f44115i);
        sb2.append(", billingDetailsCollectionConfiguration=");
        sb2.append(this.f44116j);
        sb2.append(", preferredNetworks=");
        sb2.append(this.f44117k);
        sb2.append(", allowsRemovalOfLastSavedPaymentMethod=");
        sb2.append(this.f44118l);
        sb2.append(", paymentMethodOrder=");
        sb2.append(this.f44119m);
        sb2.append(", externalPaymentMethods=");
        sb2.append(this.n);
        sb2.append(", cardBrandAcceptance=");
        sb2.append(this.o);
        sb2.append(", allowedCardFundingTypes=");
        sb2.append(this.f44120p);
        sb2.append(", customPaymentMethods=");
        sb2.append(this.f44121q);
        sb2.append(", embeddedViewDisplaysMandateText=");
        sb2.append(this.f44122r);
        sb2.append(", link=");
        sb2.append(this.f44123s);
        sb2.append(", formSheetAction=");
        sb2.append(this.f44124t);
        sb2.append(", termsDisplay=");
        sb2.append(this.f44125u);
        sb2.append(", opensCardScannerAutomatically=");
        sb2.append(this.f44126v);
        sb2.append(", userOverrideCountry=");
        return c0.q(sb2, this.f44127w, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44107a);
        PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = this.f44108b;
        if (paymentSheet$CustomerConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$CustomerConfiguration.writeToParcel(dest, i5);
        }
        PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration = this.f44109c;
        if (paymentSheet$GooglePayConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$GooglePayConfiguration.writeToParcel(dest, i5);
        }
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f44110d;
        if (paymentSheet$BillingDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$BillingDetails.writeToParcel(dest, i5);
        }
        dest.writeParcelable(this.f44111e, i5);
        dest.writeInt(this.f44112f ? 1 : 0);
        dest.writeInt(this.f44113g ? 1 : 0);
        this.f44114h.writeToParcel(dest, i5);
        dest.writeString(this.f44115i);
        this.f44116j.writeToParcel(dest, i5);
        Iterator itJ = fq.c.j(this.f44117k, dest);
        while (itJ.hasNext()) {
            dest.writeString(((ft.b) itJ.next()).name());
        }
        dest.writeInt(this.f44118l ? 1 : 0);
        dest.writeStringList(this.f44119m);
        dest.writeStringList(this.n);
        dest.writeParcelable(this.o, i5);
        Iterator itJ2 = fq.c.j(this.f44120p, dest);
        while (itJ2.hasNext()) {
            ((PaymentSheet$CardFundingType) itJ2.next()).writeToParcel(dest, i5);
        }
        Iterator itJ3 = fq.c.j(this.f44121q, dest);
        while (itJ3.hasNext()) {
            ((PaymentSheet$CustomPaymentMethod) itJ3.next()).writeToParcel(dest, i5);
        }
        dest.writeInt(this.f44122r ? 1 : 0);
        this.f44123s.writeToParcel(dest, i5);
        dest.writeString(this.f44124t.name());
        LinkedHashMap linkedHashMap = this.f44125u;
        dest.writeInt(linkedHashMap.size());
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            dest.writeParcelable((Parcelable) entry.getKey(), i5);
            dest.writeString(((w0) entry.getValue()).name());
        }
        dest.writeInt(this.f44126v ? 1 : 0);
        dest.writeString(this.f44127w);
    }
}
