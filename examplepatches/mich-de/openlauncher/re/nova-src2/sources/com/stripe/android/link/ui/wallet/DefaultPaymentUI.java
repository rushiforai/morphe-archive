package com.stripe.android.link.ui.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/link/ui/wallet/DefaultPaymentUI;", "Landroid/os/Parcelable;", "PaymentType", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class DefaultPaymentUI implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<DefaultPaymentUI> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    public final PaymentType f43062a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43063b;

    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bq\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/link/ui/wallet/DefaultPaymentUI$PaymentType;", "Landroid/os/Parcelable;", "Card", "BankAccount", "Lcom/stripe/android/link/ui/wallet/DefaultPaymentUI$PaymentType$BankAccount;", "Lcom/stripe/android/link/ui/wallet/DefaultPaymentUI$PaymentType$Card;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface PaymentType extends Parcelable {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/ui/wallet/DefaultPaymentUI$PaymentType$BankAccount;", "Lcom/stripe/android/link/ui/wallet/DefaultPaymentUI$PaymentType;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class BankAccount implements PaymentType {

            @NotNull
            public static final Parcelable.Creator<BankAccount> CREATOR = new b();

            /* renamed from: a, reason: collision with root package name */
            public final String f43064a;

            public BankAccount(String str) {
                this.f43064a = str;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof BankAccount) && Intrinsics.b(this.f43064a, ((BankAccount) obj).f43064a);
            }

            public final int hashCode() {
                String str = this.f43064a;
                if (str == null) {
                    return 0;
                }
                return str.hashCode();
            }

            public final String toString() {
                return c0.l("BankAccount(bankIconCode=", this.f43064a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43064a);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/ui/wallet/DefaultPaymentUI$PaymentType$Card;", "Lcom/stripe/android/link/ui/wallet/DefaultPaymentUI$PaymentType;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Card implements PaymentType {

            @NotNull
            public static final Parcelable.Creator<Card> CREATOR = new c();

            /* renamed from: a, reason: collision with root package name */
            public final int f43065a;

            public Card(int i5) {
                this.f43065a = i5;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof Card) && this.f43065a == ((Card) obj).f43065a;
            }

            public final int hashCode() {
                return Integer.hashCode(this.f43065a);
            }

            public final String toString() {
                return c0.i(this.f43065a, "Card(iconRes=", ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeInt(this.f43065a);
            }
        }
    }

    public DefaultPaymentUI(PaymentType paymentType, String last4) {
        Intrinsics.g(paymentType, "paymentType");
        Intrinsics.g(last4, "last4");
        this.f43062a = paymentType;
        this.f43063b = last4;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof DefaultPaymentUI)) {
            return false;
        }
        DefaultPaymentUI defaultPaymentUI = (DefaultPaymentUI) obj;
        return Intrinsics.b(this.f43062a, defaultPaymentUI.f43062a) && Intrinsics.b(this.f43063b, defaultPaymentUI.f43063b);
    }

    public final int hashCode() {
        return this.f43063b.hashCode() + (this.f43062a.hashCode() * 31);
    }

    public final String toString() {
        return "DefaultPaymentUI(paymentType=" + this.f43062a + ", last4=" + this.f43063b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f43062a, i5);
        dest.writeString(this.f43063b);
    }
}
