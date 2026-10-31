package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.core.model.CountryCode;
import com.stripe.android.core.model.StripeModel;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0087\b\u0018\u00002\u00020\u0001:\u0005\u0002\u0003\u0004\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetails;", "Lcom/stripe/android/core/model/StripeModel;", "PaymentDetails", "Card", "Passthrough", "BankAccount", "BillingAddress", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ConsumerPaymentDetails implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<ConsumerPaymentDetails> CREATOR = new eh.a(22);

    /* renamed from: a, reason: collision with root package name */
    public final List f43270a;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetails$BankAccount;", "Lcom/stripe/android/model/ConsumerPaymentDetails$PaymentDetails;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class BankAccount extends PaymentDetails {

        @NotNull
        public static final Parcelable.Creator<BankAccount> CREATOR = new z();

        /* renamed from: c, reason: collision with root package name */
        public final String f43271c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43272d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f43273e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43274f;

        /* renamed from: g, reason: collision with root package name */
        public final String f43275g;

        /* renamed from: h, reason: collision with root package name */
        public final String f43276h;

        /* renamed from: i, reason: collision with root package name */
        public final BillingAddress f43277i;

        /* renamed from: j, reason: collision with root package name */
        public final String f43278j;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BankAccount(String id2, String last4, boolean z11, String str, String str2, String str3, BillingAddress billingAddress, String str4) {
            super(z11, "bank_account");
            Intrinsics.g(id2, "id");
            Intrinsics.g(last4, "last4");
            this.f43271c = id2;
            this.f43272d = last4;
            this.f43273e = z11;
            this.f43274f = str;
            this.f43275g = str2;
            this.f43276h = str3;
            this.f43277i = billingAddress;
            this.f43278j = str4;
        }

        public static BankAccount f(BankAccount bankAccount, boolean z11, BillingAddress billingAddress, String str, int i5) {
            String id2 = bankAccount.f43271c;
            String last4 = bankAccount.f43272d;
            if ((i5 & 4) != 0) {
                z11 = bankAccount.f43273e;
            }
            boolean z12 = z11;
            String str2 = bankAccount.f43274f;
            String str3 = bankAccount.f43275g;
            String str4 = bankAccount.f43276h;
            if ((i5 & 64) != 0) {
                billingAddress = bankAccount.f43277i;
            }
            BillingAddress billingAddress2 = billingAddress;
            if ((i5 & 128) != 0) {
                str = bankAccount.f43278j;
            }
            Intrinsics.g(id2, "id");
            Intrinsics.g(last4, "last4");
            return new BankAccount(id2, last4, z12, str2, str3, str4, billingAddress2, str);
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: b, reason: from getter */
        public final BillingAddress getF43300f() {
            return this.f43277i;
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: d, reason: from getter */
        public final String getF43301g() {
            return this.f43278j;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: e, reason: from getter */
        public final boolean getF43302a() {
            return this.f43273e;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof BankAccount)) {
                return false;
            }
            BankAccount bankAccount = (BankAccount) obj;
            return Intrinsics.b(this.f43271c, bankAccount.f43271c) && Intrinsics.b(this.f43272d, bankAccount.f43272d) && this.f43273e == bankAccount.f43273e && Intrinsics.b(this.f43274f, bankAccount.f43274f) && Intrinsics.b(this.f43275g, bankAccount.f43275g) && Intrinsics.b(this.f43276h, bankAccount.f43276h) && Intrinsics.b(this.f43277i, bankAccount.f43277i) && Intrinsics.b(this.f43278j, bankAccount.f43278j);
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: getId, reason: from getter */
        public final String getF43297c() {
            return this.f43271c;
        }

        public final int hashCode() {
            int iF = c9.f(b.c0.e(this.f43271c.hashCode() * 31, 31, this.f43272d), 31, this.f43273e);
            String str = this.f43274f;
            int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43275g;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43276h;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            BillingAddress billingAddress = this.f43277i;
            int iHashCode4 = (iHashCode3 + (billingAddress == null ? 0 : billingAddress.hashCode())) * 31;
            String str4 = this.f43278j;
            return iHashCode4 + (str4 != null ? str4.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("BankAccount(id=", this.f43271c, ", last4=", this.f43272d, ", isDefault=");
            c9.s(", nickname=", this.f43274f, ", bankAccountName=", sbW, this.f43273e);
            b.c0.D(sbW, this.f43275g, ", bankIconCode=", this.f43276h, ", billingAddress=");
            sbW.append(this.f43277i);
            sbW.append(", billingEmailAddress=");
            sbW.append(this.f43278j);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43271c);
            dest.writeString(this.f43272d);
            dest.writeInt(this.f43273e ? 1 : 0);
            dest.writeString(this.f43274f);
            dest.writeString(this.f43275g);
            dest.writeString(this.f43276h);
            BillingAddress billingAddress = this.f43277i;
            if (billingAddress == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                billingAddress.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43278j);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetails$BillingAddress;", "Landroid/os/Parcelable;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class BillingAddress implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<BillingAddress> CREATOR = new a0();

        /* renamed from: a, reason: collision with root package name */
        public final String f43279a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43280b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43281c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43282d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43283e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43284f;

        /* renamed from: g, reason: collision with root package name */
        public final CountryCode f43285g;

        public BillingAddress(String str, String str2, String str3, String str4, String str5, String str6, CountryCode countryCode) {
            this.f43279a = str;
            this.f43280b = str2;
            this.f43281c = str3;
            this.f43282d = str4;
            this.f43283e = str5;
            this.f43284f = str6;
            this.f43285g = countryCode;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof BillingAddress)) {
                return false;
            }
            BillingAddress billingAddress = (BillingAddress) obj;
            return Intrinsics.b(this.f43279a, billingAddress.f43279a) && Intrinsics.b(this.f43280b, billingAddress.f43280b) && Intrinsics.b(this.f43281c, billingAddress.f43281c) && Intrinsics.b(this.f43282d, billingAddress.f43282d) && Intrinsics.b(this.f43283e, billingAddress.f43283e) && Intrinsics.b(this.f43284f, billingAddress.f43284f) && Intrinsics.b(this.f43285g, billingAddress.f43285g);
        }

        public final int hashCode() {
            String str = this.f43279a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43280b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43281c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43282d;
            int iHashCode4 = (iHashCode3 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43283e;
            int iHashCode5 = (iHashCode4 + (str5 == null ? 0 : str5.hashCode())) * 31;
            String str6 = this.f43284f;
            int iHashCode6 = (iHashCode5 + (str6 == null ? 0 : str6.hashCode())) * 31;
            CountryCode countryCode = this.f43285g;
            return iHashCode6 + (countryCode != null ? countryCode.f42575a.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("BillingAddress(name=", this.f43279a, ", line1=", this.f43280b, ", line2=");
            b.c0.D(sbW, this.f43281c, ", administrativeArea=", this.f43282d, ", locality=");
            b.c0.D(sbW, this.f43283e, ", postalCode=", this.f43284f, ", countryCode=");
            sbW.append(this.f43285g);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43279a);
            dest.writeString(this.f43280b);
            dest.writeString(this.f43281c);
            dest.writeString(this.f43282d);
            dest.writeString(this.f43283e);
            dest.writeString(this.f43284f);
            dest.writeParcelable(this.f43285g, i5);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetails$Card;", "Lcom/stripe/android/model/ConsumerPaymentDetails$PaymentDetails;", "com/stripe/android/model/d0", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final /* data */ class Card extends PaymentDetails {

        @NotNull
        public static final Parcelable.Creator<Card> CREATOR = new b0();

        /* renamed from: c, reason: collision with root package name */
        public final String f43286c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43287d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f43288e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43289f;

        /* renamed from: g, reason: collision with root package name */
        public final BillingAddress f43290g;

        /* renamed from: h, reason: collision with root package name */
        public final String f43291h;

        /* renamed from: i, reason: collision with root package name */
        public final int f43292i;

        /* renamed from: j, reason: collision with root package name */
        public final int f43293j;

        /* renamed from: k, reason: collision with root package name */
        public final ft.b f43294k;

        /* renamed from: l, reason: collision with root package name */
        public final List f43295l;

        /* renamed from: m, reason: collision with root package name */
        public final ft.r f43296m;
        public final d0 n;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Card(String id2, String last4, boolean z11, String str, BillingAddress billingAddress, String str2, int i5, int i11, ft.b brand, List networks, ft.r cvcCheck, d0 funding) {
            super(z11, "card");
            Intrinsics.g(id2, "id");
            Intrinsics.g(last4, "last4");
            Intrinsics.g(brand, "brand");
            Intrinsics.g(networks, "networks");
            Intrinsics.g(cvcCheck, "cvcCheck");
            Intrinsics.g(funding, "funding");
            this.f43286c = id2;
            this.f43287d = last4;
            this.f43288e = z11;
            this.f43289f = str;
            this.f43290g = billingAddress;
            this.f43291h = str2;
            this.f43292i = i5;
            this.f43293j = i11;
            this.f43294k = brand;
            this.f43295l = networks;
            this.f43296m = cvcCheck;
            this.n = funding;
        }

        public static Card f(Card card, boolean z11, BillingAddress billingAddress, String str, int i5) {
            String id2 = card.f43286c;
            String last4 = card.f43287d;
            if ((i5 & 4) != 0) {
                z11 = card.f43288e;
            }
            boolean z12 = z11;
            String str2 = card.f43289f;
            if ((i5 & 16) != 0) {
                billingAddress = card.f43290g;
            }
            BillingAddress billingAddress2 = billingAddress;
            String str3 = (i5 & 32) != 0 ? card.f43291h : str;
            int i11 = card.f43292i;
            int i12 = card.f43293j;
            ft.b brand = card.f43294k;
            List networks = card.f43295l;
            ft.r cvcCheck = card.f43296m;
            d0 funding = card.n;
            Intrinsics.g(id2, "id");
            Intrinsics.g(last4, "last4");
            Intrinsics.g(brand, "brand");
            Intrinsics.g(networks, "networks");
            Intrinsics.g(cvcCheck, "cvcCheck");
            Intrinsics.g(funding, "funding");
            return new Card(id2, last4, z12, str2, billingAddress2, str3, i11, i12, brand, networks, cvcCheck, funding);
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: b, reason: from getter */
        public final BillingAddress getF43300f() {
            return this.f43290g;
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: d, reason: from getter */
        public final String getF43301g() {
            return this.f43291h;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: e, reason: from getter */
        public final boolean getF43302a() {
            return this.f43288e;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Card)) {
                return false;
            }
            Card card = (Card) obj;
            return Intrinsics.b(this.f43286c, card.f43286c) && Intrinsics.b(this.f43287d, card.f43287d) && this.f43288e == card.f43288e && Intrinsics.b(this.f43289f, card.f43289f) && Intrinsics.b(this.f43290g, card.f43290g) && Intrinsics.b(this.f43291h, card.f43291h) && this.f43292i == card.f43292i && this.f43293j == card.f43293j && this.f43294k == card.f43294k && Intrinsics.b(this.f43295l, card.f43295l) && this.f43296m == card.f43296m && this.n == card.n;
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: getId, reason: from getter */
        public final String getF43297c() {
            return this.f43286c;
        }

        public final int hashCode() {
            int iF = c9.f(b.c0.e(this.f43286c.hashCode() * 31, 31, this.f43287d), 31, this.f43288e);
            String str = this.f43289f;
            int iHashCode = (iF + (str == null ? 0 : str.hashCode())) * 31;
            BillingAddress billingAddress = this.f43290g;
            int iHashCode2 = (iHashCode + (billingAddress == null ? 0 : billingAddress.hashCode())) * 31;
            String str2 = this.f43291h;
            return this.n.hashCode() + ((this.f43296m.hashCode() + b.u4.c((this.f43294k.hashCode() + b.u4.a(this.f43293j, b.u4.a(this.f43292i, (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31, 31), 31)) * 31, 31, this.f43295l)) * 31);
        }

        public final boolean i() {
            return !mk.v.J(this.f43293j, this.f43292i);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("Card(id=", this.f43286c, ", last4=", this.f43287d, ", isDefault=");
            c9.s(", nickname=", this.f43289f, ", billingAddress=", sbW, this.f43288e);
            sbW.append(this.f43290g);
            sbW.append(", billingEmailAddress=");
            sbW.append(this.f43291h);
            sbW.append(", expiryYear=");
            b.c0.A(sbW, this.f43292i, ", expiryMonth=", this.f43293j, ", brand=");
            sbW.append(this.f43294k);
            sbW.append(", networks=");
            sbW.append(this.f43295l);
            sbW.append(", cvcCheck=");
            sbW.append(this.f43296m);
            sbW.append(", funding=");
            sbW.append(this.n);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43286c);
            dest.writeString(this.f43287d);
            dest.writeInt(this.f43288e ? 1 : 0);
            dest.writeString(this.f43289f);
            BillingAddress billingAddress = this.f43290g;
            if (billingAddress == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                billingAddress.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43291h);
            dest.writeInt(this.f43292i);
            dest.writeInt(this.f43293j);
            dest.writeString(this.f43294k.name());
            dest.writeStringList(this.f43295l);
            dest.writeString(this.f43296m.name());
            dest.writeString(this.n.name());
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetails$Passthrough;", "Lcom/stripe/android/model/ConsumerPaymentDetails$PaymentDetails;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Passthrough extends PaymentDetails {

        @NotNull
        public static final Parcelable.Creator<Passthrough> CREATOR = new e0();

        /* renamed from: c, reason: collision with root package name */
        public final String f43297c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43298d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43299e;

        /* renamed from: f, reason: collision with root package name */
        public final BillingAddress f43300f;

        /* renamed from: g, reason: collision with root package name */
        public final String f43301g;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Passthrough(String id2, String paymentMethodId, String last4, BillingAddress billingAddress, String str) {
            super(false, "card");
            Intrinsics.g(id2, "id");
            Intrinsics.g(paymentMethodId, "paymentMethodId");
            Intrinsics.g(last4, "last4");
            this.f43297c = id2;
            this.f43298d = paymentMethodId;
            this.f43299e = last4;
            this.f43300f = billingAddress;
            this.f43301g = str;
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: b, reason: from getter */
        public final BillingAddress getF43300f() {
            return this.f43300f;
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: d, reason: from getter */
        public final String getF43301g() {
            return this.f43301g;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Passthrough)) {
                return false;
            }
            Passthrough passthrough = (Passthrough) obj;
            return Intrinsics.b(this.f43297c, passthrough.f43297c) && Intrinsics.b(this.f43298d, passthrough.f43298d) && Intrinsics.b(this.f43299e, passthrough.f43299e) && Intrinsics.b(this.f43300f, passthrough.f43300f) && Intrinsics.b(this.f43301g, passthrough.f43301g);
        }

        @Override // com.stripe.android.model.ConsumerPaymentDetails.PaymentDetails
        /* renamed from: getId, reason: from getter */
        public final String getF43297c() {
            return this.f43297c;
        }

        public final int hashCode() {
            int iE = b.c0.e(b.c0.e(this.f43297c.hashCode() * 31, 31, this.f43298d), 31, this.f43299e);
            BillingAddress billingAddress = this.f43300f;
            int iHashCode = (iE + (billingAddress == null ? 0 : billingAddress.hashCode())) * 31;
            String str = this.f43301g;
            return iHashCode + (str != null ? str.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("Passthrough(id=", this.f43297c, ", paymentMethodId=", this.f43298d, ", last4=");
            sbW.append(this.f43299e);
            sbW.append(", billingAddress=");
            sbW.append(this.f43300f);
            sbW.append(", billingEmailAddress=");
            return b.c0.q(sbW, this.f43301g, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43297c);
            dest.writeString(this.f43298d);
            dest.writeString(this.f43299e);
            BillingAddress billingAddress = this.f43300f;
            if (billingAddress == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                billingAddress.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43301g);
        }
    }

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001\u0082\u0001\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetails$PaymentDetails;", "Landroid/os/Parcelable;", "Lcom/stripe/android/model/ConsumerPaymentDetails$BankAccount;", "Lcom/stripe/android/model/ConsumerPaymentDetails$Card;", "Lcom/stripe/android/model/ConsumerPaymentDetails$Passthrough;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class PaymentDetails implements Parcelable {

        /* renamed from: a, reason: collision with root package name */
        public final boolean f43302a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43303b;

        public PaymentDetails(boolean z11, String str) {
            this.f43302a = z11;
            this.f43303b = str;
        }

        /* renamed from: b */
        public abstract BillingAddress getF43300f();

        /* renamed from: d */
        public abstract String getF43301g();

        /* renamed from: e, reason: from getter */
        public boolean getF43302a() {
            return this.f43302a;
        }

        /* renamed from: getId */
        public abstract String getF43297c();
    }

    public ConsumerPaymentDetails(List paymentDetails) {
        Intrinsics.g(paymentDetails, "paymentDetails");
        this.f43270a = paymentDetails;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ConsumerPaymentDetails) && Intrinsics.b(this.f43270a, ((ConsumerPaymentDetails) obj).f43270a);
    }

    public final int hashCode() {
        return this.f43270a.hashCode();
    }

    public final String toString() {
        return "ConsumerPaymentDetails(paymentDetails=" + this.f43270a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Iterator itK = fq.c.k(this.f43270a, dest);
        while (itK.hasNext()) {
            dest.writeParcelable((Parcelable) itK.next(), i5);
        }
    }
}
