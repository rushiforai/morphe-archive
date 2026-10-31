package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.tiktok.util.TTConst;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bw\u0018\u00002\u00020\u00012\u00020\u0002:\u0002\u0003\u0004\u0082\u0001\u0002\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetailsCreateParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "Card", "BankAccount", "Lcom/stripe/android/model/ConsumerPaymentDetailsCreateParams$BankAccount;", "Lcom/stripe/android/model/ConsumerPaymentDetailsCreateParams$Card;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface ConsumerPaymentDetailsCreateParams extends StripeParamsModel, Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetailsCreateParams$BankAccount;", "Lcom/stripe/android/model/ConsumerPaymentDetailsCreateParams;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final /* data */ class BankAccount implements ConsumerPaymentDetailsCreateParams {

        @NotNull
        public static final Parcelable.Creator<BankAccount> CREATOR = new f0();

        /* renamed from: a, reason: collision with root package name */
        public final String f43304a;

        /* renamed from: b, reason: collision with root package name */
        public final Map f43305b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43306c;

        /* renamed from: d, reason: collision with root package name */
        public final Map f43307d;

        public BankAccount(String bankAccountId, LinkedHashMap linkedHashMap, String str, Map map) {
            Intrinsics.g(bankAccountId, "bankAccountId");
            this.f43304a = bankAccountId;
            this.f43305b = linkedHashMap;
            this.f43306c = str;
            this.f43307d = map;
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
            return Intrinsics.b(this.f43304a, bankAccount.f43304a) && Intrinsics.b(this.f43305b, bankAccount.f43305b) && Intrinsics.b(this.f43306c, bankAccount.f43306c) && Intrinsics.b(this.f43307d, bankAccount.f43307d);
        }

        public final int hashCode() {
            int iHashCode = this.f43304a.hashCode() * 31;
            Map map = this.f43305b;
            int iHashCode2 = (iHashCode + (map == null ? 0 : map.hashCode())) * 31;
            String str = this.f43306c;
            return this.f43307d.hashCode() + ((iHashCode2 + (str != null ? str.hashCode() : 0)) * 31);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            MapBuilder mapBuilder = new MapBuilder();
            String str = this.f43306c;
            if (str != null) {
                mapBuilder.put("billing_email_address", str);
            }
            Map map = this.f43305b;
            if (map != null && !map.isEmpty()) {
                mapBuilder.put("billing_address", map);
            }
            return MapsKt.m0(MapsKt.m0(MapsKt.j0(new Pair(TTConst.TRACK_TYPE, "bank_account"), new Pair("bank_account", a80.m.n("account", this.f43304a))), mapBuilder.b()), this.f43307d);
        }

        public final String toString() {
            return "BankAccount(bankAccountId=" + this.f43304a + ", billingAddress=" + this.f43305b + ", billingEmailAddress=" + this.f43306c + ", clientAttributionMetadata=" + this.f43307d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43304a);
            Map map = this.f43305b;
            if (map == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeInt(map.size());
                for (Map.Entry entry : map.entrySet()) {
                    dest.writeString((String) entry.getKey());
                    dest.writeValue(entry.getValue());
                }
            }
            dest.writeString(this.f43306c);
            Map map2 = this.f43307d;
            dest.writeInt(map2.size());
            for (Map.Entry entry2 : map2.entrySet()) {
                dest.writeString((String) entry2.getKey());
                dest.writeValue(entry2.getValue());
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetailsCreateParams$Card;", "Lcom/stripe/android/model/ConsumerPaymentDetailsCreateParams;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final /* data */ class Card implements ConsumerPaymentDetailsCreateParams {

        @NotNull
        public static final Parcelable.Creator<Card> CREATOR = new g0();

        /* renamed from: a, reason: collision with root package name */
        public final LinkedHashMap f43308a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43309b;

        public Card(LinkedHashMap linkedHashMap, String email) {
            Intrinsics.g(email, "email");
            this.f43308a = linkedHashMap;
            this.f43309b = email;
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
            return this.f43308a.equals(card.f43308a) && Intrinsics.b(this.f43309b, card.f43309b);
        }

        public final int hashCode() {
            return this.f43309b.hashCode() + (this.f43308a.hashCode() * 31);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair(TTConst.TRACK_TYPE, "card"), new Pair("active", Boolean.TRUE), new Pair("billing_email_address", this.f43309b));
            LinkedHashMap linkedHashMap = this.f43308a;
            Pair pairZ = zg.a.z(linkedHashMap);
            linkedHashMapK0.put(pairZ.f71683a, pairZ.f71684b);
            Object obj = linkedHashMap.get("client_attribution_metadata");
            if (obj != null) {
                linkedHashMapK0.putAll(b70.k.e0(new Pair("client_attribution_metadata", obj)));
            }
            Object obj2 = linkedHashMap.get("card");
            Map map = obj2 instanceof Map ? (Map) obj2 : null;
            if (map != null) {
                LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                for (Map.Entry entry : map.entrySet()) {
                    if (b70.g.O0(kotlin.collections.c.f1(new String[]{"number", "exp_month", "exp_year"}), entry.getKey())) {
                        linkedHashMap2.put(entry.getKey(), entry.getValue());
                    }
                }
                LinkedHashMap linkedHashMapU0 = MapsKt.u0(linkedHashMap2);
                Object obj3 = map.get("networks");
                Map map2 = obj3 instanceof Map ? (Map) obj3 : null;
                Object obj4 = map2 != null ? map2.get("preferred") : null;
                String str = obj4 instanceof String ? (String) obj4 : null;
                if (str != null) {
                    linkedHashMapU0.put("preferred_network", str);
                }
                linkedHashMapK0.put("card", MapsKt.s0(linkedHashMapU0));
            }
            return linkedHashMapK0;
        }

        public final String toString() {
            return "Card(cardPaymentMethodCreateParamsMap=" + this.f43308a + ", email=" + this.f43309b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            LinkedHashMap linkedHashMap = this.f43308a;
            dest.writeInt(linkedHashMap.size());
            for (Map.Entry entry : linkedHashMap.entrySet()) {
                dest.writeString((String) entry.getKey());
                dest.writeValue(entry.getValue());
            }
            dest.writeString(this.f43309b);
        }
    }
}
