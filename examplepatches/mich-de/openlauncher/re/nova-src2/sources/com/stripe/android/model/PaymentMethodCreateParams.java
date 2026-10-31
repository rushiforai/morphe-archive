package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.stripe.android.model.PaymentMethod;
import com.tiktok.util.TTConst;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.EmptySet;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.SetBuilder;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u000e\u0003\u0004\u0005\u0006\u0007\b\t\n\u000b\f\r\u000e\u000f\u0010¨\u0006\u0011"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "Card", "Ideal", "Fpx", "Upi", "SepaDebit", "AuBecsDebit", "BacsDebit", "Netbanking", "CashAppPay", "Swish", "USBankAccount", "Link", "ShopPay", "com/stripe/android/model/m3", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class PaymentMethodCreateParams implements StripeParamsModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentMethodCreateParams> CREATOR = new n3();

    /* renamed from: a, reason: collision with root package name */
    public final String f43680a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f43681b;

    /* renamed from: c, reason: collision with root package name */
    public final Card f43682c;

    /* renamed from: d, reason: collision with root package name */
    public final Ideal f43683d;

    /* renamed from: e, reason: collision with root package name */
    public final Fpx f43684e;

    /* renamed from: f, reason: collision with root package name */
    public final SepaDebit f43685f;

    /* renamed from: g, reason: collision with root package name */
    public final AuBecsDebit f43686g;

    /* renamed from: h, reason: collision with root package name */
    public final BacsDebit f43687h;

    /* renamed from: i, reason: collision with root package name */
    public final Upi f43688i;

    /* renamed from: j, reason: collision with root package name */
    public final Netbanking f43689j;

    /* renamed from: k, reason: collision with root package name */
    public final USBankAccount f43690k;

    /* renamed from: l, reason: collision with root package name */
    public final Link f43691l;

    /* renamed from: m, reason: collision with root package name */
    public final CashAppPay f43692m;
    public final Swish n;
    public final ShopPay o;

    /* renamed from: p, reason: collision with root package name */
    public final PaymentMethod.BillingDetails f43693p;

    /* renamed from: q, reason: collision with root package name */
    public final PaymentMethod.AllowRedisplay f43694q;

    /* renamed from: r, reason: collision with root package name */
    public final RadarOptions f43695r;

    /* renamed from: s, reason: collision with root package name */
    public final Map f43696s;

    /* renamed from: t, reason: collision with root package name */
    public final Set f43697t;

    /* renamed from: u, reason: collision with root package name */
    public final ClientAttributionMetadata f43698u;

    /* renamed from: v, reason: collision with root package name */
    public final Map f43699v;

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$AuBecsDebit;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class AuBecsDebit implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<AuBecsDebit> CREATOR = new h3();

        /* renamed from: a, reason: collision with root package name */
        public String f43700a;

        /* renamed from: b, reason: collision with root package name */
        public String f43701b;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof AuBecsDebit)) {
                return false;
            }
            AuBecsDebit auBecsDebit = (AuBecsDebit) obj;
            return Intrinsics.b(this.f43700a, auBecsDebit.f43700a) && Intrinsics.b(this.f43701b, auBecsDebit.f43701b);
        }

        public final int hashCode() {
            return this.f43701b.hashCode() + (this.f43700a.hashCode() * 31);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            return MapsKt.j0(new Pair("bsb_number", this.f43700a), new Pair("account_number", this.f43701b));
        }

        public final String toString() {
            return b.c0.n("AuBecsDebit(bsbNumber=", this.f43700a, ", accountNumber=", this.f43701b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43700a);
            dest.writeString(this.f43701b);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$BacsDebit;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class BacsDebit implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<BacsDebit> CREATOR = new i3();

        /* renamed from: a, reason: collision with root package name */
        public final String f43702a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43703b;

        public BacsDebit(String accountNumber, String sortCode) {
            Intrinsics.g(accountNumber, "accountNumber");
            Intrinsics.g(sortCode, "sortCode");
            this.f43702a = accountNumber;
            this.f43703b = sortCode;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof BacsDebit)) {
                return false;
            }
            BacsDebit bacsDebit = (BacsDebit) obj;
            return Intrinsics.b(this.f43702a, bacsDebit.f43702a) && Intrinsics.b(this.f43703b, bacsDebit.f43703b);
        }

        public final int hashCode() {
            return this.f43703b.hashCode() + (this.f43702a.hashCode() * 31);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            return MapsKt.j0(new Pair("account_number", this.f43702a), new Pair("sort_code", this.f43703b));
        }

        public final String toString() {
            return b.c0.n("BacsDebit(accountNumber=", this.f43702a, ", sortCode=", this.f43703b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43702a);
            dest.writeString(this.f43703b);
        }
    }

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$Card;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "Networks", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Card implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Card> CREATOR = new j3();

        /* renamed from: a, reason: collision with root package name */
        public final String f43704a;

        /* renamed from: b, reason: collision with root package name */
        public final Integer f43705b;

        /* renamed from: c, reason: collision with root package name */
        public final Integer f43706c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43707d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43708e;

        /* renamed from: f, reason: collision with root package name */
        public final Set f43709f;

        /* renamed from: g, reason: collision with root package name */
        public final Networks f43710g;

        @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$Card$Networks;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Networks implements StripeParamsModel, Parcelable {

            @NotNull
            public static final Parcelable.Creator<Networks> CREATOR = new k3();

            /* renamed from: a, reason: collision with root package name */
            public final String f43711a;

            public Networks(String str) {
                this.f43711a = str;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                return (obj instanceof Networks) && Intrinsics.b(((Networks) obj).f43711a, this.f43711a);
            }

            public final int hashCode() {
                return Objects.hash(this.f43711a);
            }

            @Override // com.stripe.android.model.StripeParamsModel
            public final Map k0() {
                String str = this.f43711a;
                return str != null ? a80.m.n("preferred", str) : b70.h.f17594a;
            }

            public final String toString() {
                return b.c0.l("PaymentMethodCreateParams.Card.Networks(preferred=", this.f43711a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43711a);
            }
        }

        public /* synthetic */ Card(Integer num, Integer num2, String str, Set set, Networks networks, int i5) {
            this(null, (i5 & 2) != 0 ? null : num, (i5 & 4) != 0 ? null : num2, null, (i5 & 16) != 0 ? null : str, (i5 & 32) != 0 ? null : set, (i5 & 64) != 0 ? null : networks);
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
            return Intrinsics.b(this.f43704a, card.f43704a) && Intrinsics.b(this.f43705b, card.f43705b) && Intrinsics.b(this.f43706c, card.f43706c) && Intrinsics.b(this.f43707d, card.f43707d) && Intrinsics.b(this.f43708e, card.f43708e) && Intrinsics.b(this.f43709f, card.f43709f) && Intrinsics.b(this.f43710g, card.f43710g);
        }

        public final int hashCode() {
            String str = this.f43704a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            Integer num = this.f43705b;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.f43706c;
            int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
            String str2 = this.f43707d;
            int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43708e;
            int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
            Set set = this.f43709f;
            int iHashCode6 = (iHashCode5 + (set == null ? 0 : set.hashCode())) * 31;
            Networks networks = this.f43710g;
            return iHashCode6 + (networks != null ? networks.hashCode() : 0);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            Pair pair = new Pair("number", this.f43704a);
            Pair pair2 = new Pair("exp_month", this.f43705b);
            Pair pair3 = new Pair("exp_year", this.f43706c);
            Pair pair4 = new Pair("cvc", this.f43707d);
            Pair pair5 = new Pair("token", this.f43708e);
            Networks networks = this.f43710g;
            List<Pair> listQ = ul.b.Q(pair, pair2, pair3, pair4, pair5, new Pair("networks", networks != null ? networks.k0() : null));
            ArrayList arrayList = new ArrayList();
            for (Pair pair6 : listQ) {
                Object obj = pair6.f71684b;
                Pair pair7 = obj != null ? new Pair(pair6.f71683a, obj) : null;
                if (pair7 != null) {
                    arrayList.add(pair7);
                }
            }
            return MapsKt.r0(arrayList);
        }

        public final String toString() {
            return "Card(number=" + this.f43704a + ", expiryMonth=" + this.f43705b + ", expiryYear=" + this.f43706c + ", cvc=" + this.f43707d + ", token=" + this.f43708e + ", attribution=" + this.f43709f + ", networks=" + this.f43710g + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43704a);
            Integer num = this.f43705b;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            Integer num2 = this.f43706c;
            if (num2 == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num2);
            }
            dest.writeString(this.f43707d);
            dest.writeString(this.f43708e);
            Set set = this.f43709f;
            if (set == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeInt(set.size());
                Iterator it = set.iterator();
                while (it.hasNext()) {
                    dest.writeString((String) it.next());
                }
            }
            Networks networks = this.f43710g;
            if (networks == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                networks.writeToParcel(dest, i5);
            }
        }

        public Card(String str, Integer num, Integer num2, String str2, String str3, Set set, Networks networks) {
            this.f43704a = str;
            this.f43705b = num;
            this.f43706c = num2;
            this.f43707d = str2;
            this.f43708e = str3;
            this.f43709f = set;
            this.f43710g = networks;
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$CashAppPay;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class CashAppPay implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<CashAppPay> CREATOR = new l3();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$Fpx;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Fpx implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Fpx> CREATOR = new o3();

        /* renamed from: a, reason: collision with root package name */
        public String f43712a;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Fpx) && Intrinsics.b(this.f43712a, ((Fpx) obj).f43712a);
        }

        public final int hashCode() {
            String str = this.f43712a;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            String str = this.f43712a;
            Map mapN = str != null ? a80.m.n(PlaceTypes.BANK, str) : null;
            return mapN == null ? b70.h.f17594a : mapN;
        }

        public final String toString() {
            return b.c0.l("Fpx(bank=", this.f43712a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43712a);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$Ideal;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Ideal implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Ideal> CREATOR = new p3();

        /* renamed from: a, reason: collision with root package name */
        public String f43713a;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Ideal) && Intrinsics.b(this.f43713a, ((Ideal) obj).f43713a);
        }

        public final int hashCode() {
            String str = this.f43713a;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            String str = this.f43713a;
            Map mapN = str != null ? a80.m.n(PlaceTypes.BANK, str) : null;
            return mapN == null ? b70.h.f17594a : mapN;
        }

        public final String toString() {
            return b.c0.l("Ideal(bank=", this.f43713a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43713a);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$Link;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Link implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Link> CREATOR = new q3();

        /* renamed from: a, reason: collision with root package name */
        public final String f43714a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43715b;

        /* renamed from: c, reason: collision with root package name */
        public final Map f43716c;

        public Link(String paymentDetailsId, String consumerSessionClientSecret, Map map) {
            Intrinsics.g(paymentDetailsId, "paymentDetailsId");
            Intrinsics.g(consumerSessionClientSecret, "consumerSessionClientSecret");
            this.f43714a = paymentDetailsId;
            this.f43715b = consumerSessionClientSecret;
            this.f43716c = map;
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
            return Intrinsics.b(this.f43714a, link.f43714a) && Intrinsics.b(this.f43715b, link.f43715b) && Intrinsics.b(this.f43716c, link.f43716c);
        }

        public final int hashCode() {
            int iE = b.c0.e(this.f43714a.hashCode() * 31, 31, this.f43715b);
            Map map = this.f43716c;
            return iE + (map == null ? 0 : map.hashCode());
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            Map mapJ0 = MapsKt.j0(new Pair("payment_details_id", this.f43714a), new Pair("credentials", a80.m.n("consumer_session_client_secret", this.f43715b)));
            Map map = this.f43716c;
            if (map == null) {
                map = b70.h.f17594a;
            }
            return MapsKt.m0(mapJ0, map);
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("Link(paymentDetailsId=", this.f43714a, ", consumerSessionClientSecret=", this.f43715b, ", extraParams=");
            sbW.append(this.f43716c);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43714a);
            dest.writeString(this.f43715b);
            Map map = this.f43716c;
            if (map == null) {
                dest.writeInt(0);
                return;
            }
            dest.writeInt(1);
            dest.writeInt(map.size());
            for (Map.Entry entry : map.entrySet()) {
                dest.writeString((String) entry.getKey());
                dest.writeValue(entry.getValue());
            }
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$Netbanking;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Netbanking implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Netbanking> CREATOR = new r3();

        /* renamed from: a, reason: collision with root package name */
        public String f43717a;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Netbanking) && Intrinsics.b(this.f43717a, ((Netbanking) obj).f43717a);
        }

        public final int hashCode() {
            return this.f43717a.hashCode();
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            String lowerCase = this.f43717a.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            return b70.k.e0(new Pair(PlaceTypes.BANK, lowerCase));
        }

        public final String toString() {
            return b.c0.l("Netbanking(bank=", this.f43717a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43717a);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$SepaDebit;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class SepaDebit implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<SepaDebit> CREATOR = new s3();

        /* renamed from: a, reason: collision with root package name */
        public String f43718a;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof SepaDebit) && Intrinsics.b(this.f43718a, ((SepaDebit) obj).f43718a);
        }

        public final int hashCode() {
            String str = this.f43718a;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            String str = this.f43718a;
            Map mapN = str != null ? a80.m.n("iban", str) : null;
            return mapN == null ? b70.h.f17594a : mapN;
        }

        public final String toString() {
            return b.c0.l("SepaDebit(iban=", this.f43718a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43718a);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$ShopPay;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ShopPay implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<ShopPay> CREATOR = new t3();

        /* renamed from: a, reason: collision with root package name */
        public String f43719a;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof ShopPay) && Intrinsics.b(this.f43719a, ((ShopPay) obj).f43719a);
        }

        public final int hashCode() {
            return this.f43719a.hashCode();
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            return a80.m.n("external_source_id", this.f43719a);
        }

        public final String toString() {
            return b.c0.l("ShopPay(externalSourceId=", this.f43719a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43719a);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$Swish;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Swish implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Swish> CREATOR = new u3();

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$USBankAccount;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class USBankAccount implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<USBankAccount> CREATOR = new v3();

        /* renamed from: a, reason: collision with root package name */
        public final String f43720a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43721b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43722c;

        /* renamed from: d, reason: collision with root package name */
        public final PaymentMethod.USBankAccount.USBankAccountType f43723d;

        /* renamed from: e, reason: collision with root package name */
        public final PaymentMethod.USBankAccount.USBankAccountHolderType f43724e;

        public USBankAccount(String str, String str2, String str3, PaymentMethod.USBankAccount.USBankAccountType uSBankAccountType, PaymentMethod.USBankAccount.USBankAccountHolderType uSBankAccountHolderType) {
            this.f43720a = str;
            this.f43721b = str2;
            this.f43722c = str3;
            this.f43723d = uSBankAccountType;
            this.f43724e = uSBankAccountHolderType;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof USBankAccount)) {
                return false;
            }
            USBankAccount uSBankAccount = (USBankAccount) obj;
            return Intrinsics.b(this.f43720a, uSBankAccount.f43720a) && Intrinsics.b(this.f43721b, uSBankAccount.f43721b) && Intrinsics.b(this.f43722c, uSBankAccount.f43722c) && this.f43723d == uSBankAccount.f43723d && this.f43724e == uSBankAccount.f43724e;
        }

        public final int hashCode() {
            String str = this.f43720a;
            int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
            String str2 = this.f43721b;
            int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43722c;
            int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
            PaymentMethod.USBankAccount.USBankAccountType uSBankAccountType = this.f43723d;
            int iHashCode4 = (iHashCode3 + (uSBankAccountType == null ? 0 : uSBankAccountType.hashCode())) * 31;
            PaymentMethod.USBankAccount.USBankAccountHolderType uSBankAccountHolderType = this.f43724e;
            return iHashCode4 + (uSBankAccountHolderType != null ? uSBankAccountHolderType.hashCode() : 0);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            String str = this.f43720a;
            if (str != null) {
                Intrinsics.d(str);
                return b70.k.e0(new Pair("link_account_session", str));
            }
            String str2 = this.f43721b;
            Intrinsics.d(str2);
            Pair pair = new Pair("account_number", str2);
            String str3 = this.f43722c;
            Intrinsics.d(str3);
            Pair pair2 = new Pair("routing_number", str3);
            PaymentMethod.USBankAccount.USBankAccountType uSBankAccountType = this.f43723d;
            Intrinsics.d(uSBankAccountType);
            Pair pair3 = new Pair("account_type", uSBankAccountType.f43676a);
            PaymentMethod.USBankAccount.USBankAccountHolderType uSBankAccountHolderType = this.f43724e;
            Intrinsics.d(uSBankAccountHolderType);
            return MapsKt.j0(pair, pair2, pair3, new Pair("account_holder_type", uSBankAccountHolderType.f43672a));
        }

        public final String toString() {
            StringBuilder sbW = b.c0.w("USBankAccount(linkAccountSessionId=", this.f43720a, ", accountNumber=", this.f43721b, ", routingNumber=");
            sbW.append(this.f43722c);
            sbW.append(", accountType=");
            sbW.append(this.f43723d);
            sbW.append(", accountHolderType=");
            sbW.append(this.f43724e);
            sbW.append(")");
            return sbW.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43720a);
            dest.writeString(this.f43721b);
            dest.writeString(this.f43722c);
            PaymentMethod.USBankAccount.USBankAccountType uSBankAccountType = this.f43723d;
            if (uSBankAccountType == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                uSBankAccountType.writeToParcel(dest, i5);
            }
            PaymentMethod.USBankAccount.USBankAccountHolderType uSBankAccountHolderType = this.f43724e;
            if (uSBankAccountHolderType == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                uSBankAccountHolderType.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodCreateParams$Upi;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Upi implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Upi> CREATOR = new w3();

        /* renamed from: a, reason: collision with root package name */
        public final String f43725a;

        public Upi(String str) {
            this.f43725a = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Upi) && Intrinsics.b(this.f43725a, ((Upi) obj).f43725a);
        }

        public final int hashCode() {
            String str = this.f43725a;
            if (str == null) {
                return 0;
            }
            return str.hashCode();
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            String str = this.f43725a;
            Map mapN = str != null ? a80.m.n("vpa", str) : null;
            return mapN == null ? b70.h.f17594a : mapN;
        }

        public final String toString() {
            return b.c0.l("Upi(vpa=", this.f43725a, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43725a);
        }
    }

    public PaymentMethodCreateParams(String str, boolean z11, PaymentMethod.BillingDetails billingDetails, PaymentMethod.AllowRedisplay allowRedisplay, Set set, ClientAttributionMetadata clientAttributionMetadata, Map map, int i5) {
        this(str, z11, null, null, null, null, null, null, null, null, null, null, null, null, null, (i5 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? null : billingDetails, allowRedisplay, null, null, set, clientAttributionMetadata, map);
    }

    public static PaymentMethodCreateParams d(PaymentMethodCreateParams paymentMethodCreateParams, RadarOptions radarOptions, SetBuilder setBuilder, int i5) {
        PaymentMethod.AllowRedisplay allowRedisplay;
        Map map;
        Set productUsage;
        String code = paymentMethodCreateParams.f43680a;
        boolean z11 = paymentMethodCreateParams.f43681b;
        Card card = paymentMethodCreateParams.f43682c;
        Ideal ideal = paymentMethodCreateParams.f43683d;
        Fpx fpx = paymentMethodCreateParams.f43684e;
        SepaDebit sepaDebit = paymentMethodCreateParams.f43685f;
        AuBecsDebit auBecsDebit = paymentMethodCreateParams.f43686g;
        BacsDebit bacsDebit = paymentMethodCreateParams.f43687h;
        Upi upi = paymentMethodCreateParams.f43688i;
        Netbanking netbanking = paymentMethodCreateParams.f43689j;
        USBankAccount uSBankAccount = paymentMethodCreateParams.f43690k;
        Link link = paymentMethodCreateParams.f43691l;
        CashAppPay cashAppPay = paymentMethodCreateParams.f43692m;
        Swish swish = paymentMethodCreateParams.n;
        ShopPay shopPay = paymentMethodCreateParams.o;
        PaymentMethod.BillingDetails billingDetails = paymentMethodCreateParams.f43693p;
        PaymentMethod.AllowRedisplay allowRedisplay2 = paymentMethodCreateParams.f43694q;
        if ((i5 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0) {
            allowRedisplay = allowRedisplay2;
            radarOptions = paymentMethodCreateParams.f43695r;
        } else {
            allowRedisplay = allowRedisplay2;
        }
        Map map2 = paymentMethodCreateParams.f43696s;
        if ((i5 & 524288) != 0) {
            map = map2;
            productUsage = paymentMethodCreateParams.f43697t;
        } else {
            map = map2;
            productUsage = setBuilder;
        }
        ClientAttributionMetadata clientAttributionMetadata = paymentMethodCreateParams.f43698u;
        Map map3 = paymentMethodCreateParams.f43699v;
        paymentMethodCreateParams.getClass();
        Intrinsics.g(code, "code");
        Intrinsics.g(productUsage, "productUsage");
        return new PaymentMethodCreateParams(code, z11, card, ideal, fpx, sepaDebit, auBecsDebit, bacsDebit, upi, netbanking, uSBankAccount, link, cashAppPay, swish, shopPay, billingDetails, allowRedisplay, radarOptions, map, productUsage, clientAttributionMetadata, map3);
    }

    public final String b() {
        Object obj = ((LinkedHashMap) k0()).get("card");
        Map map = obj instanceof Map ? (Map) obj : null;
        Object obj2 = map != null ? map.get("number") : null;
        String str = obj2 instanceof String ? (String) obj2 : null;
        if (str != null) {
            return r70.l.H1(4, str);
        }
        return null;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final Set e() {
        Set set;
        z2 z2Var = PaymentMethod.Type.f43637g;
        boolean zB = Intrinsics.b(this.f43680a, "card");
        Set set2 = this.f43697t;
        if (!zB) {
            return set2;
        }
        Card card = this.f43682c;
        if (card == null || (set = card.f43709f) == null) {
            set = EmptySet.f71734a;
        }
        return b70.n.b0(set, set2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentMethodCreateParams)) {
            return false;
        }
        PaymentMethodCreateParams paymentMethodCreateParams = (PaymentMethodCreateParams) obj;
        return Intrinsics.b(this.f43680a, paymentMethodCreateParams.f43680a) && this.f43681b == paymentMethodCreateParams.f43681b && Intrinsics.b(this.f43682c, paymentMethodCreateParams.f43682c) && Intrinsics.b(this.f43683d, paymentMethodCreateParams.f43683d) && Intrinsics.b(this.f43684e, paymentMethodCreateParams.f43684e) && Intrinsics.b(this.f43685f, paymentMethodCreateParams.f43685f) && Intrinsics.b(this.f43686g, paymentMethodCreateParams.f43686g) && Intrinsics.b(this.f43687h, paymentMethodCreateParams.f43687h) && Intrinsics.b(this.f43688i, paymentMethodCreateParams.f43688i) && Intrinsics.b(this.f43689j, paymentMethodCreateParams.f43689j) && Intrinsics.b(this.f43690k, paymentMethodCreateParams.f43690k) && Intrinsics.b(this.f43691l, paymentMethodCreateParams.f43691l) && Intrinsics.b(this.f43692m, paymentMethodCreateParams.f43692m) && Intrinsics.b(this.n, paymentMethodCreateParams.n) && Intrinsics.b(this.o, paymentMethodCreateParams.o) && Intrinsics.b(this.f43693p, paymentMethodCreateParams.f43693p) && this.f43694q == paymentMethodCreateParams.f43694q && Intrinsics.b(this.f43695r, paymentMethodCreateParams.f43695r) && Intrinsics.b(this.f43696s, paymentMethodCreateParams.f43696s) && Intrinsics.b(this.f43697t, paymentMethodCreateParams.f43697t) && Intrinsics.b(this.f43698u, paymentMethodCreateParams.f43698u) && Intrinsics.b(this.f43699v, paymentMethodCreateParams.f43699v);
    }

    public final int hashCode() {
        int iF = c9.f(this.f43680a.hashCode() * 31, 31, this.f43681b);
        Card card = this.f43682c;
        int iHashCode = (iF + (card == null ? 0 : card.hashCode())) * 31;
        Ideal ideal = this.f43683d;
        int iHashCode2 = (iHashCode + (ideal == null ? 0 : ideal.hashCode())) * 31;
        Fpx fpx = this.f43684e;
        int iHashCode3 = (iHashCode2 + (fpx == null ? 0 : fpx.hashCode())) * 31;
        SepaDebit sepaDebit = this.f43685f;
        int iHashCode4 = (iHashCode3 + (sepaDebit == null ? 0 : sepaDebit.hashCode())) * 31;
        AuBecsDebit auBecsDebit = this.f43686g;
        int iHashCode5 = (iHashCode4 + (auBecsDebit == null ? 0 : auBecsDebit.hashCode())) * 31;
        BacsDebit bacsDebit = this.f43687h;
        int iHashCode6 = (iHashCode5 + (bacsDebit == null ? 0 : bacsDebit.hashCode())) * 31;
        Upi upi = this.f43688i;
        int iHashCode7 = (iHashCode6 + (upi == null ? 0 : upi.hashCode())) * 31;
        Netbanking netbanking = this.f43689j;
        int iHashCode8 = (iHashCode7 + (netbanking == null ? 0 : netbanking.f43717a.hashCode())) * 31;
        USBankAccount uSBankAccount = this.f43690k;
        int iHashCode9 = (iHashCode8 + (uSBankAccount == null ? 0 : uSBankAccount.hashCode())) * 31;
        Link link = this.f43691l;
        int iHashCode10 = (iHashCode9 + (link == null ? 0 : link.hashCode())) * 31;
        CashAppPay cashAppPay = this.f43692m;
        int iHashCode11 = (iHashCode10 + (cashAppPay == null ? 0 : cashAppPay.hashCode())) * 31;
        Swish swish = this.n;
        int iHashCode12 = (iHashCode11 + (swish == null ? 0 : swish.hashCode())) * 31;
        ShopPay shopPay = this.o;
        int iHashCode13 = (iHashCode12 + (shopPay == null ? 0 : shopPay.f43719a.hashCode())) * 31;
        PaymentMethod.BillingDetails billingDetails = this.f43693p;
        int iHashCode14 = (iHashCode13 + (billingDetails == null ? 0 : billingDetails.hashCode())) * 31;
        PaymentMethod.AllowRedisplay allowRedisplay = this.f43694q;
        int iHashCode15 = (iHashCode14 + (allowRedisplay == null ? 0 : allowRedisplay.hashCode())) * 31;
        RadarOptions radarOptions = this.f43695r;
        int iHashCode16 = (iHashCode15 + (radarOptions == null ? 0 : radarOptions.hashCode())) * 31;
        Map map = this.f43696s;
        int iK = h6.c1.k(this.f43697t, (iHashCode16 + (map == null ? 0 : map.hashCode())) * 31, 31);
        ClientAttributionMetadata clientAttributionMetadata = this.f43698u;
        int iHashCode17 = (iK + (clientAttributionMetadata == null ? 0 : clientAttributionMetadata.hashCode())) * 31;
        Map map2 = this.f43699v;
        return iHashCode17 + (map2 != null ? map2.hashCode() : 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:15:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00f4  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0105  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x010f  */
    /* JADX WARN: Type inference failed for: r1v3, types: [java.util.Map] */
    @Override // com.stripe.android.model.StripeParamsModel
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Map k0() {
        ShopPay shopPay;
        Map mapK0;
        Map mapO;
        Map mapO2;
        b70.h hVar = b70.h.f17594a;
        Map mapM0 = this.f43699v;
        if (mapM0 == null) {
            String str = this.f43680a;
            Map mapN = a80.m.n(TTConst.TRACK_TYPE, str);
            PaymentMethod.BillingDetails billingDetails = this.f43693p;
            Map mapO3 = billingDetails != null ? com.google.android.gms.internal.measurement.k2.o("billing_details", billingDetails.k0()) : null;
            if (mapO3 == null) {
                mapO3 = hVar;
            }
            LinkedHashMap linkedHashMapM0 = MapsKt.m0(mapN, mapO3);
            z2 z2Var = PaymentMethod.Type.f43637g;
            if (Intrinsics.b(str, "card")) {
                Card card = this.f43682c;
                mapK0 = card != null ? card.k0() : null;
                if (mapK0 == null || mapK0.isEmpty()) {
                    mapK0 = null;
                }
                mapO = mapK0 == null ? com.google.android.gms.internal.measurement.k2.o(str, mapK0) : null;
                if (mapO == null) {
                    mapO = hVar;
                }
                LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapO);
                Map map = this.f43696s;
                mapO2 = map == null ? com.google.android.gms.internal.measurement.k2.o("metadata", map) : null;
                if (mapO2 == null) {
                    mapO2 = hVar;
                }
                mapM0 = MapsKt.m0(linkedHashMapM02, mapO2);
            } else if (Intrinsics.b(str, "ideal")) {
                Ideal ideal = this.f43683d;
                if (ideal != null) {
                    mapK0 = ideal.k0();
                }
                if (mapK0 == null) {
                    mapK0 = null;
                    if (mapK0 == null) {
                    }
                    if (mapO == null) {
                    }
                    LinkedHashMap linkedHashMapM022 = MapsKt.m0(linkedHashMapM0, mapO);
                    Map map2 = this.f43696s;
                    if (map2 == null) {
                    }
                    if (mapO2 == null) {
                    }
                    mapM0 = MapsKt.m0(linkedHashMapM022, mapO2);
                }
            } else if (Intrinsics.b(str, "fpx")) {
                Fpx fpx = this.f43684e;
                if (fpx != null) {
                    mapK0 = fpx.k0();
                }
                if (mapK0 == null) {
                }
            } else if (Intrinsics.b(str, "sepa_debit")) {
                SepaDebit sepaDebit = this.f43685f;
                if (sepaDebit != null) {
                    mapK0 = sepaDebit.k0();
                }
                if (mapK0 == null) {
                }
            } else if (Intrinsics.b(str, "au_becs_debit")) {
                AuBecsDebit auBecsDebit = this.f43686g;
                if (auBecsDebit != null) {
                    mapK0 = auBecsDebit.k0();
                }
                if (mapK0 == null) {
                }
            } else if (Intrinsics.b(str, "bacs_debit")) {
                BacsDebit bacsDebit = this.f43687h;
                if (bacsDebit != null) {
                    mapK0 = bacsDebit.k0();
                }
                if (mapK0 == null) {
                }
            } else if (Intrinsics.b(str, "upi")) {
                Upi upi = this.f43688i;
                if (upi != null) {
                    mapK0 = upi.k0();
                }
                if (mapK0 == null) {
                }
            } else if (Intrinsics.b(str, "netbanking")) {
                Netbanking netbanking = this.f43689j;
                if (netbanking != null) {
                    mapK0 = netbanking.k0();
                }
                if (mapK0 == null) {
                }
            } else if (Intrinsics.b(str, "us_bank_account")) {
                USBankAccount uSBankAccount = this.f43690k;
                if (uSBankAccount != null) {
                    mapK0 = uSBankAccount.k0();
                }
                if (mapK0 == null) {
                }
            } else if (Intrinsics.b(str, "link")) {
                Link link = this.f43691l;
                if (link != null) {
                    mapK0 = link.k0();
                }
                if (mapK0 == null) {
                }
            } else {
                if (Intrinsics.b(str, "shop_pay") && (shopPay = this.o) != null) {
                    mapK0 = shopPay.k0();
                }
                if (mapK0 == null) {
                }
            }
        }
        PaymentMethod.AllowRedisplay allowRedisplay = this.f43694q;
        Map mapN2 = allowRedisplay != null ? a80.m.n("allow_redisplay", allowRedisplay.f43595a) : null;
        if (mapN2 == null) {
            mapN2 = hVar;
        }
        LinkedHashMap linkedHashMapM03 = MapsKt.m0(mapM0, mapN2);
        RadarOptions radarOptions = this.f43695r;
        Map mapO4 = radarOptions != null ? com.google.android.gms.internal.measurement.k2.o("radar_options", radarOptions.k0()) : null;
        if (mapO4 == null) {
            mapO4 = hVar;
        }
        LinkedHashMap linkedHashMapM04 = MapsKt.m0(linkedHashMapM03, mapO4);
        ClientAttributionMetadata clientAttributionMetadata = this.f43698u;
        b70.h hVarO = clientAttributionMetadata != null ? com.google.android.gms.internal.measurement.k2.o("client_attribution_metadata", clientAttributionMetadata.k0()) : null;
        if (hVarO != null) {
            hVar = hVarO;
        }
        return MapsKt.m0(linkedHashMapM04, hVar);
    }

    public final String toString() {
        return "PaymentMethodCreateParams(code=" + this.f43680a + ", requiresMandate=" + this.f43681b + ", card=" + this.f43682c + ", ideal=" + this.f43683d + ", fpx=" + this.f43684e + ", sepaDebit=" + this.f43685f + ", auBecsDebit=" + this.f43686g + ", bacsDebit=" + this.f43687h + ", upi=" + this.f43688i + ", netbanking=" + this.f43689j + ", usBankAccount=" + this.f43690k + ", link=" + this.f43691l + ", cashAppPay=" + this.f43692m + ", swish=" + this.n + ", shopPay=" + this.o + ", billingDetails=" + this.f43693p + ", allowRedisplay=" + this.f43694q + ", radarOptions=" + this.f43695r + ", metadata=" + this.f43696s + ", productUsage=" + this.f43697t + ", clientAttributionMetadata=" + this.f43698u + ", overrideParamMap=" + this.f43699v + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43680a);
        dest.writeInt(this.f43681b ? 1 : 0);
        Card card = this.f43682c;
        if (card == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            card.writeToParcel(dest, i5);
        }
        Ideal ideal = this.f43683d;
        if (ideal == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            ideal.writeToParcel(dest, i5);
        }
        Fpx fpx = this.f43684e;
        if (fpx == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            fpx.writeToParcel(dest, i5);
        }
        SepaDebit sepaDebit = this.f43685f;
        if (sepaDebit == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            sepaDebit.writeToParcel(dest, i5);
        }
        AuBecsDebit auBecsDebit = this.f43686g;
        if (auBecsDebit == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            auBecsDebit.writeToParcel(dest, i5);
        }
        BacsDebit bacsDebit = this.f43687h;
        if (bacsDebit == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            bacsDebit.writeToParcel(dest, i5);
        }
        Upi upi = this.f43688i;
        if (upi == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            upi.writeToParcel(dest, i5);
        }
        Netbanking netbanking = this.f43689j;
        if (netbanking == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            netbanking.writeToParcel(dest, i5);
        }
        USBankAccount uSBankAccount = this.f43690k;
        if (uSBankAccount == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            uSBankAccount.writeToParcel(dest, i5);
        }
        Link link = this.f43691l;
        if (link == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            link.writeToParcel(dest, i5);
        }
        CashAppPay cashAppPay = this.f43692m;
        if (cashAppPay == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            cashAppPay.writeToParcel(dest, i5);
        }
        Swish swish = this.n;
        if (swish == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            swish.writeToParcel(dest, i5);
        }
        ShopPay shopPay = this.o;
        if (shopPay == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            shopPay.writeToParcel(dest, i5);
        }
        PaymentMethod.BillingDetails billingDetails = this.f43693p;
        if (billingDetails == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            billingDetails.writeToParcel(dest, i5);
        }
        PaymentMethod.AllowRedisplay allowRedisplay = this.f43694q;
        if (allowRedisplay == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            allowRedisplay.writeToParcel(dest, i5);
        }
        dest.writeParcelable(this.f43695r, i5);
        Map map = this.f43696s;
        if (map == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeInt(map.size());
            for (Map.Entry entry : map.entrySet()) {
                dest.writeString((String) entry.getKey());
                dest.writeString((String) entry.getValue());
            }
        }
        Set set = this.f43697t;
        dest.writeInt(set.size());
        Iterator it = set.iterator();
        while (it.hasNext()) {
            dest.writeString((String) it.next());
        }
        ClientAttributionMetadata clientAttributionMetadata = this.f43698u;
        if (clientAttributionMetadata == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            clientAttributionMetadata.writeToParcel(dest, i5);
        }
        Map map2 = this.f43699v;
        if (map2 == null) {
            dest.writeInt(0);
            return;
        }
        dest.writeInt(1);
        dest.writeInt(map2.size());
        for (Map.Entry entry2 : map2.entrySet()) {
            dest.writeString((String) entry2.getKey());
            dest.writeValue(entry2.getValue());
        }
    }

    public PaymentMethodCreateParams(String code, boolean z11, Card card, Ideal ideal, Fpx fpx, SepaDebit sepaDebit, AuBecsDebit auBecsDebit, BacsDebit bacsDebit, Upi upi, Netbanking netbanking, USBankAccount uSBankAccount, Link link, CashAppPay cashAppPay, Swish swish, ShopPay shopPay, PaymentMethod.BillingDetails billingDetails, PaymentMethod.AllowRedisplay allowRedisplay, RadarOptions radarOptions, Map map, Set productUsage, ClientAttributionMetadata clientAttributionMetadata, Map map2) {
        Intrinsics.g(code, "code");
        Intrinsics.g(productUsage, "productUsage");
        this.f43680a = code;
        this.f43681b = z11;
        this.f43682c = card;
        this.f43683d = ideal;
        this.f43684e = fpx;
        this.f43685f = sepaDebit;
        this.f43686g = auBecsDebit;
        this.f43687h = bacsDebit;
        this.f43688i = upi;
        this.f43689j = netbanking;
        this.f43690k = uSBankAccount;
        this.f43691l = link;
        this.f43692m = cashAppPay;
        this.n = swish;
        this.o = shopPay;
        this.f43693p = billingDetails;
        this.f43694q = allowRedisplay;
        this.f43695r = radarOptions;
        this.f43696s = map;
        this.f43697t = productUsage;
        this.f43698u = clientAttributionMetadata;
        this.f43699v = map2;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public PaymentMethodCreateParams(PaymentMethod.Type type, Card card, USBankAccount uSBankAccount, Link link, ShopPay shopPay, PaymentMethod.BillingDetails billingDetails, PaymentMethod.AllowRedisplay allowRedisplay, ClientAttributionMetadata clientAttributionMetadata, int i5) {
        Card card2 = (i5 & 2) != 0 ? null : card;
        USBankAccount uSBankAccount2 = (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : uSBankAccount;
        Link link2 = (i5 & 1024) != 0 ? null : link;
        ShopPay shopPay2 = (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : shopPay;
        PaymentMethod.AllowRedisplay allowRedisplay2 = (32768 & i5) != 0 ? null : allowRedisplay;
        EmptySet productUsage = EmptySet.f71734a;
        ClientAttributionMetadata clientAttributionMetadata2 = (i5 & 524288) != 0 ? null : clientAttributionMetadata;
        Intrinsics.g(productUsage, "productUsage");
        this(type.f43655a, type.f43657c, card2, null, null, null, null, null, null, null, uSBankAccount2, link2, null, null, shopPay2, billingDetails, allowRedisplay2, null, null, productUsage, clientAttributionMetadata2, null);
    }

    public PaymentMethodCreateParams(Card card, PaymentMethod.BillingDetails billingDetails, ClientAttributionMetadata clientAttributionMetadata) {
        this(PaymentMethod.Type.f43639i, card, null, null, null, billingDetails, null, clientAttributionMetadata, 1392636);
    }
}
