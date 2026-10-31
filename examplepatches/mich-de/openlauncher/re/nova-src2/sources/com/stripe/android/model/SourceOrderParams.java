package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.amplitude.android.TrackingOptions;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/SourceOrderParams;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "Item", "Shipping", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class SourceOrderParams implements StripeParamsModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<SourceOrderParams> CREATOR = new c5();

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f43840a;

    /* renamed from: b, reason: collision with root package name */
    public final Shipping f43841b;

    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/SourceOrderParams$Item;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "com/stripe/android/model/e5", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Item implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Item> CREATOR = new d5();

        /* renamed from: a, reason: collision with root package name */
        public final e5 f43842a;

        /* renamed from: b, reason: collision with root package name */
        public final Integer f43843b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43844c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43845d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43846e;

        /* renamed from: f, reason: collision with root package name */
        public final Integer f43847f;

        public Item(e5 e5Var, Integer num, String str, String str2, String str3, Integer num2) {
            this.f43842a = e5Var;
            this.f43843b = num;
            this.f43844c = str;
            this.f43845d = str2;
            this.f43846e = str3;
            this.f43847f = num2;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Item)) {
                return false;
            }
            Item item = (Item) obj;
            return this.f43842a == item.f43842a && Intrinsics.b(this.f43843b, item.f43843b) && Intrinsics.b(this.f43844c, item.f43844c) && Intrinsics.b(this.f43845d, item.f43845d) && Intrinsics.b(this.f43846e, item.f43846e) && Intrinsics.b(this.f43847f, item.f43847f);
        }

        public final int hashCode() {
            e5 e5Var = this.f43842a;
            int iHashCode = (e5Var == null ? 0 : e5Var.hashCode()) * 31;
            Integer num = this.f43843b;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            String str = this.f43844c;
            int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43845d;
            int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43846e;
            int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
            Integer num2 = this.f43847f;
            return iHashCode5 + (num2 != null ? num2.hashCode() : 0);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            Integer num = this.f43843b;
            Map mapE0 = num != null ? b70.k.e0(new Pair("amount", Integer.valueOf(num.intValue()))) : null;
            Map map = b70.h.f17594a;
            if (mapE0 == null) {
                mapE0 = map;
            }
            LinkedHashMap linkedHashMapM0 = MapsKt.m0(map, mapE0);
            String str = this.f43844c;
            Map mapN = str != null ? a80.m.n(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, str) : null;
            if (mapN == null) {
                mapN = map;
            }
            LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapN);
            String str2 = this.f43845d;
            Map mapN2 = str2 != null ? a80.m.n(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, str2) : null;
            if (mapN2 == null) {
                mapN2 = map;
            }
            LinkedHashMap linkedHashMapM03 = MapsKt.m0(linkedHashMapM02, mapN2);
            String str3 = this.f43846e;
            Map mapN3 = str3 != null ? a80.m.n("parent", str3) : null;
            if (mapN3 == null) {
                mapN3 = map;
            }
            LinkedHashMap linkedHashMapM04 = MapsKt.m0(linkedHashMapM03, mapN3);
            Integer num2 = this.f43847f;
            Map mapE02 = num2 != null ? b70.k.e0(new Pair("quantity", Integer.valueOf(num2.intValue()))) : null;
            if (mapE02 == null) {
                mapE02 = map;
            }
            LinkedHashMap linkedHashMapM05 = MapsKt.m0(linkedHashMapM04, mapE02);
            e5 e5Var = this.f43842a;
            Map mapN4 = e5Var != null ? a80.m.n(TTConst.TRACK_TYPE, e5Var.f44027a) : null;
            if (mapN4 != null) {
                map = mapN4;
            }
            return MapsKt.m0(linkedHashMapM05, map);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Item(type=");
            sb2.append(this.f43842a);
            sb2.append(", amount=");
            sb2.append(this.f43843b);
            sb2.append(", currency=");
            b.c0.D(sb2, this.f43844c, ", description=", this.f43845d, ", parent=");
            sb2.append(this.f43846e);
            sb2.append(", quantity=");
            sb2.append(this.f43847f);
            sb2.append(")");
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            e5 e5Var = this.f43842a;
            if (e5Var == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(e5Var.name());
            }
            Integer num = this.f43843b;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            dest.writeString(this.f43844c);
            dest.writeString(this.f43845d);
            dest.writeString(this.f43846e);
            Integer num2 = this.f43847f;
            if (num2 == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num2);
            }
        }
    }

    @Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/SourceOrderParams$Shipping;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Shipping implements StripeParamsModel, Parcelable {

        @NotNull
        public static final Parcelable.Creator<Shipping> CREATOR = new f5();

        /* renamed from: a, reason: collision with root package name */
        public final Address f43848a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43849b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43850c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43851d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43852e;

        public Shipping(Address address, String str, String str2, String str3, String str4) {
            Intrinsics.g(address, "address");
            this.f43848a = address;
            this.f43849b = str;
            this.f43850c = str2;
            this.f43851d = str3;
            this.f43852e = str4;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Shipping)) {
                return false;
            }
            Shipping shipping = (Shipping) obj;
            return Intrinsics.b(this.f43848a, shipping.f43848a) && Intrinsics.b(this.f43849b, shipping.f43849b) && Intrinsics.b(this.f43850c, shipping.f43850c) && Intrinsics.b(this.f43851d, shipping.f43851d) && Intrinsics.b(this.f43852e, shipping.f43852e);
        }

        public final int hashCode() {
            int iHashCode = this.f43848a.hashCode() * 31;
            String str = this.f43849b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43850c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43851d;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43852e;
            return iHashCode4 + (str4 != null ? str4.hashCode() : 0);
        }

        @Override // com.stripe.android.model.StripeParamsModel
        public final Map k0() {
            Map mapO = com.google.android.gms.internal.measurement.k2.o(PlaceTypes.ADDRESS, this.f43848a.k0());
            String str = this.f43849b;
            Map mapN = str != null ? a80.m.n(TrackingOptions.AMP_TRACKING_OPTION_CARRIER, str) : null;
            Map map = b70.h.f17594a;
            if (mapN == null) {
                mapN = map;
            }
            LinkedHashMap linkedHashMapM0 = MapsKt.m0(mapO, mapN);
            String str2 = this.f43850c;
            Map mapN2 = str2 != null ? a80.m.n(PendingUpgradeStore.KEY_NAME, str2) : null;
            if (mapN2 == null) {
                mapN2 = map;
            }
            LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapN2);
            String str3 = this.f43851d;
            Map mapN3 = str3 != null ? a80.m.n("phone", str3) : null;
            if (mapN3 == null) {
                mapN3 = map;
            }
            LinkedHashMap linkedHashMapM03 = MapsKt.m0(linkedHashMapM02, mapN3);
            String str4 = this.f43852e;
            Map mapN4 = str4 != null ? a80.m.n("tracking_number", str4) : null;
            if (mapN4 != null) {
                map = mapN4;
            }
            return MapsKt.m0(linkedHashMapM03, map);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Shipping(address=");
            sb2.append(this.f43848a);
            sb2.append(", carrier=");
            sb2.append(this.f43849b);
            sb2.append(", name=");
            b.c0.D(sb2, this.f43850c, ", phone=", this.f43851d, ", trackingNumber=");
            return b.c0.q(sb2, this.f43852e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f43848a.writeToParcel(dest, i5);
            dest.writeString(this.f43849b);
            dest.writeString(this.f43850c);
            dest.writeString(this.f43851d);
            dest.writeString(this.f43852e);
        }
    }

    public SourceOrderParams(ArrayList arrayList, Shipping shipping) {
        this.f43840a = arrayList;
        this.f43841b = shipping;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SourceOrderParams)) {
            return false;
        }
        SourceOrderParams sourceOrderParams = (SourceOrderParams) obj;
        return this.f43840a.equals(sourceOrderParams.f43840a) && Intrinsics.b(this.f43841b, sourceOrderParams.f43841b);
    }

    public final int hashCode() {
        int iHashCode = this.f43840a.hashCode() * 31;
        Shipping shipping = this.f43841b;
        return iHashCode + (shipping == null ? 0 : shipping.hashCode());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v7, types: [java.util.Map] */
    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        ArrayList arrayList = this.f43840a;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(((Item) it.next()).k0());
        }
        Map mapE0 = b70.k.e0(new Pair("items", arrayList2));
        b70.h hVar = b70.h.f17594a;
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(hVar, mapE0);
        Shipping shipping = this.f43841b;
        b70.h hVarO = shipping != null ? com.google.android.gms.internal.measurement.k2.o("shipping", shipping.k0()) : null;
        if (hVarO != null) {
            hVar = hVarO;
        }
        return MapsKt.m0(linkedHashMapM0, hVar);
    }

    public final String toString() {
        return "SourceOrderParams(items=" + this.f43840a + ", shipping=" + this.f43841b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Iterator itJ = fq.c.j(this.f43840a, dest);
        while (itJ.hasNext()) {
            ((Item) itJ.next()).writeToParcel(dest, i5);
        }
        Shipping shipping = this.f43841b;
        if (shipping == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            shipping.writeToParcel(dest, i5);
        }
    }
}
