package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/LinkPaymentDetails;", "Landroid/os/Parcelable;", "Card", "BankAccount", "Lcom/stripe/android/model/LinkPaymentDetails$BankAccount;", "Lcom/stripe/android/model/LinkPaymentDetails$Card;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface LinkPaymentDetails extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/LinkPaymentDetails$BankAccount;", "Lcom/stripe/android/model/LinkPaymentDetails;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class BankAccount implements LinkPaymentDetails {

        @NotNull
        public static final Parcelable.Creator<BankAccount> CREATOR = new v1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43508a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43509b;

        public BankAccount(String str, String last4) {
            Intrinsics.g(last4, "last4");
            this.f43508a = str;
            this.f43509b = last4;
        }

        @Override // com.stripe.android.model.LinkPaymentDetails
        /* renamed from: Q, reason: from getter */
        public final String getF43513d() {
            return this.f43509b;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof BankAccount)) {
                return false;
            }
            BankAccount bankAccount = (BankAccount) obj;
            return Intrinsics.b(this.f43508a, bankAccount.f43508a) && Intrinsics.b(this.f43509b, bankAccount.f43509b);
        }

        public final int hashCode() {
            String str = this.f43508a;
            return this.f43509b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
        }

        public final String toString() {
            return b.c0.n("BankAccount(bankName=", this.f43508a, ", last4=", this.f43509b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43508a);
            dest.writeString(this.f43509b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/LinkPaymentDetails$Card;", "Lcom/stripe/android/model/LinkPaymentDetails;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Card implements LinkPaymentDetails {

        @NotNull
        public static final Parcelable.Creator<Card> CREATOR = new w1();

        /* renamed from: a, reason: collision with root package name */
        public final String f43510a;

        /* renamed from: b, reason: collision with root package name */
        public final int f43511b;

        /* renamed from: c, reason: collision with root package name */
        public final int f43512c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43513d;

        /* renamed from: e, reason: collision with root package name */
        public final ft.b f43514e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43515f;

        public Card(String str, int i5, int i11, String last4, ft.b brand, String funding) {
            Intrinsics.g(last4, "last4");
            Intrinsics.g(brand, "brand");
            Intrinsics.g(funding, "funding");
            this.f43510a = str;
            this.f43511b = i5;
            this.f43512c = i11;
            this.f43513d = last4;
            this.f43514e = brand;
            this.f43515f = funding;
        }

        @Override // com.stripe.android.model.LinkPaymentDetails
        /* renamed from: Q, reason: from getter */
        public final String getF43513d() {
            return this.f43513d;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Card)) {
                return false;
            }
            Card card = (Card) obj;
            return Intrinsics.b(this.f43510a, card.f43510a) && this.f43511b == card.f43511b && this.f43512c == card.f43512c && Intrinsics.b(this.f43513d, card.f43513d) && this.f43514e == card.f43514e && Intrinsics.b(this.f43515f, card.f43515f);
        }

        public final int hashCode() {
            String str = this.f43510a;
            return this.f43515f.hashCode() + ((this.f43514e.hashCode() + b.c0.e(b.u4.a(this.f43512c, b.u4.a(this.f43511b, (str == null ? 0 : str.hashCode()) * 31, 31), 31), 31, this.f43513d)) * 31);
        }

        public final String toString() {
            StringBuilder sbV = b.c0.v("Card(nickname=", this.f43511b, this.f43510a, ", expMonth=", ", expYear=");
            sbV.append(this.f43512c);
            sbV.append(", last4=");
            sbV.append(this.f43513d);
            sbV.append(", brand=");
            sbV.append(this.f43514e);
            sbV.append(", funding=");
            sbV.append(this.f43515f);
            sbV.append(")");
            return sbV.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43510a);
            dest.writeInt(this.f43511b);
            dest.writeInt(this.f43512c);
            dest.writeString(this.f43513d);
            dest.writeString(this.f43514e.name());
            dest.writeString(this.f43515f);
        }
    }

    /* renamed from: Q */
    String getF43513d();
}
