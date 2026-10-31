package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethod;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u00012\u00020\u0002:\u0002\u0003\u0004\u0082\u0001\u0001\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/PaymentMethodUpdateParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "Card", "com/stripe/android/model/o4", "Lcom/stripe/android/model/PaymentMethodUpdateParams$Card;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public abstract class PaymentMethodUpdateParams implements StripeParamsModel, Parcelable {

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodUpdateParams$Card;", "Lcom/stripe/android/model/PaymentMethodUpdateParams;", "Networks", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Card extends PaymentMethodUpdateParams {

        @NotNull
        public static final Parcelable.Creator<Card> CREATOR = new m4();

        /* renamed from: a, reason: collision with root package name */
        public final Integer f43750a;

        /* renamed from: b, reason: collision with root package name */
        public final Integer f43751b;

        /* renamed from: c, reason: collision with root package name */
        public final Networks f43752c;

        /* renamed from: d, reason: collision with root package name */
        public final PaymentMethod.BillingDetails f43753d;

        /* renamed from: e, reason: collision with root package name */
        public final Set f43754e;

        /* renamed from: f, reason: collision with root package name */
        public final PaymentMethod.AllowRedisplay f43755f;

        @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/PaymentMethodUpdateParams$Card$Networks;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final class Networks implements StripeParamsModel, Parcelable {

            @NotNull
            public static final Parcelable.Creator<Networks> CREATOR = new n4();

            /* renamed from: a, reason: collision with root package name */
            public final String f43756a;

            public Networks(String str) {
                this.f43756a = str;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                return (obj instanceof Networks) && Intrinsics.b(((Networks) obj).f43756a, this.f43756a);
            }

            public final int hashCode() {
                return Objects.hash(this.f43756a);
            }

            @Override // com.stripe.android.model.StripeParamsModel
            public final Map k0() {
                String str = this.f43756a;
                return str != null ? a80.m.n("preferred", str) : b70.h.f17594a;
            }

            public final String toString() {
                return b.c0.l("PaymentMethodCreateParams.Card.Networks(preferred=", this.f43756a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43756a);
            }
        }

        public Card(Integer num, Integer num2, Networks networks, PaymentMethod.BillingDetails billingDetails, Set set, PaymentMethod.AllowRedisplay allowRedisplay) {
            z2 z2Var = PaymentMethod.Type.f43637g;
            this.f43750a = num;
            this.f43751b = num2;
            this.f43752c = networks;
            this.f43753d = billingDetails;
            this.f43754e = set;
            this.f43755f = allowRedisplay;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (!(obj instanceof Card)) {
                return false;
            }
            Card card = (Card) obj;
            return Intrinsics.b(card.f43750a, this.f43750a) && Intrinsics.b(card.f43751b, this.f43751b) && Intrinsics.b(card.f43752c, this.f43752c) && Intrinsics.b(card.f43753d, this.f43753d);
        }

        public final int hashCode() {
            return Objects.hash(this.f43750a, this.f43751b, this.f43752c, this.f43753d);
        }

        public final String toString() {
            return "PaymentMethodCreateParams.Card.(expiryMonth=" + this.f43750a + ", expiryYear=" + this.f43751b + ", networks=" + this.f43752c + ", billingDetails=" + this.f43753d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Integer num = this.f43750a;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            Integer num2 = this.f43751b;
            if (num2 == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num2);
            }
            Networks networks = this.f43752c;
            if (networks == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                networks.writeToParcel(dest, i5);
            }
            PaymentMethod.BillingDetails billingDetails = this.f43753d;
            if (billingDetails == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                billingDetails.writeToParcel(dest, i5);
            }
            Set set = this.f43754e;
            dest.writeInt(set.size());
            Iterator it = set.iterator();
            while (it.hasNext()) {
                dest.writeString((String) it.next());
            }
            PaymentMethod.AllowRedisplay allowRedisplay = this.f43755f;
            if (allowRedisplay == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                allowRedisplay.writeToParcel(dest, i5);
            }
        }
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        z2 z2Var = PaymentMethod.Type.f43637g;
        Card card = (Card) this;
        Pair pair = new Pair("exp_month", card.f43750a);
        Pair pair2 = new Pair("exp_year", card.f43751b);
        Card.Networks networks = card.f43752c;
        List<Pair> listQ = ul.b.Q(pair, pair2, new Pair("networks", networks != null ? networks.k0() : null));
        ArrayList arrayList = new ArrayList();
        for (Pair pair3 : listQ) {
            Object obj = pair3.f71684b;
            Pair pair4 = obj != null ? new Pair(pair3.f71683a, obj) : null;
            if (pair4 != null) {
                arrayList.add(pair4);
            }
        }
        Map mapO = com.google.android.gms.internal.measurement.k2.o("card", MapsKt.r0(arrayList));
        PaymentMethod.BillingDetails billingDetails = card.f43753d;
        Map mapO2 = billingDetails != null ? com.google.android.gms.internal.measurement.k2.o("billing_details", billingDetails.k0()) : null;
        Map map = b70.h.f17594a;
        if (mapO2 == null) {
            mapO2 = map;
        }
        PaymentMethod.AllowRedisplay allowRedisplay = card.f43755f;
        Map mapN = allowRedisplay != null ? a80.m.n("allow_redisplay", allowRedisplay.f43595a) : null;
        if (mapN != null) {
            map = mapN;
        }
        return MapsKt.m0(MapsKt.m0(mapO2, map), mapO);
    }
}
