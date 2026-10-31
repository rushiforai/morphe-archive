package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import b.u4;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$Configuration", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class PaymentSheet$Configuration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$Configuration> CREATOR = new ou.l0(6);

    /* renamed from: a, reason: collision with root package name */
    public final String f44544a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSheet$CustomerConfiguration f44545b;

    /* renamed from: c, reason: collision with root package name */
    public final PaymentSheet$GooglePayConfiguration f44546c;

    /* renamed from: d, reason: collision with root package name */
    public final PaymentSheet$BillingDetails f44547d;

    /* renamed from: e, reason: collision with root package name */
    public final AddressDetails f44548e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f44549f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f44550g;

    /* renamed from: h, reason: collision with root package name */
    public final PaymentSheet$Appearance f44551h;

    /* renamed from: i, reason: collision with root package name */
    public final String f44552i;

    /* renamed from: j, reason: collision with root package name */
    public final PaymentSheet$BillingDetailsCollectionConfiguration f44553j;

    /* renamed from: k, reason: collision with root package name */
    public final List f44554k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f44555l;

    /* renamed from: m, reason: collision with root package name */
    public final List f44556m;
    public final List n;
    public final ou.v0 o;

    /* renamed from: p, reason: collision with root package name */
    public final PaymentSheet$CardBrandAcceptance f44557p;

    /* renamed from: q, reason: collision with root package name */
    public final List f44558q;

    /* renamed from: r, reason: collision with root package name */
    public final List f44559r;

    /* renamed from: s, reason: collision with root package name */
    public final PaymentSheet$LinkConfiguration f44560s;

    /* renamed from: t, reason: collision with root package name */
    public final PaymentSheet$WalletButtonsConfiguration f44561t;

    /* renamed from: u, reason: collision with root package name */
    public final PaymentSheet$ShopPayConfiguration f44562u;

    /* renamed from: v, reason: collision with root package name */
    public final String f44563v;

    /* renamed from: w, reason: collision with root package name */
    public final Map f44564w;

    /* renamed from: x, reason: collision with root package name */
    public final boolean f44565x;

    /* renamed from: y, reason: collision with root package name */
    public final String f44566y;

    public PaymentSheet$Configuration(String merchantDisplayName, PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration, PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration, PaymentSheet$BillingDetails paymentSheet$BillingDetails, AddressDetails addressDetails, boolean z11, boolean z12, PaymentSheet$Appearance appearance, String str, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration, List preferredNetworks, boolean z13, List paymentMethodOrder, List externalPaymentMethods, ou.v0 paymentMethodLayout, PaymentSheet$CardBrandAcceptance cardBrandAcceptance, List allowedCardFundingTypes, List customPaymentMethods, PaymentSheet$LinkConfiguration link, PaymentSheet$WalletButtonsConfiguration walletButtons, PaymentSheet$ShopPayConfiguration paymentSheet$ShopPayConfiguration, String str2, Map termsDisplay, boolean z14, String str3) {
        Intrinsics.g(merchantDisplayName, "merchantDisplayName");
        Intrinsics.g(appearance, "appearance");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        Intrinsics.g(preferredNetworks, "preferredNetworks");
        Intrinsics.g(paymentMethodOrder, "paymentMethodOrder");
        Intrinsics.g(externalPaymentMethods, "externalPaymentMethods");
        Intrinsics.g(paymentMethodLayout, "paymentMethodLayout");
        Intrinsics.g(cardBrandAcceptance, "cardBrandAcceptance");
        Intrinsics.g(allowedCardFundingTypes, "allowedCardFundingTypes");
        Intrinsics.g(customPaymentMethods, "customPaymentMethods");
        Intrinsics.g(link, "link");
        Intrinsics.g(walletButtons, "walletButtons");
        Intrinsics.g(termsDisplay, "termsDisplay");
        this.f44544a = merchantDisplayName;
        this.f44545b = paymentSheet$CustomerConfiguration;
        this.f44546c = paymentSheet$GooglePayConfiguration;
        this.f44547d = paymentSheet$BillingDetails;
        this.f44548e = addressDetails;
        this.f44549f = z11;
        this.f44550g = z12;
        this.f44551h = appearance;
        this.f44552i = str;
        this.f44553j = billingDetailsCollectionConfiguration;
        this.f44554k = preferredNetworks;
        this.f44555l = z13;
        this.f44556m = paymentMethodOrder;
        this.n = externalPaymentMethods;
        this.o = paymentMethodLayout;
        this.f44557p = cardBrandAcceptance;
        this.f44558q = allowedCardFundingTypes;
        this.f44559r = customPaymentMethods;
        this.f44560s = link;
        this.f44561t = walletButtons;
        this.f44562u = paymentSheet$ShopPayConfiguration;
        this.f44563v = str2;
        this.f44564w = termsDisplay;
        this.f44565x = z14;
        this.f44566y = str3;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$Configuration)) {
            return false;
        }
        PaymentSheet$Configuration paymentSheet$Configuration = (PaymentSheet$Configuration) obj;
        return Intrinsics.b(this.f44544a, paymentSheet$Configuration.f44544a) && Intrinsics.b(this.f44545b, paymentSheet$Configuration.f44545b) && Intrinsics.b(this.f44546c, paymentSheet$Configuration.f44546c) && Intrinsics.b(this.f44547d, paymentSheet$Configuration.f44547d) && Intrinsics.b(this.f44548e, paymentSheet$Configuration.f44548e) && this.f44549f == paymentSheet$Configuration.f44549f && this.f44550g == paymentSheet$Configuration.f44550g && Intrinsics.b(this.f44551h, paymentSheet$Configuration.f44551h) && Intrinsics.b(this.f44552i, paymentSheet$Configuration.f44552i) && Intrinsics.b(this.f44553j, paymentSheet$Configuration.f44553j) && Intrinsics.b(this.f44554k, paymentSheet$Configuration.f44554k) && this.f44555l == paymentSheet$Configuration.f44555l && Intrinsics.b(this.f44556m, paymentSheet$Configuration.f44556m) && Intrinsics.b(this.n, paymentSheet$Configuration.n) && this.o == paymentSheet$Configuration.o && Intrinsics.b(this.f44557p, paymentSheet$Configuration.f44557p) && Intrinsics.b(this.f44558q, paymentSheet$Configuration.f44558q) && Intrinsics.b(this.f44559r, paymentSheet$Configuration.f44559r) && Intrinsics.b(this.f44560s, paymentSheet$Configuration.f44560s) && Intrinsics.b(this.f44561t, paymentSheet$Configuration.f44561t) && Intrinsics.b(this.f44562u, paymentSheet$Configuration.f44562u) && Intrinsics.b(this.f44563v, paymentSheet$Configuration.f44563v) && Intrinsics.b(this.f44564w, paymentSheet$Configuration.f44564w) && this.f44565x == paymentSheet$Configuration.f44565x && Intrinsics.b(this.f44566y, paymentSheet$Configuration.f44566y);
    }

    public final int hashCode() {
        int iHashCode = this.f44544a.hashCode() * 31;
        PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = this.f44545b;
        int iHashCode2 = (iHashCode + (paymentSheet$CustomerConfiguration == null ? 0 : paymentSheet$CustomerConfiguration.hashCode())) * 31;
        PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration = this.f44546c;
        int iHashCode3 = (iHashCode2 + (paymentSheet$GooglePayConfiguration == null ? 0 : paymentSheet$GooglePayConfiguration.hashCode())) * 31;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f44547d;
        int iHashCode4 = (iHashCode3 + (paymentSheet$BillingDetails == null ? 0 : paymentSheet$BillingDetails.hashCode())) * 31;
        AddressDetails addressDetails = this.f44548e;
        int iHashCode5 = (this.f44551h.hashCode() + c9.f(c9.f((iHashCode4 + (addressDetails == null ? 0 : addressDetails.hashCode())) * 31, 31, this.f44549f), 31, this.f44550g)) * 31;
        String str = this.f44552i;
        int iHashCode6 = (this.f44561t.hashCode() + ((this.f44560s.hashCode() + u4.c(u4.c((this.f44557p.hashCode() + ((this.o.hashCode() + u4.c(u4.c(c9.f(u4.c((this.f44553j.hashCode() + ((iHashCode5 + (str == null ? 0 : str.hashCode())) * 31)) * 31, 31, this.f44554k), 31, this.f44555l), 31, this.f44556m), 31, this.n)) * 31)) * 31, 31, this.f44558q), 31, this.f44559r)) * 31)) * 31;
        PaymentSheet$ShopPayConfiguration paymentSheet$ShopPayConfiguration = this.f44562u;
        int iHashCode7 = (iHashCode6 + (paymentSheet$ShopPayConfiguration == null ? 0 : paymentSheet$ShopPayConfiguration.hashCode())) * 31;
        String str2 = this.f44563v;
        int iF = c9.f(x8.h.c(this.f44564w, (iHashCode7 + (str2 == null ? 0 : str2.hashCode())) * 31, 31), 31, this.f44565x);
        String str3 = this.f44566y;
        return iF + (str3 != null ? str3.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Configuration(merchantDisplayName=");
        sb2.append(this.f44544a);
        sb2.append(", customer=");
        sb2.append(this.f44545b);
        sb2.append(", googlePay=");
        sb2.append(this.f44546c);
        sb2.append(", defaultBillingDetails=");
        sb2.append(this.f44547d);
        sb2.append(", shippingDetails=");
        sb2.append(this.f44548e);
        sb2.append(", allowsDelayedPaymentMethods=");
        sb2.append(this.f44549f);
        sb2.append(", allowsPaymentMethodsRequiringShippingAddress=");
        sb2.append(this.f44550g);
        sb2.append(", appearance=");
        sb2.append(this.f44551h);
        sb2.append(", primaryButtonLabel=");
        sb2.append(this.f44552i);
        sb2.append(", billingDetailsCollectionConfiguration=");
        sb2.append(this.f44553j);
        sb2.append(", preferredNetworks=");
        sb2.append(this.f44554k);
        sb2.append(", allowsRemovalOfLastSavedPaymentMethod=");
        sb2.append(this.f44555l);
        sb2.append(", paymentMethodOrder=");
        sb2.append(this.f44556m);
        sb2.append(", externalPaymentMethods=");
        sb2.append(this.n);
        sb2.append(", paymentMethodLayout=");
        sb2.append(this.o);
        sb2.append(", cardBrandAcceptance=");
        sb2.append(this.f44557p);
        sb2.append(", allowedCardFundingTypes=");
        sb2.append(this.f44558q);
        sb2.append(", customPaymentMethods=");
        sb2.append(this.f44559r);
        sb2.append(", link=");
        sb2.append(this.f44560s);
        sb2.append(", walletButtons=");
        sb2.append(this.f44561t);
        sb2.append(", shopPayConfiguration=");
        sb2.append(this.f44562u);
        sb2.append(", googlePlacesApiKey=");
        sb2.append(this.f44563v);
        sb2.append(", termsDisplay=");
        sb2.append(this.f44564w);
        sb2.append(", opensCardScannerAutomatically=");
        sb2.append(this.f44565x);
        sb2.append(", userOverrideCountry=");
        return b.c0.q(sb2, this.f44566y, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44544a);
        PaymentSheet$CustomerConfiguration paymentSheet$CustomerConfiguration = this.f44545b;
        if (paymentSheet$CustomerConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$CustomerConfiguration.writeToParcel(dest, i5);
        }
        PaymentSheet$GooglePayConfiguration paymentSheet$GooglePayConfiguration = this.f44546c;
        if (paymentSheet$GooglePayConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$GooglePayConfiguration.writeToParcel(dest, i5);
        }
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.f44547d;
        if (paymentSheet$BillingDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$BillingDetails.writeToParcel(dest, i5);
        }
        dest.writeParcelable(this.f44548e, i5);
        dest.writeInt(this.f44549f ? 1 : 0);
        dest.writeInt(this.f44550g ? 1 : 0);
        this.f44551h.writeToParcel(dest, i5);
        dest.writeString(this.f44552i);
        this.f44553j.writeToParcel(dest, i5);
        Iterator itK = fq.c.k(this.f44554k, dest);
        while (itK.hasNext()) {
            dest.writeString(((ft.b) itK.next()).name());
        }
        dest.writeInt(this.f44555l ? 1 : 0);
        dest.writeStringList(this.f44556m);
        dest.writeStringList(this.n);
        dest.writeString(this.o.name());
        dest.writeParcelable(this.f44557p, i5);
        Iterator itK2 = fq.c.k(this.f44558q, dest);
        while (itK2.hasNext()) {
            ((PaymentSheet$CardFundingType) itK2.next()).writeToParcel(dest, i5);
        }
        Iterator itK3 = fq.c.k(this.f44559r, dest);
        while (itK3.hasNext()) {
            ((PaymentSheet$CustomPaymentMethod) itK3.next()).writeToParcel(dest, i5);
        }
        this.f44560s.writeToParcel(dest, i5);
        this.f44561t.writeToParcel(dest, i5);
        PaymentSheet$ShopPayConfiguration paymentSheet$ShopPayConfiguration = this.f44562u;
        if (paymentSheet$ShopPayConfiguration == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$ShopPayConfiguration.writeToParcel(dest, i5);
        }
        dest.writeString(this.f44563v);
        Map map = this.f44564w;
        dest.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            dest.writeParcelable((Parcelable) entry.getKey(), i5);
            dest.writeString(((ou.w0) entry.getValue()).name());
        }
        dest.writeInt(this.f44565x ? 1 : 0);
        dest.writeString(this.f44566y);
    }
}
