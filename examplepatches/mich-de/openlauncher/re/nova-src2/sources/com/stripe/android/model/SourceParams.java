package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.stripe.android.model.Source;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/SourceParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "OwnerParams", "ApiParams", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class SourceParams implements StripeParamsModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<SourceParams> CREATOR = new h5();

    /* renamed from: a, reason: collision with root package name */
    public final String f43853a;

    /* renamed from: b, reason: collision with root package name */
    public final Long f43854b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43855c;

    /* renamed from: d, reason: collision with root package name */
    public final OwnerParams f43856d;

    /* renamed from: e, reason: collision with root package name */
    public final Source.Usage f43857e;

    /* renamed from: f, reason: collision with root package name */
    public final SourceOrderParams f43858f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43859g;

    /* renamed from: h, reason: collision with root package name */
    public final Map f43860h;

    /* renamed from: i, reason: collision with root package name */
    public final ApiParams f43861i;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashSet f43862j;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/SourceParams$ApiParams;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ApiParams implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<ApiParams> CREATOR = new g5();

        /* renamed from: a, reason: collision with root package name */
        public final Object f43863a;

        public ApiParams(Map map) {
            this.f43863a = map;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof ApiParams) && this.f43863a.equals(((ApiParams) obj).f43863a);
        }

        public final int hashCode() {
            return this.f43863a.hashCode();
        }

        public final String toString() {
            return "ApiParams(value=" + this.f43863a + ")";
        }

        /* JADX WARN: Type inference failed for: r2v2, types: [java.lang.Object, java.util.Map] */
        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) throws JSONException {
            Intrinsics.g(dest, "dest");
            JSONObject jSONObjectH = vh.a.H(this.f43863a);
            dest.writeString(jSONObjectH != null ? jSONObjectH.toString() : null);
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/SourceParams$OwnerParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class OwnerParams implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<OwnerParams> CREATOR = new i5();

        /* renamed from: a, reason: collision with root package name */
        public Address f43864a;

        /* renamed from: b, reason: collision with root package name */
        public String f43865b;

        /* renamed from: c, reason: collision with root package name */
        public String f43866c;

        /* renamed from: d, reason: collision with root package name */
        public String f43867d;

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof OwnerParams)) {
                return false;
            }
            OwnerParams ownerParams = (OwnerParams) obj;
            return Intrinsics.b(this.f43864a, ownerParams.f43864a) && Intrinsics.b(this.f43865b, ownerParams.f43865b) && Intrinsics.b(this.f43866c, ownerParams.f43866c) && Intrinsics.b(this.f43867d, ownerParams.f43867d);
        }

        public final int hashCode() {
            Address address = this.f43864a;
            int iHashCode = (address == null ? 0 : address.hashCode()) * 31;
            String str = this.f43865b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43866c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43867d;
            return iHashCode3 + (str3 != null ? str3.hashCode() : 0);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            Address address = this.f43864a;
            Map mapO = address != null ? com.google.android.gms.internal.measurement.k2.o(PlaceTypes.ADDRESS, address.k0()) : null;
            Map map = b70.h.f17594a;
            if (mapO == null) {
                mapO = map;
            }
            LinkedHashMap linkedHashMapM0 = MapsKt.m0(map, mapO);
            String str = this.f43865b;
            Map mapN = str != null ? a80.m.n(ActionCategory.EMAIL, str) : null;
            if (mapN == null) {
                mapN = map;
            }
            LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapN);
            String str2 = this.f43866c;
            Map mapN2 = str2 != null ? a80.m.n(PendingUpgradeStore.KEY_NAME, str2) : null;
            if (mapN2 == null) {
                mapN2 = map;
            }
            LinkedHashMap linkedHashMapM03 = MapsKt.m0(linkedHashMapM02, mapN2);
            String str3 = this.f43867d;
            Map mapN3 = str3 != null ? a80.m.n("phone", str3) : null;
            if (mapN3 != null) {
                map = mapN3;
            }
            return MapsKt.m0(linkedHashMapM03, map);
        }

        public final String toString() {
            Address address = this.f43864a;
            String str = this.f43865b;
            String str2 = this.f43866c;
            String str3 = this.f43867d;
            StringBuilder sb2 = new StringBuilder("OwnerParams(address=");
            sb2.append(address);
            sb2.append(", email=");
            sb2.append(str);
            sb2.append(", name=");
            return b.c0.s(sb2, str2, ", phone=", str3, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Address address = this.f43864a;
            if (address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                address.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43865b);
            dest.writeString(this.f43866c);
            dest.writeString(this.f43867d);
        }
    }

    public SourceParams(String typeRaw, Long l9, String str, OwnerParams ownerParams, Source.Usage usage, SourceOrderParams sourceOrderParams, String str2, LinkedHashMap linkedHashMap, ApiParams apiParams, LinkedHashSet linkedHashSet) {
        Intrinsics.g(typeRaw, "typeRaw");
        Intrinsics.g(apiParams, "apiParams");
        this.f43853a = typeRaw;
        this.f43854b = l9;
        this.f43855c = str;
        this.f43856d = ownerParams;
        this.f43857e = usage;
        this.f43858f = sourceOrderParams;
        this.f43859g = str2;
        this.f43860h = linkedHashMap;
        this.f43861i = apiParams;
        this.f43862j = linkedHashSet;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SourceParams)) {
            return false;
        }
        SourceParams sourceParams = (SourceParams) obj;
        return Intrinsics.b(this.f43853a, sourceParams.f43853a) && Intrinsics.b(this.f43854b, sourceParams.f43854b) && Intrinsics.b(this.f43855c, sourceParams.f43855c) && Intrinsics.b(this.f43856d, sourceParams.f43856d) && this.f43857e == sourceParams.f43857e && Intrinsics.b(this.f43858f, sourceParams.f43858f) && Intrinsics.b(this.f43859g, sourceParams.f43859g) && Intrinsics.b(this.f43860h, sourceParams.f43860h) && Intrinsics.b(this.f43861i, sourceParams.f43861i) && this.f43862j.equals(sourceParams.f43862j);
    }

    public final int hashCode() {
        int iHashCode = this.f43853a.hashCode() * 961;
        Long l9 = this.f43854b;
        int iHashCode2 = (iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str = this.f43855c;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        OwnerParams ownerParams = this.f43856d;
        int iHashCode4 = (iHashCode3 + (ownerParams == null ? 0 : ownerParams.hashCode())) * 31;
        Source.Usage usage = this.f43857e;
        int iHashCode5 = (iHashCode4 + (usage == null ? 0 : usage.hashCode())) * 31;
        SourceOrderParams sourceOrderParams = this.f43858f;
        int iHashCode6 = (iHashCode5 + (sourceOrderParams == null ? 0 : sourceOrderParams.hashCode())) * 31;
        String str2 = this.f43859g;
        int iHashCode7 = (iHashCode6 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Map map = this.f43860h;
        return this.f43862j.hashCode() + ((this.f43861i.f43863a.hashCode() + ((iHashCode7 + (map != null ? map.hashCode() : 0)) * 31)) * 31);
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [java.lang.Object, java.util.Map] */
    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        String str = this.f43853a;
        Map mapN = a80.m.n(TTConst.TRACK_TYPE, str);
        ?? r22 = this.f43861i.f43863a;
        boolean zIsEmpty = r22.isEmpty();
        Object obj = r22;
        if (zIsEmpty) {
            obj = null;
        }
        Map mapE0 = obj != null ? b70.k.e0(new Pair(str, obj)) : null;
        Map map = b70.h.f17594a;
        if (mapE0 == null) {
            mapE0 = map;
        }
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(MapsKt.m0(mapN, mapE0), map);
        Long l9 = this.f43854b;
        Map mapE02 = l9 != null ? b70.k.e0(new Pair("amount", Long.valueOf(l9.longValue()))) : null;
        if (mapE02 == null) {
            mapE02 = map;
        }
        LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapE02);
        String str2 = this.f43855c;
        Map mapN2 = str2 != null ? a80.m.n(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, str2) : null;
        if (mapN2 == null) {
            mapN2 = map;
        }
        LinkedHashMap linkedHashMapM03 = MapsKt.m0(linkedHashMapM02, mapN2);
        SourceOrderParams sourceOrderParams = this.f43858f;
        Map mapO = sourceOrderParams != null ? com.google.android.gms.internal.measurement.k2.o("source_order", sourceOrderParams.k0()) : null;
        if (mapO == null) {
            mapO = map;
        }
        LinkedHashMap linkedHashMapM04 = MapsKt.m0(linkedHashMapM03, mapO);
        OwnerParams ownerParams = this.f43856d;
        Map mapO2 = ownerParams != null ? com.google.android.gms.internal.measurement.k2.o("owner", ownerParams.k0()) : null;
        if (mapO2 == null) {
            mapO2 = map;
        }
        LinkedHashMap linkedHashMapM05 = MapsKt.m0(linkedHashMapM04, mapO2);
        Map map2 = this.f43860h;
        Map mapO3 = map2 != null ? com.google.android.gms.internal.measurement.k2.o("metadata", map2) : null;
        if (mapO3 == null) {
            mapO3 = map;
        }
        LinkedHashMap linkedHashMapM06 = MapsKt.m0(linkedHashMapM05, mapO3);
        String str3 = this.f43859g;
        Map mapN3 = str3 != null ? a80.m.n("token", str3) : null;
        if (mapN3 == null) {
            mapN3 = map;
        }
        LinkedHashMap linkedHashMapM07 = MapsKt.m0(linkedHashMapM06, mapN3);
        Source.Usage usage = this.f43857e;
        Map mapN4 = usage != null ? a80.m.n("usage", usage.f43824a) : null;
        if (mapN4 != null) {
            map = mapN4;
        }
        return MapsKt.m0(linkedHashMapM07, map);
    }

    public final String toString() {
        return "SourceParams(typeRaw=" + this.f43853a + ", typeData=null, amount=" + this.f43854b + ", currency=" + this.f43855c + ", owner=" + this.f43856d + ", usage=" + this.f43857e + ", sourceOrder=" + this.f43858f + ", token=" + this.f43859g + ", metadata=" + this.f43860h + ", apiParams=" + this.f43861i + ", attribution=" + this.f43862j + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) throws JSONException {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43853a);
        dest.writeParcelable(null, i5);
        Long l9 = this.f43854b;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
        dest.writeString(this.f43855c);
        OwnerParams ownerParams = this.f43856d;
        if (ownerParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            ownerParams.writeToParcel(dest, i5);
        }
        Source.Usage usage = this.f43857e;
        if (usage == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(usage.name());
        }
        SourceOrderParams sourceOrderParams = this.f43858f;
        if (sourceOrderParams == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            sourceOrderParams.writeToParcel(dest, i5);
        }
        dest.writeString(this.f43859g);
        Map map = this.f43860h;
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
        this.f43861i.writeToParcel(dest, i5);
        LinkedHashSet linkedHashSet = this.f43862j;
        dest.writeInt(linkedHashSet.size());
        Iterator it = linkedHashSet.iterator();
        while (it.hasNext()) {
            dest.writeString((String) it.next());
        }
    }
}
