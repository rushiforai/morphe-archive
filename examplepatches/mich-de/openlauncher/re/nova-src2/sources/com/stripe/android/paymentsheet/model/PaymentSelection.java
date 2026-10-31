package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.u4;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.link.LinkPaymentMethod;
import com.stripe.android.link.ui.inline.UserInput;
import com.stripe.android.model.Address;
import com.stripe.android.model.ConsumerShippingAddress;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentsheet.paymentdatacollection.ach.BankFormScreenState;
import ft.d0;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b1\u0018\u00002\u00020\u0001:\b\u0002\u0003\u0004\u0005\u0006\u0007\b\t\u0082\u0001\u0007\n\u000b\f\r\u000e\u000f\u0010¨\u0006\u0011"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection;", "Landroid/os/Parcelable;", "GooglePay", "Link", "ShopPay", "ExternalPaymentMethod", "CustomPaymentMethod", "Saved", "wu/c", "New", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$CustomPaymentMethod;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$ExternalPaymentMethod;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$GooglePay;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$Link;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$New;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$Saved;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$ShopPay;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class PaymentSelection implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$CustomPaymentMethod;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CustomPaymentMethod extends PaymentSelection {

        @NotNull
        public static final Parcelable.Creator<CustomPaymentMethod> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final String f44799a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethod.BillingDetails f44800b;

        /* renamed from: c, reason: collision with root package name */
        public final ResolvableString f44801c;

        /* renamed from: d, reason: collision with root package name */
        public final String f44802d;

        /* renamed from: e, reason: collision with root package name */
        public final String f44803e;

        public CustomPaymentMethod(String id2, PaymentMethod.BillingDetails billingDetails, ResolvableString label, String str, String str2) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(label, "label");
            this.f44799a = id2;
            this.f44800b = billingDetails;
            this.f44801c = label;
            this.f44802d = str;
            this.f44803e = str2;
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final boolean b() {
            return false;
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final ResolvableString d(String merchantName, boolean z11) {
            Intrinsics.g(merchantName, "merchantName");
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
            if (!(obj instanceof CustomPaymentMethod)) {
                return false;
            }
            CustomPaymentMethod customPaymentMethod = (CustomPaymentMethod) obj;
            return Intrinsics.b(this.f44799a, customPaymentMethod.f44799a) && Intrinsics.b(this.f44800b, customPaymentMethod.f44800b) && Intrinsics.b(this.f44801c, customPaymentMethod.f44801c) && Intrinsics.b(this.f44802d, customPaymentMethod.f44802d) && Intrinsics.b(this.f44803e, customPaymentMethod.f44803e);
        }

        public final int hashCode() {
            int iHashCode = this.f44799a.hashCode() * 31;
            PaymentMethod.BillingDetails billingDetails = this.f44800b;
            int iHashCode2 = (this.f44801c.hashCode() + ((iHashCode + (billingDetails == null ? 0 : billingDetails.hashCode())) * 31)) * 31;
            String str = this.f44802d;
            int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f44803e;
            return iHashCode3 + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("CustomPaymentMethod(id=");
            sb2.append(this.f44799a);
            sb2.append(", billingDetails=");
            sb2.append(this.f44800b);
            sb2.append(", label=");
            sb2.append(this.f44801c);
            sb2.append(", lightThemeIconUrl=");
            sb2.append(this.f44802d);
            sb2.append(", darkThemeIconUrl=");
            return c0.q(sb2, this.f44803e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44799a);
            dest.writeParcelable(this.f44800b, i5);
            dest.writeParcelable(this.f44801c, i5);
            dest.writeString(this.f44802d);
            dest.writeString(this.f44803e);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$ExternalPaymentMethod;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ExternalPaymentMethod extends PaymentSelection {

        @NotNull
        public static final Parcelable.Creator<ExternalPaymentMethod> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final String f44804a;

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethod.BillingDetails f44805b;

        /* renamed from: c, reason: collision with root package name */
        public final ResolvableString f44806c;

        /* renamed from: d, reason: collision with root package name */
        public final int f44807d;

        /* renamed from: e, reason: collision with root package name */
        public final String f44808e;

        /* renamed from: f, reason: collision with root package name */
        public final String f44809f;

        public ExternalPaymentMethod(String type, PaymentMethod.BillingDetails billingDetails, ResolvableString label, int i5, String str, String str2) {
            Intrinsics.g(type, "type");
            Intrinsics.g(label, "label");
            this.f44804a = type;
            this.f44805b = billingDetails;
            this.f44806c = label;
            this.f44807d = i5;
            this.f44808e = str;
            this.f44809f = str2;
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final boolean b() {
            return false;
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final ResolvableString d(String merchantName, boolean z11) {
            Intrinsics.g(merchantName, "merchantName");
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
            if (!(obj instanceof ExternalPaymentMethod)) {
                return false;
            }
            ExternalPaymentMethod externalPaymentMethod = (ExternalPaymentMethod) obj;
            return Intrinsics.b(this.f44804a, externalPaymentMethod.f44804a) && Intrinsics.b(this.f44805b, externalPaymentMethod.f44805b) && Intrinsics.b(this.f44806c, externalPaymentMethod.f44806c) && this.f44807d == externalPaymentMethod.f44807d && Intrinsics.b(this.f44808e, externalPaymentMethod.f44808e) && Intrinsics.b(this.f44809f, externalPaymentMethod.f44809f);
        }

        public final int hashCode() {
            int iHashCode = this.f44804a.hashCode() * 31;
            PaymentMethod.BillingDetails billingDetails = this.f44805b;
            int iA = u4.a(this.f44807d, (this.f44806c.hashCode() + ((iHashCode + (billingDetails == null ? 0 : billingDetails.hashCode())) * 31)) * 31, 31);
            String str = this.f44808e;
            int iHashCode2 = (iA + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f44809f;
            return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("ExternalPaymentMethod(type=");
            sb2.append(this.f44804a);
            sb2.append(", billingDetails=");
            sb2.append(this.f44805b);
            sb2.append(", label=");
            sb2.append(this.f44806c);
            sb2.append(", iconResource=");
            sb2.append(this.f44807d);
            sb2.append(", lightThemeIconUrl=");
            return c0.s(sb2, this.f44808e, ", darkThemeIconUrl=", this.f44809f, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44804a);
            dest.writeParcelable(this.f44805b, i5);
            dest.writeParcelable(this.f44806c, i5);
            dest.writeInt(this.f44807d);
            dest.writeString(this.f44808e);
            dest.writeString(this.f44809f);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$GooglePay;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class GooglePay extends PaymentSelection {

        /* renamed from: a, reason: collision with root package name */
        public static final GooglePay f44810a = new GooglePay();

        @NotNull
        public static final Parcelable.Creator<GooglePay> CREATOR = new c();

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final boolean b() {
            return false;
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final ResolvableString d(String merchantName, boolean z11) {
            Intrinsics.g(merchantName, "merchantName");
            return null;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof GooglePay);
        }

        public final int hashCode() {
            return -61554386;
        }

        public final String toString() {
            return "GooglePay";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$New;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection;", "Card", "USBankAccount", "GenericPaymentMethod", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$New$Card;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$New$GenericPaymentMethod;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$New$USBankAccount;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class New extends PaymentSelection {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$New$Card;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$New;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Card extends New {

            @NotNull
            public static final Parcelable.Creator<Card> CREATOR = new e();

            /* renamed from: a, reason: collision with root package name */
            public final PaymentMethodCreateParams f44814a;

            /* renamed from: b, reason: collision with root package name */
            public final ft.b f44815b;

            /* renamed from: c, reason: collision with root package name */
            public final wu.c f44816c;

            /* renamed from: d, reason: collision with root package name */
            public final PaymentMethodOptionsParams f44817d;

            /* renamed from: e, reason: collision with root package name */
            public final PaymentMethodExtraParams f44818e;

            /* renamed from: f, reason: collision with root package name */
            public final UserInput f44819f;

            /* renamed from: g, reason: collision with root package name */
            public final String f44820g;

            public Card(PaymentMethodCreateParams paymentMethodCreateParams, ft.b brand, wu.c customerRequestedSave, PaymentMethodOptionsParams paymentMethodOptionsParams, PaymentMethodExtraParams paymentMethodExtraParams, UserInput userInput) {
                Intrinsics.g(paymentMethodCreateParams, "paymentMethodCreateParams");
                Intrinsics.g(brand, "brand");
                Intrinsics.g(customerRequestedSave, "customerRequestedSave");
                this.f44814a = paymentMethodCreateParams;
                this.f44815b = brand;
                this.f44816c = customerRequestedSave;
                this.f44817d = paymentMethodOptionsParams;
                this.f44818e = paymentMethodExtraParams;
                this.f44819f = userInput;
                String strB = paymentMethodCreateParams.b();
                this.f44820g = strB == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : strB;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: e, reason: from getter */
            public final wu.c getF44836g() {
                return this.f44816c;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof Card)) {
                    return false;
                }
                Card card = (Card) obj;
                return Intrinsics.b(this.f44814a, card.f44814a) && this.f44815b == card.f44815b && this.f44816c == card.f44816c && Intrinsics.b(this.f44817d, card.f44817d) && Intrinsics.b(this.f44818e, card.f44818e) && Intrinsics.b(this.f44819f, card.f44819f);
            }

            public final int hashCode() {
                int iHashCode = (this.f44816c.hashCode() + ((this.f44815b.hashCode() + (this.f44814a.hashCode() * 31)) * 31)) * 31;
                PaymentMethodOptionsParams paymentMethodOptionsParams = this.f44817d;
                int iHashCode2 = (iHashCode + (paymentMethodOptionsParams == null ? 0 : paymentMethodOptionsParams.hashCode())) * 31;
                PaymentMethodExtraParams paymentMethodExtraParams = this.f44818e;
                int iHashCode3 = (iHashCode2 + (paymentMethodExtraParams == null ? 0 : paymentMethodExtraParams.hashCode())) * 31;
                UserInput userInput = this.f44819f;
                return iHashCode3 + (userInput != null ? userInput.hashCode() : 0);
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: i, reason: from getter */
            public final PaymentMethodCreateParams getF44835f() {
                return this.f44814a;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: l, reason: from getter */
            public final PaymentMethodExtraParams getF44838i() {
                return this.f44818e;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: m, reason: from getter */
            public final PaymentMethodOptionsParams getF44837h() {
                return this.f44817d;
            }

            public final String toString() {
                return "Card(paymentMethodCreateParams=" + this.f44814a + ", brand=" + this.f44815b + ", customerRequestedSave=" + this.f44816c + ", paymentMethodOptionsParams=" + this.f44817d + ", paymentMethodExtraParams=" + this.f44818e + ", linkInput=" + this.f44819f + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeParcelable(this.f44814a, i5);
                dest.writeString(this.f44815b.name());
                dest.writeString(this.f44816c.name());
                dest.writeParcelable(this.f44817d, i5);
                dest.writeParcelable(this.f44818e, i5);
                dest.writeParcelable(this.f44819f, i5);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$New$GenericPaymentMethod;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$New;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class GenericPaymentMethod extends New {

            @NotNull
            public static final Parcelable.Creator<GenericPaymentMethod> CREATOR = new f();

            /* renamed from: a, reason: collision with root package name */
            public final ResolvableString f44821a;

            /* renamed from: b, reason: collision with root package name */
            public final int f44822b;

            /* renamed from: c, reason: collision with root package name */
            public final Integer f44823c;

            /* renamed from: d, reason: collision with root package name */
            public final String f44824d;

            /* renamed from: e, reason: collision with root package name */
            public final String f44825e;

            /* renamed from: f, reason: collision with root package name */
            public final PaymentMethodCreateParams f44826f;

            /* renamed from: g, reason: collision with root package name */
            public final wu.c f44827g;

            /* renamed from: h, reason: collision with root package name */
            public final PaymentMethodOptionsParams f44828h;

            /* renamed from: i, reason: collision with root package name */
            public final PaymentMethodExtraParams f44829i;

            public GenericPaymentMethod(ResolvableString label, int i5, Integer num, String str, String str2, PaymentMethodCreateParams paymentMethodCreateParams, wu.c customerRequestedSave, PaymentMethodOptionsParams paymentMethodOptionsParams, PaymentMethodExtraParams paymentMethodExtraParams) {
                Intrinsics.g(label, "label");
                Intrinsics.g(paymentMethodCreateParams, "paymentMethodCreateParams");
                Intrinsics.g(customerRequestedSave, "customerRequestedSave");
                this.f44821a = label;
                this.f44822b = i5;
                this.f44823c = num;
                this.f44824d = str;
                this.f44825e = str2;
                this.f44826f = paymentMethodCreateParams;
                this.f44827g = customerRequestedSave;
                this.f44828h = paymentMethodOptionsParams;
                this.f44829i = paymentMethodExtraParams;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: e, reason: from getter */
            public final wu.c getF44836g() {
                return this.f44827g;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof GenericPaymentMethod)) {
                    return false;
                }
                GenericPaymentMethod genericPaymentMethod = (GenericPaymentMethod) obj;
                return Intrinsics.b(this.f44821a, genericPaymentMethod.f44821a) && this.f44822b == genericPaymentMethod.f44822b && Intrinsics.b(this.f44823c, genericPaymentMethod.f44823c) && Intrinsics.b(this.f44824d, genericPaymentMethod.f44824d) && Intrinsics.b(this.f44825e, genericPaymentMethod.f44825e) && Intrinsics.b(this.f44826f, genericPaymentMethod.f44826f) && this.f44827g == genericPaymentMethod.f44827g && Intrinsics.b(this.f44828h, genericPaymentMethod.f44828h) && Intrinsics.b(this.f44829i, genericPaymentMethod.f44829i);
            }

            public final int hashCode() {
                int iA = u4.a(this.f44822b, this.f44821a.hashCode() * 31, 31);
                Integer num = this.f44823c;
                int iHashCode = (iA + (num == null ? 0 : num.hashCode())) * 31;
                String str = this.f44824d;
                int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
                String str2 = this.f44825e;
                int iHashCode3 = (this.f44827g.hashCode() + ((this.f44826f.hashCode() + ((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31)) * 31;
                PaymentMethodOptionsParams paymentMethodOptionsParams = this.f44828h;
                int iHashCode4 = (iHashCode3 + (paymentMethodOptionsParams == null ? 0 : paymentMethodOptionsParams.hashCode())) * 31;
                PaymentMethodExtraParams paymentMethodExtraParams = this.f44829i;
                return iHashCode4 + (paymentMethodExtraParams != null ? paymentMethodExtraParams.hashCode() : 0);
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: i, reason: from getter */
            public final PaymentMethodCreateParams getF44835f() {
                return this.f44826f;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: l, reason: from getter */
            public final PaymentMethodExtraParams getF44838i() {
                return this.f44829i;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: m, reason: from getter */
            public final PaymentMethodOptionsParams getF44837h() {
                return this.f44828h;
            }

            public final String toString() {
                return "GenericPaymentMethod(label=" + this.f44821a + ", iconResource=" + this.f44822b + ", iconResourceNight=" + this.f44823c + ", lightThemeIconUrl=" + this.f44824d + ", darkThemeIconUrl=" + this.f44825e + ", paymentMethodCreateParams=" + this.f44826f + ", customerRequestedSave=" + this.f44827g + ", paymentMethodOptionsParams=" + this.f44828h + ", paymentMethodExtraParams=" + this.f44829i + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeParcelable(this.f44821a, i5);
                dest.writeInt(this.f44822b);
                Integer num = this.f44823c;
                if (num == null) {
                    dest.writeInt(0);
                } else {
                    fq.c.q(dest, 1, num);
                }
                dest.writeString(this.f44824d);
                dest.writeString(this.f44825e);
                dest.writeParcelable(this.f44826f, i5);
                dest.writeString(this.f44827g.name());
                dest.writeParcelable(this.f44828h, i5);
                dest.writeParcelable(this.f44829i, i5);
            }
        }

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$New$USBankAccount;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection$New;", "InstantDebitsInfo", "Input", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class USBankAccount extends New {

            @NotNull
            public static final Parcelable.Creator<USBankAccount> CREATOR = new g();

            /* renamed from: a, reason: collision with root package name */
            public final String f44830a;

            /* renamed from: b, reason: collision with root package name */
            public final int f44831b;

            /* renamed from: c, reason: collision with root package name */
            public final Input f44832c;

            /* renamed from: d, reason: collision with root package name */
            public final BankFormScreenState f44833d;

            /* renamed from: e, reason: collision with root package name */
            public final InstantDebitsInfo f44834e;

            /* renamed from: f, reason: collision with root package name */
            public final PaymentMethodCreateParams f44835f;

            /* renamed from: g, reason: collision with root package name */
            public final wu.c f44836g;

            /* renamed from: h, reason: collision with root package name */
            public final PaymentMethodOptionsParams f44837h;

            /* renamed from: i, reason: collision with root package name */
            public final PaymentMethodExtraParams f44838i;

            @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$New$USBankAccount$Input;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public static final /* data */ class Input implements Parcelable {

                @NotNull
                public static final Parcelable.Creator<Input> CREATOR = new h();

                /* renamed from: a, reason: collision with root package name */
                public final String f44839a;

                /* renamed from: b, reason: collision with root package name */
                public final String f44840b;

                /* renamed from: c, reason: collision with root package name */
                public final String f44841c;

                /* renamed from: d, reason: collision with root package name */
                public final Address f44842d;

                /* renamed from: e, reason: collision with root package name */
                public final boolean f44843e;

                public Input(String name, String str, String str2, Address address, boolean z11) {
                    Intrinsics.g(name, "name");
                    this.f44839a = name;
                    this.f44840b = str;
                    this.f44841c = str2;
                    this.f44842d = address;
                    this.f44843e = z11;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof Input)) {
                        return false;
                    }
                    Input input = (Input) obj;
                    return Intrinsics.b(this.f44839a, input.f44839a) && Intrinsics.b(this.f44840b, input.f44840b) && Intrinsics.b(this.f44841c, input.f44841c) && Intrinsics.b(this.f44842d, input.f44842d) && this.f44843e == input.f44843e;
                }

                public final int hashCode() {
                    int iHashCode = this.f44839a.hashCode() * 31;
                    String str = this.f44840b;
                    int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
                    String str2 = this.f44841c;
                    int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
                    Address address = this.f44842d;
                    return Boolean.hashCode(this.f44843e) + ((iHashCode3 + (address != null ? address.hashCode() : 0)) * 31);
                }

                public final String toString() {
                    StringBuilder sbW = c0.w("Input(name=", this.f44839a, ", email=", this.f44840b, ", phone=");
                    sbW.append(this.f44841c);
                    sbW.append(", address=");
                    sbW.append(this.f44842d);
                    sbW.append(", saveForFutureUse=");
                    return a80.m.k(sbW, this.f44843e, ")");
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    dest.writeString(this.f44839a);
                    dest.writeString(this.f44840b);
                    dest.writeString(this.f44841c);
                    dest.writeParcelable(this.f44842d, i5);
                    dest.writeInt(this.f44843e ? 1 : 0);
                }
            }

            @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$New$USBankAccount$InstantDebitsInfo;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
            public static final /* data */ class InstantDebitsInfo implements Parcelable {

                @NotNull
                public static final Parcelable.Creator<InstantDebitsInfo> CREATOR = new i();

                /* renamed from: a, reason: collision with root package name */
                public final PaymentMethod f44844a;

                /* renamed from: b, reason: collision with root package name */
                public final d0 f44845b;

                public InstantDebitsInfo(PaymentMethod paymentMethod, d0 d0Var) {
                    Intrinsics.g(paymentMethod, "paymentMethod");
                    this.f44844a = paymentMethod;
                    this.f44845b = d0Var;
                }

                @Override // android.os.Parcelable
                public final int describeContents() {
                    return 0;
                }

                public final boolean equals(Object obj) {
                    if (this == obj) {
                        return true;
                    }
                    if (!(obj instanceof InstantDebitsInfo)) {
                        return false;
                    }
                    InstantDebitsInfo instantDebitsInfo = (InstantDebitsInfo) obj;
                    return Intrinsics.b(this.f44844a, instantDebitsInfo.f44844a) && this.f44845b == instantDebitsInfo.f44845b;
                }

                public final int hashCode() {
                    int iHashCode = this.f44844a.hashCode() * 31;
                    d0 d0Var = this.f44845b;
                    return iHashCode + (d0Var == null ? 0 : d0Var.hashCode());
                }

                public final String toString() {
                    return "InstantDebitsInfo(paymentMethod=" + this.f44844a + ", linkMode=" + this.f44845b + ")";
                }

                @Override // android.os.Parcelable
                public final void writeToParcel(Parcel dest, int i5) {
                    Intrinsics.g(dest, "dest");
                    dest.writeParcelable(this.f44844a, i5);
                    d0 d0Var = this.f44845b;
                    if (d0Var == null) {
                        dest.writeInt(0);
                    } else {
                        dest.writeInt(1);
                        dest.writeString(d0Var.name());
                    }
                }
            }

            public USBankAccount(String label, int i5, Input input, BankFormScreenState screenState, InstantDebitsInfo instantDebitsInfo, PaymentMethodCreateParams paymentMethodCreateParams, wu.c customerRequestedSave, PaymentMethodOptionsParams paymentMethodOptionsParams, PaymentMethodExtraParams paymentMethodExtraParams) {
                Intrinsics.g(label, "label");
                Intrinsics.g(input, "input");
                Intrinsics.g(screenState, "screenState");
                Intrinsics.g(paymentMethodCreateParams, "paymentMethodCreateParams");
                Intrinsics.g(customerRequestedSave, "customerRequestedSave");
                this.f44830a = label;
                this.f44831b = i5;
                this.f44832c = input;
                this.f44833d = screenState;
                this.f44834e = instantDebitsInfo;
                this.f44835f = paymentMethodCreateParams;
                this.f44836g = customerRequestedSave;
                this.f44837h = paymentMethodOptionsParams;
                this.f44838i = paymentMethodExtraParams;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New, com.stripe.android.paymentsheet.model.PaymentSelection
            public final ResolvableString d(String merchantName, boolean z11) {
                Intrinsics.g(merchantName, "merchantName");
                BankFormScreenState.LinkedBankAccount linkedBankAccount = this.f44833d.f44864d;
                if (linkedBankAccount != null) {
                    return linkedBankAccount.f44871f;
                }
                return null;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: e, reason: from getter */
            public final wu.c getF44836g() {
                return this.f44836g;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof USBankAccount)) {
                    return false;
                }
                USBankAccount uSBankAccount = (USBankAccount) obj;
                return Intrinsics.b(this.f44830a, uSBankAccount.f44830a) && this.f44831b == uSBankAccount.f44831b && Intrinsics.b(this.f44832c, uSBankAccount.f44832c) && Intrinsics.b(this.f44833d, uSBankAccount.f44833d) && Intrinsics.b(this.f44834e, uSBankAccount.f44834e) && Intrinsics.b(this.f44835f, uSBankAccount.f44835f) && this.f44836g == uSBankAccount.f44836g && Intrinsics.b(this.f44837h, uSBankAccount.f44837h) && Intrinsics.b(this.f44838i, uSBankAccount.f44838i);
            }

            public final int hashCode() {
                int iHashCode = (this.f44833d.hashCode() + ((this.f44832c.hashCode() + u4.a(this.f44831b, this.f44830a.hashCode() * 31, 31)) * 31)) * 31;
                InstantDebitsInfo instantDebitsInfo = this.f44834e;
                int iHashCode2 = (this.f44836g.hashCode() + ((this.f44835f.hashCode() + ((iHashCode + (instantDebitsInfo == null ? 0 : instantDebitsInfo.hashCode())) * 31)) * 31)) * 31;
                PaymentMethodOptionsParams paymentMethodOptionsParams = this.f44837h;
                int iHashCode3 = (iHashCode2 + (paymentMethodOptionsParams == null ? 0 : paymentMethodOptionsParams.hashCode())) * 31;
                PaymentMethodExtraParams paymentMethodExtraParams = this.f44838i;
                return iHashCode3 + (paymentMethodExtraParams != null ? paymentMethodExtraParams.hashCode() : 0);
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: i, reason: from getter */
            public final PaymentMethodCreateParams getF44835f() {
                return this.f44835f;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: l, reason: from getter */
            public final PaymentMethodExtraParams getF44838i() {
                return this.f44838i;
            }

            @Override // com.stripe.android.paymentsheet.model.PaymentSelection.New
            /* renamed from: m, reason: from getter */
            public final PaymentMethodOptionsParams getF44837h() {
                return this.f44837h;
            }

            public final String toString() {
                StringBuilder sbV = c0.v("USBankAccount(label=", this.f44831b, this.f44830a, ", iconResource=", ", input=");
                sbV.append(this.f44832c);
                sbV.append(", screenState=");
                sbV.append(this.f44833d);
                sbV.append(", instantDebits=");
                sbV.append(this.f44834e);
                sbV.append(", paymentMethodCreateParams=");
                sbV.append(this.f44835f);
                sbV.append(", customerRequestedSave=");
                sbV.append(this.f44836g);
                sbV.append(", paymentMethodOptionsParams=");
                sbV.append(this.f44837h);
                sbV.append(", paymentMethodExtraParams=");
                sbV.append(this.f44838i);
                sbV.append(")");
                return sbV.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44830a);
                dest.writeInt(this.f44831b);
                this.f44832c.writeToParcel(dest, i5);
                dest.writeParcelable(this.f44833d, i5);
                InstantDebitsInfo instantDebitsInfo = this.f44834e;
                if (instantDebitsInfo == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    instantDebitsInfo.writeToParcel(dest, i5);
                }
                dest.writeParcelable(this.f44835f, i5);
                dest.writeString(this.f44836g.name());
                dest.writeParcelable(this.f44837h, i5);
                dest.writeParcelable(this.f44838i, i5);
            }
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final boolean b() {
            return false;
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public ResolvableString d(String merchantName, boolean z11) {
            Intrinsics.g(merchantName, "merchantName");
            return null;
        }

        /* renamed from: e */
        public abstract wu.c getF44836g();

        /* renamed from: i */
        public abstract PaymentMethodCreateParams getF44835f();

        /* renamed from: l */
        public abstract PaymentMethodExtraParams getF44838i();

        /* renamed from: m */
        public abstract PaymentMethodOptionsParams getF44837h();
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$Saved;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection;", "com/stripe/android/paymentsheet/model/k", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Saved extends PaymentSelection {

        @NotNull
        public static final Parcelable.Creator<Saved> CREATOR = new j();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentMethod f44846a;

        /* renamed from: b, reason: collision with root package name */
        public final k f44847b;

        /* renamed from: c, reason: collision with root package name */
        public final PaymentMethodOptionsParams f44848c;

        public Saved(PaymentMethod paymentMethod, k kVar, PaymentMethodOptionsParams paymentMethodOptionsParams) {
            Intrinsics.g(paymentMethod, "paymentMethod");
            this.f44846a = paymentMethod;
            this.f44847b = kVar;
            this.f44848c = paymentMethodOptionsParams;
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r3v2, types: [com.stripe.android.model.PaymentMethodOptionsParams] */
        public static Saved e(Saved saved, PaymentMethod paymentMethod, PaymentMethodOptionsParams.Card card, int i5) {
            if ((i5 & 1) != 0) {
                paymentMethod = saved.f44846a;
            }
            k kVar = saved.f44847b;
            PaymentMethodOptionsParams.Card card2 = card;
            if ((i5 & 4) != 0) {
                card2 = saved.f44848c;
            }
            saved.getClass();
            Intrinsics.g(paymentMethod, "paymentMethod");
            return new Saved(paymentMethod, kVar, card2);
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final boolean b() {
            PaymentMethod.Type type = this.f44846a.f43573e;
            return type == PaymentMethod.Type.L || type == PaymentMethod.Type.f43642l;
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final ResolvableString d(String merchantName, boolean z11) {
            Intrinsics.g(merchantName, "merchantName");
            PaymentMethod.Type type = this.f44846a.f43573e;
            int i5 = type == null ? -1 : l.f44859a[type.ordinal()];
            if (i5 == 1) {
                return ph.a.k(merchantName, null, false, false, false, false, z11);
            }
            if (i5 != 2) {
                return null;
            }
            return zg.a.U(2132020008, new Object[]{merchantName}, EmptyList.f71733a);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Saved)) {
                return false;
            }
            Saved saved = (Saved) obj;
            return Intrinsics.b(this.f44846a, saved.f44846a) && this.f44847b == saved.f44847b && Intrinsics.b(this.f44848c, saved.f44848c);
        }

        public final int hashCode() {
            int iHashCode = this.f44846a.hashCode() * 31;
            k kVar = this.f44847b;
            int iHashCode2 = (iHashCode + (kVar == null ? 0 : kVar.hashCode())) * 31;
            PaymentMethodOptionsParams paymentMethodOptionsParams = this.f44848c;
            return iHashCode2 + (paymentMethodOptionsParams != null ? paymentMethodOptionsParams.hashCode() : 0);
        }

        public final String toString() {
            return "Saved(paymentMethod=" + this.f44846a + ", walletType=" + this.f44847b + ", paymentMethodOptionsParams=" + this.f44848c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44846a, i5);
            k kVar = this.f44847b;
            if (kVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(kVar.name());
            }
            dest.writeParcelable(this.f44848c, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$ShopPay;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ShopPay extends PaymentSelection {

        /* renamed from: a, reason: collision with root package name */
        public static final ShopPay f44849a = new ShopPay();

        @NotNull
        public static final Parcelable.Creator<ShopPay> CREATOR = new m();

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final boolean b() {
            return false;
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final ResolvableString d(String merchantName, boolean z11) {
            Intrinsics.g(merchantName, "merchantName");
            return null;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof ShopPay);
        }

        public final int hashCode() {
            return 2007368465;
        }

        public final String toString() {
            return "ShopPay";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    public abstract boolean b();

    public abstract ResolvableString d(String str, boolean z11);

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/model/PaymentSelection$Link;", "Lcom/stripe/android/paymentsheet/model/PaymentSelection;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Link extends PaymentSelection {

        @NotNull
        public static final Parcelable.Creator<Link> CREATOR = new d();

        /* renamed from: a, reason: collision with root package name */
        public final es.o f44811a;

        /* renamed from: b, reason: collision with root package name */
        public final LinkPaymentMethod f44812b;

        /* renamed from: c, reason: collision with root package name */
        public final ConsumerShippingAddress f44813c;

        public Link(es.o linkExpressMode, LinkPaymentMethod linkPaymentMethod, ConsumerShippingAddress consumerShippingAddress) {
            Intrinsics.g(linkExpressMode, "linkExpressMode");
            this.f44811a = linkExpressMode;
            this.f44812b = linkPaymentMethod;
            this.f44813c = consumerShippingAddress;
        }

        public static Link e(Link link, LinkPaymentMethod linkPaymentMethod) {
            es.o linkExpressMode = link.f44811a;
            ConsumerShippingAddress consumerShippingAddress = link.f44813c;
            link.getClass();
            Intrinsics.g(linkExpressMode, "linkExpressMode");
            return new Link(linkExpressMode, linkPaymentMethod, consumerShippingAddress);
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final boolean b() {
            return false;
        }

        @Override // com.stripe.android.paymentsheet.model.PaymentSelection
        public final ResolvableString d(String merchantName, boolean z11) {
            Intrinsics.g(merchantName, "merchantName");
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
            if (!(obj instanceof Link)) {
                return false;
            }
            Link link = (Link) obj;
            return this.f44811a == link.f44811a && Intrinsics.b(this.f44812b, link.f44812b) && Intrinsics.b(this.f44813c, link.f44813c);
        }

        public final int hashCode() {
            int iHashCode = this.f44811a.hashCode() * 31;
            LinkPaymentMethod linkPaymentMethod = this.f44812b;
            int iHashCode2 = (iHashCode + (linkPaymentMethod == null ? 0 : linkPaymentMethod.hashCode())) * 31;
            ConsumerShippingAddress consumerShippingAddress = this.f44813c;
            return iHashCode2 + (consumerShippingAddress != null ? consumerShippingAddress.hashCode() : 0);
        }

        public final String toString() {
            return "Link(linkExpressMode=" + this.f44811a + ", selectedPayment=" + this.f44812b + ", shippingAddress=" + this.f44813c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44811a.name());
            dest.writeParcelable(this.f44812b, i5);
            dest.writeParcelable(this.f44813c, i5);
        }

        public /* synthetic */ Link(es.o oVar, LinkPaymentMethod linkPaymentMethod, ConsumerShippingAddress consumerShippingAddress, int i5) {
            this((i5 & 1) != 0 ? es.o.f52992a : oVar, (i5 & 2) != 0 ? null : linkPaymentMethod, (i5 & 4) != 0 ? null : consumerShippingAddress);
        }
    }
}
