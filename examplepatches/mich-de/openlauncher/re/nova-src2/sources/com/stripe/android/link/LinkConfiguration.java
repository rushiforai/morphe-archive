package com.stripe.android.link;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import b.u4;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodSaveConsentBehavior;
import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.StripeIntent;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import com.stripe.android.paymentsheet.addresselement.AddressDetails;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0081\b\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/link/LinkConfiguration;", "Landroid/os/Parcelable;", "CustomerInfo", "CardBrandChoice", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<LinkConfiguration> CREATOR = new r();
    public final boolean A;
    public final LinkAppearance B;
    public final boolean C;
    public final boolean D;
    public final String E;
    public final PaymentMethodSaveConsentBehavior F;
    public final boolean G;
    public final List H;
    public final ClientAttributionMetadata I;

    /* renamed from: a, reason: collision with root package name */
    public final StripeIntent f42895a;

    /* renamed from: b, reason: collision with root package name */
    public final String f42896b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42897c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42898d;

    /* renamed from: e, reason: collision with root package name */
    public final String f42899e;

    /* renamed from: f, reason: collision with root package name */
    public final CustomerInfo f42900f;

    /* renamed from: g, reason: collision with root package name */
    public final AddressDetails f42901g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f42902h;

    /* renamed from: i, reason: collision with root package name */
    public final Map f42903i;

    /* renamed from: j, reason: collision with root package name */
    public final CardBrandChoice f42904j;

    /* renamed from: k, reason: collision with root package name */
    public final CardBrandFilter f42905k;

    /* renamed from: l, reason: collision with root package name */
    public final CardFundingFilter f42906l;

    /* renamed from: m, reason: collision with root package name */
    public final mu.b f42907m;
    public final PaymentSheet$BillingDetailsCollectionConfiguration n;
    public final PaymentSheet$BillingDetails o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f42908p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f42909q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f42910r;

    /* renamed from: s, reason: collision with root package name */
    public final String f42911s;

    /* renamed from: t, reason: collision with root package name */
    public final ft.d0 f42912t;

    /* renamed from: u, reason: collision with root package name */
    public final boolean f42913u;

    /* renamed from: v, reason: collision with root package name */
    public final String f42914v;

    /* renamed from: w, reason: collision with root package name */
    public final boolean f42915w;

    /* renamed from: x, reason: collision with root package name */
    public final boolean f42916x;

    /* renamed from: y, reason: collision with root package name */
    public final boolean f42917y;

    /* renamed from: z, reason: collision with root package name */
    public final boolean f42918z;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkConfiguration$CardBrandChoice;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CardBrandChoice implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<CardBrandChoice> CREATOR = new q();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f42919a;

        /* renamed from: b, reason: collision with root package name */
        public final List f42920b;

        public CardBrandChoice(List preferredNetworks, boolean z11) {
            Intrinsics.g(preferredNetworks, "preferredNetworks");
            this.f42919a = z11;
            this.f42920b = preferredNetworks;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof CardBrandChoice)) {
                return false;
            }
            CardBrandChoice cardBrandChoice = (CardBrandChoice) obj;
            return this.f42919a == cardBrandChoice.f42919a && Intrinsics.b(this.f42920b, cardBrandChoice.f42920b);
        }

        public final int hashCode() {
            return this.f42920b.hashCode() + (Boolean.hashCode(this.f42919a) * 31);
        }

        public final String toString() {
            return "CardBrandChoice(eligible=" + this.f42919a + ", preferredNetworks=" + this.f42920b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(this.f42919a ? 1 : 0);
            dest.writeStringList(this.f42920b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/LinkConfiguration$CustomerInfo;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CustomerInfo implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<CustomerInfo> CREATOR = new s();

        /* renamed from: a, reason: collision with root package name */
        public final String f42921a;

        /* renamed from: b, reason: collision with root package name */
        public final String f42922b;

        /* renamed from: c, reason: collision with root package name */
        public final String f42923c;

        /* renamed from: d, reason: collision with root package name */
        public final String f42924d;

        public CustomerInfo(String str, String str2, String str3, String str4) {
            this.f42921a = str;
            this.f42922b = str2;
            this.f42923c = str3;
            this.f42924d = str4;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof CustomerInfo)) {
                return false;
            }
            CustomerInfo customerInfo = (CustomerInfo) obj;
            return Intrinsics.b(this.f42921a, customerInfo.f42921a) && Intrinsics.b(this.f42922b, customerInfo.f42922b) && Intrinsics.b(this.f42923c, customerInfo.f42923c) && Intrinsics.b(this.f42924d, customerInfo.f42924d);
        }

        public final int hashCode() {
            String str = this.f42921a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f42922b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f42923c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f42924d;
            return iHashCode3 + (str4 != null ? str4.hashCode() : 0);
        }

        public final String toString() {
            return b.c0.s(b.c0.w("CustomerInfo(name=", this.f42921a, ", email=", this.f42922b, ", phone="), this.f42923c, ", billingCountryCode=", this.f42924d, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f42921a);
            dest.writeString(this.f42922b);
            dest.writeString(this.f42923c);
            dest.writeString(this.f42924d);
        }
    }

    public LinkConfiguration(StripeIntent stripeIntent, String merchantName, String str, String str2, String str3, CustomerInfo customerInfo, AddressDetails addressDetails, boolean z11, Map map, CardBrandChoice cardBrandChoice, CardBrandFilter cardBrandFilter, CardFundingFilter cardFundingFilter, mu.b bVar, PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration, PaymentSheet$BillingDetails paymentSheet$BillingDetails, boolean z12, boolean z13, boolean z14, String elementsSessionId, ft.d0 d0Var, boolean z15, String str4, boolean z16, boolean z17, boolean z18, boolean z19, boolean z21, LinkAppearance linkAppearance, boolean z22, boolean z23, String str5, PaymentMethodSaveConsentBehavior saveConsentBehavior, boolean z24, List linkSupportedPaymentMethodsOnboardingEnabled, ClientAttributionMetadata clientAttributionMetadata) {
        Intrinsics.g(stripeIntent, "stripeIntent");
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(customerInfo, "customerInfo");
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        Intrinsics.g(cardFundingFilter, "cardFundingFilter");
        Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
        Intrinsics.g(elementsSessionId, "elementsSessionId");
        Intrinsics.g(saveConsentBehavior, "saveConsentBehavior");
        Intrinsics.g(linkSupportedPaymentMethodsOnboardingEnabled, "linkSupportedPaymentMethodsOnboardingEnabled");
        Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
        this.f42895a = stripeIntent;
        this.f42896b = merchantName;
        this.f42897c = str;
        this.f42898d = str2;
        this.f42899e = str3;
        this.f42900f = customerInfo;
        this.f42901g = addressDetails;
        this.f42902h = z11;
        this.f42903i = map;
        this.f42904j = cardBrandChoice;
        this.f42905k = cardBrandFilter;
        this.f42906l = cardFundingFilter;
        this.f42907m = bVar;
        this.n = billingDetailsCollectionConfiguration;
        this.o = paymentSheet$BillingDetails;
        this.f42908p = z12;
        this.f42909q = z13;
        this.f42910r = z14;
        this.f42911s = elementsSessionId;
        this.f42912t = d0Var;
        this.f42913u = z15;
        this.f42914v = str4;
        this.f42915w = z16;
        this.f42916x = z17;
        this.f42917y = z18;
        this.f42918z = z19;
        this.A = z21;
        this.B = linkAppearance;
        this.C = z22;
        this.D = z23;
        this.E = str5;
        this.F = saveConsentBehavior;
        this.G = z24;
        this.H = linkSupportedPaymentMethodsOnboardingEnabled;
        this.I = clientAttributionMetadata;
    }

    public final String b() {
        if (this.f42918z) {
            return this.E;
        }
        return null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof LinkConfiguration)) {
            return false;
        }
        LinkConfiguration linkConfiguration = (LinkConfiguration) obj;
        return Intrinsics.b(this.f42895a, linkConfiguration.f42895a) && Intrinsics.b(this.f42896b, linkConfiguration.f42896b) && Intrinsics.b(this.f42897c, linkConfiguration.f42897c) && Intrinsics.b(this.f42898d, linkConfiguration.f42898d) && Intrinsics.b(this.f42899e, linkConfiguration.f42899e) && Intrinsics.b(this.f42900f, linkConfiguration.f42900f) && Intrinsics.b(this.f42901g, linkConfiguration.f42901g) && this.f42902h == linkConfiguration.f42902h && Intrinsics.b(this.f42903i, linkConfiguration.f42903i) && Intrinsics.b(this.f42904j, linkConfiguration.f42904j) && Intrinsics.b(this.f42905k, linkConfiguration.f42905k) && Intrinsics.b(this.f42906l, linkConfiguration.f42906l) && this.f42907m == linkConfiguration.f42907m && Intrinsics.b(this.n, linkConfiguration.n) && Intrinsics.b(this.o, linkConfiguration.o) && this.f42908p == linkConfiguration.f42908p && this.f42909q == linkConfiguration.f42909q && this.f42910r == linkConfiguration.f42910r && Intrinsics.b(this.f42911s, linkConfiguration.f42911s) && this.f42912t == linkConfiguration.f42912t && this.f42913u == linkConfiguration.f42913u && Intrinsics.b(this.f42914v, linkConfiguration.f42914v) && this.f42915w == linkConfiguration.f42915w && this.f42916x == linkConfiguration.f42916x && this.f42917y == linkConfiguration.f42917y && this.f42918z == linkConfiguration.f42918z && this.A == linkConfiguration.A && Intrinsics.b(this.B, linkConfiguration.B) && this.C == linkConfiguration.C && this.D == linkConfiguration.D && Intrinsics.b(this.E, linkConfiguration.E) && Intrinsics.b(this.F, linkConfiguration.F) && this.G == linkConfiguration.G && Intrinsics.b(this.H, linkConfiguration.H) && Intrinsics.b(this.I, linkConfiguration.I);
    }

    public final int hashCode() {
        int iE = b.c0.e(this.f42895a.hashCode() * 31, 31, this.f42896b);
        String str = this.f42897c;
        int iHashCode = (iE + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f42898d;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f42899e;
        int iHashCode3 = (this.f42900f.hashCode() + ((iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31)) * 31;
        AddressDetails addressDetails = this.f42901g;
        int iC = x8.h.c(this.f42903i, c9.f((iHashCode3 + (addressDetails == null ? 0 : addressDetails.hashCode())) * 31, 31, this.f42902h), 31);
        CardBrandChoice cardBrandChoice = this.f42904j;
        int iHashCode4 = (this.f42906l.hashCode() + ((this.f42905k.hashCode() + ((iC + (cardBrandChoice == null ? 0 : cardBrandChoice.hashCode())) * 31)) * 31)) * 31;
        mu.b bVar = this.f42907m;
        int iHashCode5 = (this.n.hashCode() + ((iHashCode4 + (bVar == null ? 0 : bVar.hashCode())) * 31)) * 31;
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.o;
        int iE2 = b.c0.e(c9.f(c9.f(c9.f((iHashCode5 + (paymentSheet$BillingDetails == null ? 0 : paymentSheet$BillingDetails.hashCode())) * 31, 31, this.f42908p), 31, this.f42909q), 31, this.f42910r), 31, this.f42911s);
        ft.d0 d0Var = this.f42912t;
        int iF = c9.f((iE2 + (d0Var == null ? 0 : d0Var.hashCode())) * 31, 31, this.f42913u);
        String str4 = this.f42914v;
        int iF2 = c9.f(c9.f(c9.f(c9.f(c9.f((iF + (str4 == null ? 0 : str4.hashCode())) * 31, 31, this.f42915w), 31, this.f42916x), 31, this.f42917y), 31, this.f42918z), 31, this.A);
        LinkAppearance linkAppearance = this.B;
        int iF3 = c9.f(c9.f((iF2 + (linkAppearance == null ? 0 : linkAppearance.hashCode())) * 31, 31, this.C), 31, this.D);
        String str5 = this.E;
        return this.I.hashCode() + u4.c(c9.f((this.F.hashCode() + ((iF3 + (str5 != null ? str5.hashCode() : 0)) * 31)) * 31, 31, this.G), 31, this.H);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LinkConfiguration(stripeIntent=");
        sb2.append(this.f42895a);
        sb2.append(", merchantName=");
        sb2.append(this.f42896b);
        sb2.append(", sellerBusinessName=");
        b.c0.D(sb2, this.f42897c, ", merchantCountryCode=", this.f42898d, ", merchantLogoUrl=");
        sb2.append(this.f42899e);
        sb2.append(", customerInfo=");
        sb2.append(this.f42900f);
        sb2.append(", shippingDetails=");
        sb2.append(this.f42901g);
        sb2.append(", passthroughModeEnabled=");
        sb2.append(this.f42902h);
        sb2.append(", flags=");
        sb2.append(this.f42903i);
        sb2.append(", cardBrandChoice=");
        sb2.append(this.f42904j);
        sb2.append(", cardBrandFilter=");
        sb2.append(this.f42905k);
        sb2.append(", cardFundingFilter=");
        sb2.append(this.f42906l);
        sb2.append(", financialConnectionsAvailability=");
        sb2.append(this.f42907m);
        sb2.append(", billingDetailsCollectionConfiguration=");
        sb2.append(this.n);
        sb2.append(", defaultBillingDetails=");
        sb2.append(this.o);
        sb2.append(", useAttestationEndpointsForLink=");
        sb2.append(this.f42908p);
        sb2.append(", suppress2faModal=");
        a80.m.s(sb2, this.f42909q, ", disableRuxInFlowController=", this.f42910r, ", elementsSessionId=");
        sb2.append(this.f42911s);
        sb2.append(", linkMode=");
        sb2.append(this.f42912t);
        sb2.append(", allowDefaultOptIn=");
        c9.s(", googlePlacesApiKey=", this.f42914v, ", collectMissingBillingDetailsForExistingPaymentMethods=", sb2, this.f42913u);
        a80.m.s(sb2, this.f42915w, ", allowUserEmailEdits=", this.f42916x, ", allowLogOut=");
        a80.m.s(sb2, this.f42917y, ", enableDisplayableDefaultValuesInEce=", this.f42918z, ", skipWalletInFlowController=");
        sb2.append(this.A);
        sb2.append(", linkAppearance=");
        sb2.append(this.B);
        sb2.append(", linkSignUpOptInFeatureEnabled=");
        a80.m.s(sb2, this.C, ", linkSignUpOptInInitialValue=", this.D, ", customerId=");
        sb2.append(this.E);
        sb2.append(", saveConsentBehavior=");
        sb2.append(this.F);
        sb2.append(", forceSetupFutureUseBehaviorAndNewMandate=");
        sb2.append(this.G);
        sb2.append(", linkSupportedPaymentMethodsOnboardingEnabled=");
        sb2.append(this.H);
        sb2.append(", clientAttributionMetadata=");
        sb2.append(this.I);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f42895a, i5);
        dest.writeString(this.f42896b);
        dest.writeString(this.f42897c);
        dest.writeString(this.f42898d);
        dest.writeString(this.f42899e);
        this.f42900f.writeToParcel(dest, i5);
        AddressDetails addressDetails = this.f42901g;
        if (addressDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            addressDetails.writeToParcel(dest, i5);
        }
        dest.writeInt(this.f42902h ? 1 : 0);
        Map map = this.f42903i;
        dest.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            dest.writeString((String) entry.getKey());
            dest.writeInt(((Boolean) entry.getValue()).booleanValue() ? 1 : 0);
        }
        CardBrandChoice cardBrandChoice = this.f42904j;
        if (cardBrandChoice == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            cardBrandChoice.writeToParcel(dest, i5);
        }
        dest.writeParcelable(this.f42905k, i5);
        dest.writeParcelable(this.f42906l, i5);
        mu.b bVar = this.f42907m;
        if (bVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(bVar.name());
        }
        this.n.writeToParcel(dest, i5);
        PaymentSheet$BillingDetails paymentSheet$BillingDetails = this.o;
        if (paymentSheet$BillingDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            paymentSheet$BillingDetails.writeToParcel(dest, i5);
        }
        dest.writeInt(this.f42908p ? 1 : 0);
        dest.writeInt(this.f42909q ? 1 : 0);
        dest.writeInt(this.f42910r ? 1 : 0);
        dest.writeString(this.f42911s);
        ft.d0 d0Var = this.f42912t;
        if (d0Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(d0Var.name());
        }
        dest.writeInt(this.f42913u ? 1 : 0);
        dest.writeString(this.f42914v);
        dest.writeInt(this.f42915w ? 1 : 0);
        dest.writeInt(this.f42916x ? 1 : 0);
        dest.writeInt(this.f42917y ? 1 : 0);
        dest.writeInt(this.f42918z ? 1 : 0);
        dest.writeInt(this.A ? 1 : 0);
        LinkAppearance linkAppearance = this.B;
        if (linkAppearance == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            linkAppearance.writeToParcel(dest, i5);
        }
        dest.writeInt(this.C ? 1 : 0);
        dest.writeInt(this.D ? 1 : 0);
        dest.writeString(this.E);
        dest.writeParcelable(this.F, i5);
        dest.writeInt(this.G ? 1 : 0);
        dest.writeStringList(this.H);
        dest.writeParcelable(this.I, i5);
    }
}
