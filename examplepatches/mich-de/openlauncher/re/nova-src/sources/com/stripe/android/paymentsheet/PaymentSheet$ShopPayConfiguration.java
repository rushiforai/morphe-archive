package com.stripe.android.paymentsheet;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import b.u4;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"com/stripe/android/paymentsheet/PaymentSheet$ShopPayConfiguration", "Landroid/os/Parcelable;", "LineItem", "ShippingRate", "DeliveryEstimate", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentSheet$ShopPayConfiguration implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<PaymentSheet$ShopPayConfiguration> CREATOR = new h0();

    /* renamed from: a, reason: collision with root package name */
    public final String f44632a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f44633b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f44634c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f44635d;

    /* renamed from: e, reason: collision with root package name */
    public final List f44636e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f44637f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f44638g;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$ShopPayConfiguration$DeliveryEstimate;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public interface DeliveryEstimate extends Parcelable {
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$ShopPayConfiguration$LineItem;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class LineItem implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<LineItem> CREATOR = new i0();

        /* renamed from: a, reason: collision with root package name */
        public final String f44639a;

        /* renamed from: b, reason: collision with root package name */
        public final int f44640b;

        public LineItem(String name, int i5) {
            Intrinsics.g(name, "name");
            this.f44639a = name;
            this.f44640b = i5;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof LineItem)) {
                return false;
            }
            LineItem lineItem = (LineItem) obj;
            return Intrinsics.b(this.f44639a, lineItem.f44639a) && this.f44640b == lineItem.f44640b;
        }

        public final int hashCode() {
            return (this.f44639a.hashCode() * 31) + this.f44640b;
        }

        public final String toString() {
            return "LineItem(name=" + this.f44639a + ", amount=" + this.f44640b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44639a);
            dest.writeInt(this.f44640b);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/PaymentSheet$ShopPayConfiguration$ShippingRate;", "Landroid/os/Parcelable;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class ShippingRate implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<ShippingRate> CREATOR = new j0();

        /* renamed from: a, reason: collision with root package name */
        public final String f44641a;

        /* renamed from: b, reason: collision with root package name */
        public final int f44642b;

        /* renamed from: c, reason: collision with root package name */
        public final String f44643c;

        public ShippingRate(String id2, int i5, String displayName, DeliveryEstimate deliveryEstimate) {
            Intrinsics.g(id2, "id");
            Intrinsics.g(displayName, "displayName");
            this.f44641a = id2;
            this.f44642b = i5;
            this.f44643c = displayName;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ShippingRate)) {
                return false;
            }
            ShippingRate shippingRate = (ShippingRate) obj;
            return Intrinsics.b(this.f44641a, shippingRate.f44641a) && this.f44642b == shippingRate.f44642b && Intrinsics.b(this.f44643c, shippingRate.f44643c) && Intrinsics.b(null, null);
        }

        public final int hashCode() {
            return b.c0.e(((this.f44641a.hashCode() * 31) + this.f44642b) * 31, 31, this.f44643c) + 0;
        }

        public final String toString() {
            StringBuilder sbV = b.c0.v("ShippingRate(id=", this.f44642b, this.f44641a, ", amount=", ", displayName=");
            sbV.append(this.f44643c);
            sbV.append(", deliveryEstimate=");
            sbV.append((Object) null);
            sbV.append(")");
            return sbV.toString();
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeString(this.f44641a);
            dest.writeInt(this.f44642b);
            dest.writeString(this.f44643c);
            dest.writeParcelable(null, i5);
        }
    }

    public PaymentSheet$ShopPayConfiguration(String shopId, boolean z11, boolean z12, boolean z13, ArrayList allowedShippingCountries, ArrayList arrayList, ArrayList arrayList2) {
        Intrinsics.g(shopId, "shopId");
        Intrinsics.g(allowedShippingCountries, "allowedShippingCountries");
        this.f44632a = shopId;
        this.f44633b = z11;
        this.f44634c = z12;
        this.f44635d = z13;
        this.f44636e = allowedShippingCountries;
        this.f44637f = arrayList;
        this.f44638g = arrayList2;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof PaymentSheet$ShopPayConfiguration)) {
            return false;
        }
        PaymentSheet$ShopPayConfiguration paymentSheet$ShopPayConfiguration = (PaymentSheet$ShopPayConfiguration) obj;
        return Intrinsics.b(this.f44632a, paymentSheet$ShopPayConfiguration.f44632a) && this.f44633b == paymentSheet$ShopPayConfiguration.f44633b && this.f44634c == paymentSheet$ShopPayConfiguration.f44634c && this.f44635d == paymentSheet$ShopPayConfiguration.f44635d && Intrinsics.b(this.f44636e, paymentSheet$ShopPayConfiguration.f44636e) && this.f44637f.equals(paymentSheet$ShopPayConfiguration.f44637f) && this.f44638g.equals(paymentSheet$ShopPayConfiguration.f44638g);
    }

    public final int hashCode() {
        return this.f44638g.hashCode() + ((this.f44637f.hashCode() + u4.c(c9.f(c9.f(c9.f(this.f44632a.hashCode() * 31, 31, this.f44633b), 31, this.f44634c), 31, this.f44635d), 31, this.f44636e)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ShopPayConfiguration(shopId=");
        sb2.append(this.f44632a);
        sb2.append(", billingAddressRequired=");
        sb2.append(this.f44633b);
        sb2.append(", emailRequired=");
        a80.m.s(sb2, this.f44634c, ", shippingAddressRequired=", this.f44635d, ", allowedShippingCountries=");
        sb2.append(this.f44636e);
        sb2.append(", lineItems=");
        sb2.append(this.f44637f);
        sb2.append(", shippingRates=");
        sb2.append(this.f44638g);
        sb2.append(")");
        return sb2.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f44632a);
        dest.writeInt(this.f44633b ? 1 : 0);
        dest.writeInt(this.f44634c ? 1 : 0);
        dest.writeInt(this.f44635d ? 1 : 0);
        dest.writeStringList(this.f44636e);
        Iterator itJ = fq.c.j(this.f44637f, dest);
        while (itJ.hasNext()) {
            ((LineItem) itJ.next()).writeToParcel(dest, i5);
        }
        Iterator itJ2 = fq.c.j(this.f44638g, dest);
        while (itJ2.hasNext()) {
            ((ShippingRate) itJ2.next()).writeToParcel(dest, i5);
        }
    }
}
