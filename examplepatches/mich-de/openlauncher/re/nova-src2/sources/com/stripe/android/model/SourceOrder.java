package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/SourceOrder;", "Lcom/stripe/android/core/model/StripeModel;", "Item", "Shipping", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class SourceOrder implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<SourceOrder> CREATOR = new x4();

    /* renamed from: a, reason: collision with root package name */
    public final Integer f43825a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43826b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43827c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f43828d;

    /* renamed from: e, reason: collision with root package name */
    public final Shipping f43829e;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/SourceOrder$Item;", "Lcom/stripe/android/core/model/StripeModel;", "com/stripe/android/model/a5", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Item implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<Item> CREATOR = new y4();

        /* renamed from: a, reason: collision with root package name */
        public final a5 f43830a;

        /* renamed from: b, reason: collision with root package name */
        public final Integer f43831b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43832c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43833d;

        /* renamed from: e, reason: collision with root package name */
        public final Integer f43834e;

        public Item(a5 type, Integer num, String str, String str2, Integer num2) {
            Intrinsics.g(type, "type");
            this.f43830a = type;
            this.f43831b = num;
            this.f43832c = str;
            this.f43833d = str2;
            this.f43834e = num2;
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
            return this.f43830a == item.f43830a && Intrinsics.b(this.f43831b, item.f43831b) && Intrinsics.b(this.f43832c, item.f43832c) && Intrinsics.b(this.f43833d, item.f43833d) && Intrinsics.b(this.f43834e, item.f43834e);
        }

        public final int hashCode() {
            int iHashCode = this.f43830a.hashCode() * 31;
            Integer num = this.f43831b;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            String str = this.f43832c;
            int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43833d;
            int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
            Integer num2 = this.f43834e;
            return iHashCode4 + (num2 != null ? num2.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Item(type=");
            sb2.append(this.f43830a);
            sb2.append(", amount=");
            sb2.append(this.f43831b);
            sb2.append(", currency=");
            b.c0.D(sb2, this.f43832c, ", description=", this.f43833d, ", quantity=");
            sb2.append(this.f43834e);
            sb2.append(")");
            return sb2.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f43830a.name());
            Integer num = this.f43831b;
            if (num == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num);
            }
            dest.writeString(this.f43832c);
            dest.writeString(this.f43833d);
            Integer num2 = this.f43834e;
            if (num2 == null) {
                dest.writeInt(0);
            } else {
                fq.c.q(dest, 1, num2);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/SourceOrder$Shipping;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Shipping implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<Shipping> CREATOR = new b5();

        /* renamed from: a, reason: collision with root package name */
        public final Address f43835a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43836b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43837c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43838d;

        /* renamed from: e, reason: collision with root package name */
        public final String f43839e;

        public Shipping(Address address, String str, String str2, String str3, String str4) {
            this.f43835a = address;
            this.f43836b = str;
            this.f43837c = str2;
            this.f43838d = str3;
            this.f43839e = str4;
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
            return Intrinsics.b(this.f43835a, shipping.f43835a) && Intrinsics.b(this.f43836b, shipping.f43836b) && Intrinsics.b(this.f43837c, shipping.f43837c) && Intrinsics.b(this.f43838d, shipping.f43838d) && Intrinsics.b(this.f43839e, shipping.f43839e);
        }

        public final int hashCode() {
            Address address = this.f43835a;
            int iHashCode = (address == null ? 0 : address.hashCode()) * 31;
            String str = this.f43836b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43837c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43838d;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            String str4 = this.f43839e;
            return iHashCode4 + (str4 != null ? str4.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Shipping(address=");
            sb2.append(this.f43835a);
            sb2.append(", carrier=");
            sb2.append(this.f43836b);
            sb2.append(", name=");
            b.c0.D(sb2, this.f43837c, ", phone=", this.f43838d, ", trackingNumber=");
            return b.c0.q(sb2, this.f43839e, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Address address = this.f43835a;
            if (address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                address.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43836b);
            dest.writeString(this.f43837c);
            dest.writeString(this.f43838d);
            dest.writeString(this.f43839e);
        }
    }

    public SourceOrder(Integer num, String str, String str2, ArrayList arrayList, Shipping shipping) {
        this.f43825a = num;
        this.f43826b = str;
        this.f43827c = str2;
        this.f43828d = arrayList;
        this.f43829e = shipping;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SourceOrder)) {
            return false;
        }
        SourceOrder sourceOrder = (SourceOrder) obj;
        return Intrinsics.b(this.f43825a, sourceOrder.f43825a) && Intrinsics.b(this.f43826b, sourceOrder.f43826b) && Intrinsics.b(this.f43827c, sourceOrder.f43827c) && this.f43828d.equals(sourceOrder.f43828d) && Intrinsics.b(this.f43829e, sourceOrder.f43829e);
    }

    public final int hashCode() {
        Integer num = this.f43825a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        String str = this.f43826b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f43827c;
        int iHashCode3 = (this.f43828d.hashCode() + ((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31;
        Shipping shipping = this.f43829e;
        return iHashCode3 + (shipping != null ? shipping.hashCode() : 0);
    }

    public final String toString() {
        return "SourceOrder(amount=" + this.f43825a + ", currency=" + this.f43826b + ", email=" + this.f43827c + ", items=" + this.f43828d + ", shipping=" + this.f43829e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Integer num = this.f43825a;
        if (num == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num);
        }
        dest.writeString(this.f43826b);
        dest.writeString(this.f43827c);
        Iterator itJ = fq.c.j(this.f43828d, dest);
        while (itJ.hasNext()) {
            ((Item) itJ.next()).writeToParcel(dest, i5);
        }
        Shipping shipping = this.f43829e;
        if (shipping == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            shipping.writeToParcel(dest, i5);
        }
    }
}
