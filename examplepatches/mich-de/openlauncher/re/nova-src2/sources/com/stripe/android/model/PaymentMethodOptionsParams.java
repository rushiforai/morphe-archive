package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u00012\u00020\u0002:\t\u0003\u0004\u0005\u0006\u0007\b\t\n\u000b\u0082\u0001\t\f\r\u000e\u000f\u0010\u0011\u0012\u0013\u0014¨\u0006\u0015"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "Card", "Link", "Blik", "SepaDebit", "Konbini", "WeChatPay", "WeChatPayH5", "USBankAccount", "SetupFutureUsage", "Lcom/stripe/android/model/PaymentMethodOptionsParams$Blik;", "Lcom/stripe/android/model/PaymentMethodOptionsParams$Card;", "Lcom/stripe/android/model/PaymentMethodOptionsParams$Konbini;", "Lcom/stripe/android/model/PaymentMethodOptionsParams$Link;", "Lcom/stripe/android/model/PaymentMethodOptionsParams$SepaDebit;", "Lcom/stripe/android/model/PaymentMethodOptionsParams$SetupFutureUsage;", "Lcom/stripe/android/model/PaymentMethodOptionsParams$USBankAccount;", "Lcom/stripe/android/model/PaymentMethodOptionsParams$WeChatPay;", "Lcom/stripe/android/model/PaymentMethodOptionsParams$WeChatPayH5;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public abstract class PaymentMethodOptionsParams implements StripeParamsModel, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final PaymentMethod.Type f43733a;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams$Blik;", "Lcom/stripe/android/model/PaymentMethodOptionsParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Blik extends PaymentMethodOptionsParams {

        @NotNull
        public static final Parcelable.Creator<Blik> CREATOR = new c4();

        /* renamed from: b, reason: collision with root package name */
        public final String f43734b;

        /* renamed from: c, reason: collision with root package name */
        public final ft.d f43735c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Blik(String code, ft.d dVar) {
            super(PaymentMethod.Type.f43652x);
            Intrinsics.g(code, "code");
            this.f43734b = code;
            this.f43735c = dVar;
        }

        @Override // com.stripe.android.model.PaymentMethodOptionsParams
        public final List b() {
            Pair pair = new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, this.f43734b);
            ft.d dVar = this.f43735c;
            return ul.b.Q(pair, new Pair("setup_future_usage", dVar != null ? dVar.f55930a : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Blik)) {
                return false;
            }
            Blik blik = (Blik) obj;
            return Intrinsics.b(this.f43734b, blik.f43734b) && this.f43735c == blik.f43735c;
        }

        public final int hashCode() {
            int iHashCode = this.f43734b.hashCode() * 31;
            ft.d dVar = this.f43735c;
            return iHashCode + (dVar == null ? 0 : dVar.hashCode());
        }

        public final String toString() {
            return "Blik(code=" + this.f43734b + ", setupFutureUsage=" + this.f43735c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43734b);
            ft.d dVar = this.f43735c;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams$Card;", "Lcom/stripe/android/model/PaymentMethodOptionsParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Card extends PaymentMethodOptionsParams {

        @NotNull
        public static final Parcelable.Creator<Card> CREATOR = new d4();

        /* renamed from: b, reason: collision with root package name */
        public final String f43736b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43737c;

        /* renamed from: d, reason: collision with root package name */
        public final ft.d f43738d;

        /* renamed from: e, reason: collision with root package name */
        public final Boolean f43739e;

        public /* synthetic */ Card(ft.d dVar) {
            this(null, null, dVar, Boolean.TRUE);
        }

        public static Card d(Card card, String str, ft.d dVar, int i5) {
            if ((i5 & 1) != 0) {
                str = card.f43736b;
            }
            String str2 = card.f43737c;
            if ((i5 & 4) != 0) {
                dVar = card.f43738d;
            }
            Boolean bool = card.f43739e;
            card.getClass();
            return new Card(str, str2, dVar, bool);
        }

        @Override // com.stripe.android.model.PaymentMethodOptionsParams
        public final List b() {
            Pair pair = new Pair("cvc", this.f43736b);
            Pair pair2 = new Pair("network", this.f43737c);
            Pair pair3 = new Pair("moto", this.f43739e);
            ft.d dVar = this.f43738d;
            return ul.b.Q(pair, pair2, pair3, new Pair("setup_future_usage", dVar != null ? dVar.f55930a : null));
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
            return Intrinsics.b(this.f43736b, card.f43736b) && Intrinsics.b(this.f43737c, card.f43737c) && this.f43738d == card.f43738d && Intrinsics.b(this.f43739e, card.f43739e);
        }

        public final int hashCode() {
            String str = this.f43736b;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43737c;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            ft.d dVar = this.f43738d;
            int iHashCode3 = (iHashCode2 + (dVar == null ? 0 : dVar.hashCode())) * 31;
            Boolean bool = this.f43739e;
            return iHashCode3 + (bool != null ? bool.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("Card(cvc=", this.f43736b, ", network=", this.f43737c, ", setupFutureUsage=");
            sbW.append(this.f43738d);
            sbW.append(", moto=");
            sbW.append(this.f43739e);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43736b);
            dest.writeString(this.f43737c);
            ft.d dVar = this.f43738d;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
            Boolean bool = this.f43739e;
            if (bool == null) {
                dest.writeInt(0);
            } else {
                com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
            }
        }

        public Card(String str, String str2, ft.d dVar, Boolean bool) {
            super(PaymentMethod.Type.f43639i);
            this.f43736b = str;
            this.f43737c = str2;
            this.f43738d = dVar;
            this.f43739e = bool;
        }

        public Card(int i5, ft.d dVar, String str) {
            this((i5 & 1) != 0 ? null : str, null, (i5 & 4) != 0 ? null : dVar, null);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams$Konbini;", "Lcom/stripe/android/model/PaymentMethodOptionsParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Konbini extends PaymentMethodOptionsParams {

        @NotNull
        public static final Parcelable.Creator<Konbini> CREATOR = new e4();

        /* renamed from: b, reason: collision with root package name */
        public final String f43740b;

        /* renamed from: c, reason: collision with root package name */
        public final ft.d f43741c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Konbini(String confirmationNumber, ft.d dVar) {
            super(PaymentMethod.Type.O);
            Intrinsics.g(confirmationNumber, "confirmationNumber");
            this.f43740b = confirmationNumber;
            this.f43741c = dVar;
        }

        @Override // com.stripe.android.model.PaymentMethodOptionsParams
        public final List b() {
            Pair pair = new Pair("confirmation_number", this.f43740b);
            ft.d dVar = this.f43741c;
            return ul.b.Q(pair, new Pair("setup_future_usage", dVar != null ? dVar.f55930a : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Konbini)) {
                return false;
            }
            Konbini konbini = (Konbini) obj;
            return Intrinsics.b(this.f43740b, konbini.f43740b) && this.f43741c == konbini.f43741c;
        }

        public final int hashCode() {
            int iHashCode = this.f43740b.hashCode() * 31;
            ft.d dVar = this.f43741c;
            return iHashCode + (dVar == null ? 0 : dVar.hashCode());
        }

        public final String toString() {
            return "Konbini(confirmationNumber=" + this.f43740b + ", setupFutureUsage=" + this.f43741c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43740b);
            ft.d dVar = this.f43741c;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams$Link;", "Lcom/stripe/android/model/PaymentMethodOptionsParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Link extends PaymentMethodOptionsParams {

        @NotNull
        public static final Parcelable.Creator<Link> CREATOR = new f4();

        /* renamed from: b, reason: collision with root package name */
        public final ft.d f43742b;

        public Link(ft.d dVar) {
            super(PaymentMethod.Type.f43638h);
            this.f43742b = dVar;
        }

        @Override // com.stripe.android.model.PaymentMethodOptionsParams
        public final List b() {
            ft.d dVar = this.f43742b;
            return ul.b.P(new Pair("setup_future_usage", dVar != null ? dVar.f55930a : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Link) && this.f43742b == ((Link) obj).f43742b;
        }

        public final int hashCode() {
            ft.d dVar = this.f43742b;
            if (dVar == null) {
                return 0;
            }
            return dVar.hashCode();
        }

        public final String toString() {
            return "Link(setupFutureUsage=" + this.f43742b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            ft.d dVar = this.f43742b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams$SepaDebit;", "Lcom/stripe/android/model/PaymentMethodOptionsParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SepaDebit extends PaymentMethodOptionsParams {

        @NotNull
        public static final Parcelable.Creator<SepaDebit> CREATOR = new g4();

        /* renamed from: b, reason: collision with root package name */
        public final ft.d f43743b;

        public SepaDebit(ft.d dVar) {
            super(PaymentMethod.Type.f43642l);
            this.f43743b = dVar;
        }

        @Override // com.stripe.android.model.PaymentMethodOptionsParams
        public final List b() {
            ft.d dVar = this.f43743b;
            return ul.b.P(new Pair("setup_future_usage", dVar != null ? dVar.f55930a : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof SepaDebit) && this.f43743b == ((SepaDebit) obj).f43743b;
        }

        public final int hashCode() {
            ft.d dVar = this.f43743b;
            if (dVar == null) {
                return 0;
            }
            return dVar.hashCode();
        }

        public final String toString() {
            return "SepaDebit(setupFutureUsage=" + this.f43743b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            ft.d dVar = this.f43743b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams$SetupFutureUsage;", "Lcom/stripe/android/model/PaymentMethodOptionsParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class SetupFutureUsage extends PaymentMethodOptionsParams {

        @NotNull
        public static final Parcelable.Creator<SetupFutureUsage> CREATOR = new h4();

        /* renamed from: b, reason: collision with root package name */
        public final PaymentMethod.Type f43744b;

        /* renamed from: c, reason: collision with root package name */
        public final ft.d f43745c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public SetupFutureUsage(PaymentMethod.Type paymentMethodType, ft.d setupFutureUsage) {
            super(paymentMethodType);
            Intrinsics.g(paymentMethodType, "paymentMethodType");
            Intrinsics.g(setupFutureUsage, "setupFutureUsage");
            this.f43744b = paymentMethodType;
            this.f43745c = setupFutureUsage;
        }

        @Override // com.stripe.android.model.PaymentMethodOptionsParams
        public final List b() {
            return ul.b.P(new Pair("setup_future_usage", this.f43745c.f55930a));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SetupFutureUsage)) {
                return false;
            }
            SetupFutureUsage setupFutureUsage = (SetupFutureUsage) obj;
            return this.f43744b == setupFutureUsage.f43744b && this.f43745c == setupFutureUsage.f43745c;
        }

        public final int hashCode() {
            return this.f43745c.hashCode() + (this.f43744b.hashCode() * 31);
        }

        public final String toString() {
            return "SetupFutureUsage(paymentMethodType=" + this.f43744b + ", setupFutureUsage=" + this.f43745c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f43744b.writeToParcel(dest, i5);
            dest.writeString(this.f43745c.name());
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams$USBankAccount;", "Lcom/stripe/android/model/PaymentMethodOptionsParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class USBankAccount extends PaymentMethodOptionsParams {

        @NotNull
        public static final Parcelable.Creator<USBankAccount> CREATOR = new i4();

        /* renamed from: b, reason: collision with root package name */
        public final ft.d f43746b;

        public USBankAccount(ft.d dVar) {
            super(PaymentMethod.Type.L);
            this.f43746b = dVar;
        }

        @Override // com.stripe.android.model.PaymentMethodOptionsParams
        public final List b() {
            ft.d dVar = this.f43746b;
            return ul.b.P(new Pair("setup_future_usage", dVar != null ? dVar.f55930a : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof USBankAccount) && this.f43746b == ((USBankAccount) obj).f43746b;
        }

        public final int hashCode() {
            ft.d dVar = this.f43746b;
            if (dVar == null) {
                return 0;
            }
            return dVar.hashCode();
        }

        public final String toString() {
            return "USBankAccount(setupFutureUsage=" + this.f43746b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            ft.d dVar = this.f43746b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams$WeChatPay;", "Lcom/stripe/android/model/PaymentMethodOptionsParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class WeChatPay extends PaymentMethodOptionsParams {

        @NotNull
        public static final Parcelable.Creator<WeChatPay> CREATOR = new j4();

        /* renamed from: b, reason: collision with root package name */
        public final String f43747b;

        /* renamed from: c, reason: collision with root package name */
        public final ft.d f43748c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public WeChatPay(String appId, ft.d dVar) {
            super(PaymentMethod.Type.f43653y);
            Intrinsics.g(appId, "appId");
            this.f43747b = appId;
            this.f43748c = dVar;
        }

        @Override // com.stripe.android.model.PaymentMethodOptionsParams
        public final List b() {
            Pair pair = new Pair("client", "android");
            Pair pair2 = new Pair("app_id", this.f43747b);
            ft.d dVar = this.f43748c;
            return ul.b.Q(pair, pair2, new Pair("setup_future_usage", dVar != null ? dVar.f55930a : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof WeChatPay)) {
                return false;
            }
            WeChatPay weChatPay = (WeChatPay) obj;
            return Intrinsics.b(this.f43747b, weChatPay.f43747b) && this.f43748c == weChatPay.f43748c;
        }

        public final int hashCode() {
            int iHashCode = this.f43747b.hashCode() * 31;
            ft.d dVar = this.f43748c;
            return iHashCode + (dVar == null ? 0 : dVar.hashCode());
        }

        public final String toString() {
            return "WeChatPay(appId=" + this.f43747b + ", setupFutureUsage=" + this.f43748c + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43747b);
            ft.d dVar = this.f43748c;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/PaymentMethodOptionsParams$WeChatPayH5;", "Lcom/stripe/android/model/PaymentMethodOptionsParams;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class WeChatPayH5 extends PaymentMethodOptionsParams {

        @NotNull
        public static final Parcelable.Creator<WeChatPayH5> CREATOR = new k4();

        /* renamed from: b, reason: collision with root package name */
        public final ft.d f43749b;

        public WeChatPayH5(ft.d dVar) {
            super(PaymentMethod.Type.f43653y);
            this.f43749b = dVar;
        }

        @Override // com.stripe.android.model.PaymentMethodOptionsParams
        public final List b() {
            Pair pair = new Pair("client", "mobile_web");
            ft.d dVar = this.f43749b;
            return ul.b.Q(pair, new Pair("setup_future_usage", dVar != null ? dVar.f55930a : null));
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof WeChatPayH5) && this.f43749b == ((WeChatPayH5) obj).f43749b;
        }

        public final int hashCode() {
            ft.d dVar = this.f43749b;
            if (dVar == null) {
                return 0;
            }
            return dVar.hashCode();
        }

        public final String toString() {
            return "WeChatPayH5(setupFutureUsage=" + this.f43749b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            ft.d dVar = this.f43749b;
            if (dVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(dVar.name());
            }
        }
    }

    public PaymentMethodOptionsParams(PaymentMethod.Type type) {
        this.f43733a = type;
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
        return !mapM0.isEmpty() ? b70.k.e0(new Pair(this.f43733a.f43655a, mapM0)) : hVar;
    }
}
