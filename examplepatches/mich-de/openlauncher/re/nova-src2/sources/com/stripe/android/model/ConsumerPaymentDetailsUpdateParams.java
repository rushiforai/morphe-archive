package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/ConsumerPaymentDetailsUpdateParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class ConsumerPaymentDetailsUpdateParams implements StripeParamsModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<ConsumerPaymentDetailsUpdateParams> CREATOR = new eh.a(24);

    /* renamed from: a, reason: collision with root package name */
    public final String f43311a;

    /* renamed from: b, reason: collision with root package name */
    public final Boolean f43312b;

    /* renamed from: c, reason: collision with root package name */
    public final Map f43313c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashMap f43314d;

    public ConsumerPaymentDetailsUpdateParams(String id2, Boolean bool, LinkedHashMap linkedHashMap, LinkedHashMap linkedHashMap2) {
        Intrinsics.g(id2, "id");
        this.f43311a = id2;
        this.f43312b = bool;
        this.f43313c = linkedHashMap;
        this.f43314d = linkedHashMap2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConsumerPaymentDetailsUpdateParams)) {
            return false;
        }
        ConsumerPaymentDetailsUpdateParams consumerPaymentDetailsUpdateParams = (ConsumerPaymentDetailsUpdateParams) obj;
        return Intrinsics.b(this.f43311a, consumerPaymentDetailsUpdateParams.f43311a) && Intrinsics.b(this.f43312b, consumerPaymentDetailsUpdateParams.f43312b) && Intrinsics.b(this.f43313c, consumerPaymentDetailsUpdateParams.f43313c) && this.f43314d.equals(consumerPaymentDetailsUpdateParams.f43314d);
    }

    public final int hashCode() {
        int iHashCode = this.f43311a.hashCode() * 31;
        Boolean bool = this.f43312b;
        int iHashCode2 = (iHashCode + (bool == null ? 0 : bool.hashCode())) * 31;
        Map map = this.f43313c;
        return this.f43314d.hashCode() + ((iHashCode2 + (map != null ? map.hashCode() : 0)) * 31);
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        Object obj;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Boolean bool = Boolean.TRUE;
        if (Intrinsics.b(this.f43312b, bool)) {
            linkedHashMap.put("is_default", bool);
        }
        Map map = this.f43313c;
        if (map != null) {
            Object obj2 = map.get("card");
            Map map2 = obj2 instanceof Map ? (Map) obj2 : null;
            if (map2 != null) {
                Object obj3 = map2.get("exp_month");
                if (obj3 != null) {
                    linkedHashMap.put("exp_month", obj3);
                }
                Object obj4 = map2.get("exp_year");
                if (obj4 != null) {
                    linkedHashMap.put("exp_year", obj4);
                }
                Object obj5 = map2.get("networks");
                Map map3 = obj5 instanceof Map ? (Map) obj5 : null;
                if (map3 != null && (obj = map3.get("preferred")) != null) {
                    linkedHashMap.put("preferred_network", obj);
                }
            }
            Pair pairZ = zg.a.z(map);
            linkedHashMap.put(pairZ.f71683a, pairZ.f71684b);
            Object obj6 = map.get("billing_details");
            Map map4 = obj6 instanceof Map ? (Map) obj6 : null;
            Object obj7 = map4 != null ? map4.get(ActionCategory.EMAIL) : null;
            String str = obj7 instanceof String ? (String) obj7 : null;
            if (str != null) {
                linkedHashMap.put("billing_email_address", str);
            }
        }
        LinkedHashMap linkedHashMap2 = this.f43314d;
        if (!linkedHashMap2.isEmpty()) {
            linkedHashMap.put("client_attribution_metadata", linkedHashMap2);
        }
        return linkedHashMap;
    }

    public final String toString() {
        return "ConsumerPaymentDetailsUpdateParams(id=" + this.f43311a + ", isDefault=" + this.f43312b + ", cardPaymentMethodCreateParamsMap=" + this.f43313c + ", clientAttributionMetadataParams=" + this.f43314d + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43311a);
        Boolean bool = this.f43312b;
        if (bool == null) {
            dest.writeInt(0);
        } else {
            com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
        }
        Map map = this.f43313c;
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
        LinkedHashMap linkedHashMap = this.f43314d;
        dest.writeInt(linkedHashMap.size());
        for (Map.Entry entry2 : linkedHashMap.entrySet()) {
            dest.writeString((String) entry2.getKey());
            dest.writeString((String) entry2.getValue());
        }
    }
}
