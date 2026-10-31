package com.stripe.android.model.wallets;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.Address;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\b\u0002\u0003\u0004\u0005\u0006\u0007\b\t\u0082\u0001\u0007\n\u000b\f\r\u000e\u000f\u0010¨\u0006\u0011"}, d2 = {"Lcom/stripe/android/model/wallets/Wallet;", "Lcom/stripe/android/core/model/StripeModel;", "AmexExpressCheckoutWallet", "ApplePayWallet", "GooglePayWallet", "MasterpassWallet", "SamsungPayWallet", "VisaCheckoutWallet", "LinkWallet", "ht/a", "Lcom/stripe/android/model/wallets/Wallet$AmexExpressCheckoutWallet;", "Lcom/stripe/android/model/wallets/Wallet$ApplePayWallet;", "Lcom/stripe/android/model/wallets/Wallet$GooglePayWallet;", "Lcom/stripe/android/model/wallets/Wallet$LinkWallet;", "Lcom/stripe/android/model/wallets/Wallet$MasterpassWallet;", "Lcom/stripe/android/model/wallets/Wallet$SamsungPayWallet;", "Lcom/stripe/android/model/wallets/Wallet$VisaCheckoutWallet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class Wallet implements StripeModel {

    /* renamed from: a, reason: collision with root package name */
    public final ht.a f44059a;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/wallets/Wallet$AmexExpressCheckoutWallet;", "Lcom/stripe/android/model/wallets/Wallet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class AmexExpressCheckoutWallet extends Wallet {

        @NotNull
        public static final Parcelable.Creator<AmexExpressCheckoutWallet> CREATOR = new a();

        /* renamed from: b, reason: collision with root package name */
        public final String f44060b;

        public AmexExpressCheckoutWallet(String str) {
            super(ht.a.f60052c);
            this.f44060b = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof AmexExpressCheckoutWallet) && Intrinsics.b(this.f44060b, ((AmexExpressCheckoutWallet) obj).f44060b);
        }

        public final int hashCode() {
            String str = this.f44060b;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return c0.l("AmexExpressCheckoutWallet(dynamicLast4=", this.f44060b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44060b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/wallets/Wallet$ApplePayWallet;", "Lcom/stripe/android/model/wallets/Wallet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ApplePayWallet extends Wallet {

        @NotNull
        public static final Parcelable.Creator<ApplePayWallet> CREATOR = new b();

        /* renamed from: b, reason: collision with root package name */
        public final String f44061b;

        public ApplePayWallet(String str) {
            super(ht.a.f60053d);
            this.f44061b = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof ApplePayWallet) && Intrinsics.b(this.f44061b, ((ApplePayWallet) obj).f44061b);
        }

        public final int hashCode() {
            String str = this.f44061b;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return c0.l("ApplePayWallet(dynamicLast4=", this.f44061b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44061b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/wallets/Wallet$GooglePayWallet;", "Lcom/stripe/android/model/wallets/Wallet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class GooglePayWallet extends Wallet {

        @NotNull
        public static final Parcelable.Creator<GooglePayWallet> CREATOR = new c();

        /* renamed from: b, reason: collision with root package name */
        public final String f44062b;

        public GooglePayWallet(String str) {
            super(ht.a.f60054e);
            this.f44062b = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof GooglePayWallet) && Intrinsics.b(this.f44062b, ((GooglePayWallet) obj).f44062b);
        }

        public final int hashCode() {
            String str = this.f44062b;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return c0.l("GooglePayWallet(dynamicLast4=", this.f44062b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44062b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/wallets/Wallet$LinkWallet;", "Lcom/stripe/android/model/wallets/Wallet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class LinkWallet extends Wallet {

        @NotNull
        public static final Parcelable.Creator<LinkWallet> CREATOR = new d();

        /* renamed from: b, reason: collision with root package name */
        public final String f44063b;

        public LinkWallet(String str) {
            super(ht.a.f60058i);
            this.f44063b = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof LinkWallet) && Intrinsics.b(this.f44063b, ((LinkWallet) obj).f44063b);
        }

        public final int hashCode() {
            String str = this.f44063b;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return c0.l("LinkWallet(dynamicLast4=", this.f44063b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44063b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/wallets/Wallet$MasterpassWallet;", "Lcom/stripe/android/model/wallets/Wallet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class MasterpassWallet extends Wallet {

        @NotNull
        public static final Parcelable.Creator<MasterpassWallet> CREATOR = new e();

        /* renamed from: b, reason: collision with root package name */
        public final Address f44064b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44065c;

        /* renamed from: d, reason: collision with root package name */
        public final String f44066d;

        /* renamed from: e, reason: collision with root package name */
        public final Address f44067e;

        public MasterpassWallet(Address address, String str, String str2, Address address2) {
            super(ht.a.f60055f);
            this.f44064b = address;
            this.f44065c = str;
            this.f44066d = str2;
            this.f44067e = address2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof MasterpassWallet)) {
                return false;
            }
            MasterpassWallet masterpassWallet = (MasterpassWallet) obj;
            return Intrinsics.b(this.f44064b, masterpassWallet.f44064b) && Intrinsics.b(this.f44065c, masterpassWallet.f44065c) && Intrinsics.b(this.f44066d, masterpassWallet.f44066d) && Intrinsics.b(this.f44067e, masterpassWallet.f44067e);
        }

        public final int hashCode() {
            Address address = this.f44064b;
            int iHashCode = (address == null ? 0 : address.hashCode()) * 31;
            String str = this.f44065c;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f44066d;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            Address address2 = this.f44067e;
            return iHashCode3 + (address2 != null ? address2.hashCode() : 0);
        }

        public final String toString() {
            return "MasterpassWallet(billingAddress=" + this.f44064b + ", email=" + this.f44065c + ", name=" + this.f44066d + ", shippingAddress=" + this.f44067e + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Address address = this.f44064b;
            if (address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                address.writeToParcel(dest, i5);
            }
            dest.writeString(this.f44065c);
            dest.writeString(this.f44066d);
            Address address2 = this.f44067e;
            if (address2 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                address2.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/wallets/Wallet$SamsungPayWallet;", "Lcom/stripe/android/model/wallets/Wallet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class SamsungPayWallet extends Wallet {

        @NotNull
        public static final Parcelable.Creator<SamsungPayWallet> CREATOR = new f();

        /* renamed from: b, reason: collision with root package name */
        public final String f44068b;

        public SamsungPayWallet(String str) {
            super(ht.a.f60056g);
            this.f44068b = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof SamsungPayWallet) && Intrinsics.b(this.f44068b, ((SamsungPayWallet) obj).f44068b);
        }

        public final int hashCode() {
            String str = this.f44068b;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        public final String toString() {
            return c0.l("SamsungPayWallet(dynamicLast4=", this.f44068b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44068b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/wallets/Wallet$VisaCheckoutWallet;", "Lcom/stripe/android/model/wallets/Wallet;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class VisaCheckoutWallet extends Wallet {

        @NotNull
        public static final Parcelable.Creator<VisaCheckoutWallet> CREATOR = new g();

        /* renamed from: b, reason: collision with root package name */
        public final Address f44069b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44070c;

        /* renamed from: d, reason: collision with root package name */
        public final String f44071d;

        /* renamed from: e, reason: collision with root package name */
        public final Address f44072e;

        /* renamed from: f, reason: collision with root package name */
        public final String f44073f;

        public VisaCheckoutWallet(Address address, String str, String str2, Address address2, String str3) {
            super(ht.a.f60057h);
            this.f44069b = address;
            this.f44070c = str;
            this.f44071d = str2;
            this.f44072e = address2;
            this.f44073f = str3;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof VisaCheckoutWallet)) {
                return false;
            }
            VisaCheckoutWallet visaCheckoutWallet = (VisaCheckoutWallet) obj;
            return Intrinsics.b(this.f44069b, visaCheckoutWallet.f44069b) && Intrinsics.b(this.f44070c, visaCheckoutWallet.f44070c) && Intrinsics.b(this.f44071d, visaCheckoutWallet.f44071d) && Intrinsics.b(this.f44072e, visaCheckoutWallet.f44072e) && Intrinsics.b(this.f44073f, visaCheckoutWallet.f44073f);
        }

        public final int hashCode() {
            Address address = this.f44069b;
            int iHashCode = (address == null ? 0 : address.hashCode()) * 31;
            String str = this.f44070c;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f44071d;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            Address address2 = this.f44072e;
            int iHashCode4 = (iHashCode3 + (address2 == null ? 0 : address2.hashCode())) * 31;
            String str3 = this.f44073f;
            return iHashCode4 + (str3 != null ? str3.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("VisaCheckoutWallet(billingAddress=");
            sb2.append(this.f44069b);
            sb2.append(", email=");
            sb2.append(this.f44070c);
            sb2.append(", name=");
            sb2.append(this.f44071d);
            sb2.append(", shippingAddress=");
            sb2.append(this.f44072e);
            sb2.append(", dynamicLast4=");
            return c0.q(sb2, this.f44073f, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Address address = this.f44069b;
            if (address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                address.writeToParcel(dest, i5);
            }
            dest.writeString(this.f44070c);
            dest.writeString(this.f44071d);
            Address address2 = this.f44072e;
            if (address2 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                address2.writeToParcel(dest, i5);
            }
            dest.writeString(this.f44073f);
        }
    }

    public Wallet(ht.a aVar) {
        this.f44059a = aVar;
    }
}
