package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u00012\u00020\u0002:\u0005\u0003\u0004\u0005\u0006\u0007\u0082\u0001\u0005\b\t\n\u000b\f¨\u0006\r"}, d2 = {"Lcom/stripe/android/model/PaymentMethodExtraParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "BacsDebit", "Card", "Link", "SepaDebit", "USBankAccount", "Lcom/stripe/android/model/PaymentMethodExtraParams$BacsDebit;", "Lcom/stripe/android/model/PaymentMethodExtraParams$Card;", "Lcom/stripe/android/model/PaymentMethodExtraParams$Link;", "Lcom/stripe/android/model/PaymentMethodExtraParams$SepaDebit;", "Lcom/stripe/android/model/PaymentMethodExtraParams$USBankAccount;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public abstract class PaymentMethodExtraParams implements StripeParamsModel, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethod.Type f43726a;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodExtraParams$BacsDebit;", "Lcom/stripe/android/model/PaymentMethodExtraParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class BacsDebit extends PaymentMethodExtraParams {

        @NotNull
        public static final Parcelable.Creator<BacsDebit> CREATOR = new x3();

        /* renamed from: b, reason: collision with root package name */
        public final Boolean f43727b;

        public BacsDebit(Boolean bool) {
            super(PaymentMethod.Type.n);
            this.f43727b = bool;
        }

        @Override // com.stripe.android.model.PaymentMethodExtraParams
        public final List b() {
            Boolean bool = this.f43727b;
            return ul.b.P(new Pair("confirmed", bool != null ? bool.toString() : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof BacsDebit) && Intrinsics.b(this.f43727b, ((BacsDebit) obj).f43727b);
        }

        public final int hashCode() {
            Boolean bool = this.f43727b;
            if (bool == null) {
                return 0;
            }
            return bool.hashCode();
        }

        public final String toString() {
            return "BacsDebit(confirmed=" + this.f43727b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Boolean bool = this.f43727b;
            if (bool == null) {
                dest.writeInt(0);
            } else {
                com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodExtraParams$Card;", "Lcom/stripe/android/model/PaymentMethodExtraParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Card extends PaymentMethodExtraParams {

        @NotNull
        public static final Parcelable.Creator<Card> CREATOR = new y3();

        /* renamed from: b, reason: collision with root package name */
        public final Boolean f43728b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43729c;

        public Card(String str, Boolean bool) {
            super(PaymentMethod.Type.f43639i);
            this.f43728b = bool;
            this.f43729c = str;
        }

        @Override // com.stripe.android.model.PaymentMethodExtraParams
        public final List b() {
            Boolean bool = this.f43728b;
            return ul.b.P(new Pair("set_as_default_payment_method", bool != null ? bool.toString() : null));
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
            return Intrinsics.b(this.f43728b, card.f43728b) && Intrinsics.b(this.f43729c, card.f43729c);
        }

        public final int hashCode() {
            Boolean bool = this.f43728b;
            int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
            String str = this.f43729c;
            return iHashCode + (str != null ? str.hashCode() : 0);
        }

        public final String toString() {
            return "Card(setAsDefault=" + this.f43728b + ", phoneNumberCountry=" + this.f43729c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Boolean bool = this.f43728b;
            if (bool == null) {
                dest.writeInt(0);
            } else {
                com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
            }
            dest.writeString(this.f43729c);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodExtraParams$Link;", "Lcom/stripe/android/model/PaymentMethodExtraParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Link extends PaymentMethodExtraParams {

        @NotNull
        public static final Parcelable.Creator<Link> CREATOR = new z3();

        /* renamed from: b, reason: collision with root package name */
        public final Boolean f43730b;

        public Link(Boolean bool) {
            super(PaymentMethod.Type.f43638h);
            this.f43730b = bool;
        }

        @Override // com.stripe.android.model.PaymentMethodExtraParams
        public final List b() {
            Boolean bool = this.f43730b;
            return ul.b.P(new Pair("set_as_default_payment_method", bool != null ? bool.toString() : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Link) && Intrinsics.b(this.f43730b, ((Link) obj).f43730b);
        }

        public final int hashCode() {
            Boolean bool = this.f43730b;
            if (bool == null) {
                return 0;
            }
            return bool.hashCode();
        }

        public final String toString() {
            return "Link(setAsDefault=" + this.f43730b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Boolean bool = this.f43730b;
            if (bool == null) {
                dest.writeInt(0);
            } else {
                com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodExtraParams$SepaDebit;", "Lcom/stripe/android/model/PaymentMethodExtraParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SepaDebit extends PaymentMethodExtraParams {

        @NotNull
        public static final Parcelable.Creator<SepaDebit> CREATOR = new a4();

        /* renamed from: b, reason: collision with root package name */
        public final Boolean f43731b;

        public SepaDebit(Boolean bool) {
            super(PaymentMethod.Type.f43642l);
            this.f43731b = bool;
        }

        @Override // com.stripe.android.model.PaymentMethodExtraParams
        public final List b() {
            Boolean bool = this.f43731b;
            return ul.b.P(new Pair("set_as_default_payment_method", bool != null ? bool.toString() : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof SepaDebit) && Intrinsics.b(this.f43731b, ((SepaDebit) obj).f43731b);
        }

        public final int hashCode() {
            Boolean bool = this.f43731b;
            if (bool == null) {
                return 0;
            }
            return bool.hashCode();
        }

        public final String toString() {
            return "SepaDebit(setAsDefault=" + this.f43731b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Boolean bool = this.f43731b;
            if (bool == null) {
                dest.writeInt(0);
            } else {
                com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodExtraParams$USBankAccount;", "Lcom/stripe/android/model/PaymentMethodExtraParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class USBankAccount extends PaymentMethodExtraParams {

        @NotNull
        public static final Parcelable.Creator<USBankAccount> CREATOR = new b4();

        /* renamed from: b, reason: collision with root package name */
        public final Boolean f43732b;

        public USBankAccount(Boolean bool) {
            super(PaymentMethod.Type.L);
            this.f43732b = bool;
        }

        @Override // com.stripe.android.model.PaymentMethodExtraParams
        public final List b() {
            Boolean bool = this.f43732b;
            return ul.b.P(new Pair("set_as_default_payment_method", bool != null ? bool.toString() : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof USBankAccount) && Intrinsics.b(this.f43732b, ((USBankAccount) obj).f43732b);
        }

        public final int hashCode() {
            Boolean bool = this.f43732b;
            if (bool == null) {
                return 0;
            }
            return bool.hashCode();
        }

        public final String toString() {
            return "USBankAccount(setAsDefault=" + this.f43732b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Boolean bool = this.f43732b;
            if (bool == null) {
                dest.writeInt(0);
            } else {
                com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
            }
        }
    }

    public PaymentMethodExtraParams(PaymentMethod.Type type) {
        this.f43726a = type;
    }

    public abstract List b();

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        b70.h hVar = b70.h.f17594a;
        Map mapM0 = hVar;
        for (Pair pair : b()) {
            String str = (String) pair.f71683a;
            Object obj = pair.f71684b;
            Map mapE0 = obj != null ? b70.k.e0(new Pair(str, obj)) : null;
            if (mapE0 == null) {
                mapE0 = hVar;
            }
            mapM0 = MapsKt.m0(mapM0, mapE0);
        }
        return !mapM0.isEmpty() ? b70.k.e0(new Pair(this.f43726a.f43655a, mapM0)) : hVar;
    }
}
