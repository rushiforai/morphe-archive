package com.stripe.android.common.model;

import a80.m;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import b.u4;
import com.stripe.android.link.LinkAppearance;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$CardBrandAcceptance;
import com.stripe.android.paymentsheet.PaymentSheet$CardFundingType;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerAccessType;
import com.stripe.android.paymentsheet.PaymentSheet$CustomerConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$GooglePayConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$LinkConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$ShopPayConfiguration;
import com.stripe.android.paymentsheet.PaymentSheet$WalletButtonsConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Regex;
import lt.a;
import org.jetbrains.annotations.NotNull;
import ou.w0;
import r70.j;
import r70.k;
import sv.b;
import wq.c;
import wq.d;
import x8.h;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/common/model/CommonConfiguration;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class CommonConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<CommonConfiguration> CREATOR = new b(6);

    /* renamed from: a, reason: collision with root package name */
    public final String f42524a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$CustomerConfiguration f42525b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentSheet$GooglePayConfiguration f42526c;

    /* renamed from: d, reason: collision with root package name */
    public final PaymentSheet$LinkConfiguration f42527d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentSheet$BillingDetails f42528e;

    /* renamed from: f, reason: collision with root package name */
    public final AddressDetails f42529f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f42530g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f42531h;

    /* renamed from: i, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f42532i;

    /* renamed from: j, reason: collision with root package name */
    public final List f42533j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f42534k;

    /* renamed from: l, reason: collision with root package name */
    public final List f42535l;

    /* renamed from: m, reason: collision with root package name */
    public final List f42536m;
    public final PaymentSheet$CardBrandAcceptance n;
    public final List o;

    /* renamed from: p, reason: collision with root package name */
    public final List f42537p;

    /* renamed from: q, reason: collision with root package name */
    public final PaymentSheet$ShopPayConfiguration f42538q;

    /* renamed from: r, reason: collision with root package name */
    public final String f42539r;

    /* renamed from: s, reason: collision with root package name */
    public final LinkAppearance f42540s;

    /* renamed from: t, reason: collision with root package name */
    public final Map f42541t;

    /* renamed from: u, reason: collision with root package name */
    public final PaymentSheet$WalletButtonsConfiguration f42542u;

    /* renamed from: v, reason: collision with root package name */
    public final boolean f42543v;

    /* renamed from: w, reason: collision with root package name */
    public final String f42544w;

    /* renamed from: x, reason: collision with root package name */
    public final PaymentSheet$Appearance f42545x;

    public CommonConfiguration(String merchantDisplayName, PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration, PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration, PaymentSheet$LinkConfiguration link, PaymentSheet$BillingDetails paymentSheet$BillingDetails, AddressDetails addressDetails, boolean z11, boolean z12, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration, List preferredNetworks, boolean z13, List paymentMethodOrder, List externalPaymentMethods, PaymentSheet$CardBrandAcceptance cardBrandAcceptance, List allowedCardFundingTypes, List customPaymentMethods, PaymentSheet$ShopPayConfiguration paymentSheet$ShopPayConfiguration, String str, LinkAppearance linkAppearance, Map termsDisplay, PaymentSheet$WalletButtonsConfiguration paymentSheet$WalletButtonsConfiguration, boolean z14, String str2, PaymentSheet$Appearance appearance) {
        Intrinsics.g(merchantDisplayName, "merchantDisplayName");
        Intrinsics.g(link, "link");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        Intrinsics.g(preferredNetworks, "preferredNetworks");
        Intrinsics.g(paymentMethodOrder, "paymentMethodOrder");
        Intrinsics.g(externalPaymentMethods, "externalPaymentMethods");
        Intrinsics.g(cardBrandAcceptance, "cardBrandAcceptance");
        Intrinsics.g(allowedCardFundingTypes, "allowedCardFundingTypes");
        Intrinsics.g(customPaymentMethods, "customPaymentMethods");
        Intrinsics.g(termsDisplay, "termsDisplay");
        Intrinsics.g(appearance, "appearance");
        this.f42524a = merchantDisplayName;
        this.f42525b = paymentSheet$CustomerConfiguration;
        this.f42526c = paymentSheet$GooglePayConfiguration;
        this.f42527d = link;
        this.f42528e = paymentSheet$BillingDetails;
        this.f42529f = addressDetails;
        this.f42530g = z11;
        this.f42531h = z12;
        this.f42532i = billingDetailsCollectionConfiguration;
        this.f42533j = preferredNetworks;
        this.f42534k = z13;
        this.f42535l = paymentMethodOrder;
        this.f42536m = externalPaymentMethods;
        this.n = cardBrandAcceptance;
        this.o = allowedCardFundingTypes;
        this.f42537p = customPaymentMethods;
        this.f42538q = paymentSheet$ShopPayConfiguration;
        this.f42539r = str;
        this.f42540s = linkAppearance;
        this.f42541t = termsDisplay;
        this.f42542u = paymentSheet$WalletButtonsConfiguration;
        this.f42543v = z14;
        this.f42544w = str2;
        this.f42545x = appearance;
    }

    public final void a(String callbackIdentifier, boolean z11) {
        String str;
        Intrinsics.g(callbackIdentifier, "callbackIdentifier");
        if (k.U0(this.f42524a)) {
            throw new IllegalArgumentException("When a Configuration is passed to PaymentSheet, the Merchant display name cannot be an empty string.");
        }
        PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = this.f42525b;
        if (paymentSheet$CustomerConfiguration != null && (str = paymentSheet$CustomerConfiguration.f44572a) != null && k.U0(str)) {
            throw new IllegalArgumentException("When a CustomerConfiguration is passed to PaymentSheet, the Customer ID cannot be an empty string.");
        }
        for (String str2 : this.f42536m) {
            if (!j.I0(str2, "external_", false) && !z11) {
                throw new IllegalArgumentException(c0.l("External payment method '", str2, "' does not start with 'external_'. All external payment methods must use the 'external_' prefix. See https://docs.stripe.com/payments/external-payment-methods?platform=android#available-external-payment-methods"));
            }
        }
        a.a(callbackIdentifier);
        if (paymentSheet$CustomerConfiguration != null) {
            String str3 = paymentSheet$CustomerConfiguration.f44573b;
            PaymentSheet$CustomerAccessType paymentSheet$CustomerAccessType = paymentSheet$CustomerConfiguration.f44574c;
            if (paymentSheet$CustomerAccessType != null) {
                if (paymentSheet$CustomerAccessType instanceof PaymentSheet$CustomerAccessType.LegacyCustomerEphemeralKey) {
                    String str4 = ((PaymentSheet$CustomerAccessType.LegacyCustomerEphemeralKey) paymentSheet$CustomerAccessType).f44571a;
                    if (!Intrinsics.b(str4, str3)) {
                        throw new IllegalArgumentException("Conflicting ephemeralKeySecrets between CustomerConfiguration and CustomerConfiguration.customerAccessType");
                    }
                    if (k.U0(str4) || k.U0(str3)) {
                        throw new IllegalArgumentException("When a CustomerConfiguration is passed to PaymentSheet, the ephemeralKeySecret cannot be an empty string.");
                    }
                    if (!new Regex("^ek_[^_](.)+$").f(str4) || !new Regex("^ek_[^_](.)+$").f(str3)) {
                        throw new IllegalArgumentException("`ephemeralKeySecret` format does not match expected client secret formatting");
                    }
                    return;
                }
                if (!(paymentSheet$CustomerAccessType instanceof PaymentSheet$CustomerAccessType.CustomerSession)) {
                    throw new NoWhenBranchMatchedException();
                }
                String customerSessionClientSecret = ((PaymentSheet$CustomerAccessType.CustomerSession) paymentSheet$CustomerAccessType).f44570a;
                Intrinsics.g(customerSessionClientSecret, "customerSessionClientSecret");
                Object obj = k.U0(customerSessionClientSecret) ? wq.a.f94630a : j.I0(customerSessionClientSecret, "ek_", false) ? wq.b.f94631a : !j.I0(customerSessionClientSecret, "cuss_", false) ? c.f94632a : d.f94633a;
                if (obj instanceof wq.a) {
                    throw new IllegalArgumentException("When a CustomerConfiguration is passed to PaymentSheet, the customerSessionClientSecret cannot be an empty string.");
                }
                if (obj instanceof wq.b) {
                    throw new IllegalArgumentException("Argument looks like an Ephemeral Key secret, but expecting a CustomerSession client secret. See CustomerSession API: https://docs.stripe.com/api/customer_sessions/create");
                }
                if (obj instanceof c) {
                    throw new IllegalArgumentException("Argument does not look like a CustomerSession client secret. See CustomerSession API: https://docs.stripe.com/api/customer_sessions/create");
                }
                if (!(obj instanceof d)) {
                    throw new NoWhenBranchMatchedException();
                }
            }
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CommonConfiguration)) {
            return false;
        }
        CommonConfiguration commonConfiguration = (CommonConfiguration) obj;
        return Intrinsics.b(this.f42524a, commonConfiguration.f42524a) && Intrinsics.b(this.f42525b, commonConfiguration.f42525b) && Intrinsics.b(this.f42526c, commonConfiguration.f42526c) && Intrinsics.b(this.f42527d, commonConfiguration.f42527d) && Intrinsics.b(this.f42528e, commonConfiguration.f42528e) && Intrinsics.b(this.f42529f, commonConfiguration.f42529f) && this.f42530g == commonConfiguration.f42530g && this.f42531h == commonConfiguration.f42531h && Intrinsics.b(this.f42532i, commonConfiguration.f42532i) && Intrinsics.b(this.f42533j, commonConfiguration.f42533j) && this.f42534k == commonConfiguration.f42534k && Intrinsics.b(this.f42535l, commonConfiguration.f42535l) && Intrinsics.b(this.f42536m, commonConfiguration.f42536m) && Intrinsics.b(this.n, commonConfiguration.n) && Intrinsics.b(this.o, commonConfiguration.o) && Intrinsics.b(this.f42537p, commonConfiguration.f42537p) && Intrinsics.b(this.f42538q, commonConfiguration.f42538q) && Intrinsics.b(this.f42539r, commonConfiguration.f42539r) && Intrinsics.b(this.f42540s, commonConfiguration.f42540s) && Intrinsics.b(this.f42541t, commonConfiguration.f42541t) && Intrinsics.b(this.f42542u, commonConfiguration.f42542u) && this.f42543v == commonConfiguration.f42543v && Intrinsics.b(this.f42544w, commonConfiguration.f42544w) && Intrinsics.b(this.f42545x, commonConfiguration.f42545x);
    }

    public final int hashCode() {
        int iHashCode = this.f42524a.hashCode() * 31;
        PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = this.f42525b;
        int iHashCode2 = (iHashCode + (paymentSheet$CustomerConfiguration == null ? 0 : paymentSheet$CustomerConfiguration.hashCode())) * 31;
        PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration = this.f42526c;
        int iHashCode3 = (this.f42527d.hashCode() + ((iHashCode2 + (paymentSheet$GooglePayConfiguration == null ? 0 : paymentSheet$GooglePayConfiguration.hashCode())) * 31)) * 31;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f42528e;
        int iHashCode4 = (iHashCode3 + (paymentSheet$BillingDetails == null ? 0 : paymentSheet$BillingDetails.hashCode())) * 31;
        AddressDetails addressDetails = this.f42529f;
        int iC = u4.c(u4.c((this.n.hashCode() + u4.c(u4.c(c9.f(u4.c((this.f42532i.hashCode() + c9.f(c9.f((iHashCode4 + (addressDetails == null ? 0 : addressDetails.hashCode())) * 31, 31, this.f42530g), 31, this.f42531h)) * 31, 31, this.f42533j), 31, this.f42534k), 31, this.f42535l), 31, this.f42536m)) * 31, 31, this.o), 31, this.f42537p);
        PaymentSheet$ShopPayConfiguration paymentSheet$ShopPayConfiguration = this.f42538q;
        int iHashCode5 = (iC + (paymentSheet$ShopPayConfiguration == null ? 0 : paymentSheet$ShopPayConfiguration.hashCode())) * 31;
        String str = this.f42539r;
        int iHashCode6 = (iHashCode5 + (str == null ? 0 : str.hashCode())) * 31;
        LinkAppearance linkAppearance = this.f42540s;
        int iC2 = h.c(this.f42541t, (iHashCode6 + (linkAppearance == null ? 0 : linkAppearance.hashCode())) * 31, 31);
        PaymentSheet$WalletButtonsConfiguration paymentSheet$WalletButtonsConfiguration = this.f42542u;
        int iF = c9.f((iC2 + (paymentSheet$WalletButtonsConfiguration == null ? 0 : paymentSheet$WalletButtonsConfiguration.hashCode())) * 31, 31, this.f42543v);
        String str2 = this.f42544w;
        return this.f42545x.hashCode() + ((iF + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CommonConfiguration(merchantDisplayName=");
        sb2.append(this.f42524a);
        sb2.append(", customer=");
        sb2.append(this.f42525b);
        sb2.append(", googlePay=");
        sb2.append(this.f42526c);
        sb2.append(", link=");
        sb2.append(this.f42527d);
        sb2.append(", defaultBillingDetails=");
        sb2.append(this.f42528e);
        sb2.append(", shippingDetails=");
        sb2.append(this.f42529f);
        sb2.append(", allowsDelayedPaymentMethods=");
        m.s(sb2, this.f42530g, ", allowsPaymentMethodsRequiringShippingAddress=", this.f42531h, ", billingDetailsCollectionConfiguration=");
        sb2.append(this.f42532i);
        sb2.append(", preferredNetworks=");
        sb2.append(this.f42533j);
        sb2.append(", allowsRemovalOfLastSavedPaymentMethod=");
        sb2.append(this.f42534k);
        sb2.append(", paymentMethodOrder=");
        sb2.append(this.f42535l);
        sb2.append(", externalPaymentMethods=");
        sb2.append(this.f42536m);
        sb2.append(", cardBrandAcceptance=");
        sb2.append(this.n);
        sb2.append(", allowedCardFundingTypes=");
        sb2.append(this.o);
        sb2.append(", customPaymentMethods=");
        sb2.append(this.f42537p);
        sb2.append(", shopPayConfiguration=");
        sb2.append(this.f42538q);
        sb2.append(", googlePlacesApiKey=");
        sb2.append(this.f42539r);
        sb2.append(", linkAppearance=");
        sb2.append(this.f42540s);
        sb2.append(", termsDisplay=");
        sb2.append(this.f42541t);
        sb2.append(", walletButtons=");
        sb2.append(this.f42542u);
        sb2.append(", opensCardScannerAutomatically=");
        sb2.append(this.f42543v);
        sb2.append(", userOverrideCountry=");
        sb2.append(this.f42544w);
        sb2.append(", appearance=");
        sb2.append(this.f42545x);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42524a);
        PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = this.f42525b;
        if (paymentSheet$CustomerConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$CustomerConfiguration.writeToParcel(dest, i5);
        }
        PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration = this.f42526c;
        if (paymentSheet$GooglePayConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$GooglePayConfiguration.writeToParcel(dest, i5);
        }
        this.f42527d.writeToParcel(dest, i5);
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f42528e;
        if (paymentSheet$BillingDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$BillingDetails.writeToParcel(dest, i5);
        }
        AddressDetails addressDetails = this.f42529f;
        if (addressDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            addressDetails.writeToParcel(dest, i5);
        }
        dest.writeInt(this.f42530g ? 1 : 0);
        dest.writeInt(this.f42531h ? 1 : 0);
        this.f42532i.writeToParcel(dest, i5);
        Iterator itK = fq.c.k(this.f42533j, dest);
        while (itK.hasNext()) {
            dest.writeString(((ft.b) itK.next()).name());
        }
        dest.writeInt(this.f42534k ? 1 : 0);
        dest.writeStringList(this.f42535l);
        dest.writeStringList(this.f42536m);
        dest.writeParcelable(this.n, i5);
        Iterator itK2 = fq.c.k(this.o, dest);
        while (itK2.hasNext()) {
            ((PaymentSheet$CardFundingType) itK2.next()).writeToParcel(dest, i5);
        }
        Iterator itK3 = fq.c.k(this.f42537p, dest);
        while (itK3.hasNext()) {
            ((PaymentSheet$CustomPaymentMethod) itK3.next()).writeToParcel(dest, i5);
        }
        PaymentSheet$ShopPayConfiguration paymentSheet$ShopPayConfiguration = this.f42538q;
        if (paymentSheet$ShopPayConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$ShopPayConfiguration.writeToParcel(dest, i5);
        }
        dest.writeString(this.f42539r);
        LinkAppearance linkAppearance = this.f42540s;
        if (linkAppearance == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            linkAppearance.writeToParcel(dest, i5);
        }
        Map map = this.f42541t;
        dest.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            dest.writeParcelable((Parcelable) entry.getKey(), i5);
            dest.writeString(((w0) entry.getValue()).name());
        }
        PaymentSheet$WalletButtonsConfiguration paymentSheet$WalletButtonsConfiguration = this.f42542u;
        if (paymentSheet$WalletButtonsConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$WalletButtonsConfiguration.writeToParcel(dest, i5);
        }
        dest.writeInt(this.f42543v ? 1 : 0);
        dest.writeString(this.f42544w);
        this.f42545x.writeToParcel(dest, i5);
    }
}
